@JS("L")
library leaflet_interop;

import "dart:html"
    show HtmlElement, ImageElement, MouseEvent, KeyboardEvent, Event;
import "package:js/js.dart";
import "dart:svg" show SvgElement;

import "func.dart";
import 'geojson_interop.dart';

/// Type definitions for Leaflet.js 1.2
/// Project: https://github.com/Leaflet/Leaflet
/// Definitions by: Alejandro Sánchez <https://github.com/alejo90>
/// Definitions: https://github.com/DefinitelyTyped/DefinitelyTyped
/// TypeScript Version: 2.3
@JS()
class Class {
  // @Ignore
  Class.fakeConstructor$();
  external static dynamic extend(dynamic props);
  external static dynamic include(dynamic props);
  external static dynamic mergeOptions(dynamic props);
  external static dynamic addInitHook(void initHookFn());
}

@JS()
class Transformation {
  // @Ignore
  Transformation.fakeConstructor$();
  external factory Transformation(num a, num b, num c, num d);
  external Point transform(Point point, [num scale]);
  external Point untransform(Point point, [num scale]);
}

// Module LineUtil
@JS("LineUtil.simplify")
external List<Point> simplify(List<Point> points, num tolerance);
@JS("LineUtil.pointToSegmentDistance")
external num pointToSegmentDistance(Point p, Point p1, Point p2);
@JS("LineUtil.closestPointOnSegment")
external Point closestPointOnSegment(Point p, Point p1, Point p2);
// End module LineUtil

// Module PolyUtil
@JS("PolyUtil.clipPolygon")
external List<Point> clipPolygon(List<Point> points,
    dynamic /*Bounds|Tuple of <Tuple of <num,num>,Tuple of <num,num>>*/ bounds,
    [bool round]);
// End module PolyUtil

// Module DomUtil
/// Get Element by its ID or with the given HTML-Element
@JS("DomUtil.get")
external HtmlElement /*HtmlElement|Null*/ JS$get(
    dynamic /*String|HtmlElement*/ element);
@JS("DomUtil.getStyle")
external String /*String|Null*/ getStyle(HtmlElement el, String styleAttrib);
@JS("DomUtil.create")
external HtmlElement create(String tagName,
    [String className, HtmlElement container]);
@JS("DomUtil.remove")
external void remove(HtmlElement el);
@JS("DomUtil.empty")
external void empty(HtmlElement el);
@JS("DomUtil.toFront")
external void toFront(HtmlElement el);
@JS("DomUtil.toBack")
external void toBack(HtmlElement el);
@JS("DomUtil.hasClass")
external bool hasClass(HtmlElement el, String name);
@JS("DomUtil.addClass")
external void addClass(HtmlElement el, String name);
@JS("DomUtil.removeClass")
external void removeClass(HtmlElement el, String name);
@JS("DomUtil.setClass")
external void setClass(HtmlElement el, String name);
@JS("DomUtil.getClass")
external String getClass(HtmlElement el);
@JS("DomUtil.setOpacity")
external void setOpacity(HtmlElement el, num opacity);
@JS("DomUtil.testProp")
external dynamic/*=String |*/ testProp(List<String> props);
@JS("DomUtil.setTransform")
external void setTransform(HtmlElement el, Point offset, [num scale]);
@JS("DomUtil.setPosition")
external void setPosition(HtmlElement el, Point position);
@JS("DomUtil.getPosition")
external Point getPosition(HtmlElement el);
@JS("DomUtil.disableTextSelection")
external void disableTextSelection();
@JS("DomUtil.enableTextSelection")
external void enableTextSelection();
@JS("DomUtil.disableImageDrag")
external void disableImageDrag();
@JS("DomUtil.enableImageDrag")
external void enableImageDrag();
@JS("DomUtil.preventOutline")
external void preventOutline(HtmlElement el);
@JS("DomUtil.restoreOutline")
external void restoreOutline();
@JS("DomUtil.TRANSFORM")
external String get TRANSFORM;
@JS("DomUtil.TRANSFORM")
external set TRANSFORM(String v);
@JS("DomUtil.TRANSITION")
external String get TRANSITION;
@JS("DomUtil.TRANSITION")
external set TRANSITION(String v);
@JS("DomUtil.TRANSITION_END")
external String get TRANSITION_END;
@JS("DomUtil.TRANSITION_END")
external set TRANSITION_END(String v);

// End module DomUtil
@anonymous
@JS()
abstract class CRS {
  external Point latLngToPoint(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng, num zoom);
  external LatLng pointToLatLng(
      dynamic /*Point|Tuple of <num,num>*/ point, num zoom);
  external Point project(dynamic /*LatLng|LatLngLiteral*/ latlng);
  external LatLng unproject(dynamic /*Point|Tuple of <num,num>*/ point);
  external num scale(num zoom);
  external num zoom(num scale);
  external Bounds getProjectedBounds(num zoom);
  external num distance(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng1,
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng2);
  external LatLng wrapLatLng(dynamic /*LatLng|LatLngLiteral*/ latlng);
  external String get code;
  external set code(String v);
  external List<num> /*Tuple of <num,num>*/ get wrapLng;
  external set wrapLng(List<num> /*Tuple of <num,num>*/ v);
  external List<num> /*Tuple of <num,num>*/ get wrapLat;
  external set wrapLat(List<num> /*Tuple of <num,num>*/ v);
  external bool get infinite;
  external set infinite(bool v);
}

// Module CRS
@JS("CRS.EPSG3395")
external CRS get EPSG3395;
@JS("CRS.EPSG3857")
external CRS get EPSG3857;
@JS("CRS.EPSG4326")
external CRS get EPSG4326;
@JS("CRS.Earth")
external CRS get Earth;
@JS("CRS.Simple")
external CRS get Simple;

// End module CRS
@anonymous
@JS()
abstract class Projection {
  external Point project(dynamic /*LatLng|LatLngLiteral*/ latlng);
  external LatLng unproject(dynamic /*Point|Tuple of <num,num>*/ point);
  external Bounds get bounds;
  external set bounds(Bounds v);
}

// Module Projection
@JS("Projection.LonLat")
external Projection get LonLat;
@JS("Projection.Mercator")
external Projection get Mercator;
@JS("Projection.SphericalMercator")
external Projection get SphericalMercator;

// End module Projection
@JS()
class LatLng {
  // @Ignore
  LatLng.fakeConstructor$();
  external factory LatLng(num latitude, num longitude, [num altitude]);
  external bool equals(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ otherLatLng,
      [num maxMargin]);
  external String toString();
  external num distanceTo(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ otherLatLng);
  external LatLng wrap();
  external LatLngBounds toBounds(num sizeInMeters);
  external num get lat;
  external set lat(num v);
  external num get lng;
  external set lng(num v);
  external num get alt;
  external set alt(num v);
}

@anonymous
@JS()
abstract class LatLngLiteral {
  external num get lat;
  external set lat(num v);
  external num get lng;
  external set lng(num v);
  external factory LatLngLiteral({num lat, num lng});
}

/*export type LatLngTuple = [number, number];*/
/*export type LatLngExpression = LatLng | LatLngLiteral | LatLngTuple;*/
/*external LatLng latLng(num latitude, num longitude, [num altitude]);*/
/*external LatLng latLng(Tuple of <num,num>|Tuple of <num,num,num>|LatLngLiteral|{lat: number, lng: number, alt?: number} coords);*/
@JS()
external LatLng latLng(
    dynamic /*num|Tuple of <num,num>|Tuple of <num,num,num>|LatLngLiteral|{lat: number, lng: number, alt?: number}*/ latitude_coords,
    [num longitude,
    num altitude]);

@JS()
class LatLngBounds {
  // @Ignore
  LatLngBounds.fakeConstructor$();
  /*external factory LatLngBounds(LatLng|LatLngLiteral|Tuple of <num,num> southWest, LatLng|LatLngLiteral|Tuple of <num,num> northEast);*/
  /*external factory LatLngBounds(List<Tuple of <num,num>> latlngs);*/
  external factory LatLngBounds(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>|List<Tuple of <num,num>>*/ southWest_latlngs,
      [dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ northEast]);
  external LatLngBounds extend(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>|LatLngBounds|List<Tuple of <num,num>>*/ latlngOrBounds);
  external LatLngBounds pad(num bufferRatio);
  external LatLng getCenter();
  external LatLng getSouthWest();
  external LatLng getNorthEast();
  external LatLng getNorthWest();
  external LatLng getSouthEast();
  external num getWest();
  external num getSouth();
  external num getEast();
  external num getNorth();
  external bool contains(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>|LatLng|LatLngLiteral|Tuple of <num,num>*/ otherBoundsOrLatLng);
  external bool intersects(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ otherBounds);
  external bool overlaps(
      dynamic /*Bounds|Tuple of <Tuple of <num,num>,Tuple of <num,num>>*/ otherBounds);
  external String toBBoxString();
  external bool equals(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ otherBounds);
  external bool isValid();
}

/*export type LatLngBoundsLiteral = LatLngTuple[];*/
/*export type LatLngBoundsExpression = LatLngBounds | LatLngBoundsLiteral;*/
/*external LatLngBounds latLngBounds(LatLng|LatLngLiteral|Tuple of <num,num> southWest, LatLng|LatLngLiteral|Tuple of <num,num> northEast);*/
/*external LatLngBounds latLngBounds(List<LatLng|LatLngLiteral|Tuple of <num,num>> latlngs);*/
@JS()
external LatLngBounds latLngBounds(
    dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>|List<LatLng|LatLngLiteral|Tuple of <num,num>>*/ southWest_latlngs,
    [dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ northEast]); /*export type PointTuple = [number, number];*/

@JS()
class Point with GeoJsonObject {
  // @Ignore
  Point.fakeConstructor$();
  external factory Point(num x, num y, [bool round]);
  external Point clone();
  external Point add(dynamic /*Point|Tuple of <num,num>*/ otherPoint);
  external Point subtract(dynamic /*Point|Tuple of <num,num>*/ otherPoint);
  external Point divideBy(num num);
  external Point multiplyBy(num num);
  external Point scaleBy(dynamic /*Point|Tuple of <num,num>*/ scale);
  external Point unscaleBy(dynamic /*Point|Tuple of <num,num>*/ scale);
  external Point round();
  external Point floor();
  external Point ceil();
  external num distanceTo(dynamic /*Point|Tuple of <num,num>*/ otherPoint);
  external bool equals(dynamic /*Point|Tuple of <num,num>*/ otherPoint);
  external bool contains(dynamic /*Point|Tuple of <num,num>*/ otherPoint);
  external String toString();
  external num get x;
  external set x(num v);
  external num get y;
  external set y(num v);
}

/*export type PointExpression = Point | PointTuple;*/
/*external Point point(num x, num y, [bool round]);*/
/*external Point point(Tuple of <num,num>|{x: number, y: number} coords);*/
@JS()
external Point point(
    dynamic /*num|Tuple of <num,num>|{x: number, y: number}*/ x_coords,
    [num y,
    bool round]); /*export type BoundsLiteral = [PointTuple, PointTuple];*/

@JS()
class Bounds {
  // @Ignore
  Bounds.fakeConstructor$();
  /*external factory Bounds(Point|Tuple of <num,num> topLeft, Point|Tuple of <num,num> bottomRight);*/
  /*external factory Bounds(List<Point>|Tuple of <Tuple of <num,num>,Tuple of <num,num>> points);*/
  external factory Bounds(
      dynamic /*Point|Tuple of <num,num>|List<Point>|Tuple of <Tuple of <num,num>,Tuple of <num,num>>*/ topLeft_points,
      [dynamic /*Point|Tuple of <num,num>*/ bottomRight]);
  external Bounds extend(dynamic /*Point|Tuple of <num,num>*/ point);
  external Point getCenter([bool round]);
  external Point getBottomLeft();
  external Point getTopRight();
  external Point getSize();
  external bool contains(
      dynamic /*Bounds|Tuple of <Tuple of <num,num>,Tuple of <num,num>>|Point|Tuple of <num,num>*/ pointOrBounds);
  external bool intersects(
      dynamic /*Bounds|Tuple of <Tuple of <num,num>,Tuple of <num,num>>*/ otherBounds);
  external bool overlaps(
      dynamic /*Bounds|Tuple of <Tuple of <num,num>,Tuple of <num,num>>*/ otherBounds);
  external Point get min;
  external set min(Point v);
  external Point get max;
  external set max(Point v);
}

/*export type BoundsExpression = Bounds | BoundsLiteral;*/
/*external Bounds bounds(Point|Tuple of <num,num> topLeft, Point|Tuple of <num,num> bottomRight);*/
/*external Bounds bounds(List<Point>|Tuple of <Tuple of <num,num>,Tuple of <num,num>> points);*/
@JS()
external Bounds bounds(
    dynamic /*Point|Tuple of <num,num>|List<Point>|Tuple of <Tuple of <num,num>,Tuple of <num,num>>*/ topLeft_points,
    [dynamic /*Point|Tuple of <num,num>*/ bottomRight]);
typedef void LeafletEventHandlerFn(LeafletEvent event);

@anonymous
@JS()
abstract class LeafletEventHandlerFnMap {
  /* Index signature is not yet supported by JavaScript interop. */
}

/// A set of methods shared between event-powered classes (like Map and Marker).
/// Generally, events allow you to execute some function when something happens
/// with an object (e.g. the user clicks on the map, causing the map to fire
/// 'click' event).
@JS()
abstract class Evented extends Class {
  // @Ignore
  Evented.fakeConstructor$() : super.fakeConstructor$();

  /// Adds a listener function (fn) to a particular event type of the object.
  /// You can optionally specify the context of the listener (object the this
  /// keyword will point to). You can also pass several space-separated types
  /// (e.g. 'click dblclick').
  /*external Evented on(String type, LeafletEventHandlerFn fn, [dynamic context]);*/
  /// Adds a set of type/listener pairs, e.g. {click: onClick, mousemove: onMouseMove}
  /*external Evented on(LeafletEventHandlerFnMap eventMap);*/
  external Evented on(dynamic /*String|LeafletEventHandlerFnMap*/ type_eventMap,
      [fn, dynamic context]);

  /// tslint:disable:unified-signatures
  /// With an eventMap there are no additional arguments allowed
  /// Removes a previously added listener function. If no function is specified,
  /// it will remove all the listeners of that particular event from the object.
  /// Note that if you passed a custom context to on, you must pass the same context
  /// to off in order to remove the listener.
  /*external Evented off(String type, [LeafletEventHandlerFn fn, dynamic context]);*/
  /// Removes a set of type/listener pairs.
  /*external Evented off(LeafletEventHandlerFnMap eventMap);*/
  /// tslint:enable
  /// Removes all listeners to all events on the object.
  /*external Evented off();*/
  external Evented off(
      [dynamic /*String|LeafletEventHandlerFnMap*/ type_eventMap,
      fn,
      dynamic context]);

  /// Fires an event of the specified type. You can optionally provide a data
  /// object — the first argument of the listener function will contain its properties.
  /// The event might can optionally be propagated to event parents.
  external Evented fire(String type, [dynamic data, bool propagate]);

  /// Returns true if a particular event type has any listeners attached to it.
  external bool listens(String type);

  /// Behaves as on(...), except the listener will only get fired once and then removed.
  /*external Evented once(String type, LeafletEventHandlerFn fn, [dynamic context]);*/
  /// Behaves as on(...), except the listener will only get fired once and then removed.
  /*external Evented once(LeafletEventHandlerFnMap eventMap);*/
  external Evented once(
      dynamic /*String|LeafletEventHandlerFnMap*/ type_eventMap,
      [fn,
      dynamic context]);

  /// Adds an event parent - an Evented that will receive propagated events
  external Evented addEventParent(Evented obj);

  /// Removes an event parent, so it will stop receiving propagated events
  external Evented removeEventParent(Evented obj);

  /// Alias for on(...)
  /// Adds a listener function (fn) to a particular event type of the object.
  /// You can optionally specify the context of the listener (object the this
  /// keyword will point to). You can also pass several space-separated types
  /// (e.g. 'click dblclick').
  /*external Evented addEventListener(String type, LeafletEventHandlerFn fn,
    [dynamic context]);*/
  /// Alias for on(...)
  /// Adds a set of type/listener pairs, e.g. {click: onClick, mousemove: onMouseMove}
  /*external Evented addEventListener(LeafletEventHandlerFnMap eventMap);*/
  external Evented addEventListener(
      dynamic /*String|LeafletEventHandlerFnMap*/ type_eventMap,
      [fn,
      dynamic context]);

  /// Alias for off(...)
  /// Removes a previously added listener function. If no function is specified,
  /// it will remove all the listeners of that particular event from the object.
  /// Note that if you passed a custom context to on, you must pass the same context
  /// to off in order to remove the listener.
  /*external Evented removeEventListener(String type, LeafletEventHandlerFn fn,
    [dynamic context]);*/
  /// Alias for off(...)
  /// Removes a set of type/listener pairs.
  /*external Evented removeEventListener(LeafletEventHandlerFnMap eventMap);*/
  external Evented removeEventListener(
      dynamic /*String|LeafletEventHandlerFnMap*/ type_eventMap,
      [fn,
      dynamic context]);

  /// Alias for off()
  /// Removes all listeners to all events on the object.
  external Evented clearAllEventListeners();

  /// Alias for once(...)
  /// Behaves as on(...), except the listener will only get fired once and then removed.
  /*external Evented addOneTimeEventListener(String type, LeafletEventHandlerFn fn,
    [dynamic context]);*/
  /// Alias for once(...)
  /// Behaves as on(...), except the listener will only get fired once and then removed.
  /*external Evented addOneTimeEventListener(LeafletEventHandlerFnMap eventMap);*/
  external Evented addOneTimeEventListener(
      dynamic /*String|LeafletEventHandlerFnMap*/ type_eventMap,
      [fn,
      dynamic context]);

  /// Alias for fire(...)
  /// Fires an event of the specified type. You can optionally provide a data
  /// object — the first argument of the listener function will contain its properties.
  /// The event might can optionally be propagated to event parents.
  external Evented fireEvent(String type, [dynamic data, bool propagate]);

  /// Alias for listens(...)
  /// Returns true if a particular event type has any listeners attached to it.
  external bool hasEventListeners(String type);
}

/// A class for making DOM elements draggable (including touch support).
/// Used internally for map and marker dragging. Only works for elements
/// that were positioned with [`L.DomUtil.setPosition`](#domutil-setposition).
@JS()
class Draggable extends Evented {
  // @Ignore
  Draggable.fakeConstructor$() : super.fakeConstructor$();
  external factory Draggable(HtmlElement element,
      [HtmlElement dragStartTarget, bool preventOutline]);
  external void enable();
  external void disable();
  external void finishDrag();
}

@anonymous
@JS()
abstract class LayerOptions {
  external String get pane;
  external set pane(String v);
  external String get attribution;
  external set attribution(String v);
  external factory LayerOptions({String pane, String attribution});
}

@anonymous
@JS()
abstract class InteractiveLayerOptions implements LayerOptions {
  external bool get interactive;
  external set interactive(bool v);
  external factory InteractiveLayerOptions(
      {bool interactive, String pane, String attribution});
}

@JS()
class Layer extends Evented {
  // @Ignore
  Layer.fakeConstructor$() : super.fakeConstructor$();
  external factory Layer([LayerOptions options]);
  external Layer addTo(dynamic /*Map|LayerGroup*/ map);
  external Layer remove();
  external Layer removeFrom(Map map);
  external dynamic /*HtmlElement|dynamic*/ getPane([String name]);

  /// Popup methods
  external Layer bindPopup(
      dynamic /*Func1<Layer, String|HtmlElement>|String|HtmlElement|Popup*/ content,
      [PopupOptions options]);
  external Layer unbindPopup();
  external Layer openPopup(
      [dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng]);
  external Layer closePopup();
  external Layer togglePopup();
  external bool isPopupOpen();
  external Layer setPopupContent(dynamic /*String|HtmlElement|Popup*/ content);
  external dynamic /*Popup|dynamic*/ getPopup();

  /// Tooltip methods
  external Layer bindTooltip(
      dynamic /*Func1<Layer, String|HtmlElement>|Tooltip|String|HtmlElement*/ content,
      [TooltipOptions options]);
  external Layer unbindTooltip();
  external Layer openTooltip(
      [dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng]);
  external Layer closeTooltip();
  external Layer toggleTooltip();
  external bool isTooltipOpen();
  external Layer setTooltipContent(
      dynamic /*String|HtmlElement|Tooltip*/ content);
  external dynamic /*Tooltip|dynamic*/ getTooltip();

  /// Extension methods
  external Layer onAdd(Map map);
  external Layer onRemove(Map map);
  external dynamic /*JSMap of <String,VoidFunc1<LeafletEvent>>*/ getEvents();
  external String /*String|Null*/ getAttribution();
  external Layer beforeAdd(Map map);
}

@anonymous
@JS()
abstract class GridLayerOptions {
  external dynamic /*num|Point*/ get tileSize;
  external set tileSize(dynamic /*num|Point*/ v);
  external num get opacity;
  external set opacity(num v);
  external bool get updateWhenIdle;
  external set updateWhenIdle(bool v);
  external bool get updateWhenZooming;
  external set updateWhenZooming(bool v);
  external num get updateInterval;
  external set updateInterval(num v);
  external String get attribution;
  external set attribution(String v);
  external num get zIndex;
  external set zIndex(num v);
  external dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ get bounds;
  external set bounds(dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ v);
  external num get minZoom;
  external set minZoom(num v);
  external num get maxZoom;
  external set maxZoom(num v);
  external bool get noWrap;
  external set noWrap(bool v);
  external String get pane;
  external set pane(String v);
  external String get className;
  external set className(String v);
  external num get keepBuffer;
  external set keepBuffer(num v);
  external factory GridLayerOptions(
      {dynamic /*num|Point*/ tileSize,
      num opacity,
      bool updateWhenIdle,
      bool updateWhenZooming,
      num updateInterval,
      String attribution,
      num zIndex,
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ bounds,
      num minZoom,
      num maxZoom,
      bool noWrap,
      String pane,
      String className,
      num keepBuffer});
}

@JS()
class GridLayer extends Layer {
  // @Ignore
  GridLayer.fakeConstructor$() : super.fakeConstructor$();
  external factory GridLayer([GridLayerOptions options]);
  external GridLayer bringToFront();
  external GridLayer bringToBack();
  external HtmlElement /*HtmlElement|Null*/ getContainer();
  external GridLayer setOpacity(num opacity);
  external GridLayer setZIndex(num zIndex);
  external bool isLoading();
  external GridLayer redraw();
  external Point getTileSize();
}

@JS()
external GridLayer gridLayer([GridLayerOptions options]);

@anonymous
@JS()
abstract class TileLayerOptions implements GridLayerOptions {
  external num get minZoom;
  external set minZoom(num v);
  external num get maxZoom;
  external set maxZoom(num v);
  external num get maxNativeZoom;
  external set maxNativeZoom(num v);
  external num get minNativeZoom;
  external set minNativeZoom(num v);
  external dynamic /*String|List<String>*/ get subdomains;
  external set subdomains(dynamic /*String|List<String>*/ v);
  external String get errorTileUrl;
  external set errorTileUrl(String v);
  external num get zoomOffset;
  external set zoomOffset(num v);
  external bool get tms;
  external set tms(bool v);
  external bool get zoomReverse;
  external set zoomReverse(bool v);
  external bool get detectRetina;
  external set detectRetina(bool v);
  external bool get crossOrigin;
  external set crossOrigin(
      bool v); /* Index signature is not yet supported by JavaScript interop. */
}

@JS()
class TileLayer extends GridLayer {
  // @Ignore
  TileLayer.fakeConstructor$() : super.fakeConstructor$();
  external factory TileLayer(String urlTemplate, [TileLayerOptions options]);
  external TileLayer setUrl(String url, [bool noRedraw]);
  external TileLayerOptions get options;
  external set options(TileLayerOptions v);
}

@JS()
external TileLayer tileLayer(String urlTemplate, [TileLayerOptions options]);

// End module TileLayer
@anonymous
@JS()
abstract class WMSOptions implements TileLayerOptions {
  external String get layers;
  external set layers(String v);
  external String get styles;
  external set styles(String v);
  external String get format;
  external set format(String v);
  external bool get transparent;
  external set transparent(bool v);
  external String get version;
  external set version(String v);
  external CRS get crs;
  external set crs(CRS v);
  external bool get uppercase;
  external set uppercase(bool v);
}

@anonymous
@JS()
abstract class WMSParams {
  external String get format;
  external set format(String v);
  external String get layers;
  external set layers(String v);
  external String get request;
  external set request(String v);
  external String get service;
  external set service(String v);
  external String get styles;
  external set styles(String v);
  external String get version;
  external set version(String v);
  external bool get transparent;
  external set transparent(bool v);
  external num get width;
  external set width(num v);
  external num get height;
  external set height(num v);
  external factory WMSParams(
      {String format,
      String layers,
      String request,
      String service,
      String styles,
      String version,
      bool transparent,
      num width,
      num height});
}

// Module TileLayer
@JS("TileLayer.WMS")
class WMS extends TileLayer {
  // @Ignore
  WMS.fakeConstructor$() : super.fakeConstructor$();
  external factory WMS(String baseUrl, [WMSOptions options]);
  external WMS setParams(WMSParams params, [bool noRedraw]);
  external WMSParams get wmsParams;
  external set wmsParams(WMSParams v);
  external WMSOptions get options;
  external set options(dynamic v);
}

// Module tileLayer
@JS("tileLayer.wms")
external WMS wms(String baseUrl, [WMSOptions options]);

// End module tileLayer
@anonymous
@JS()
abstract class ImageOverlayOptions implements LayerOptions {
  external num get opacity;
  external set opacity(num v);
  external String get alt;
  external set alt(String v);
  external bool get interactive;
  external set interactive(bool v);
  external String get attribution;
  external set attribution(String v);
  external bool get crossOrigin;
  external set crossOrigin(bool v);
  external factory ImageOverlayOptions(
      {num opacity,
      String alt,
      bool interactive,
      String attribution,
      bool crossOrigin,
      String pane});
}

@JS()
class ImageOverlay extends Layer {
  // @Ignore
  ImageOverlay.fakeConstructor$() : super.fakeConstructor$();
  external factory ImageOverlay(
      String imageUrl, dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ bounds,
      [ImageOverlayOptions options]);
  external ImageOverlay setOpacity(num opacity);
  external ImageOverlay bringToFront();
  external ImageOverlay bringToBack();
  external ImageOverlay setUrl(String url);

  /// Update the bounds that this ImageOverlay covers
  external ImageOverlay setBounds(LatLngBounds bounds);

  /// Get the bounds that this ImageOverlay covers
  external LatLngBounds getBounds();

  /// Get the img element that represents the ImageOverlay on the map
  external dynamic /*ImageElement|dynamic*/ getElement();
  external ImageOverlayOptions get options;
  external set options(ImageOverlayOptions v);
}

@JS()
external ImageOverlay imageOverlay(
    String imageUrl, dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ bounds,
    [ImageOverlayOptions options]); /*export type LineCapShape = 'butt' | 'round' | 'square' | 'inherit';*/

/*export type LineJoinShape = 'miter' | 'round' | 'bevel' | 'inherit';*/
/*export type FillRule = 'nonzero' | 'evenodd' | 'inherit';*/
@anonymous
@JS()
abstract class PathOptions implements InteractiveLayerOptions {
  external bool get stroke;
  external set stroke(bool v);
  external String get color;
  external set color(String v);
  external num get weight;
  external set weight(num v);
  external num get opacity;
  external set opacity(num v);
  external String /*'butt'|'round'|'square'|'inherit'*/ get lineCap;
  external set lineCap(String /*'butt'|'round'|'square'|'inherit'*/ v);
  external String /*'miter'|'round'|'bevel'|'inherit'*/ get lineJoin;
  external set lineJoin(String /*'miter'|'round'|'bevel'|'inherit'*/ v);
  external String get dashArray;
  external set dashArray(String v);
  external String get dashOffset;
  external set dashOffset(String v);
  external bool get fill;
  external set fill(bool v);
  external String get fillColor;
  external set fillColor(String v);
  external num get fillOpacity;
  external set fillOpacity(num v);
  external String /*'nonzero'|'evenodd'|'inherit'*/ get fillRule;
  external set fillRule(String /*'nonzero'|'evenodd'|'inherit'*/ v);
  external Renderer get renderer;
  external set renderer(Renderer v);
  external String get className;
  external set className(String v);
  external factory PathOptions(
      {bool stroke,
      String color,
      num weight,
      num opacity,
      String /*'butt'|'round'|'square'|'inherit'*/ lineCap,
      String /*'miter'|'round'|'bevel'|'inherit'*/ lineJoin,
      String dashArray,
      String dashOffset,
      bool fill,
      String fillColor,
      num fillOpacity,
      String /*'nonzero'|'evenodd'|'inherit'*/ fillRule,
      Renderer renderer,
      String className,
      bool interactive,
      String pane,
      String attribution});
}

@JS()
abstract class Path extends Layer {
  // @Ignore
  Path.fakeConstructor$() : super.fakeConstructor$();
  external Path redraw();
  external Path setStyle(PathOptions style);
  external Path bringToFront();
  external Path bringToBack();
  external dynamic /*Element|dynamic*/ getElement();
  external PathOptions get options;
  external set options(PathOptions v);
}

@anonymous
@JS()
abstract class PolylineOptions implements PathOptions {
  external num get smoothFactor;
  external set smoothFactor(num v);
  external bool get noClip;
  external set noClip(bool v);
  external factory PolylineOptions(
      {num smoothFactor,
      bool noClip,
      bool stroke,
      String color,
      num weight,
      num opacity,
      String /*'butt'|'round'|'square'|'inherit'*/ lineCap,
      String /*'miter'|'round'|'bevel'|'inherit'*/ lineJoin,
      String dashArray,
      String dashOffset,
      bool fill,
      String fillColor,
      num fillOpacity,
      String /*'nonzero'|'evenodd'|'inherit'*/ fillRule,
      Renderer renderer,
      String className,
      bool interactive,
      String pane,
      String attribution});
}

@JS()
class Polyline {
  // @Ignore
  Polyline.fakeConstructor$();
}

@JS()
external Polyline polyline(
    List<dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ > latlngs,
    [PolylineOptions options]);

@JS()
class Polygon extends Polyline {
  // @Ignore
  Polygon.fakeConstructor$() : super.fakeConstructor$();
  external factory Polygon(
      List<
          dynamic> /*List<LatLng|LatLngLiteral|Tuple of <num,num>>|List<List<LatLng|LatLngLiteral|Tuple of <num,num>>>*/ latlngs,
      [PolylineOptions options]);
}

@JS()
external Polygon polygon(
    List<
        dynamic> /*List<LatLng|LatLngLiteral|Tuple of <num,num>>|List<List<LatLng|LatLngLiteral|Tuple of <num,num>>>*/ latlngs,
    [PolylineOptions options]);

@JS()
class Rectangle extends Polygon {
  // @Ignore
  Rectangle.fakeConstructor$() : super.fakeConstructor$();
  external factory Rectangle(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ latLngBounds,
      [PolylineOptions options]);
  external Rectangle setBounds(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ latLngBounds);
}

@JS()
external Rectangle rectangle(
    dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ latLngBounds,
    [PolylineOptions options]);

@anonymous
@JS()
abstract class CircleMarkerOptions implements PathOptions {
  external num get radius;
  external set radius(num v);
  external factory CircleMarkerOptions(
      {num radius,
      bool stroke,
      String color,
      num weight,
      num opacity,
      String /*'butt'|'round'|'square'|'inherit'*/ lineCap,
      String /*'miter'|'round'|'bevel'|'inherit'*/ lineJoin,
      String dashArray,
      String dashOffset,
      bool fill,
      String fillColor,
      num fillOpacity,
      String /*'nonzero'|'evenodd'|'inherit'*/ fillRule,
      Renderer renderer,
      String className,
      bool interactive,
      String pane,
      String attribution});
}

@JS()
class CircleMarker extends Path {
  // @Ignore
  CircleMarker.fakeConstructor$() : super.fakeConstructor$();
  external factory CircleMarker(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
      [CircleMarkerOptions options]);
  external Feature<Point, dynamic> toGeoJSON();
  external CircleMarker setLatLng(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latLng);
  external LatLng getLatLng();
  external CircleMarker setRadius(num radius);
  external num getRadius();
  external CircleMarkerOptions get options;
  external set options(dynamic v);
  external Feature<Point, dynamic> get feature;
  external set feature(Feature<Point, dynamic> v);
}

@JS()
external CircleMarker circleMarker(
    dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
    [CircleMarkerOptions options]);

@JS()
class Circle extends CircleMarker {
  // @Ignore
  Circle.fakeConstructor$() : super.fakeConstructor$();
  /*external factory Circle(LatLng|LatLngLiteral|Tuple of <num,num> latlng, [CircleMarkerOptions options]);*/
  /*external factory Circle(LatLng|LatLngLiteral|Tuple of <num,num> latlng, num radius, [CircleMarkerOptions options]);*/
  external factory Circle(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
      [dynamic /*CircleMarkerOptions|num*/ options_radius,
      CircleMarkerOptions options]);
  external LatLngBounds getBounds();
}

/*external Circle circle(LatLng|LatLngLiteral|Tuple of <num,num> latlng, [CircleMarkerOptions options]);*/
/*external Circle circle(LatLng|LatLngLiteral|Tuple of <num,num> latlng, num radius, [CircleMarkerOptions options]);*/
@JS()
external Circle circle(
    dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
    [dynamic /*CircleMarkerOptions|num*/ options_radius,
    CircleMarkerOptions options]);

@anonymous
@JS()
abstract class RendererOptions implements LayerOptions {
  external num get padding;
  external set padding(num v);
  external factory RendererOptions(
      {num padding, String pane, String attribution});
}

@JS()
class Renderer extends Layer {
  // @Ignore
  Renderer.fakeConstructor$() : super.fakeConstructor$();
  external factory Renderer([RendererOptions options]);
  external RendererOptions get options;
  external set options(RendererOptions v);
}

@JS()
class SVG extends Renderer {
  // @Ignore
  SVG.fakeConstructor$() : super.fakeConstructor$();
}

// Module SVG
@JS("SVG.create")
external SvgElement SVG_create(String name);
@JS("SVG.pointsToPath")
external String pointsToPath(
    List<dynamic /*Point|Tuple of <num,num>*/ > rings, bool close);
// End module SVG
@JS()
external SVG svg([RendererOptions options]);

@JS()
class Canvas extends Renderer {
  // @Ignore
  Canvas.fakeConstructor$() : super.fakeConstructor$();
}

@JS()
external Canvas canvas([RendererOptions options]);

/// Used to group several layers and handle them as one.
/// If you add it to the map, any layers added or removed from the group will be
/// added/removed on the map as well. Extends Layer.
@JS()
class LayerGroup extends Layer {
  // @Ignore
  LayerGroup.fakeConstructor$() : super.fakeConstructor$();
  external factory LayerGroup([List<Layer> layers]);

  /// Returns a GeoJSON representation of the layer group (as a GeoJSON GeometryCollection, GeoJSONFeatureCollection or Multipoint).
  external dynamic /*FeatureCollection<Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection>|Feature<MultiPoint>|GeometryCollection*/ toGeoJSON();

  /// Adds the given layer to the group.
  external LayerGroup addLayer(Layer layer);

  /// Removes the layer with the given internal ID or the given layer from the group.
  external LayerGroup removeLayer(dynamic /*num|Layer*/ layer);

  /// Returns true if the given layer is currently added to the group.
  external bool hasLayer(Layer layer);

  /// Removes all the layers from the group.
  external LayerGroup clearLayers();

  /// Calls methodName on every layer contained in this group, passing any additional parameters.
  /// Has no effect if the layers contained do not implement methodName.
  external LayerGroup invoke(String methodName,
      [dynamic params1,
      dynamic params2,
      dynamic params3,
      dynamic params4,
      dynamic params5]);

  /// Iterates over the layers of the group,
  /// optionally specifying context of the iterator function.
  external LayerGroup eachLayer(void fn(Layer layer), [dynamic context]);

  /// Returns the layer with the given internal ID.
  external dynamic /*Layer|dynamic*/ getLayer(num id);

  /// Returns an array of all the layers added to the group.
  external List<Layer> getLayers();

  /// Calls setZIndex on every layer contained in this group, passing the z-index.
  external LayerGroup setZIndex(num zIndex);

  /// Returns the internal ID for a layer
  external num getLayerId(Layer layer);
  external dynamic /*FeatureCollection<Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection>|Feature<MultiPoint>|GeometryCollection*/ get feature;
  external set feature(
      dynamic /*FeatureCollection<Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection>|Feature<MultiPoint>|GeometryCollection*/ v);
}

/// Create a layer group, optionally given an initial set of layers.
@JS()
external LayerGroup layerGroup(List<Layer> layers);

/// Extended LayerGroup that also has mouse events (propagated from
/// members of the group) and a shared bindPopup method.
@JS()
class FeatureGroup extends LayerGroup {
  // @Ignore
  FeatureGroup.fakeConstructor$() : super.fakeConstructor$();

  /// Sets the given path options to each layer of the group that has a setStyle method.
  external FeatureGroup setStyle(StyleFunction style);

  /// Brings the layer group to the top of all other layers
  external FeatureGroup bringToFront();

  /// Brings the layer group to the top [sic] of all other layers
  external FeatureGroup bringToBack();

  /// Returns the LatLngBounds of the Feature Group (created from
  /// bounds and coordinates of its children).
  external LatLngBounds getBounds();
}

/// Create a feature group, optionally given an initial set of layers.
@JS()
external FeatureGroup featureGroup([List<Layer> layers]);
typedef PathOptions StyleFunction(
    [Feature<
        dynamic /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/, dynamic> feature]);

@anonymous
@JS()
abstract class GeoJSONOptions implements LayerOptions {
  /// A Function defining how GeoJSON points spawn Leaflet layers.
  /// It is internally called when data is added, passing the GeoJSON point
  /// feature and its LatLng.
  /// The default is to spawn a default Marker:
  /// ```
  /// function(geoJsonPoint, latlng) {
  /// return L.marker(latlng);
  /// }
  /// ```
  external Layer pointToLayer(Feature<Point, dynamic> geoJsonPoint, LatLng latlng);

  /// A Function defining the Path options for styling GeoJSON lines and polygons,
  /// called internally when data is added.
  /// The default value is to not override any defaults:
  /// ```
  /// function (geoJsonFeature) {
  /// return {}
  /// }
  /// ```
  external StyleFunction get style;
  external set style(StyleFunction v);

  /// A Function that will be called once for each created Feature, after it
  /// has been created and styled. Useful for attaching events and popups to features.
  /// The default is to do nothing with the newly created layers:
  /// ```
  /// function (feature, layer) {}
  /// ```
  external void onEachFeature(
      Feature<
          dynamic /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/ ,dynamic> feature,
      Layer layer);

  /// A Function that will be used to decide whether to show a feature or not.
  /// The default is to show all features:
  /// ```
  /// function (geoJsonFeature) {
  /// return true;
  /// }
  /// ```
  external bool filter(
      Feature<
          dynamic /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/, dynamic> geoJsonFeature);

  /// A Function that will be used for converting GeoJSON coordinates to LatLngs.
  /// The default is the coordsToLatLng static method.
  external LatLng coordsToLatLng(
      List<num> /*Tuple of <num,num>|Tuple of <num,num,num>*/ coords);
}

/// Represents a GeoJSON object or an array of GeoJSON objects.
/// Allows you to parse GeoJSON data and display it on the map. Extends FeatureGroup.
@JS()
class GeoJSON extends FeatureGroup {
  // @Ignore
  GeoJSON.fakeConstructor$() : super.fakeConstructor$();

  /// Creates a Layer from a given GeoJSON feature. Can use a custom pointToLayer
  /// and/or coordsToLatLng functions if provided as options.
  external static Layer geometryToLayer(
      Feature<
          dynamic /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/, dynamic> featureData,
      [GeoJSONOptions options]);

  /// Creates a LatLng object from an array of 2 numbers (longitude, latitude) or
  /// 3 numbers (longitude, latitude, altitude) used in GeoJSON for points.
  external static LatLng coordsToLatLng(
      List<num> /*Tuple of <num,num>|Tuple of <num,num,num>*/ coords);

  /// Creates a multidimensional array of LatLngs from a GeoJSON coordinates array.
  /// levelsDeep specifies the nesting level (0 is for an array of points, 1 for an array of
  /// arrays of points, etc., 0 by default).
  /// Can use a custom coordsToLatLng function.
  external static List<dynamic> coordsToLatLngs(List<dynamic> coords,
      [num levelsDeep,
      LatLng coordsToLatLng(
          List<num> /*Tuple of <num,num>|Tuple of <num,num,num>*/ coords)]);

  /// Reverse of coordsToLatLng
  external static List<
      num> /*Tuple of <num,num>|Tuple of <num,num,num>*/ latLngToCoords(LatLng latlng);

  /// Reverse of coordsToLatLngs closed determines whether the first point should be
  /// appended to the end of the array to close the feature, only used when levelsDeep is 0.
  /// False by default.
  external static List<dynamic> latLngsToCoords(List<dynamic> latlngs,
      [num levelsDeep, bool closed]);

  /// Normalize GeoJSON geometries/features into GeoJSON features.
  external static Feature<
          dynamic /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/, dynamic>
      asFeature(dynamic /*Feature<Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection>|Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/ geojson);
  external factory GeoJSON([GeoJsonObject geojson, GeoJSONOptions options]);

  /// Adds a GeoJSON object to the layer.
  external Layer addData(GeoJsonObject data);

  /// Resets the given vector layer's style to the original GeoJSON style,
  /// useful for resetting style after hover events.
  external Layer resetStyle(Layer layer);

  /// Changes styles of GeoJSON vector layers with the given style function.
  external GeoJSON setStyle(StyleFunction style);
  external GeoJSONOptions get options;
  external set options(GeoJSONOptions v);
}

/// Creates a GeoJSON layer.
/// Optionally accepts an object in GeoJSON format to display on the
/// map (you can alternatively add it later with addData method) and
/// an options object.
@JS()
external GeoJSON geoJSON(
    [GeoJsonObject geojson,
    GeoJSONOptions options]); /*export type Zoom = boolean | 'center';*/

@anonymous
@JS()
abstract class MapOptions {
  external bool get preferCanvas;
  external set preferCanvas(bool v);

  /// Control options
  external bool get attributionControl;
  external set attributionControl(bool v);
  external bool get zoomControl;
  external set zoomControl(bool v);

  /// Interaction options
  external bool get closePopupOnClick;
  external set closePopupOnClick(bool v);
  external num get zoomSnap;
  external set zoomSnap(num v);
  external num get zoomDelta;
  external set zoomDelta(num v);
  external bool get trackResize;
  external set trackResize(bool v);
  external bool get boxZoom;
  external set boxZoom(bool v);
  external dynamic /*bool|'center'*/ get doubleClickZoom;
  external set doubleClickZoom(dynamic /*bool|'center'*/ v);
  external bool get dragging;
  external set dragging(bool v);

  /// Map state options
  external CRS get crs;
  external set crs(CRS v);
  external dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ get center;
  external set center(dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ v);
  external num get zoom;
  external set zoom(num v);
  external num get minZoom;
  external set minZoom(num v);
  external num get maxZoom;
  external set maxZoom(num v);
  external List<Layer> get layers;
  external set layers(List<Layer> v);
  external dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ get maxBounds;
  external set maxBounds(dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ v);
  external Renderer get renderer;
  external set renderer(Renderer v);

  /// Animation options
  external bool get fadeAnimation;
  external set fadeAnimation(bool v);
  external bool get markerZoomAnimation;
  external set markerZoomAnimation(bool v);
  external num get transform3DLimit;
  external set transform3DLimit(num v);
  external bool get zoomAnimation;
  external set zoomAnimation(bool v);
  external num get zoomAnimationThreshold;
  external set zoomAnimationThreshold(num v);

  /// Panning inertia options
  external bool get inertia;
  external set inertia(bool v);
  external num get inertiaDeceleration;
  external set inertiaDeceleration(num v);
  external num get inertiaMaxSpeed;
  external set inertiaMaxSpeed(num v);
  external num get easeLinearity;
  external set easeLinearity(num v);
  external bool get worldCopyJump;
  external set worldCopyJump(bool v);
  external num get maxBoundsViscosity;
  external set maxBoundsViscosity(num v);

  /// Keyboard navigation options
  external bool get keyboard;
  external set keyboard(bool v);
  external num get keyboardPanDelta;
  external set keyboardPanDelta(num v);

  /// Mousewheel options
  external dynamic /*bool|'center'*/ get scrollWheelZoom;
  external set scrollWheelZoom(dynamic /*bool|'center'*/ v);
  external num get wheelDebounceTime;
  external set wheelDebounceTime(num v);
  external num get wheelPxPerZoomLevel;
  external set wheelPxPerZoomLevel(num v);

  /// Touch interaction options
  external bool get tap;
  external set tap(bool v);
  external num get tapTolerance;
  external set tapTolerance(num v);
  external dynamic /*bool|'center'*/ get touchZoom;
  external set touchZoom(dynamic /*bool|'center'*/ v);
  external bool get bounceAtZoomLimits;
  external set bounceAtZoomLimits(bool v);
  external factory MapOptions(
      {bool preferCanvas,
      bool attributionControl,
      bool zoomControl,
      bool closePopupOnClick,
      num zoomSnap,
      num zoomDelta,
      bool trackResize,
      bool boxZoom,
      dynamic /*bool|'center'*/ doubleClickZoom,
      bool dragging,
      CRS crs,
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ center,
      num zoom,
      num minZoom,
      num maxZoom,
      List<Layer> layers,
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ maxBounds,
      Renderer renderer,
      bool fadeAnimation,
      bool markerZoomAnimation,
      num transform3DLimit,
      bool zoomAnimation,
      num zoomAnimationThreshold,
      bool inertia,
      num inertiaDeceleration,
      num inertiaMaxSpeed,
      num easeLinearity,
      bool worldCopyJump,
      num maxBoundsViscosity,
      bool keyboard,
      num keyboardPanDelta,
      dynamic /*bool|'center'*/ scrollWheelZoom,
      num wheelDebounceTime,
      num wheelPxPerZoomLevel,
      bool tap,
      num tapTolerance,
      dynamic /*bool|'center'*/ touchZoom,
      bool bounceAtZoomLimits});
}

/*export type ControlPosition = 'topleft' | 'topright' | 'bottomleft' | 'bottomright';*/
@anonymous
@JS()
abstract class ControlOptions {
  external String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ get position;
  external set position(
      String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ v);
  external factory ControlOptions(
      {String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ position});
}

@JS()
class Control extends Class {
  // @Ignore
  Control.fakeConstructor$() : super.fakeConstructor$();
  external factory Control([ControlOptions options]);
  external String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ getPosition();
  external Control setPosition(
      String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ position);
  external dynamic /*HtmlElement|dynamic*/ getContainer();
  external Control addTo(Map map);
  external Control remove();

  /// Extension methods
  external Function get onAdd;
  external set onAdd(Function f);
  external void onRemove(Map map);
  external ControlOptions get options;
  external set options(ControlOptions v);
}

// Module Control
@anonymous
@JS()
abstract class ZoomOptions implements ControlOptions {
  external String get zoomInText;
  external set zoomInText(String v);
  external String get zoomInTitle;
  external set zoomInTitle(String v);
  external String get zoomOutText;
  external set zoomOutText(String v);
  external String get zoomOutTitle;
  external set zoomOutTitle(String v);
  external factory ZoomOptions(
      {String zoomInText,
      String zoomInTitle,
      String zoomOutText,
      String zoomOutTitle,
      String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ position});
}

@JS("Control.Zoom")
class Zoom extends Control {
  // @Ignore
  Zoom.fakeConstructor$() : super.fakeConstructor$();
  external factory Zoom([ZoomOptions options]);
  external ZoomOptions get options;
  external set options(dynamic v);
}

@anonymous
@JS()
abstract class AttributionOptions implements ControlOptions {
  external dynamic /*String|bool*/ get prefix;
  external set prefix(dynamic /*String|bool*/ v);
  external factory AttributionOptions(
      {dynamic /*String|bool*/ prefix,
      String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ position});
}

@JS("Control.Attribution")
class Attribution extends Control {
  // @Ignore
  Attribution.fakeConstructor$() : super.fakeConstructor$();
  external factory Attribution([AttributionOptions options]);
  external Attribution setPrefix(String prefix);
  external Attribution addAttribution(String text);
  external Attribution removeAttribution(String text);
  external AttributionOptions get options;
  external set options(dynamic /*AttributionOptions*/ v);
}

@anonymous
@JS()
abstract class LayersOptions implements ControlOptions {
  external bool get collapsed;
  external set collapsed(bool v);
  external bool get autoZIndex;
  external set autoZIndex(bool v);
  external bool get hideSingleBase;
  external set hideSingleBase(bool v);
  external factory LayersOptions(
      {bool collapsed,
      bool autoZIndex,
      bool hideSingleBase,
      String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ position});
}

@anonymous
@JS()
abstract class LayersObject {
  /* Index signature is not yet supported by JavaScript interop. */
}

@JS("Control.Layers")
class Layers extends Control {
  // @Ignore
  Layers.fakeConstructor$() : super.fakeConstructor$();
  external factory Layers(
      [LayersObject baseLayers, LayersObject overlays, LayersOptions options]);
  external Layers addBaseLayer(Layer layer, String name);
  external Layers addOverlay(Layer layer, String name);
  external Layers removeLayer(Layer layer);
  external Layers expand();
  external Layers collapse();
  external LayersOptions get options;
  external set options(dynamic /*LayersOptions*/ v);
}

@anonymous
@JS()
abstract class ScaleOptions implements ControlOptions {
  external num get maxWidth;
  external set maxWidth(num v);
  external bool get metric;
  external set metric(bool v);
  external bool get imperial;
  external set imperial(bool v);
  external bool get updateWhenIdle;
  external set updateWhenIdle(bool v);
  external factory ScaleOptions(
      {num maxWidth,
      bool metric,
      bool imperial,
      bool updateWhenIdle,
      String /*'topleft'|'topright'|'bottomleft'|'bottomright'*/ position});
}

@JS("Control.Scale")
class Scale extends Control {
  // @Ignore
  Scale.fakeConstructor$() : super.fakeConstructor$();
  external factory Scale([ScaleOptions options]);
  external ScaleOptions get options;
  external set options(dynamic /*ScaleOptions*/ v);
}

// End module Control

// Module control
@JS("control.zoom")
external Zoom zoom([ZoomOptions options]);
@JS("control.attribution")
external Attribution attribution([AttributionOptions options]);
@JS("control.layers")
external Layers layers(
    [LayersObject baseLayers, LayersObject overlays, LayersOptions options]);
@JS("control.scale")
external Scale scale([ScaleOptions options]);

// End module control
@anonymous
@JS()
abstract class DivOverlayOptions {
  external dynamic /*Point|Tuple of <num,num>*/ get offset;
  external set offset(dynamic /*Point|Tuple of <num,num>*/ v);
  external bool get zoomAnimation;
  external set zoomAnimation(bool v);
  external String get className;
  external set className(String v);
  external String get pane;
  external set pane(String v);
  external factory DivOverlayOptions(
      {dynamic /*Point|Tuple of <num,num>*/ offset,
      bool zoomAnimation,
      String className,
      String pane});
}

@anonymous
@JS()
abstract class PopupOptions implements DivOverlayOptions {
  external num get maxWidth;
  external set maxWidth(num v);
  external num get minWidth;
  external set minWidth(num v);
  external num get maxHeight;
  external set maxHeight(num v);
  external bool get autoPan;
  external set autoPan(bool v);
  external dynamic /*Point|Tuple of <num,num>*/ get autoPanPaddingTopLeft;
  external set autoPanPaddingTopLeft(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get autoPanPaddingBottomRight;
  external set autoPanPaddingBottomRight(
      dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get autoPanPadding;
  external set autoPanPadding(dynamic /*Point|Tuple of <num,num>*/ v);
  external bool get keepInView;
  external set keepInView(bool v);
  external bool get closeButton;
  external set closeButton(bool v);
  external bool get autoClose;
  external set autoClose(bool v);
  external bool get closeOnClick;
  external set closeOnClick(bool v);
  external factory PopupOptions(
      {num maxWidth,
      num minWidth,
      num maxHeight,
      bool autoPan,
      dynamic /*Point|Tuple of <num,num>*/ autoPanPaddingTopLeft,
      dynamic /*Point|Tuple of <num,num>*/ autoPanPaddingBottomRight,
      dynamic /*Point|Tuple of <num,num>*/ autoPanPadding,
      bool keepInView,
      bool closeButton,
      bool autoClose,
      bool closeOnClick,
      dynamic /*Point|Tuple of <num,num>*/ offset,
      bool zoomAnimation,
      String className,
      String pane});
}

/*export type Content = string | HTMLElement;*/
@JS()
class Popup extends Layer {
  // @Ignore
  Popup.fakeConstructor$() : super.fakeConstructor$();
  external factory Popup([PopupOptions options, Layer source]);
  external dynamic /*LatLng|dynamic*/ getLatLng();
  external Popup setLatLng(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng);
  external dynamic /*String|HtmlElement|Func1<Layer, String|HtmlElement>|dynamic*/ getContent();
  external Popup setContent(
      dynamic /*Func1<Layer, String|HtmlElement>|String|HtmlElement*/ htmlContent);
  external dynamic /*HtmlElement|dynamic*/ getElement();
  external void update();
  external bool isOpen();
  external Popup bringToFront();
  external Popup bringToBack();
  external Popup openOn(Map map);
  external PopupOptions get options;
  external set options(PopupOptions v);
}

@JS()
external Popup popup(
    [PopupOptions options,
    Layer source]); /*export type Direction = 'right' | 'left' | 'top' | 'bottom' | 'center' | 'auto';*/

@anonymous
@JS()
abstract class TooltipOptions implements DivOverlayOptions {
  external String get pane;
  external set pane(String v);
  external dynamic /*Point|Tuple of <num,num>*/ get offset;
  external set offset(dynamic /*Point|Tuple of <num,num>*/ v);
  external String /*'right'|'left'|'top'|'bottom'|'center'|'auto'*/ get direction;
  external set direction(
      String /*'right'|'left'|'top'|'bottom'|'center'|'auto'*/ v);
  external bool get permanent;
  external set permanent(bool v);
  external bool get sticky;
  external set sticky(bool v);
  external bool get interactive;
  external set interactive(bool v);
  external num get opacity;
  external set opacity(num v);
  external factory TooltipOptions(
      {String pane,
      dynamic /*Point|Tuple of <num,num>*/ offset,
      String /*'right'|'left'|'top'|'bottom'|'center'|'auto'*/ direction,
      bool permanent,
      bool sticky,
      bool interactive,
      num opacity,
      bool zoomAnimation,
      String className});
}

@JS()
class Tooltip extends Layer {
  // @Ignore
  Tooltip.fakeConstructor$() : super.fakeConstructor$();
  external factory Tooltip([TooltipOptions options, Layer source]);
  external void setOpacity(num val);
  external dynamic /*LatLng|dynamic*/ getLatLng();
  external Tooltip setLatLng(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng);
  external dynamic /*String|HtmlElement|dynamic*/ getContent();
  external Tooltip setContent(
      dynamic /*Func1<Layer, String|HtmlElement>|String|HtmlElement*/ htmlContent);
  external dynamic /*HtmlElement|dynamic*/ getElement();
  external void update();
  external bool isOpen();
  external Tooltip bringToFront();
  external Tooltip bringToBack();
  external TooltipOptions get options;
  external set options(TooltipOptions v);
}

@JS()
external Tooltip tooltip([TooltipOptions options, Layer source]);

@anonymous
@JS()
abstract class ZoomOptions2 {
  external bool get animate;
  external set animate(bool v);
  external factory ZoomOptions2({bool animate});
}

@anonymous
@JS()
abstract class PanOptions {
  external bool get animate;
  external set animate(bool v);
  external num get duration;
  external set duration(num v);
  external num get easeLinearity;
  external set easeLinearity(num v);
  external bool get noMoveStart;
  external set noMoveStart(bool v);
  external factory PanOptions(
      {bool animate, num duration, num easeLinearity, bool noMoveStart});
}

/// tslint:disable:no-empty-interface
/// This is not empty, it extends two interfaces into one...
@anonymous
@JS()
abstract class ZoomPanOptions implements ZoomOptions2, PanOptions {
  external factory ZoomPanOptions(
      {bool animate, num duration, num easeLinearity, bool noMoveStart});
}

/// tslint:enable
@anonymous
@JS()
abstract class FitBoundsOptions implements ZoomOptions2, PanOptions {
  external dynamic /*Point|Tuple of <num,num>*/ get paddingTopLeft;
  external set paddingTopLeft(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get paddingBottomRight;
  external set paddingBottomRight(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get padding;
  external set padding(dynamic /*Point|Tuple of <num,num>*/ v);
  external num get maxZoom;
  external set maxZoom(num v);
  external factory FitBoundsOptions(
      {dynamic /*Point|Tuple of <num,num>*/ paddingTopLeft,
      dynamic /*Point|Tuple of <num,num>*/ paddingBottomRight,
      dynamic /*Point|Tuple of <num,num>*/ padding,
      num maxZoom,
      bool animate,
      num duration,
      num easeLinearity,
      bool noMoveStart});
}

@anonymous
@JS()
abstract class LocateOptions {
  external bool get watch;
  external set watch(bool v);
  external bool get setView;
  external set setView(bool v);
  external num get maxZoom;
  external set maxZoom(num v);
  external num get timeout;
  external set timeout(num v);
  external num get maximumAge;
  external set maximumAge(num v);
  external bool get enableHighAccuracy;
  external set enableHighAccuracy(bool v);
  external factory LocateOptions(
      {bool watch,
      bool setView,
      num maxZoom,
      num timeout,
      num maximumAge,
      bool enableHighAccuracy});
}

@JS()
class Handler extends Class {
  // @Ignore
  Handler.fakeConstructor$() : super.fakeConstructor$();
  external factory Handler(Map map);
  external Handler enable();
  external Handler disable();
  external bool enabled();

  /// Extension methods
  external void addHooks();
  external void removeHooks();
}

@anonymous
@JS()
abstract class LeafletEvent {
  external String get type;
  external set type(String v);
  external dynamic get target;
  external set target(dynamic v);
  external factory LeafletEvent({String type, dynamic target});
}

@anonymous
@JS()
abstract class LeafletMouseEvent implements LeafletEvent {
  external LatLng get latlng;
  external set latlng(LatLng v);
  external Point get layerPoint;
  external set layerPoint(Point v);
  external Point get containerPoint;
  external set containerPoint(Point v);
  external MouseEvent get originalEvent;
  external set originalEvent(MouseEvent v);
  external factory LeafletMouseEvent(
      {LatLng latlng,
      Point layerPoint,
      Point containerPoint,
      MouseEvent originalEvent,
      String type,
      dynamic target});
}

@anonymous
@JS()
abstract class LeafletKeyboardEvent implements LeafletEvent {
  external KeyboardEvent get originalEvent;
  external set originalEvent(KeyboardEvent v);
  external factory LeafletKeyboardEvent(
      {KeyboardEvent originalEvent, String type, dynamic target});
}

@anonymous
@JS()
abstract class LocationEvent implements LeafletEvent {
  external LatLng get latlng;
  external set latlng(LatLng v);
  external LatLngBounds get bounds;
  external set bounds(LatLngBounds v);
  external num get accuracy;
  external set accuracy(num v);
  external num get altitude;
  external set altitude(num v);
  external num get altitudeAccuracy;
  external set altitudeAccuracy(num v);
  external num get heading;
  external set heading(num v);
  external num get speed;
  external set speed(num v);
  external num get timestamp;
  external set timestamp(num v);
  external factory LocationEvent(
      {LatLng latlng,
      LatLngBounds bounds,
      num accuracy,
      num altitude,
      num altitudeAccuracy,
      num heading,
      num speed,
      num timestamp,
      String type,
      dynamic target});
}

@anonymous
@JS()
abstract class ErrorEvent implements LeafletEvent {
  external String get message;
  external set message(String v);
  external num get code;
  external set code(num v);
  external factory ErrorEvent(
      {String message, num code, String type, dynamic target});
}

@anonymous
@JS()
abstract class LayerEvent implements LeafletEvent {
  external Layer get layer;
  external set layer(Layer v);
  external factory LayerEvent({Layer layer, String type, dynamic target});
}

@anonymous
@JS()
abstract class LayersControlEvent implements LayerEvent {
  external String get name;
  external set name(String v);
  external factory LayersControlEvent(
      {String name, Layer layer, String type, dynamic target});
}

@anonymous
@JS()
abstract class TileEvent implements LeafletEvent {
  external ImageElement get tile;
  external set tile(ImageElement v);
  external Point get coords;
  external set coords(Point v);
  external factory TileEvent(
      {ImageElement tile, Point coords, String type, dynamic target});
}

@anonymous
@JS()
abstract class TileErrorEvent implements TileEvent {
  external Error get error;
  external set error(Error v);
  external factory TileErrorEvent(
      {Error error,
      ImageElement tile,
      Point coords,
      String type,
      dynamic target});
}

@anonymous
@JS()
abstract class ResizeEvent implements LeafletEvent {
  external Point get oldSize;
  external set oldSize(Point v);
  external Point get newSize;
  external set newSize(Point v);
  external factory ResizeEvent(
      {Point oldSize, Point newSize, String type, dynamic target});
}

@anonymous
@JS()
abstract class GeoJSONEvent implements LeafletEvent {
  external Layer get layer;
  external set layer(Layer v);
  external dynamic get properties;
  external set properties(dynamic v);
  external String get geometryType;
  external set geometryType(String v);
  external String get id;
  external set id(String v);
  external factory GeoJSONEvent(
      {Layer layer,
      dynamic properties,
      String geometryType,
      String id,
      String type,
      dynamic target});
}

@anonymous
@JS()
abstract class PopupEvent implements LeafletEvent {
  external Popup get popup;
  external set popup(Popup v);
  external factory PopupEvent({Popup popup, String type, dynamic target});
}

@anonymous
@JS()
abstract class TooltipEvent implements LeafletEvent {
  external Tooltip get tooltip;
  external set tooltip(Tooltip v);
  external factory TooltipEvent({Tooltip tooltip, String type, dynamic target});
}

@anonymous
@JS()
abstract class DragEndEvent implements LeafletEvent {
  external num get distance;
  external set distance(num v);
  external factory DragEndEvent({num distance, String type, dynamic target});
}

@anonymous
@JS()
abstract class ZoomAnimEvent implements LeafletEvent {
  external LatLng get center;
  external set center(LatLng v);
  external num get zoom;
  external set zoom(num v);
  external bool get noUpdate;
  external set noUpdate(bool v);
  external factory ZoomAnimEvent(
      {LatLng center, num zoom, bool noUpdate, String type, dynamic target});
}

// Module DomEvent
typedef void EventHandlerFn(Event event);
/*external dynamic on(HtmlElement el, String types, EventHandlerFn fn,
    [dynamic context]);*/
/*external dynamic on(HtmlElement el, JSMap of <String,EventHandlerFn> eventMap, [dynamic context]);*/
@JS("DomEvent.on")
external dynamic on(HtmlElement el,
    dynamic /*String|JSMap of <String,EventHandlerFn>*/ types_eventMap,
    [dynamic fn_context, dynamic context]);
/*external dynamic off(HtmlElement el, String types, EventHandlerFn fn,
    [dynamic context]);*/
/*external dynamic off(HtmlElement el, JSMap of <String,EventHandlerFn> eventMap, [dynamic context]);*/
@JS("DomEvent.off")
external dynamic off(HtmlElement el,
    dynamic /*String|JSMap of <String,EventHandlerFn>*/ types_eventMap,
    [dynamic fn_context, dynamic context]);
@JS("DomEvent.stopPropagation")
external dynamic stopPropagation(Event ev);
@JS("DomEvent.disableScrollPropagation")
external dynamic disableScrollPropagation(HtmlElement el);
@JS("DomEvent.disableClickPropagation")
external dynamic disableClickPropagation(HtmlElement el);
@JS("DomEvent.preventDefault")
external dynamic preventDefault(Event ev);
@JS("DomEvent.stop")
external dynamic stop(Event ev);
@JS("DomEvent.getMousePosition")
external Point getMousePosition(MouseEvent ev, [HtmlElement container]);
@JS("DomEvent.getWheelDelta")
external num getWheelDelta(Event ev);
/*external dynamic addListener(HtmlElement el, String types, EventHandlerFn fn,
    [dynamic context]);*/
/*external dynamic addListener(HtmlElement el, JSMap of <String,EventHandlerFn> eventMap, [dynamic context]);*/
@JS("DomEvent.addListener")
external dynamic addListener(HtmlElement el,
    dynamic /*String|JSMap of <String,EventHandlerFn>*/ types_eventMap,
    [dynamic fn_context, dynamic context]);
/*external dynamic removeListener(HtmlElement el, String types, EventHandlerFn fn,
    [dynamic context]);*/
/*external dynamic removeListener(HtmlElement el, JSMap of <String,EventHandlerFn> eventMap, [dynamic context]);*/
@JS("DomEvent.removeListener")
external dynamic removeListener(HtmlElement el,
    dynamic /*String|JSMap of <String,EventHandlerFn>*/ types_eventMap,
    [dynamic fn_context, dynamic context]);

// End module DomEvent
@anonymous
@JS()
abstract class DefaultMapPanes {
  external HtmlElement get mapPane;
  external set mapPane(HtmlElement v);
  external HtmlElement get tilePane;
  external set tilePane(HtmlElement v);
  external HtmlElement get overlayPane;
  external set overlayPane(HtmlElement v);
  external HtmlElement get shadowPane;
  external set shadowPane(HtmlElement v);
  external HtmlElement get markerPane;
  external set markerPane(HtmlElement v);
  external HtmlElement get tooltipPane;
  external set tooltipPane(HtmlElement v);
  external HtmlElement get popupPane;
  external set popupPane(HtmlElement v);
  external factory DefaultMapPanes(
      {HtmlElement mapPane,
      HtmlElement tilePane,
      HtmlElement overlayPane,
      HtmlElement shadowPane,
      HtmlElement markerPane,
      HtmlElement tooltipPane,
      HtmlElement popupPane});
}

@JS()
class Map extends Evented {
  // @Ignore
  Map.fakeConstructor$() : super.fakeConstructor$();
  external factory Map(dynamic /*String|HtmlElement*/ element,
      [MapOptions options]);
  external Renderer getRenderer(Path layer);

  /// Methods for layers and controls
  external Map addControl(Control control);
  external Map removeControl(Control control);
  external Map addLayer(Layer layer);
  external Map removeLayer(Layer layer);
  external bool hasLayer(Layer layer);
  external Map eachLayer(void fn(Layer layer), [dynamic context]);
  /*external Map openPopup(Popup popup);*/
  /*external Map openPopup(String|HtmlElement content, LatLng|LatLngLiteral|Tuple of <num,num> latlng, [PopupOptions options]);*/
  external Map openPopup(dynamic /*Popup|String|HtmlElement*/ popup_content,
      [dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
      PopupOptions options]);
  external Map closePopup([Popup popup]);
  /*external Map openTooltip(Tooltip tooltip);*/
  /*external Map openTooltip(String|HtmlElement content, LatLng|LatLngLiteral|Tuple of <num,num> latlng, [TooltipOptions options]);*/
  external Map openTooltip(
      dynamic /*Tooltip|String|HtmlElement*/ tooltip_content,
      [dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
      TooltipOptions options]);
  external Map closeTooltip([Tooltip tooltip]);

  /// Methods for modifying map state
  external Map setView(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ center, num zoom,
      [ZoomPanOptions options]);
  external Map setZoom(num zoom, [ZoomPanOptions options]);
  external Map zoomIn([num delta, ZoomOptions2 options]);
  external Map zoomOut([num delta, ZoomOptions2 options]);
  external Map setZoomAround(
      dynamic /*Point|LatLng|LatLngLiteral|Tuple of <num,num>*/ position,
      num zoom,
      [ZoomOptions2 options]);
  external Map fitBounds(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ bounds,
      [FitBoundsOptions options]);
  external Map fitWorld([FitBoundsOptions options]);
  external Map panTo(dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
      [PanOptions options]);
  external Map panBy(dynamic /*Point|Tuple of <num,num>*/ offset);
  external Map setMaxBounds(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ bounds);
  external Map setMinZoom(num zoom);
  external Map setMaxZoom(num zoom);
  external Map panInsideBounds(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ bounds,
      [PanOptions options]);

  /// Boolean for animate or advanced ZoomPanOptions
  external Map invalidateSize([dynamic /*bool|ZoomPanOptions*/ options]);
  external Map stop();
  external Map flyTo(dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
      [num zoom, ZoomPanOptions options]);
  external Map flyToBounds(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ bounds,
      [FitBoundsOptions options]);

  /// Other methods
  external Map addHandler(String name, Handler HandlerClass());
  external Map remove();
  external HtmlElement createPane(String name, [HtmlElement container]);

  /// Name of the pane or the pane as HTML-Element
  external dynamic /*HtmlElement|dynamic*/ getPane(
      dynamic /*String|HtmlElement*/ pane);
  external dynamic /*JSMap of <String,HtmlElement>&DefaultMapPanes*/ getPanes();
  external HtmlElement getContainer();
  external Map whenReady(void fn(), [dynamic context]);

  /// Methods for getting map state
  external LatLng getCenter();
  external num getZoom();
  external LatLngBounds getBounds();
  external num getMinZoom();
  external num getMaxZoom();
  external num getBoundsZoom(
      dynamic /*LatLngBounds|List<Tuple of <num,num>>*/ bounds,
      [bool inside]);
  external Point getSize();
  external Bounds getPixelBounds();
  external Point getPixelOrigin();
  external Bounds getPixelWorldBounds([num zoom]);

  /// Conversion methods
  external num getZoomScale(num toZoom, num fromZoom);
  external num getScaleZoom(num scale, num fromZoom);
  external Point project(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng, num zoom);
  external LatLng unproject(
      dynamic /*Point|Tuple of <num,num>*/ point, num zoom);
  external LatLng layerPointToLatLng(
      dynamic /*Point|Tuple of <num,num>*/ point);
  external Point latLngToLayerPoint(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng);
  external LatLng wrapLatLng(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng);
  external LatLngBounds wrapLatLngBounds(LatLngBounds bounds);
  external num distance(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng1,
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng2);
  external Point containerPointToLayerPoint(
      dynamic /*Point|Tuple of <num,num>*/ point);
  external LatLng containerPointToLatLng(
      dynamic /*Point|Tuple of <num,num>*/ point);
  external Point layerPointToContainerPoint(
      dynamic /*Point|Tuple of <num,num>*/ point);
  external Point latLngToContainerPoint(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng);
  external Point mouseEventToContainerPoint(MouseEvent ev);
  external Point mouseEventToLayerPoint(MouseEvent ev);
  external LatLng mouseEventToLatLng(MouseEvent ev);

  /// Geolocation methods
  external Map locate([LocateOptions options]);
  external Map stopLocate();

  /// Properties
  external Handler get boxZoom;
  external set boxZoom(Handler v);
  external Handler get doubleClickZoom;
  external set doubleClickZoom(Handler v);
  external Handler get dragging;
  external set dragging(Handler v);
  external Handler get keyboard;
  external set keyboard(Handler v);
  external Handler get scrollWheelZoom;
  external set scrollWheelZoom(Handler v);
  external Handler get tap;
  external set tap(Handler v);
  external Handler get touchZoom;
  external set touchZoom(Handler v);
  external MapOptions get options;
  external set options(MapOptions v);
}

/// ID of a HTML-Element as string or the HTML-ELement itself
@JS()
external Map map(dynamic /*String|HtmlElement*/ element, [MapOptions options]);

@anonymous
@JS()
abstract class BaseIconOptions implements LayerOptions {
  external String get iconUrl;
  external set iconUrl(String v);
  external String get iconRetinaUrl;
  external set iconRetinaUrl(String v);
  external dynamic /*Point|Tuple of <num,num>*/ get iconSize;
  external set iconSize(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get iconAnchor;
  external set iconAnchor(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get popupAnchor;
  external set popupAnchor(dynamic /*Point|Tuple of <num,num>*/ v);
  external String get shadowUrl;
  external set shadowUrl(String v);
  external String get shadowRetinaUrl;
  external set shadowRetinaUrl(String v);
  external dynamic /*Point|Tuple of <num,num>*/ get shadowSize;
  external set shadowSize(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get shadowAnchor;
  external set shadowAnchor(dynamic /*Point|Tuple of <num,num>*/ v);
  external String get className;
  external set className(String v);
  external factory BaseIconOptions(
      {String iconUrl,
      String iconRetinaUrl,
      dynamic /*Point|Tuple of <num,num>*/ iconSize,
      dynamic /*Point|Tuple of <num,num>*/ iconAnchor,
      dynamic /*Point|Tuple of <num,num>*/ popupAnchor,
      String shadowUrl,
      String shadowRetinaUrl,
      dynamic /*Point|Tuple of <num,num>*/ shadowSize,
      dynamic /*Point|Tuple of <num,num>*/ shadowAnchor,
      String className,
      String pane,
      String attribution});
}

@anonymous
@JS()
abstract class IconOptions implements BaseIconOptions {
  external String get iconUrl;
  external set iconUrl(String v);
  external factory IconOptions(
      {String iconUrl,
      String iconRetinaUrl,
      dynamic /*Point|Tuple of <num,num>*/ iconSize,
      dynamic /*Point|Tuple of <num,num>*/ iconAnchor,
      dynamic /*Point|Tuple of <num,num>*/ popupAnchor,
      String shadowUrl,
      String shadowRetinaUrl,
      dynamic /*Point|Tuple of <num,num>*/ shadowSize,
      dynamic /*Point|Tuple of <num,num>*/ shadowAnchor,
      String className,
      String pane,
      String attribution});
}

@JS()
class Icon<T extends BaseIconOptions, IconOptions> extends Layer {
  // @Ignore
  Icon.fakeConstructor$() : super.fakeConstructor$();
  external factory Icon(T options);
  external HtmlElement createIcon([HtmlElement oldIcon]);
  external HtmlElement createShadow([HtmlElement oldIcon]);
  external T get options;
  external set options(T v);
}

// Module Icon
@anonymous
@JS()
abstract class DefaultIconOptions implements BaseIconOptions {
  external String get imagePath;
  external set imagePath(String v);
  external factory DefaultIconOptions(
      {String imagePath,
      String iconUrl,
      String iconRetinaUrl,
      dynamic /*Point|Tuple of <num,num>*/ iconSize,
      dynamic /*Point|Tuple of <num,num>*/ iconAnchor,
      dynamic /*Point|Tuple of <num,num>*/ popupAnchor,
      String shadowUrl,
      String shadowRetinaUrl,
      dynamic /*Point|Tuple of <num,num>*/ shadowSize,
      dynamic /*Point|Tuple of <num,num>*/ shadowAnchor,
      String className,
      String pane,
      String attribution});
}

@JS("Icon.Default")
class Default extends Icon<DefaultIconOptions, IconOptions> {
  // @Ignore
  Default.fakeConstructor$() : super.fakeConstructor$();
  external static String get imagePath;
  external static set imagePath(String v);
  external factory Default([DefaultIconOptions options]);
}

// End module Icon
@JS()
external Icon icon(IconOptions options);

@anonymous
@JS()
abstract class DivIconOptions implements BaseIconOptions {
  external dynamic/*=String |*/ get html;
  external set html(dynamic/*=String |*/ v);
  external get JS$false;
  external set JS$false(v);
  external dynamic /*Point|Tuple of <num,num>*/ get bgPos;
  external set bgPos(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get iconSize;
  external set iconSize(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get iconAnchor;
  external set iconAnchor(dynamic /*Point|Tuple of <num,num>*/ v);
  external dynamic /*Point|Tuple of <num,num>*/ get popupAnchor;
  external set popupAnchor(dynamic /*Point|Tuple of <num,num>*/ v);
  external String get className;
  external set className(String v);
  external factory DivIconOptions(
      {dynamic/*=String |*/ html,
      JS$false,
      dynamic /*Point|Tuple of <num,num>*/ bgPos,
      dynamic /*Point|Tuple of <num,num>*/ iconSize,
      dynamic /*Point|Tuple of <num,num>*/ iconAnchor,
      dynamic /*Point|Tuple of <num,num>*/ popupAnchor,
      String className,
      String iconUrl,
      String iconRetinaUrl,
      String shadowUrl,
      String shadowRetinaUrl,
      dynamic /*Point|Tuple of <num,num>*/ shadowSize,
      dynamic /*Point|Tuple of <num,num>*/ shadowAnchor,
      String pane,
      String attribution});
}

@JS()
class DivIcon extends Icon<DivIconOptions, dynamic> {
  // @Ignore
  DivIcon.fakeConstructor$() : super.fakeConstructor$();
  external factory DivIcon([DivIconOptions options]);
}

@JS()
external DivIcon divIcon([DivIconOptions options]);

@anonymous
@JS()
abstract class MarkerOptions implements InteractiveLayerOptions {
  external dynamic /*Icon|DivIcon*/ get icon;
  external set icon(dynamic /*Icon|DivIcon*/ v);
  external bool get clickable;
  external set clickable(bool v);
  external bool get draggable;
  external set draggable(bool v);
  external bool get keyboard;
  external set keyboard(bool v);
  external String get title;
  external set title(String v);
  external String get alt;
  external set alt(String v);
  external num get zIndexOffset;
  external set zIndexOffset(num v);
  external num get opacity;
  external set opacity(num v);
  external bool get riseOnHover;
  external set riseOnHover(bool v);
  external num get riseOffset;
  external set riseOffset(num v);
  external factory MarkerOptions(
      {dynamic /*Icon|DivIcon*/ icon,
      bool clickable,
      bool draggable,
      bool keyboard,
      String title,
      String alt,
      num zIndexOffset,
      num opacity,
      bool riseOnHover,
      num riseOffset,
      bool interactive,
      String pane,
      String attribution});
}

@JS()
class Marker extends Layer {
  // @Ignore
  Marker.fakeConstructor$() : super.fakeConstructor$();
  external factory Marker(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
      [MarkerOptions options]);
  external LatLng getLatLng();
  external Marker setLatLng(
      dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng);
  external Marker setZIndexOffset(num offset);
  external Marker setIcon(dynamic /*Icon|DivIcon*/ icon);
  external Marker setOpacity(num opacity);
  external dynamic /*HtmlElement|dynamic*/ getElement();

  /// Properties
  external MarkerOptions get options;
  external set options(MarkerOptions v);
  external Handler get dragging;
  external set dragging(Handler v);
}

@JS()
external Marker marker(
    dynamic /*LatLng|LatLngLiteral|Tuple of <num,num>*/ latlng,
    [MarkerOptions options]);
// Module Browser
@JS("Browser.ie")
external bool get ie;
@JS("Browser.ielt9")
external bool get ielt9;
@JS("Browser.edge")
external bool get edge;
@JS("Browser.webkit")
external bool get webkit;
@JS("Browser.gecko")
external bool get gecko;
@JS("Browser.android")
external bool get android;
@JS("Browser.android23")
external bool get android23;
@JS("Browser.chrome")
external bool get chrome;
@JS("Browser.safari")
external bool get safari;
@JS("Browser.win")
external bool get win;
@JS("Browser.ie3d")
external bool get ie3d;
@JS("Browser.webkit3d")
external bool get webkit3d;
@JS("Browser.gecko3d")
external bool get gecko3d;
@JS("Browser.opera12")
external bool get opera12;
@JS("Browser.any3d")
external bool get any3d;
@JS("Browser.mobile")
external bool get mobile;
@JS("Browser.mobileWebkit")
external bool get mobileWebkit;
@JS("Browser.mobileWebkit3d")
external bool get mobileWebkit3d;
@JS("Browser.mobileOpera")
external bool get mobileOpera;
@JS("Browser.mobileGecko")
external bool get mobileGecko;
@JS("Browser.touch")
external bool get touch;
@JS("Browser.msPointer")
external bool get msPointer;
@JS("Browser.pointer")
external bool get pointer;
@JS("Browser.retina")
external bool get retina;
@JS("Browser.canvas")
external bool get Browser_canvas;
@JS("Browser.vml")
external bool get vml;
@JS("Browser.svg")
external bool get Browser_svg;
// End module Browser

// Module Util
@JS("Util.extend")
external dynamic extend(dynamic dest, [dynamic src]);
@JS("Util.create")
external dynamic Util_create(dynamic proto, [dynamic properties]);
@JS("Util.bind")
external VoidFunc0 bind(void fn(),
    [dynamic obj1, dynamic obj2, dynamic obj3, dynamic obj4, dynamic obj5]);
@JS("Util.stamp")
external num stamp(dynamic obj);
@JS("Util.throttle")
external VoidFunc0 throttle(void fn(), num time, dynamic context);
@JS("Util.wrapNum")
external num wrapNum(num num, List<num> range, [bool includeMax]);
@JS("Util.falseFn")
external falseFn();
@JS("Util.formatNum")
external num formatNum(num num, [num digits]);
@JS("Util.trim")
external String trim(String str);
@JS("Util.splitWords")
external List<String> splitWords(String str);
@JS("Util.setOptions")
external dynamic setOptions(dynamic obj, dynamic options);
@JS("Util.getParamString")
external String getParamString(dynamic obj,
    [String existingUrl, bool uppercase]);
@JS("Util.template")
external String template(String str, dynamic data);
@JS("Util.isArray")
external bool isArray(dynamic obj);
@JS("Util.indexOf")
external num indexOf(List<dynamic> array, dynamic el);
@JS("Util.requestAnimFrame")
external num requestAnimFrame(void fn(), [dynamic context, bool immediate]);
@JS("Util.cancelAnimFrame")
external void cancelAnimFrame(num id);
@JS("Util.lastId")
external num get lastId;
@JS("Util.lastId")
external set lastId(num v);
@JS("Util.emptyImageUrl")
external String get emptyImageUrl;
@JS("Util.emptyImageUrl")
external set emptyImageUrl(String v);
// End module Util
