package ee.ut.fluxnet.sample

//#test-top
import akka.actor.ActorRef
import akka.http.scaladsl.marshalling.Marshal
import akka.http.scaladsl.model._
import akka.http.scaladsl.testkit.ScalatestRouteTest
import akka.http.scaladsl.unmarshalling.Unmarshal
import de.heikoseeberger.akkahttpplayjson.PlayJsonSupport
import ee.ut.fluxnet.sample.FluxdataBabylonActor.ActionPerformed
import ee.ut.fluxnet.sample.JsonSupportWithPlay._
import org.scalatest.concurrent.ScalaFutures
import org.scalatest.{ Matchers, WordSpec }

//#set-up
class FluxdataRoutesSpec extends WordSpec with Matchers with ScalaFutures with ScalatestRouteTest
    with TheRoutes with PlayJsonSupport {
  //#test-top

  // Here we need to implement all the abstract members of TheRoutes.
  // We use the real FluxdataDbActor to test it while we hit the Routes, 
  // but we could "mock" it by implementing it in-place or by using a TestProbe() 
  override val fluxdataDbActor: ActorRef =
    system.actorOf(FluxdataBabylonActor.props, "fluxdataDb")

  lazy val routes = theRoutes(".")

  //#set-up

  //#actual-test
  "theRoutes" should {
    "query capabiltities" in {
      val request = HttpRequest(uri = "/sensors1/data")

      request ~> routes ~> check {
        status should ===(StatusCodes.OK)

        // we expect the response to be json:
        contentType should ===(ContentTypes.`application/json`)

        Unmarshal(response.entity).to[DataCapabilities].map { theVal =>
          println(theVal)
          theVal.stations.head.station should ===("Soontaga_LFdata")
        }
      }
    }

    pending;
    "return no users if no present (GET /sensors1)" in {
      // note that there's no need for the host part in the uri:
      val request = HttpRequest(uri = "/sensors1")

      request ~> routes ~> check {
        status should ===(StatusCodes.OK)

        // we expect the response to be json:
        contentType should ===(ContentTypes.`application/json`)

        // and no entries should be in the list:
        // entityAs[String] should ===("""{"users":[]}""")

        Unmarshal(response.entity).to[Users].map(_ shouldBe ("""{"users":[]}"""))
      }
    }
    //#actual-test

    //#testing-post
    pending;
    "be able to add users (POST /sensors1)" in {
      val user = User("Kapi", 42, "jp")
      val userEntity = Marshal(user).to[MessageEntity].futureValue // futureValue is from ScalaFutures

      // using the RequestBuilding DSL:
      val request = Post("/sensors1").withEntity(userEntity)

      request ~> routes ~> check {
        status should ===(StatusCodes.Created)

        // we expect the response to be json:
        contentType should ===(ContentTypes.`application/json`)

        // and we know what message we're expecting back:
        // entityAs[String] should ===("""{"description":"User Kapi created."}""")
        Unmarshal(response.entity).to[ActionPerformed].map(_ shouldBe ("""{"description":"User Kapi created."}"""))
      }
    }
    //#testing-post

    pending;
    "be able to remove users (DELETE /sensors1)" in {
      // user the RequestBuilding DSL provided by ScalatestRouteSpec:
      val request = Delete(uri = "/sensors1/Kapi")

      request ~> routes ~> check {
        status should ===(StatusCodes.OK)

        // we expect the response to be json:
        contentType should ===(ContentTypes.`application/json`)

        // and no entries should be in the list:
        // entityAs[String] should ===("""{"description":"User Kapi deleted."}""")
        Unmarshal(response.entity).to[ActionPerformed].map(_ shouldBe ("""{"description":"User Kapi deleted."}"""))
      }
    }
    //#actual-test
  }
  //#actual-test

  //#set-up
}

//#set-up
