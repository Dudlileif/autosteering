import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

/// An extension to allow easy swapping between different location/coordinate
/// packages different classes.
extension LatLngProjExt on LatLng {
  /// A conversion to the geobase package format.
  Geographic get gbPosition => Geographic(lon: longitude, lat: latitude);
}

/// An extension to allow easy swapping between different location/coordinate
/// packages different classes.
extension GeographicProjExt on Geographic {
  /// A conversion to the latlong2 package format, used by the flutter_map
  /// package.
  LatLng get latLng => LatLng(lat, lon);

  /// Checks if this point is within the [ring].
  ///
  /// By drawing a line straight south from this point we can count the amount
  /// of times the line crosses the ring while inside the [GeoBox] boundary
  /// of the ring. It the amount we cross is odd we're within the ring,
  ///  if it's even we are outside.
  bool isWithinRing(Iterable<Geographic> ring) {
    final boundary = GeoBox.from(ring);

    var intersects = 0;

    for (var i = 0; i < ring.length; i++) {
      final start = ring.elementAt(i);
      final end = ring.elementAt((i + 1) % ring.length);

      // Skip lines that are to the north of this point..
      if (start.y > y && end.y > y) continue;

      final ringIntersection = spherical.intersectionWith(
        bearing: 180,
        other: start,
        otherBearing: start.spherical.initialBearingTo(end),
      );

      if (ringIntersection != null) {
        // Check that we're inside the boundary box.
        if (boundary.intersectsPoint2D(ringIntersection)) {
          final distanceAlongLine = ringIntersection.spherical
              .alongTrackDistanceTo(start: start, end: end);

          // Is the intersection on the actual line segment?
          if (distanceAlongLine >= 0 &&
              distanceAlongLine <= start.spherical.distanceTo(end)) {
            intersects++;
          }
        }
      }
    }

    return intersects.isOdd;
  }
}
