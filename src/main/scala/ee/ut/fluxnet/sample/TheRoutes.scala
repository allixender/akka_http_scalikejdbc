package ee.ut.fluxnet.sample

import java.io.File
import java.nio.file.{ Files, Paths }

import akka.actor.{ ActorRef, ActorSystem }
import akka.event.Logging
import akka.http.scaladsl.model.{ ContentType, HttpRequest, StatusCodes, _ }
import akka.http.scaladsl.server.Directives.{ entity, _ }
import akka.http.scaladsl.server.Route
import akka.http.scaladsl.server.directives.MethodDirectives.{ get, post }
import akka.http.scaladsl.server.directives.PathDirectives.path
import akka.http.scaladsl.server.directives.RouteDirectives.complete
import akka.pattern.ask
import akka.util.Timeout
import ee.ut.fluxnet.sample.FluxdataBabylonActor._

import scala.concurrent.Future
import scala.concurrent.duration._

//#user-routes-class
trait TheRoutes {
  //#user-routes-class

  // we leave these abstract, since they will be provided by the App
  implicit def system: ActorSystem

  lazy val log = Logging(system, classOf[TheRoutes])

  // other dependencies that TheRoutes use
  def fluxdataDbActor: ActorRef

  // Required by the `ask` (?) method below
  implicit lazy val timeout = Timeout(60.seconds) // usually we'd obtain the timeout from the system's configuration

  import JsonSupportWithPlay._
  import de.heikoseeberger.akkahttpplayjson.PlayJsonSupport._

  private def getExtensions(fileName: String): String = {

    val index = fileName.lastIndexOf('.')
    if (index != 0) {
      fileName.drop(index + 1)
    } else
      ""
  }

  private def getDefaultPage(workingDirectory: String) = {
    val basePath = new java.io.File(workingDirectory)
    val indexPath = new File(basePath, "index.html")
    val fullPath = List(Paths.get(indexPath.getPath))
    val res = fullPath.filter(x => Files.exists(x))
    if (res.nonEmpty)
      res.head
    else
      Paths.get("")
  }

  //#all-routes
  //#users-get-post
  //#users-get-delete   
  def theRoutes(workingDirectory: String): Route =
    pathPrefix("sensors1") {
      concat(
        //#users-get-delete
        pathEnd {
          concat(
            //# get index html
            get {
              entity(as[HttpRequest]) { requestData =>
                complete {
                  log.info(s"path match: ${requestData.uri.path.toString()}")
                  val fullPath = requestData.uri.path.toString match {
                    case "/sensors1/" => getDefaultPage(workingDirectory)
                    case "/sensors1" => getDefaultPage(workingDirectory)
                    case _ => Paths.get(workingDirectory + requestData.uri.path.toString)
                  }

                  val ext = getExtensions(fullPath.getFileName.toString)
                  val m: MediaType = MediaTypes.forExtension(ext)
                  val c: ContentType = m match {
                    case mt if mt.isText && mt.subType == "html" => ContentTypes.`text/html(UTF-8)`
                    case mt if mt.isText => ContentTypes.`text/plain(UTF-8)`
                    case mt if mt.isApplication && mt.subType == "json" => ContentTypes.`application/json`
                    case _ => ContentTypes.`application/octet-stream`
                  }

                  val byteArray = Files.readAllBytes(fullPath)
                  HttpResponse(StatusCodes.OK, entity = HttpEntity(c, byteArray))
                }
              }
            }
          )
        } ~
          //# query-post
          //# capababilities-get
          path("data") {
            concat(
              post {
                //# query db
                entity(as[RequestFluxataSeries]) { datarequest =>
                  val maybeResult: Future[Option[DataSeries]] =
                    (fluxdataDbActor ? datarequest).mapTo[Option[DataSeries]]
                  rejectEmptyResponse {
                    complete(maybeResult)
                  }
                }
                //# query db
              },
              get {
                //# capabiltiites
                val dataCapa: Future[DataCapabilities] =
                  (fluxdataDbActor ? RequestFluxataCapabilities).mapTo[DataCapabilities]
                onSuccess(dataCapa) { performed =>
                  log.info("found stations user [{}]: {}", performed.stations.length, performed.stations)
                  complete((StatusCodes.OK, performed))
                }
                //# capabitltiites
              }
            )
          }
      )
      //#users-get-delete
    }

  //#all-routes
}
