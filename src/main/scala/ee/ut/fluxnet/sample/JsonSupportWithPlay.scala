package ee.ut.fluxnet.sample

import ee.ut.fluxnet.sample.FluxdataBabylonActor.{ ActionPerformed, RequestFluxataSeries }
import play.api.libs.json._

object JsonSupportWithPlay {
  implicit val parameterCapabilitiesFormat: Format[ParameterCapabilities] = Json.format[ParameterCapabilities]
  implicit val stationCapabilitiesFormat: Format[StationCapabilities] = Json.format[StationCapabilities]
  implicit val dataCapabilitiesFormat: Format[DataCapabilities] = Json.format[DataCapabilities]
  implicit val dataPointFormat: Format[DataPoint] = Json.format[DataPoint]
  implicit val dataSeriesFormat: Format[DataSeries] = Json.format[DataSeries]

  implicit val requestFluxataSeriesFormat: Format[RequestFluxataSeries] = Json.format[RequestFluxataSeries]

  implicit val userFormat: Format[User] = Json.format[User]
  implicit val usersFormat: Format[Users] = Json.format[Users]
  implicit val actionFormat: Format[ActionPerformed] = Json.format[ActionPerformed]
}
