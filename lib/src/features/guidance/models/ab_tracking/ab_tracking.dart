import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';

export 'ab_config.dart';
export 'ab_limit_mode.dart';

/// A base class for common variables and methods for AB based guidance
/// models.
abstract class ABTracking {
  /// A base class for common variables and methods for AB based guidance
  /// models.
  ABTracking({
    required WayPoint start,
    required this.end,
    required this.width,
    this.turningRadius = 10,
    this.turnOffsetIncrease = 1,
    this.limitMode = ABLimitMode.limitedTurnWithin,
    this.snapToClosestLine = false,
  })  : start = start.copyWith(bearing: start.initialBearingToSpherical(end)),
        nextOffset = turnOffsetIncrease;

  /// Point A, the starting point for creating the AB-line.
  final WayPoint start;

  /// Point B, the ending point for creating the AB-line.
  final WayPoint end;

  /// How wide an AB-line should be, as in when to skip to the next line over.
  double width;

  /// How long the AB-line is.
  late final double length;

  /// The mode for what should happen at the end of the line.
  ABLimitMode limitMode;

  /// How many offsets we should add when performing a turn to the next line.
  int turnOffsetIncrease;

  /// Whether or not the closest line should always be snapped to, otherwise
  /// the [currentOffset] has to be manually set/updated.
  bool snapToClosestLine = false;

  /// The number of [width] offsets that we should move the line.
  ///
  /// A positive number means that the line is moved to the right relative
  /// to the original recording direction.
  /// A negative number means that the line is move to the left relative to
  /// the original recording direction.
  int currentOffset = 0;

  /// The turning radius to use for the [upcomingTurn] and [activeTurn].
  double turningRadius;

  /// The upcoming turn placed at the end point ahead of the vehicle in the
  /// driving direction.
  PathTracking? upcomingTurn;

  /// The current active turn that the vehicle is tracking.
  PathTracking? activeTurn;

  /// Offset lines that have been completed.
  final Set<int> finishedOffsets = {};

  /// The next offset to use for the line.
  int nextOffset = 0;

  /// Whether the upcoming turn should be the opposite direction to the usual
  /// direction.
  bool offsetOppositeTurn = false;

  /// The PID controller for controlling the steering angle when
  /// using [PathTrackingMode.pid].
  final pidController = PidController();

  /// Whether the vehicle has passed the middle point of the line in the
  /// driving direction.
  bool passedMiddle = false;

  /// Whether we are waiting to re-engage [snapToClosestLine] when the
  /// [currentOffset] equals [numOffsetsToClosestLine].
  ///
  /// If we are currently snapping to the closest line, but want to go to a
  /// different offset, we can temporarily disengage the snapping and
  /// re-engage it when the wanted offset is the closest line.
  ///
  /// See [checkIfShouldReengageSnap].
  bool awaitToReengageSnap = false;

  /// The bearing at the start point.
  double get initialBearing => start.bearing;

  /// The bearing at the end point.
  double get finalBearing => end.bearing;

  /// Offsets the [start] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  WayPoint offsetStart(int offset) =>
      start.moveSpherical(distance: offset * width, angleFromBearing: 90);

  /// Offsets the [end] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  WayPoint offsetEnd(int offset) =>
      end.moveSpherical(distance: offset * width, angleFromBearing: 90);

  /// The start point for the line with [currentOffset].
  WayPoint get currentStart => offsetStart(currentOffset);

  /// The end point for the line with [currentOffset].
  WayPoint get currentEnd => offsetEnd(currentOffset);

  /// The bearing of the current line at the [currentStart].
  double get currentInitialBearing => currentStart.bearing;

  /// The bearing of the current line at the [currentEnd].
  double get currentFinalBearing => currentEnd.bearing;

  /// The offset [start] for the [nextOffset].
  WayPoint get nextStart => offsetStart(nextOffset);

  /// The offset [end] for the [nextOffset].
  WayPoint get nextEnd => offsetEnd(nextOffset);

  /// Applies the [config] settings to the parameters for this AB-tracking
  /// object.
  void applyConfig(ABConfig? config) {
    if (config != null) {
      if (offsetOppositeTurn != config.offsetOppositeTurn) {
        activeTurn = null;
        upcomingTurn = null;
      }
      width = config.width;
      turningRadius = config.turningRadius;
      turnOffsetIncrease = config.turnOffsetIncrease;
      limitMode = config.limitMode;
      snapToClosestLine = config.snapToClosestLine;
      offsetOppositeTurn = config.offsetOppositeTurn;
      if (limitMode == ABLimitMode.unlimited) {
        activeTurn = null;
        upcomingTurn = null;
      }
    }
  }

  /// Toggles the [snapToClosestLine] to the inverse value.
  void toggleSnapToClosestLine() => snapToClosestLine = !snapToClosestLine;

  /// If the snapping is paused until the wanted offset/line is the closest,
  /// we check if that is the case and re-engage [snapToClosestLine] if it is.
  ///
  /// The [vehicle] is used to find which offset/line is the closest.
  void checkIfShouldReengageSnap(Vehicle vehicle) {
    if (awaitToReengageSnap) {
      if (currentOffset == numOffsetsToClosestLine(vehicle)) {
        snapToClosestLine = true;
        awaitToReengageSnap = false;
      }
    }
  }

  /// The perpendicular distance from [vehicle] to the base line.
  ///
  /// The distance is negative if the point is to the left of the base line.
  double perpendicularDistanceToBaseLine(Vehicle vehicle);

  /// The perpendicular distance from [vehicle] to the line of [offset] offsets.
  double perpendicularDistanceToOffsetLine(int offset, Vehicle vehicle);

  /// How many [width] offsets from the original line we need to get the
  /// closest line.
  int numOffsetsToClosestLine(Vehicle vehicle) =>
      (perpendicularDistanceToBaseLine(vehicle) / width).round();

  /// Compares [vehicle]'s bearing to current line bearing at the
  /// [currentPerpendicularIntersect] to determine what should be left and
  /// right.
  ///
  /// Returns 1 if the [vehicle]'s bearing is in the general forward direction
  /// of the recorded base line (think upper half circle), and -1 when the
  /// bearing is in the general reverse direction of the recorded base line
  /// (think lower half circle).
  int compareToBearing(Vehicle vehicle) {
    final point = vehicle.pathTrackingPoint;

    final alongDistance = point.spherical.alongTrackDistanceTo(
      start: currentStart.position,
      end: currentEnd.position,
    );

    var lineBearing = switch (alongDistance.isNaN) {
      true => currentInitialBearing,
      false => switch (alongDistance.isNegative) {
          true => currentPerpendicularIntersect(vehicle)
              .spherical
              .initialBearingTo(currentStart.position),
          false => currentStart.position.spherical.finalBearingTo(
              currentPerpendicularIntersect(vehicle),
            ),
        }
    };

    if (lineBearing.isNaN) {
      lineBearing = currentInitialBearing;
    }

    final angle = bearingDifference(lineBearing, vehicle.bearing);
    return switch (angle > 90) {
      true => -1,
      false => 1,
    };
  }

  /// The perpendicular intersection point from the [vehicle]'s path tracking
  /// point to the current line.
  Geographic currentPerpendicularIntersect(Vehicle vehicle);

  /// The signed perpendicular distance from the [vehicle]'s path tracking
  /// point to the line with [currentOffset] offsets.
  ///
  /// A negative value means that we're to the left of the line in the
  /// when accounting for the [vehicle]'s bearing and comparing it to the
  /// current line's bearing at the [currentPerpendicularIntersect], and a
  /// positive value means that we're to the right of the line.
  double signedPerpendicularDistanceToCurrentLine(Vehicle vehicle);

  /// Moves the [currentOffset] in the right direction relative to the
  /// [vehicle]'s bearing.
  void moveOffsetRight(Vehicle vehicle, {int offset = 1}) {
    if (snapToClosestLine) {
      snapToClosestLine = false;
      awaitToReengageSnap = true;
    }
    currentOffset += offset * compareToBearing(vehicle);
  }

  /// Moves the [currentOffset] in the left direction relative to the
  /// [vehicle]'s bearing.
  void moveOffsetLeft(Vehicle vehicle, {int offset = 1}) {
    if (snapToClosestLine) {
      snapToClosestLine = false;
      awaitToReengageSnap = true;
    }
    currentOffset -= offset * compareToBearing(vehicle);
  }

  /// Check the automatic offset snap and update the [currentOffset] to the
  /// one closes to [vehicle].
  void checkAutoOffsetSnap(Vehicle vehicle) {
    if (snapToClosestLine && activeTurn == null) {
      final closest = numOffsetsToClosestLine(vehicle);
      if (closest != currentOffset) {
        currentOffset = closest;
      }
    }

    checkIfShouldReengageSnap(vehicle);
  }

  /// Update the [nextOffset] to cover a new line.
  ///
  /// The [turnOffsetIncrease] is applied according to the [vehicle] driving
  /// direction and the [offsetOppositeTurn]. If the [nextOffset] is already
  /// covered in [finishedOffsets], we reduce (relative to direction) the
  /// [nextOffset] so that we cover missing offsets.
  void updateNextOffset(Vehicle vehicle) {
    final bearingAlongAToB = !compareToBearing(vehicle).isNegative;

    if ((bearingAlongAToB && !offsetOppositeTurn) ||
        (!bearingAlongAToB && offsetOppositeTurn)) {
      nextOffset = currentOffset + turnOffsetIncrease;

      while (
          finishedOffsets.contains(nextOffset) || nextOffset == currentOffset) {
        nextOffset--;
      }
    } else {
      nextOffset = currentOffset - turnOffsetIncrease;

      while (
          finishedOffsets.contains(nextOffset) || nextOffset == currentOffset) {
        nextOffset++;
      }
    }

    if (nextOffset == currentOffset) {
      nextOffset += turnOffsetIncrease;
    }

    if ((nextOffset - currentOffset).abs() == 1 && turnOffsetIncrease > 2) {
      offsetOppositeTurn = !offsetOppositeTurn;
    }
  }

  /// Checks if [activeTurn] or [upcomingTurn] should be set for the [vehicle]'s
  /// direction and position when the [limitMode] is not
  /// [ABLimitMode.unlimited].
  void checkIfTurnShouldBeInserted(Vehicle vehicle);

  /// How far along the current line the [vehicle] depending on the direction
  /// [bearingAlongAToB].
  ///
  /// Optional [startPoint] and [endPoint] can be given for specific lines.
  double alongProgress({
    required bool bearingAlongAToB,
    required Vehicle vehicle,
    WayPoint? startPoint,
    WayPoint? endPoint,
  });

  /// Calculates a list of [num] points along the current offset line ahead of
  /// the [vehicle]'s path tracking point, in the forward direction of the
  /// vehicle according to the [vehicle]'s bearing.
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<WayPoint> pointsAhead(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  });

  /// Calculates a list of [num] points along the current line behind of the
  /// [vehicle]'s path tracking point, in the rearward direction of the vehicle
  ///  according to the [vehicle]'s bearing.
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<WayPoint> pointsBehind(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  });

  /// The next point on the [currentOffset]'s line in the [vehicle]'s bearing
  /// direction from the [vehicle]'s path tracking point with
  /// [lookAheadDistance] step size.
  WayPoint nextForwardPoint(
    Vehicle vehicle, {
    double? lookAheadDistance,
  }) =>
      pointsAhead(
        vehicle,
        stepSize: lookAheadDistance ?? vehicle.lookAheadDistance,
      ).first;

  /// The next point on the [currentOffset]'s line in the opposite
  /// direction to the [vehicle]'s bearing from the [vehicle]'s path tracking
  /// point with [lookAheadDistance] step size.
  WayPoint nextReversingPoint(
    Vehicle vehicle, {
    double? lookAheadDistance,
  }) =>
      pointsBehind(
        vehicle,
        stepSize: lookAheadDistance ?? vehicle.lookAheadDistance,
      ).first;

  /// Finds the points that we use to get the secant line that intersects
  /// the circle with radius [lookAheadDistance] from the [vehicle]'s
  /// starting point.
  ///
  /// If the closest point is outside the circle, only this point will be
  /// returned.
  ({Geographic inside, Geographic? outside}) findLookAheadLinePoints(
    Vehicle vehicle, {
    double? lookAheadDistance,
  }) {
    final points = switch (vehicle.isReversing) {
      true => pointsBehind(
          vehicle,
          stepSize: lookAheadDistance ?? vehicle.lookAheadDistance,
        ),
      false => pointsAhead(
          vehicle,
          stepSize: lookAheadDistance ?? vehicle.lookAheadDistance,
        )
    }
        .map((e) => e.position)
        .toList();

    var insidePoint = points.first;

    var insideDistance =
        vehicle.lookAheadStartPosition.spherical.distanceTo(insidePoint);

    // If the closest point is outside look ahead circle we create an
    // intermediate point on the circle in the direction of the closest point.
    if (insideDistance >= (lookAheadDistance ?? vehicle.lookAheadDistance)) {
      return (
        inside: insidePoint =
            vehicle.lookAheadStartPosition.spherical.destinationPoint(
          distance: lookAheadDistance ?? vehicle.lookAheadDistance,
          bearing: vehicle.lookAheadStartPosition.spherical
              .initialBearingTo(insidePoint),
        ),
        outside: null,
      );
    }

    Geographic? outsidePoint;
    for (var i = 1; i < points.length; i++) {
      final point = points[i];
      final distance =
          vehicle.lookAheadStartPosition.spherical.distanceTo(point);
      if (distance <= (lookAheadDistance ?? vehicle.lookAheadDistance)) {
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
    Vehicle vehicle, {
    double? lookAheadDistance,
  }) {
    final points = findLookAheadLinePoints(
      vehicle,
      lookAheadDistance: lookAheadDistance ?? vehicle.lookAheadDistance,
    );

    if (points.outside == null) {
      return null;
    }

    final crossDistance = vehicle.lookAheadStartPosition.spherical
        .crossTrackDistanceTo(start: points.inside, end: points.outside!);

    final secantBearing =
        points.inside.spherical.initialBearingTo(points.outside!);

    return vehicle.lookAheadStartPosition.spherical.destinationPoint(
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
    Vehicle vehicle, {
    double? lookAheadDistance,
  }) {
    final points = findLookAheadLinePoints(
      vehicle,
      lookAheadDistance: lookAheadDistance ?? vehicle.lookAheadDistance,
    );

    if (points.outside == null) {
      return (best: points.inside, worst: null);
    }

    final vehicleAlongDistance = vehicle.lookAheadStartPosition.spherical
        .alongTrackDistanceTo(start: points.inside, end: points.outside!);

    final vehicleToLineDistance = vehicle.lookAheadStartPosition.spherical
        .crossTrackDistanceTo(start: points.inside, end: points.outside!);

    final projectionToCircleDistance = sqrt(
      pow(lookAheadDistance ?? vehicle.lookAheadDistance, 2) -
          pow(vehicleToLineDistance, 2),
    );

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
  /// for the for the [vehicle] with its look ahead distance.
  ///
  /// https://thomasfermi.github.io/Algorithms-for-Automated-Driving/Control/PurePursuit.html
  double nextSteeringAngleLookAhead(Vehicle vehicle) {
    final bearingToPoint =
        vehicle.lookAheadStartPosition.spherical.initialBearingTo(
      findLookAheadCirclePoints(vehicle).best,
    );

    final angle = signedBearingDifference(
      vehicle.bearing,
      bearingToPoint,
    );

    final steeringAngle = atan(
      2 *
          vehicle.wheelBase *
          sin(angle.toRadians()) /
          vehicle.lookAheadDistance,
    ).toDegrees();

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }

  /// The next steering angle for the [vehicle] using Stanley path tracking.
  double nextSteeringAngleStanley(Vehicle vehicle) {
    final parameters = vehicle.stanleyParameters;

    final headingError = signedBearingDifference(
      vehicle.bearing,
      currentPerpendicularIntersect(vehicle).spherical.initialBearingTo(
            pointsAhead(vehicle).last.position,
          ),
    );

    final sign = switch (vehicle.isReversing) {
      true => -1,
      false => 1,
    };

    final steeringAngle = sign * headingError +
        atan(
          parameters.crossDistanceGain *
              -signedPerpendicularDistanceToCurrentLine(
                vehicle,
              ) /
              (parameters.softeningGain +
                  parameters.velocityGain * vehicle.velocity.abs()),
        ).toDegrees();

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }

  /// Calculates the steering angle needed to reach the target point when
  /// using a PID controller.
  double nextSteeringAnglePid(Vehicle vehicle) {
    final steeringAngle = pidController.nextValue(
      signedPerpendicularDistanceToCurrentLine(vehicle),
      vehicle.pidParameters,
    );

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }

  /// The next steering angle for chasing the line.
  ///
  /// The steering mode used is according to the [mode] if set, otherwise
  /// the [vehicle]'s path tracking mode will be used.
  double nextSteeringAngle(Vehicle vehicle, {PathTrackingMode? mode}) {
    checkIfTurnShouldBeInserted(vehicle);
    if (activeTurn != null) {
      return activeTurn!.nextSteeringAngle(vehicle, mode: mode);
    }
    return switch (mode ?? vehicle.pathTrackingMode) {
      PathTrackingMode.pid => nextSteeringAnglePid(vehicle),
      PathTrackingMode.purePursuit => nextSteeringAngleLookAhead(vehicle),
      PathTrackingMode.stanley => nextSteeringAngleStanley(vehicle),
    };
  }

  /// Manually updates the tracking when not using auto steering.
  ///
  /// Will update turns in the same way as when using path tracking with
  /// auto steering.
  void manualUpdate(Vehicle vehicle) {
    checkIfTurnShouldBeInserted(vehicle);
    if (limitMode == ABLimitMode.unlimited) {
      activeTurn = null;
      upcomingTurn = null;
    } else if (activeTurn != null) {
      if (vehicle.isReversing) {
        final length = activeTurn!.path.length;
        final closestIndex = activeTurn!.closestIndex(vehicle);
        activeTurn?.cumulativeIndex = closestIndex - length;
      } else {
        activeTurn?.setIndexToClosestPoint(vehicle);
      }
    }
    updateNextOffset(vehicle);
  }
}
