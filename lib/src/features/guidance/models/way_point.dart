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

import 'package:autosteering/src/features/common/common.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:geobase/geobase.dart';

/// A class for combining vehicle information with it's position.
/// Useful to record paths and function as targets for auto-steering.
class WayPoint extends Equatable {
  /// A class for combining vehicle information with it's position.
  /// Useful to record paths and function as targets for auto-steering.
  ///
  /// [bearing] in degrees from 0-360.
  /// [velocity] in m/s.
  const WayPoint({
    required this.position,
    required this.bearing,
    double? velocity,
  }) : velocity = velocity ?? 0;

  /// Creates a [WayPoint] object from the [json] object.
  factory WayPoint.fromJson(Map<String, dynamic> json) => WayPoint(
        position: Geographic.parse(json['position'] as String),
        bearing: json['bearing'] as double,
        velocity: json['velocity'] as double?,
      );

  /// The position of the waypoint.
  final Geographic position;

  /// The bearing of the vehicle at the time of recording.
  final double bearing;

  /// The velocity of the vehicle at the time of the recording.
  final double velocity;

  /// Returns a new [WayPoint] from this with altered parameters.
  WayPoint copyWith({
    Geographic? position,
    double? bearing,
    double? velocity,
  }) =>
      WayPoint(
        position: position ?? this.position,
        bearing: bearing ?? this.bearing,
        velocity: velocity ?? this.velocity,
      );

  /// Whether this way point has valid properties.
  bool get isValid =>
      position.values.every((element) => element.isFinite) && bearing.isFinite;

  /// Move the waypoint with a rhumb line by [distance] in the direction of
  /// [bearing] + [angleFromBearing].
  ///
  /// The updated bearing will be calculated at the new point as the
  /// bearing from old position to new minus the [angleFromBearing].
  WayPoint moveRhumb({
    required double distance,
    double angleFromBearing = 0,
  }) {
    if (distance == 0) {
      return this;
    }
    final newPos = position.rhumb.destinationPoint(
      distance: distance,
      bearing: bearing + angleFromBearing,
    );

    return copyWith(
      position: newPos,
      bearing: position.rhumb.finalBearingTo(newPos) -
          angleFromBearing * distance.sign,
    );
  }

  /// Move the waypoint with a spherical line by [distance] in the direction
  /// of [bearing] + [angleFromBearing].
  ///
  /// The updated bearing will be calculated at the new point as the
  /// bearing from old position to new minus the [angleFromBearing].
  WayPoint moveSpherical({
    required double distance,
    double angleFromBearing = 0,
  }) {
    if (distance == 0) {
      return this;
    }
    final newPos = position.spherical.destinationPoint(
      distance: distance,
      bearing: bearing + angleFromBearing,
    );

    return copyWith(
      position: newPos,
      bearing: position.spherical.finalBearingTo(newPos) -
          angleFromBearing * distance.sign,
    );
  }

  /// Finds a way point on the line from this to [end]. The [distance] to
  /// the way point is from this, the start, in the direction towards the [end]
  /// point.
  WayPoint alongLineByDistanceFromStartRhumb({
    required WayPoint end,
    required double distance,
  }) {
    if (distance == 0) {
      return this;
    }
    final fraction = distance / distanceToRhumb(end);

    return intermediatePointToSpherical(end, fraction: fraction);
  }

  /// Finds a way point on the line from this to [end]. The [distance] to
  /// the way point is from this, the start, in the direction towards the [end]
  /// point.
  WayPoint alongLineByDistanceFromStartSpherical({
    required WayPoint end,
    required double distance,
  }) {
    if (distance == 0) {
      return this;
    }
    final fraction = distance / distanceToSpherical(end);

    return intermediatePointToSpherical(end, fraction: fraction);
  }

  /// Rotates the way point by [angle] degrees clockwise.
  WayPoint rotateByAngle(double angle) =>
      copyWith(bearing: (bearing + angle).wrap360());

  /// The rhumb distance in meters to [other].
  double distanceToRhumb(WayPoint other) =>
      position.rhumb.distanceTo(other.position);

  /// The spherical distance in meters to [other].
  double distanceToSpherical(WayPoint other) =>
      position.spherical.distanceTo(other.position);

  /// The initial rhumb bearing towards [other].
  double initialBearingToRhumb(WayPoint other) =>
      position.rhumb.initialBearingTo(other.position);

  /// The initial spherical bearing towards [other].
  double initialBearingToSpherical(WayPoint other) =>
      position.spherical.initialBearingTo(other.position);

  /// The final rhumb bearing towards [other].
  double finalBearingToRhumb(WayPoint other) =>
      position.rhumb.finalBearingTo(other.position);

  /// The final spherical bearing towards [other].
  double finalBearingToSpherical(WayPoint other) =>
      position.spherical.finalBearingTo(other.position);

  /// The distance this waypoint is along the line from [start] to [end].
  double alongTrackDistanceToSpherical({
    required WayPoint start,
    required WayPoint end,
  }) =>
      position.spherical
          .alongTrackDistanceTo(start: start.position, end: end.position);

  /// The cross track distance from this way point to the line from [start]
  /// to [end].
  double crossTrackDistanceToSpherical({
    required WayPoint start,
    required WayPoint end,
  }) =>
      position.spherical
          .crossTrackDistanceTo(start: start.position, end: end.position);

  /// Finds a way point along the line from this to [other] at the [fraction]
  /// of the length of the line.
  WayPoint intermediatePointToSpherical(
    WayPoint other, {
    required double fraction,
  }) {
    final newPos = position.spherical
        .intermediatePointTo(other.position, fraction: fraction);

    return WayPoint(
      position: newPos,
      bearing: position.spherical.finalBearingTo(newPos),
      velocity: velocity,
    );
  }

  /// Finds a way point along the line from this to [other] at the [fraction]
  /// of the length of the line.
  WayPoint intermediatePointToRhumb(
    WayPoint other, {
    required double fraction,
  }) {
    final newPos = position.spherical
        .intermediatePointTo(other.position, fraction: fraction);

    return WayPoint(
      position: newPos,
      bearing: position.rhumb.finalBearingTo(newPos),
      velocity: velocity,
    );
  }

  /// Finds an intersection from this to [ring] with the [bearing] of this.
  ///
  /// If [oppositeOfBearing] is true, then [bearing] + 180 is used to look
  /// for intersections.
  List<WayPoint> intersectionsWithRhumb(
    Iterable<Geographic> ring, {
    bool oppositeOfBearing = false,
  }) {
    final intersections = <Geographic>[];

    for (var i = 0; i < ring.length; i++) {
      final start = ring.elementAt(i);
      final end = ring.elementAt((i + 1) % ring.length);

      final ringIntersection = position.spherical.intersectionWith(
        bearing: oppositeOfBearing ? (bearing + 180).wrap360() : bearing,
        other: start,
        otherBearing: start.rhumb.initialBearingTo(end),
      );

      if (ringIntersection != null) {
        // Skip lines that are behind of this point or ahead if
        // [oppositeOfBearing].
        final bearingDifferenceToIntersection = bearingDifference(
          bearing,
          position.rhumb.initialBearingTo(ringIntersection),
        );
        if ((bearingDifferenceToIntersection > 90 && !oppositeOfBearing) ||
            (bearingDifferenceToIntersection < 90 && oppositeOfBearing)) {
          continue;
        }

        // Check that we're inside the boundary box.
        final distanceAlongLine = ringIntersection.spherical
            .alongTrackDistanceTo(start: start, end: end);

        // Is the intersection on the actual line segment?
        if (distanceAlongLine >= 0 &&
            distanceAlongLine <= start.rhumb.distanceTo(end)) {
          if (bearingDifference(
                oppositeOfBearing ? (bearing + 180).wrap360() : bearing,
                position.rhumb.initialBearingTo(ringIntersection),
              ) <
              1) {
            intersections.add(ringIntersection);
          }
        }
      }
    }
    return intersections
        .map(
          (intersection) => copyWith(
            position: intersection,
            bearing: position.rhumb.finalBearingTo(intersection),
          ),
        )
        .toList();
  }

  /// Finds an intersection from this to [ring] with the [bearing] of this.
  ///
  /// If [oppositeOfBearing] is true, then [bearing] + 180 is used to look
  /// for intersections.
  List<WayPoint> intersectionsWithSpherical(
    Iterable<Geographic> ring, {
    bool oppositeOfBearing = false,
  }) {
    final intersections = <Geographic>[];

    for (var i = 0; i < ring.length; i++) {
      final start = ring.elementAt(i);
      final end = ring.elementAt((i + 1) % ring.length);

      final ringIntersection = position.spherical.intersectionWith(
        bearing: oppositeOfBearing ? (bearing + 180).wrap360() : bearing,
        other: start,
        otherBearing: start.spherical.initialBearingTo(end),
      );

      if (ringIntersection != null) {
        // Skip lines that are behind of this point or ahead if
        // [oppositeOfBearing].
        final bearingDifferenceToIntersection = bearingDifference(
          bearing,
          position.spherical.initialBearingTo(ringIntersection),
        );
        if ((bearingDifferenceToIntersection > 90 && !oppositeOfBearing) ||
            (bearingDifferenceToIntersection < 90 && oppositeOfBearing)) {
          continue;
        }

        // Check that we're inside the boundary box.
        final distanceAlongLine = ringIntersection.spherical
            .alongTrackDistanceTo(start: start, end: end);

        // Is the intersection on the actual line segment?
        if (distanceAlongLine >= 0 &&
            distanceAlongLine <= start.spherical.distanceTo(end)) {
          if (bearingDifference(
                oppositeOfBearing ? (bearing + 180).wrap360() : bearing,
                position.spherical.initialBearingTo(ringIntersection),
              ) <
              1) {
            intersections.add(ringIntersection);
          }
        }
      }
    }
    return intersections
        .map(
          (intersection) => copyWith(
            position: intersection,
            bearing: position.spherical.finalBearingTo(intersection),
          ),
        )
        .toList();
  }

  /// Finds an intersection from this to [ring] with the [bearing] of this.
  ///
  /// If [oppositeOfBearing] is true, then [bearing] + 180 is used to look
  /// for intersections.
  WayPoint? intersectionWithRhumb(
    Iterable<Geographic> ring, {
    bool oppositeOfBearing = false,
  }) {
    final intersections =
        intersectionsWithRhumb(ring, oppositeOfBearing: oppositeOfBearing);
    if (intersections.isNotEmpty) {
      intersections.sortByCompare<double>(
        (element) => position.rhumb.distanceTo(element.position),
        (a, b) => a.compareTo(b),
      );

      return intersections.first;
    }
    return null;
  }

  /// Finds an intersection from this to [ring] with the [bearing] of this.
  ///
  /// If [oppositeOfBearing] is true, then [bearing] + 180 is used to look
  /// for intersections.
  WayPoint? intersectionWithSpherical(
    Iterable<Geographic> ring, {
    bool oppositeOfBearing = false,
  }) {
    final intersections =
        intersectionsWithSpherical(ring, oppositeOfBearing: oppositeOfBearing);
    if (intersections.isNotEmpty) {
      intersections.sortByCompare<double>(
        (element) => position.spherical.distanceTo(element.position),
        (a, b) => a.compareTo(b),
      );

      return intersections.first;
    }
    return null;
  }

  /// Properties used to compare with [Equatable].
  @override
  List<Object> get props => [
        position,
        bearing,
        velocity,
      ];

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson() {
    final map = {
      'position': position.toString(),
      'bearing': bearing,
    };
    if (velocity.abs() > 0) {
      map['velocity'] = velocity;
    }
    return map;
  }

  @override
  String toString() {
    var string = 'WayPoint(position: $position. bearing: $bearing°';
    if (velocity.abs() > 0) {
      string += ', velocity: $velocity m/s';
    }

    return '$string)';
  }
}

/// A class for tweening two [WayPoint].
///
/// Get the [WayPoint] at any given fraction value with [evaluate].
class WayPointTween extends Tween<WayPoint> {
  /// Creates a [WayPoint] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  WayPointTween({super.begin, super.end});

  // The inherited lerp() function doesn't work with WayPoint because it is a
  // complex object with two doubles that individually needs to be interpolated.
  @override
  WayPoint lerp(double t) {
    final position = switch (begin != null && end != null) {
      true => begin?.position.spherical
          .intermediatePointTo(end!.position, fraction: t),
      false => null
    };

    final bearing = switch (begin != null && position != null) {
      true => begin!.position.spherical.finalBearingTo(position!),
      false => null
    };

    final velocity = Tween<double>(
      begin: begin?.velocity,
      end: end?.velocity,
    ).lerp(t);

    return WayPoint(
      position: position ??
          begin?.position ??
          end?.position ??
          const Geographic(lon: 0, lat: 0),
      bearing: bearing ?? 0,
      velocity: velocity,
    );
  }
}
