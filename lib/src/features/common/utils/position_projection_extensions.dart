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

/// An extension to make it easier and slightly less convoluted to offset and
/// move [LatLng] points around.
extension OffsetLatLng on LatLng {
  /// Create a new [LatLng] that has been offset from this by [distance]
  /// meters in direction of [bearing].
  LatLng offset(double distance, double bearing) =>
      const Distance(roundResult: false).offset(
        this,
        distance,
        normalizeBearing(bearing),
      );
}
