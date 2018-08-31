package ee.ut.fluxnet.sample

import com.typesafe.config._
import org.scalatest.concurrent.ScalaFutures
import org.scalatest.{ Matchers, WordSpec }

class ConfigSpec extends WordSpec with Matchers with ScalaFutures {

  "the config" should {

    "load the tables" in {

      val customconfig = ConfigFactory.parseString(
        """tables {
          |  all = [ "Soontaga_LFdata" ],
          |
          |  Soontaga_LFdata {
          |    fields = [ P_air_Avg,
          |      Rain_mm_Tot,
          |      PAR_reflected_Den_umol_Avg,
          |      PAR_reflected_Tot_Tot,
          |      PAR_incoming_Den_umol_Avg,
          |      PAR_incoming_Tot_Tot,
          |      Albedo_Net_Avg,
          |      Rnet_Net_Avg,
          |      RIL_Net_Avg,
          |      ROL_Net_Avg,
          |      RLnet_Net_Avg,
          |      RIS_Net_Avg,
          |      ROS_Net_Avg,
          |      RSnet_Net_Avg,
          |      RIS_Pyr_Avg,
          |      ROT_AirTC_Avg,
          |      ROT_RH_Avg,
          |      batt_volt_Min,
          |      batt_volt_Avg,
          |      PTemp_Avg ],
          |
          |    P_air_Avg {description: "Air pressure", unitname: "mmHG"},
          |    Rain_mm_Tot {description: "Rainfall", unitname: "mm"},
          |    PAR_reflected_Den_umol_Avg {description: "Reflected Photosynthetically Active Radiation (PAR)", unitname: "µmol (photons) m-2 s-1"},
          |    PAR_reflected_Tot_Tot {description: "Reflected Photosynthetically Active Radiation (PAR)", unitname: "µmol (photons) m-2 s-1"},
          |    PAR_incoming_Den_umol_Avg {description: "Incoming Photosynthetically Active Radiation (PAR)", unitname: "µmol (photons) m-2 s-1"},
          |    PAR_incoming_Tot_Tot {description: "Incoming Photosynthetically Active Radiation (PAR)", unitname: "µmol (photons) m-2 s-1"},
          |    Albedo_Net_Avg {description: "Albedo (calculated)", unitname: "n/"},
          |    Rnet_Net_Avg {description: "Net Solar radiation (calculated)", unitname: "W/m2"},
          |    RIL_Net_Avg {description: "Incoming long-wave solar radiation", unitname: "W/m2"},
          |    ROL_Net_Avg {description: "Outgoing long-wave solar radiation", unitname: "W/m2"},
          |    RLnet_Net_Avg {description: "Net long-wave solar radiation", unitname: "W/m2"},
          |    RIS_Net_Avg {description: "Incoming short-wave solar radiation", unitname: "W/m2"},
          |    ROS_Net_Avg {description: "Outgoing short-wave solar radiation", unitname: "W/m2"},
          |    RSnet_Net_Avg {description: "Net short-wave solar radiation", unitname: "W/m2"},
          |    RIS_Pyr_Avg {description: "Short-wave global solar radiation", unitname: "W/m2"},
          |    ROT_AirTC_Avg {description: "Air temperature", unitname: "°C"},
          |    ROT_RH_Avg {description: "Air Humidity", unitname: "%"},
          |    batt_volt_Min {description: "minimal battery voltage", unitname: "V"},
          |    batt_volt_Avg {description: "average battery voltage", unitname: "V"},
          |    PTemp_Avg {description: "panel temperature", unitname: "°C"},
          |  }
          |}""".stripMargin
      )

      import scala.collection.JavaConversions._
      val tablesConfig: List[String] = customconfig.getStringList("tables.all").toList
      // val tablesConfig: Config = customconfig.getConfig("tables.all")
      // val tablesConfig = customconfig.getList("tables.all")

      val stations = tablesConfig.map {
        station: String =>
          println(station)
          val tablesAccess = s"tables.$station.fields"
          println(tablesAccess)
          val fieldsConfig: List[String] = customconfig.getStringList(tablesAccess).toList

          val paramCaps = fieldsConfig.map {
            field =>
              println(field)
              val fieldsAccess = s"tables.$station.$field"
              val description = customconfig.getString(fieldsAccess + ".description")
              val unitname = customconfig.getString(fieldsAccess + ".unitname")
              ParameterCapabilities(parameter = field, description = description, unitname = unitname)
          }
          StationCapabilities(station = station, parameters = paramCaps)
      }

      stations.head.parameters.size shouldBe 20
    }
  }
}
