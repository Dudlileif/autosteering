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

  /// Finds a way point on the line from this to [end]. The [distance] to
  /// the way point is from this, the start, in the direction towards the [end]
  /// point.
  WayPoint alongLineByDistanceFromStart({
    required WayPoint end,
    required double distance,
  }) {
    if (distance == 0) {
      return this;
    }
    final fraction = distance / distanceToRhumb(end);

    return intermediatePointToSpherical(end, fraction: fraction);
  }

  /// Rotates the way point by [angle] degrees clockwise.
  WayPoint rotateByAngle(double angle) =>
      copyWith(bearing: (bearing + angle).wrap360());

  /// The distance in meters to [other].
  double distanceToRhumb(WayPoint other) =>
      position.rhumb.distanceTo(other.position);

  /// The initial spherical bearing towards [other].
  double initialBearingToRhumb(WayPoint other) =>
      position.rhumb.initialBearingTo(other.position);

  /// The final spherical bearing towards [other].
  double finalBearingToRhumb(WayPoint other) =>
      position.rhumb.finalBearingTo(other.position);

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
      bearing: position.rhumb.finalBearingTo(newPos),
      velocity: velocity,
    );
  }

  /// Finds an intersection from this to [ring] with the [bearing] of this.
  ///
  /// If [oppositeOfBearing] is true, then [bearing] + 180 is used to look
  /// for intersections.
  WayPoint? intersectionWith(
    Iterable<Geographic> ring, {
    bool oppositeOfBearing = false,
  }) {
    final intersections = <Geographic>[];

    for (var i = 0; i < ring.length; i++) {
      final start = ring.elementAt(i);
      final end = ring.elementAt((i + 1) % ring.length);

      final bearingToStart = position.rhumb.initialBearingTo(start);
      final bearingToEnd = position.rhumb.initialBearingTo(end);

      // Skip lines that are to behind of this point or ahead if
      // [oppositeOfBearing].
      if ((bearingDifference(bearing, bearingToStart) > 90 &&
              bearingDifference(bearing, bearingToEnd) > 90) &&
          !oppositeOfBearing) continue;

      final ringIntersection = position.spherical.intersectionWith(
        bearing: oppositeOfBearing ? (bearing + 180).wrap360() : bearing,
        other: start,
        otherBearing: start.rhumb.initialBearingTo(end),
      );

      if (ringIntersection != null) {
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
    if (intersections.isNotEmpty) {
      intersections.sortByCompare<double>(
        (element) => position.rhumb.distanceTo(element),
        (a, b) => a.compareTo(b),
      );

      return copyWith(
        position: intersections.first,
        bearing: position.rhumb.finalBearingTo(intersections.first),
      );
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
  Map<String, dynamic> toJson() => {
        'position': position.toString(),
        'bearing': bearing,
        'velocity': velocity,
      };
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
      true => begin!.position.rhumb.finalBearingTo(position!),
      false => null
    };

    final velocity = Tween<double>(
      begin: begin?.velocity,
      end: end?.velocity,
    ).lerp(t);

    return WayPoint(
      position: position ?? const Geographic(lon: 0, lat: 0),
      bearing: bearing ?? 0,
      velocity: velocity,
    );
  }
}
