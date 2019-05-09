@JS("GeoJSON")
library geojson_interop;

import "package:js/js.dart";

/// Type definitions for non-npm package geojson 7946.0
/// Project: https://geojson.org/
/// Definitions by: Jacob Bruun <https://github.com/cobster>
/// Arne Schubert <https://github.com/atd-schubert>
/// Jeff Jacobson <https://github.com/JeffJacobson>
/// Ilia Choly <https://github.com/icholy>
/// Dan Vanderkam <https://github.com/danvk>
/// Definitions: https://github.com/DefinitelyTyped/DefinitelyTyped
/// TypeScript Version: 2.3

/// Note: as of the RFC 7946 version of GeoJSON, Coordinate Reference Systems
/// are no longer supported. (See https://tools.ietf.org/html/rfc7946#appendix-B)}

/// The valid values for the "type" property of GeoJSON geometry objects.
/// https://tools.ietf.org/html/rfc7946#section-1.4
/*export type GeoJsonGeometryTypes = Geometry[*/

/// The value values for the "type" property of GeoJSON Objects.
/// https://tools.ietf.org/html/rfc7946#section-1.4
/*export type GeoJsonTypes = GeoJSON[*/

/// Bounding box
/// https://tools.ietf.org/html/rfc7946#section-5
/*export type BBox = [number, number, number, number] | [number, number, number, number, number, number];*/

/// A Position is an array of coordinates.
/// https://tools.ietf.org/html/rfc7946#section-3.1.1
/// Array should contain between two and three elements.
/// The previous GeoJSON specification allowed more elements (e.g., which could be used to represent M values),
/// but the current specification only allows X, Y, and (optionally) Z to be defined.
/*export type Position = number[];*/

/// The base GeoJSON object.
/// https://tools.ietf.org/html/rfc7946#section-3
/// The GeoJSON specification also allows foreign members
/// (https://tools.ietf.org/html/rfc7946#section-6.1)
/// Developers should use "&" type in TypeScript or extend the interface
/// to add these foreign members.
@anonymous
@JS()
abstract class GeoJsonObject {
  /// Don't include foreign members directly into this type def.
  /// in order to preserve type safety.
  /// [key: string]: any;
  /// Specifies the type of GeoJSON object.
  external String /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection|Feature|FeatureCollection*/ 
      get type;
  external set type(
      
          String /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection|Feature|FeatureCollection*/  v);

  /// Bounding box of the coordinate range of the object's Geometries, Features, or Feature Collections.
  /// The value of the bbox member is an array of length 2*n where n is the number of dimensions
  /// represented in the contained geometries, with all axes of the most southwesterly point
  /// followed by all axes of the more northeasterly point.
  /// The axes order of a bbox follows the axes order of geometries.
  /// https://tools.ietf.org/html/rfc7946#section-5
  external List<
      num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ get bbox;
  external set bbox(
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ v);
  external factory GeoJsonObject(
      {
          String /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection|Feature|FeatureCollection*/ type,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/// Union of GeoJSON objects.
/*export type GeoJSON = Geometry | Feature | FeatureCollection;*/

/// Geometry object.
/// https://tools.ietf.org/html/rfc7946#section-3
/*export type Geometry = Point | MultiPoint | LineString | MultiLineString | Polygon | MultiPolygon | GeometryCollection;*/
/*export type GeometryObject = Geometry;*/

/// Point geometry object.
/// https://tools.ietf.org/html/rfc7946#section-3.1.2
@anonymous
@JS()
abstract class Point implements GeoJsonObject {
  external String get type;
  external set type(String v);
  external List<num> get coordinates;
  external set coordinates(List<num> v);
  external factory Point(
      {String /*'Point'*/ type,
      List<num> coordinates,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/// MultiPoint geometry object.
/// https://tools.ietf.org/html/rfc7946#section-3.1.3
@anonymous
@JS()
abstract class MultiPoint implements GeoJsonObject {
  external String /*'MultiPoint'*/ get type;
  external set type(String /*'MultiPoint'*/ v);
  external List<List<num>> get coordinates;
  external set coordinates(List<List<num>> v);
  external factory MultiPoint(
      {String /*'MultiPoint'*/ type,
      List<List<num>> coordinates,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/// LineString geometry object.
/// https://tools.ietf.org/html/rfc7946#section-3.1.4
@anonymous
@JS()
abstract class LineString implements GeoJsonObject {
  external String /*'LineString'*/ get type;
  external set type(String /*'LineString'*/ v);
  external List<List<num>> get coordinates;
  external set coordinates(List<List<num>> v);
  external factory LineString(
      {String /*'LineString'*/ type,
      List<List<num>> coordinates,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/// MultiLineString geometry object.
/// https://tools.ietf.org/html/rfc7946#section-3.1.5
@anonymous
@JS()
abstract class MultiLineString implements GeoJsonObject {
  external String /*'MultiLineString'*/ get type;
  external set type(String /*'MultiLineString'*/ v);
  external List<List<List<num>>> get coordinates;
  external set coordinates(List<List<List<num>>> v);
  external factory MultiLineString(
      {String /*'MultiLineString'*/ type,
      List<List<List<num>>> coordinates,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/// Polygon geometry object.
/// https://tools.ietf.org/html/rfc7946#section-3.1.6
@anonymous
@JS()
abstract class Polygon implements GeoJsonObject {
  external String /*'Polygon'*/ get type;
  external set type(String /*'Polygon'*/ v);
  external List<List<List<num>>> get coordinates;
  external set coordinates(List<List<List<num>>> v);
  external factory Polygon(
      {String /*'Polygon'*/ type,
      List<List<List<num>>> coordinates,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/// MultiPolygon geometry object.
/// https://tools.ietf.org/html/rfc7946#section-3.1.7
@anonymous
@JS()
abstract class MultiPolygon implements GeoJsonObject {
  external String /*'MultiPolygon'*/ get type;
  external set type(String /*'MultiPolygon'*/ v);
  external List<List<List<List<num>>>> get coordinates;
  external set coordinates(List<List<List<List<num>>>> v);
  external factory MultiPolygon(
      {String /*'MultiPolygon'*/ type,
      List<List<List<List<num>>>> coordinates,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/// Geometry Collection
/// https://tools.ietf.org/html/rfc7946#section-3.1.8
@anonymous
@JS()
abstract class GeometryCollection implements GeoJsonObject {
  external String /*'GeometryCollection'*/ get type;
  external set type(String /*'GeometryCollection'*/ v);
  external List<
          dynamic /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/ >
      get geometries;
  external set geometries(
      List<
          dynamic /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/ > v);
  external factory GeometryCollection(
      {String /*'GeometryCollection'*/ type,
      List<
          dynamic /*Point|MultiPoint|LineString|MultiLineString|Polygon|MultiPolygon|GeometryCollection*/ > geometries,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/*export type GeoJsonProperties = { [name: string]: any; } | null;*/

/// A feature object which contains a geometry and associated properties.
/// https://tools.ietf.org/html/rfc7946#section-3.2
@anonymous
@JS()
abstract class Feature<G extends GeoJsonObject /*Geometry|Null*/, P> implements GeoJsonObject {
  external String /*'Feature'*/ get type;
  external set type(String /*'Feature'*/ v);

  /// The feature's geometry
  external G get geometry;
  external set geometry(G v);

  /// A value that uniquely identifies this feature in a
  /// https://tools.ietf.org/html/rfc7946#section-3.2.
  external dynamic /*String|num*/ get id;
  external set id(dynamic /*String|num*/ v);

  /// Properties associated with this feature.
  external P get properties;
  external set properties(P v);
  external factory Feature(
      {String /*'Feature'*/ type,
      G geometry,
      dynamic /*String|num*/ id,
      P properties,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}

/// A collection of feature objects.
/// https://tools.ietf.org/html/rfc7946#section-3.3
@anonymous
@JS()
abstract class FeatureCollection<G extends GeoJsonObject /*Geometry|Null*/, 
    P, Map> implements GeoJsonObject {
  external String /*'FeatureCollection'*/ get type;
  external set type(String /*'FeatureCollection'*/ v);
  external List<Feature<G, P>> get features;
  external set features(List<Feature<G, P>> v);
  external factory FeatureCollection(
      {String /*'FeatureCollection'*/ type,
      List<Feature<G, P>> features,
      List<
          num> /*Tuple of <num,num,num,num>|Tuple of <num,num,num,num,num,num>*/ bbox});
}
