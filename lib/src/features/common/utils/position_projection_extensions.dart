import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:geobase/geobase.dart' as gb;
import 'package:latlong2/latlong.dart';

/// An extension to allow easy swapping between different location/coordinate
/// packages different classes.
extension ProjectionExstention on LatLng {
  /// A conversion to the geobase package format.
  gb.Geographic get gbPosition => gb.Geographic(lon: longitude, lat: latitude);

  /// An x/y projection in meters in the geobase package format.
  gb.Projected get gbProjected => gb.WGS84.webMercator.forward.project(
        gbPosition,
        to: gb.Projected.create,
      );

  /// A conversion to the JTS package format.
  jts.Coordinate get jtsCoordinate => jts.Coordinate(
        gbProjected.x.toDouble(),
        gbProjected.y.toDouble(),
      );

  /// A conversion to a Point from the JTS package format;
  jts.Point get jtsPoint =>
      jts.Point(jtsCoordinate, jts.PrecisionModel(), 4326);
}

/// An extension to allow easy swapping between different location/coordinate
/// packages different classes.
extension ProjectionExtension on jts.Coordinate {
  /// An x/y projection in meters in the geobase package format.
  gb.Projected get gbProjected => gb.Projected(x: x, y: y);

  /// A conversion to the geobase package format.
  gb.Geographic get gbPosition => gb.WGS84.webMercator.inverse
      .project(gbProjected, to: gb.Geographic.create);

  /// A conversion to the latlong2 package format, used by the flutter_map
  /// package.
  LatLng get latLng => LatLng(gbPosition.lat, gbPosition.lon);
}

/// An extension to make it easier and slightly less convoluted to do operations
/// on [LatLng] points.
extension LatLngOperations on LatLng {
  /// Geo-calculator used by the methods provided by the [LatLngOperations]
  /// extension.
  static const _calculator = Distance(roundResult: false);

  /// Create a new [LatLng] that has been offset from this by [distance]
  /// meters in direction of [bearing].
  LatLng offset(double distance, double bearing) => _calculator.offset(
        this,
        distance,
        normalizeBearing(bearing),
      );

  /// The distance between this and [other].
  double distanceTo(LatLng other) => _calculator.distance(this, other);

  /// The bearing direction from this to [other].
  double bearingTo(LatLng other) => _calculator.bearing(this, other);
}
