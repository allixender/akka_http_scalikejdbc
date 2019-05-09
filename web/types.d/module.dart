library api;

const colors = {
  "red": 'rgb(255, 99, 132)',
  "orange": 'rgb(255, 159, 64)',
  "yellow": 'rgb(255, 205, 86)',
  "green": 'rgb(75, 192, 192)',
  "blue": 'rgb(54, 162, 235)',
  "purple": 'rgb(153, 102, 255)',
  "grey": 'rgb(201, 203, 207)'
};

const colorsAlpha = {
  "red": 'rgba(255, 99, 132,0.4)',
  "orange": 'rgba(255, 159, 64,0.4)',
  "yellow": 'rgba(255, 205, 86,0.4)',
  "green": 'rgba(75, 192, 192,0.4)',
  "blue": 'rgba(54, 162, 235,0.4)',
  "purple": 'rgba(153, 102, 255,0.4)',
  "grey": 'rgba(201, 203, 207,0.4)'
};

List<FluxObs> parseJsonList(dynamic jsMap) {
  List<FluxObs> obsList = [];
  for (final obs in jsMap) {
    try {
      obsList.add(FluxObs.fromJson(obs));
    } catch (e) {
      print("didn't work: ${e}");
    }
  }
  return obsList;
}

class MapHome {
  num lat;
  num lng;
  num zoom;

  MapHome(this.lat, this.lng, this.zoom);
}

class FluxObs {
  final double measureval;
  final DateTime dateTime;

  const FluxObs({this.measureval, this.dateTime});

  factory FluxObs.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to FluxObs");
    }

    return FluxObs(
        measureval: json["measureval"],
        dateTime: DateTime.tryParse(json["dateTime"]));
  }

  Map<DateTime, num> asMap() {
    var obsMap = Map<DateTime, num>();
    obsMap[this.dateTime] = this.measureval;
    return obsMap;
  }
}

class FluxPara {
  final String parameter;
  final String description;
  final String unitname;

  const FluxPara({this.parameter, this.description, this.unitname});

  factory FluxPara.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to FluxPara");
    }

    return FluxPara(
      parameter: json["parameter"],
      description: json["description"] != null ? json["description"] : "",
      unitname: json["unitname"] != null ? json["unitname"] : "",
    );
  }
}

class FluxDataSeries {
  final String station;
  final FluxPara parameters;
  final List<FluxObs> series;

  const FluxDataSeries({this.station, this.parameters, this.series});

  factory FluxDataSeries.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw FormatException("Null JSON provided to FluxDataSeries");
    }
    var obsList = parseJsonList(json["series"]);

    return FluxDataSeries(
        station: json["station"],
        parameters: FluxPara.fromJson(json["parameter"]),
        series: obsList);
  }
}
