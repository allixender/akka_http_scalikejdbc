package ee.ut.fluxnet.sample

import java.time.LocalDateTime

import akka.actor.{ Actor, ActorLogging, Props }
import com.typesafe.config._
import scalikejdbc._

//#user-case-classes
final case class User(name: String, age: Int, countryOfResidence: String)

object User extends SQLSyntaxSupport[User] {

}

final case class ParameterCapabilities(parameter: String, description: String, unitname: String)

final case class StationCapabilities(station: String, parameters: Seq[ParameterCapabilities])

final case class DataCapabilities(stations: Seq[StationCapabilities])

final case class DataPoint(measureval: Option[Double], dateTime: LocalDateTime)

final case class DataSeries(station: String, parameter: ParameterCapabilities, series: Seq[DataPoint])

final case class Users(users: Seq[User])

//#user-case-classes

object FluxdataBabylonActor {

  final case class ActionPerformed(description: String)

  final case object GetAllFluxdata

  final case class CreateUserDeprecated(user: User)

  final case class GetFluxdataByName(name: String)

  final case class DeleteUserDeprecated(name: String)

  final case object RequestFluxataCapabilities

  final case class RequestFluxataSeries(station: String, parameter: String, from: LocalDateTime, to: LocalDateTime)

  def props: Props = Props[FluxdataBabylonActor].withDispatcher("blocking-io-dispatcher")
}

class FluxdataBabylonActor extends Actor with ActorLogging {

  import FluxdataBabylonActor._

  import scala.collection.JavaConversions._

  implicit val session = AutoSession

  val regularConfig: Config = ConfigFactory.load()
  val tablesConfig: List[String] = regularConfig.getStringList("tables.all").toList

  lazy val stations: Seq[StationCapabilities] = tablesConfig.map {
    station: String =>
      log.info(station)
      val tablesAccess = s"tables.$station.fields"
      log.info(tablesAccess)
      val fieldsConfig: List[String] = regularConfig.getStringList(tablesAccess).toList

      val paramCaps = fieldsConfig.map {
        field =>
          log.info(field)
          val fieldsAccess = s"tables.$station.$field"
          val description = regularConfig.getString(fieldsAccess + ".description")
          val unitname = regularConfig.getString(fieldsAccess + ".unitname")
          ParameterCapabilities(parameter = field, description = description, unitname = unitname)
      }
      StationCapabilities(station = station, parameters = paramCaps)
  }

  lazy val dataCapabilities = DataCapabilities(stations)

  /**
   *
   * @param station
   * @param parameter
   * @param from
   * @param to
   * @return
   */
  def queryDataSeries(station: String, parameter: String, from: LocalDateTime, to: LocalDateTime): Option[DataSeries] = {

    val formatter = java.time.format.DateTimeFormatter.ISO_LOCAL_DATE_TIME
    log.debug(s"$station, $parameter, ${formatter.format(from)}, ${formatter.format(to)}")

    val requestedParamCapa = dataCapabilities.stations.filter(_.station.contentEquals(station)).flatMap(_.parameters.filter(_.parameter.contentEquals(parameter))).headOption

    requestedParamCapa.map { theParamCapa =>

      val dataPoints: List[DataPoint] = DB readOnly { implicit session =>
        val table = SQLSyntax.createUnsafely(station)
        val param = SQLSyntax.createUnsafely(parameter)
        val sql1 = s"SELECT ${parameter}, TmStamp FROM ${station} WHERE TmStamp <= '${to}' AND TmStamp >= '${from}'"
        sql"SELECT ${param}, TmStamp FROM ${table} WHERE TmStamp >= ${from} AND TmStamp <= ${to}" // don't worry, prevents SQL injection
          .map { rs =>
            DataPoint(
              measureval = rs.doubleOpt(parameter),
              dateTime = rs.dateTime("TmStamp").toLocalDateTime
            )
          } // extracts values from rich java.sql.ResultSet
          .list() // single, list, traversable
          .apply() // Side effect!!! runs the SQL using Connection
      }
      Some(DataSeries(station = station, parameter = ParameterCapabilities(parameter = parameter, description = theParamCapa.description, unitname = theParamCapa.unitname), series = dataPoints))
    } getOrElse {
      log.warning("param station combo not found")
      None
    }
  }

  var users = Set.empty[User]

  def receive: Receive = {
    case GetAllFluxdata =>
      sender() ! Users(users.toSeq)
    case CreateUserDeprecated(user) =>
      users += user
      sender() ! ActionPerformed(s"User ${user.name} created.")
    case GetFluxdataByName(name) =>
      sender() ! users.find(_.name == name)
    case DeleteUserDeprecated(name) =>
      users.find(_.name == name) foreach { user => users -= user }
      sender() ! ActionPerformed(s"User ${name} deleted.")

    case RequestFluxataCapabilities =>
      sender() ! dataCapabilities
    case RequestFluxataSeries(station, parameter, from, to) =>
      sender() ! queryDataSeries(station, parameter, from, to)
  }
}
