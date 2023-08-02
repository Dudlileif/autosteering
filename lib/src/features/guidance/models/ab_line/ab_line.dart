import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

/// A class for creating and tracking straight lines by using the bearing
/// from point A to point B and their positions to create parallel lines.
///
/// The lines are based on [SphericalGreatCircle].
class ABLine with EquatableMixin {
  /// Create an AB-line from the [start] point A and the [end] point B.
  ///
  /// The [width] of the line determines when we should swap to the next line
  /// over, i.e. when the perpendicular distance to the line is larger than
  /// [width]/2.
  ABLine({
    required this.start,
    required this.end,
    required this.width,
    this.snapToClosestLine = false,
  })  : initialBearing = start.spherical.initialBearingTo(end),
        finalBearing = start.spherical.finalBearingTo(end);

  /// Point A, the starting point for creating the AB-line.
  final Geographic start;

  /// Point B, the ending point for creating the AB-line.
  final Geographic end;

  /// The bearing of the line at the [start] point.
  final double initialBearing;

  /// The bearing of the line at the [end] point.
  final double finalBearing;

  /// How wide an AB-line should be, as in when to skip to the next line over.
  double width;

  /// Whether or not the closest line should always be snapped to, otherwise
  /// the [currentOffset] has to be manually set/updated.
  bool snapToClosestLine = false;

  /// The number of [width] offsets that we should move the line.
  ///
  /// A positive number means that the line is moved to the right relative
  /// to the line's [initialBearing].
  /// A negative number means that the line is move to the left relative to
  /// the line's [initialBearing].
  int currentOffset = 0;

  /// Whether we are waiting to re-engage [snapToClosestLine] when the
  /// [currentOffset] equals [numOffsetsToClosestLine].
  ///
  /// If we are currently snapping to the closest line, but want to go to a
  /// different offset, we can temporarily disengage the snapping and
  /// re-engage it when the wanted offset is the closest line.
  ///
  /// See [_checkIfShouldReengageSnap].
  bool _awaitToReengageSnap = false;

  /// If the snapping is paused until the wanted offset/line is the closest,
  /// we check if that is the case and re-engage [snapToClosestLine] if it is.
  ///
  /// The [point] is used to find which offset/line is the closest.
  void _checkIfShouldReengageSnap(Geographic point) {
    if (_awaitToReengageSnap) {
      if (currentOffset == numOffsetsToClosestLine(point)) {
        snapToClosestLine = true;
        _awaitToReengageSnap = false;
      }
    }
  }

  /// Toggles the [snapToClosestLine] to the inverse value.
  void toggleSnapToClosestLine() => snapToClosestLine = !snapToClosestLine;

  /// Offsets the [start] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  Geographic offsetStart(int offset) => start.spherical
      .destinationPoint(distance: offset * width, bearing: initialBearing + 90);

  /// Offsets the [end] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  Geographic offsetEnd(int offset) => end.spherical
      .destinationPoint(distance: offset * width, bearing: finalBearing + 90);

  /// The start point for the line with [currentOffset].
  Geographic get currentStart => offsetStart(currentOffset);

  /// The end point for the line with [currentOffset].
  Geographic get currentEnd => offsetEnd(currentOffset);

  /// The bearing of the current line at the [currentStart].
  double get currentInitialBearing =>
      currentStart.spherical.initialBearingTo(currentEnd);

  /// The bearing of the current line at the [currentEnd].
  double get currentFinalBearing =>
      currentStart.spherical.finalBearingTo(currentEnd);

  /// Compares [heading] to current line bearing at the
  /// [currentPerpendicularIntersect] to determine what should be left and
  /// right.
  ///
  /// Returns 1 if the [heading] is in the general forward direction of
  /// [initialBearing] (think upper half circle), and -1 when [heading] is in
  /// the general reverse direction of [initialBearing] (think lower half
  /// circle).
  int compareToBearing(Geographic point, double heading) => (normalizeBearing(
                    currentStart.spherical.finalBearingTo(
                          currentPerpendicularIntersect(point),
                        ) -
                        heading,
                  ) -
                  180)
              .abs() >=
          90
      ? 1
      : -1;

  /// The perpendicular intersection point from [point] to the current line.
  Geographic currentPerpendicularIntersect(Geographic point) {
    final distanceAlong = point.spherical.alongTrackDistanceTo(
      start: currentStart,
      end: currentEnd,
    );

    return currentStart.spherical.destinationPoint(
      distance: distanceAlong,
      bearing: currentInitialBearing,
    );
  }

  /// The perpendicular distance from [point] to the line of [offset] offsets.
  double perpendicularDistanceToOffsetLine(int offset, Geographic point) =>
      point.spherical.crossTrackDistanceTo(
        start: offsetStart(offset),
        end: offsetEnd(offset),
      );

  /// The signed perpendicular distance from [point] to the line with
  /// [currentOffset] offsets.
  ///
  /// A negative value means that we're to the left of the line in the
  /// when accounting for the [heading] and comparing it to the current line's
  /// bearing at the [currentPerpendicularIntersect], and a positive value means
  /// that we're to the right of the line.
  double signedPerpendicularDistanceToCurrentLine({
    required Geographic point,
    required double heading,
  }) =>
      compareToBearing(point, heading) *
      point.spherical.crossTrackDistanceTo(
        start: currentStart,
        end: currentEnd,
      );

  /// The perpendicular distance from [point] to the original line.
  ///
  /// The distance is negative if the point is to the left of the line.
  double perpendicularDistanceToLine(Geographic point) =>
      point.spherical.crossTrackDistanceTo(
        start: start,
        end: end,
      );

  /// How many [width] offsets from the original line we need to get the
  /// closest line.
  int numOffsetsToClosestLine(Geographic point) =>
      (perpendicularDistanceToLine(point) / width).round();

  /// The distance from [point] to the [offsetStart] point.
  ///
  /// The distance is positive in the [currentInitialBearing] from the
  /// [currentStart] point and negative in the opposite direction.
  double offsetIntersectToStartDistance(int offset, Geographic point) => point
      .spherical
      .alongTrackDistanceTo(start: offsetStart(offset), end: offsetEnd(offset));

  /// Moves the [currentOffset] in the right direction relative to [heading].
  void moveOffsetRight(Geographic point, double heading) {
    if (snapToClosestLine) {
      snapToClosestLine = false;
      _awaitToReengageSnap = true;
    }
    currentOffset += compareToBearing(point, heading);
  }

  /// Moves the [currentOffset] in the left direction relative to [heading];
  void moveOffsetLeft(Geographic point, double heading) {
    if (snapToClosestLine) {
      snapToClosestLine = false;
      _awaitToReengageSnap = true;
    }
    currentOffset -= compareToBearing(point, heading);
  }

  /// Calculates a list of [num] points along the current offset line ahead of
  /// the [point], in the forward direction of the vehicle according to
  /// [heading].
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<Geographic> pointsAhead({
    required Geographic point,
    required double heading,
    double stepSize = 10,
    int num = 2,
  }) {
    // Whether the heading closer to the line bearing or the opposite bearing.
    final sign = compareToBearing(point, heading);

    if (snapToClosestLine) {
      currentOffset = numOffsetsToClosestLine(point);
    }
    _checkIfShouldReengageSnap(point);

    var stepOffset =
        (offsetIntersectToStartDistance(currentOffset, point) / stepSize)
            .ceil();

    if (sign.isNegative) {
      stepOffset--;
    }

    return List.generate(
      num,
      (index) => currentStart.spherical.destinationPoint(
        distance: stepSize * (index + sign * stepOffset),
        bearing: switch (sign.isNegative) {
          true => currentInitialBearing + 180,
          false => currentInitialBearing,
        },
      ),
      growable: false,
    );
  }

  /// Calculates a list of [num] points along the current line behind of the
  /// [point], in the rearward direction of the vehicle according to [heading].
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<Geographic> pointsBehind({
    required Geographic point,
    required double heading,
    double stepSize = 10,
    int num = 2,
  }) {
    // Whether the heading is closer to the line bearing or the opposite
    // bearing.
    final sign = compareToBearing(point, heading);

    if (snapToClosestLine) {
      currentOffset = numOffsetsToClosestLine(point);
    }

    _checkIfShouldReengageSnap(point);

    var stepOffset =
        (offsetIntersectToStartDistance(currentOffset, point) / stepSize)
            .floor();

    if (sign.isNegative) {
      stepOffset++;
    }

    return List.generate(
      num,
      (index) => currentStart.spherical.destinationPoint(
        distance: stepSize * (index - sign * stepOffset),
        bearing: switch (sign.isNegative) {
          true => currentInitialBearing,
          false => currentInitialBearing + 180,
        },
      ),
      growable: false,
    );
  }

  @override
  List<Object?> get props => [
        start,
        end,
        width,
        snapToClosestLine,
        _awaitToReengageSnap,
        currentOffset,
        initialBearing,
        finalBearing,
      ];

  /// The next point on the [currentOffset]'s line in the [heading]
  /// direction from [point] with [lookAheadDistance] step size.
  Geographic nextForwardPoint(
    Geographic point,
    double heading,
    double lookAheadDistance,
  ) =>
      pointsAhead(
        point: point,
        heading: heading,
        stepSize: lookAheadDistance,
      ).first;

  /// The next point on the [currentOffset]'s line in the opposite
  /// direction to [heading] from [point] with [lookAheadDistance] step size.
  Geographic nextReversingPoint(
    Geographic point,
    double heading,
    double lookAheadDistance,
  ) =>
      pointsBehind(
        point: point,
        heading: heading,
        stepSize: lookAheadDistance,
      ).first;

  /// Finds the points that we use to get the secant line that intersects
  /// the circle with radius [lookAheadDistance] from the [vehicle]'s
  /// starting point.
  ///
  /// If the closest point is outside the circle, only this point will be
  /// returned.
  ({Geographic inside, Geographic? outside}) findLookAheadLinePoints(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final points = switch (vehicle.isReversing) {
      true => pointsBehind(
          point: vehicle.lookAheadStartPosition.gbPosition,
          heading: vehicle.bearing,
          stepSize: lookAheadDistance,
        ),
      false => pointsAhead(
          point: vehicle.lookAheadStartPosition.gbPosition,
          heading: vehicle.bearing,
          stepSize: lookAheadDistance,
        )
    };

    var insidePoint = points.first;

    var insideDistance = vehicle.lookAheadStartPosition.gbPosition.spherical
        .distanceTo(insidePoint);

    // If the closest point is outside look ahead circle we create an
    // intermediate point on the circle in the direction of the closest point.
    if (insideDistance >= lookAheadDistance) {
      return (
        inside: insidePoint = vehicle
            .lookAheadStartPosition.gbPosition.spherical
            .destinationPoint(
          distance: lookAheadDistance,
          bearing: vehicle.lookAheadStartPosition.gbPosition.spherical
              .initialBearingTo(insidePoint),
        ),
        outside: null,
      );
    }

    Geographic? outsidePoint;
    for (var i = 1; i < points.length; i++) {
      final point = points[i];
      final distance =
          vehicle.lookAheadStartPosition.gbPosition.spherical.distanceTo(point);
      if (distance <= lookAheadDistance) {
        insidePoint = point;
        insideDistance = distance;
      } else {
        outsidePoint = point;
        break;
      }
    }

    return (inside: insidePoint, outside: outsidePoint);
  }

  /// The point on the secant line that is the shortest distance from the
  /// [vehicle]'s look ahead starting point.
  Geographic? vehicleToLookAheadLineProjection(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final points = findLookAheadLinePoints(vehicle, lookAheadDistance);

    if (points.outside == null) {
      return null;
    }

    final crossDistance = vehicle.lookAheadStartPosition.gbPosition.spherical
        .crossTrackDistanceTo(start: points.inside, end: points.outside!);

    final secantBearing =
        points.inside.spherical.initialBearingTo(points.outside!);

    return vehicle.lookAheadStartPosition.gbPosition.spherical.destinationPoint(
      distance: crossDistance,
      bearing: secantBearing - 90,
    );
  }

  /// Finds the intersection waypoints on the look ahead circle.
  ///
  /// A single waypoint is returned when there is no points in the look ahead
  /// circle. This waypoint is pointing directly towards the next waypoint
  /// outside the circle from the [vehicle]'s look ahead starting position.
  ///
  /// If the secant line exists and intersects the circle, the intersection
  /// points are returned as the best and worst, sorted by their distance to
  /// the next point outside the circle. The best point is what should be
  /// used for path tracking.
  ({Geographic best, Geographic? worst}) findLookAheadCirclePoints(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final points = findLookAheadLinePoints(vehicle, lookAheadDistance);

    if (points.outside == null) {
      return (best: points.inside, worst: null);
    }

    final vehicleAlongDistance = vehicle
        .lookAheadStartPosition.gbPosition.spherical
        .alongTrackDistanceTo(start: points.inside, end: points.outside!);

    final vehicleToLineDistance = vehicle
        .lookAheadStartPosition.gbPosition.spherical
        .crossTrackDistanceTo(start: points.inside, end: points.outside!);

    final projectionToCircleDistance =
        sqrt(pow(lookAheadDistance, 2) - pow(vehicleToLineDistance, 2));

    final secantBearing =
        points.inside.spherical.initialBearingTo(points.outside!);

    final vehicleToLineProjection = points.inside.spherical.destinationPoint(
      distance: vehicleAlongDistance,
      bearing: secantBearing,
    );

    var vehicleLineProjectionToInsidePointBearing =
        vehicleToLineProjection.spherical.initialBearingTo(points.inside);
    if (vehicleLineProjectionToInsidePointBearing.isNaN) {
      vehicleLineProjectionToInsidePointBearing = secantBearing;
    }

    final pointA = vehicleToLineProjection.spherical.destinationPoint(
      distance: projectionToCircleDistance,
      bearing: vehicleLineProjectionToInsidePointBearing,
    );

    final pointB = vehicleToLineProjection.spherical.destinationPoint(
      distance: projectionToCircleDistance,
      bearing: (vehicleLineProjectionToInsidePointBearing + 180).wrap360(),
    );

    final distanceA = pointA.spherical.distanceTo(points.outside!);
    final distanceB = pointB.spherical.distanceTo(points.outside!);

    if (distanceA < distanceB) {
      return (best: pointA, worst: pointB);
    }
    return (best: pointB, worst: pointA);
  }

  /// Finds the next steering angle to reach the [currentOffset]'s line
  /// for the for the [vehicle] with the specified [lookAheadDistance].
  double nextSteeringAngleLookAhead({
    required Vehicle vehicle,
    required double lookAheadDistance,
  }) {
    final angle =
        vehicle.lookAheadStartPosition.gbPosition.spherical.initialBearingTo(
              findLookAheadCirclePoints(vehicle, lookAheadDistance).best,
            ) -
            vehicle.bearing;

    final steeringAngle = atan(
          2 * vehicle.wheelBase * sin(angle * pi / 180) / lookAheadDistance,
        ) *
        180 /
        pi;

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }
}
