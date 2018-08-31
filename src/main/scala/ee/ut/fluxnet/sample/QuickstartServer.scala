package ee.ut.fluxnet.sample

import akka.actor.{ ActorRef, ActorSystem }
import akka.event.Logging
import akka.http.scaladsl.Http
import akka.http.scaladsl.server.Route
import akka.stream.ActorMaterializer
import com.typesafe.config.ConfigFactory
import scalikejdbc.config._

import scala.io.StdIn
import scala.util.Try

//#main-class
object QuickstartServer extends App with TheRoutes {

  // initialize JDBC & connection pool
  // DBs.setup/DBs.setupAll loads specified JDBC driver classes.
  DBs.setupAll()

  // set up ActorSystem and other dependencies here
  //#main-class
  //#server-bootstrapping
  implicit val system: ActorSystem = ActorSystem("helloAkkaHttpServer")
  implicit val materializer: ActorMaterializer = ActorMaterializer()
  //#server-bootstrapping
  // needed for the future foreach in the end
  implicit val executionContext = system.dispatcher

  val config = ConfigFactory.load()

  val conf_w_dir = Try {
    config.getString("workdir")
  }.toOption
  val workingDirectory: String = conf_w_dir.getOrElse(new java.io.File(".").getCanonicalPath)

  val logger = Logging(system, getClass)

  val fluxdataDbActor: ActorRef = system.actorOf(FluxdataBabylonActor.props, "fluxdataDbActor")

  logger.warning(s"web index dir is: $workingDirectory")

  //#main-class
  // from the TheRoutes trait
  lazy val routes: Route = theRoutes(workingDirectory)
  //#main-class

  val bindingFuture = Http().bindAndHandle(routes, config.getString("http.ip"), config.getInt("http.port"))

  logger.info(s"Server online at ${config.getString("http.ip")}, ${config.getInt("http.port")} \nPress RETURN to stop...")

  StdIn.readLine() // let it run until user presses return
  bindingFuture
    .flatMap(_.unbind()) // trigger unbinding from the port
    .onComplete(_ ⇒ system.terminate()) // and shutdown when done
}

//#main-class
