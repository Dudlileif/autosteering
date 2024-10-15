// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

/// An extension to allow easy swapping between different location/coordinate
/// packages different classes.
extension LatLngProjExt on LatLng {
  /// A conversion to the geobase package format.
  Geographic get geoPosition => Geographic(lon: longitude, lat: latitude);
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

      // Skip lines that are to the north of this point.
      if (start.y > y && end.y > y) continue;

      final ringIntersection = spherical.intersectionWith(
        bearing: 180,
        other: start,
        otherBearing: start.rhumb.initialBearingTo(end),
      );

      if (ringIntersection != null) {
        // Check that we're inside the boundary box.
        if (boundary.intersectsPoint2D(ringIntersection)) {
          final distanceAlongLine = ringIntersection.spherical
              .alongTrackDistanceTo(start: start, end: end);

          // Is the intersection on the actual line segment?
          if (distanceAlongLine >= 0 &&
              distanceAlongLine <= start.rhumb.distanceTo(end)) {
            intersects++;
          }
        }
      }
    }

    return intersects.isOdd;
  }
}

/// An extension to easily get [Geographic] positions from a [PositionSeries].
extension GeographicPositions on PositionSeries {
  /// Creates an iterable of [Geographic] positions from [positions].
  Iterable<Geographic> get toGeographicPositions =>
      positionsAs(to: Geographic.create);
}
