import 'dart:html';
import 'package:js/js.dart';
import 'dart:convert';
import 'package:service_worker/window.dart' as sw;

import 'package:chartjs/chartjs.dart';
import 'types.d/leaflet_interop.dart' as L;
import 'types.d/module.dart';

Future main() async {
  // service worker stuff test
  if (sw.isNotSupported) {
    print('ServiceWorkers are not supported.');
    return;
  }

  await sw.register('sw.dart.js');
  print('registered');

  sw.ServiceWorkerRegistration registration = await sw.ready;
  print('ready');

  sw.onMessage.listen((MessageEvent event) {
    print('reply received: ${event.data}');
  });

  // the map
  var home = MapHome(58.00954, 26.0866693, 6);

  var map = L.Map('map');
  map.setView([home.lat, home.lng], home.zoom);

  L.TileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png')
    ..options.attribution =
        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
    ..addTo(map);

  L.Marker([58.00954, 26.0866693])
    ..addTo(map)
    ..bindPopup('Soontaga sensor station.')
    ..openPopup();

  var recentreControl = L.Control()
    ..setPosition("topLeft")
    ..onAdd = (map) => allowInterop(onAddFunction);

  // ..onAdd(onAddFunction);
  // recentreControl.onAdd( (Map map) => onAddFunction(map));
  // map.addControl(recentreControl);

  L.scale().addTo(map);

  var now_dart_utc = DateTime.now().toUtc();
  print(now_dart_utc.toIso8601String());

  var before_dart_utc = DateTime.now().subtract(new Duration(days: 2)).toUtc();
  print(before_dart_utc.toIso8601String());

  // const fluxdataurl = '/sensors1/data';
  const fluxdataurl = 'http://localhost:8081/sensors1/data';

  const parametersconf = {
    "Soontaga_LFdata": {
      "fields": [
        "P_air_Avg",
        "Rain_mm_Tot",
        "PAR_reflected_Den_umol_Avg",
        "PAR_reflected_Tot_Tot",
        "PAR_incoming_Den_umol_Avg",
        "PAR_incoming_Tot_Tot",
        "Albedo_Net_Avg",
        "Rnet_Net_Avg",
        "RIL_Net_Avg",
        "ROL_Net_Avg",
        "RLnet_Net_Avg",
        "RIS_Net_Avg",
        "ROS_Net_Avg",
        "RSnet_Net_Avg",
        "RIS_Pyr_Avg",
        "ROT_AirTC_Avg",
        "ROT_RH_Avg",
        "batt_volt_Min",
        "batt_volt_Avg",
        "PTemp_Avg"
      ]
    }
  };

  for (var field in parametersconf["Soontaga_LFdata"]["fields"]) {
    final stationFixed = "Soontaga_LFdata";

    final fluxdatarequestForEach = jsonEncode({
      "station": stationFixed,
      "parameter": field,
      "from": before_dart_utc.toIso8601String(),
      "to": now_dart_utc.toIso8601String()
    });

    var message = fluxdatarequestForEach.toString();
    print('Sending message: `$message`');
    registration.active.postMessage(message);
    print('Message sent: `$message`');

    var request = HttpRequest();
    request
      ..open('POST', fluxdataurl)
      ..setRequestHeader('Content-type', 'application/json')
      ..setRequestHeader("Access-Control-Allow-Credentials", "true")
      ..send(fluxdatarequestForEach);

    await request.onLoadEnd.first;

    if (request.status == 200) {
      // print(request.responseHeaders);
      var data = await processResponse(request.responseText);

      if (data.series.isEmpty) {
        querySelector('#chart_div_' + field).text = data.station +
            ": " +
            data.parameters.parameter +
            ' has zero values reported';
      }

      var chartData = LinearChartData(
          labels: data.series
              .map((obs) => obs.dateTime.millisecondsSinceEpoch)
              .toList(),
          datasets: <ChartDataSets>[
            ChartDataSets(
                type: "line",
                borderWidth: 2,
                backgroundColor: colorsAlpha['grey'],
                borderColor: colors['red'],
                label: data.station +
                    ": " +
                    data.parameters.description +
                    " in " +
                    data.parameters.unitname,
                data: data.series.map((obs) => obs.measureval).toList())
          ]);

      var options = ChartOptions(
          responsive: true,
          scales: TimeScale(xAxes: [
            ChartXAxe(
                type: "time",
                display: true,
                scaleLabel: ScaleTitleOptions(
                    labelString: 'Time (local), from ' +
                        before_dart_utc.toLocal().toString() +
                        " to " +
                        now_dart_utc.toLocal().toString()))
          ], yAxes: [
            ChartYAxe(
                scaleLabel: ScaleTitleOptions(
                    display: true,
                    labelString: data.parameters.parameter,
                    fontColor: colors['clack']))
          ]),
          hover: ChartHoverOptions(
              mode: "index",
              intersect: false,
              onHover: (active) => "data label"));

      var config =
          ChartConfiguration(type: 'bar', data: chartData, options: options);

      Chart(querySelector('#chart_canvas_' + field) as CanvasElement, config);

      // Load the Visualization API and the corechart package.
      // google.charts.load('current', {'packages': ['corechart'], 'language': 'en'});

      // Set a callback to run when the Google Visualization API is loaded.
      // google.charts.setOnLoadCallback(drawCharts);

    }
  }

  try {
    var subs = await registration.pushManager
        .subscribe(new sw.PushSubscriptionOptions(userVisibleOnly: true));
    print('endpoint: ${subs.endpoint}');
  } on DomException catch (_) {
    print('Error: Adding push subscription failed.');
    print('       See github.com/isoos/service_worker/issues/10');
  }
}

// methods

HtmlElement onAddFunction(L.Map map, MapHome home) {
  var container = L.create('div',
      'leaflet-bar leaflet-control leaflet-control-custom leafletGlyphIcon');

  container.title = "(Re-)Center map";
  container.style.backgroundColor = 'white';
  container.style.width = '30px';
  container.style.height = '30px';

  // <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
  container.onClick.listen((MouseEvent event) => {
        map.setView([
          [home.lat, home.lng]
        ], home.zoom)
      });
  return container;
}

Future<FluxDataSeries> processResponse(String jsonString) async {
  final dataset = json.decode(jsonString);
  return FluxDataSeries.fromJson(dataset);
}
