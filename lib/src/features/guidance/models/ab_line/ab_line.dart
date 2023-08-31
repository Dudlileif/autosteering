import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';
import 'package:geobase/geobase.dart';

/// An enumerator for selecting what should happen when we approach
/// point A or B.
enum ABLimitMode {
  /// The line will continue forever in both directions. No turns will be
  /// placed at the A or B points of the line.
  unlimited,

  /// A turn will be placed at the A and B of the line so that the outermost
  /// part of the turn will be tangential to the line through the A points
  /// or the B points.
  limitedTurnWithin,

  /// A turn will be placed at the A and B points of the line so that the whole
  /// line will be straight and then a turn will be placed after the A or B
  /// points.
  limitedTurnOutside,
}

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
    this.turningRadius = 10,
    this.turnOffsetIncrease = 1,
    this.limitMode = ABLimitMode.limitedTurnWithin,
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

  /// The mode for what should happen at the end of the line.
  ABLimitMode limitMode;

  /// How many offsets we should add when performing a turn to the next line.
  int turnOffsetIncrease;

  /// The PID controller for controlling the steering angle when
  /// using [PathTrackingMode.pid].
  final pidController = PidController();

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

  /// Whether the vehicle has passed the middle point of the line in the
  /// driving direction.
  bool _passedMiddle = false;

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

  /// The length of the line from [currentStart] to [currentEnd].
  double get currentLength => currentStart.spherical.distanceTo(currentEnd);

  /// The offset [start] for the [nextOffset].
  Geographic get nextStart => offsetStart(nextOffset);

  /// The offset [end] for the [nextOffset].
  Geographic get nextEnd => offsetEnd(nextOffset);

  /// Compares [vehicle]'s bearing to current line bearing at the
  /// [currentPerpendicularIntersect] to determine what should be left and
  /// right.
  ///
  /// Returns 1 if the [vehicle]'s bearing is in the general forward direction
  /// of [initialBearing] (think upper half circle), and -1 when the bearing is
  /// in the general reverse direction of [initialBearing] (think lower half
  /// circle).
  int compareToBearing(Vehicle vehicle) {
    final point = vehicle.pathTrackingPoint;

    final alongDistance = point.spherical
        .alongTrackDistanceTo(start: currentStart, end: currentEnd);

    var lineBearing = switch (alongDistance.isNaN) {
      true => currentInitialBearing,
      false => switch (alongDistance.isNegative) {
          true => currentPerpendicularIntersect(vehicle)
              .spherical
              .initialBearingTo(currentStart),
          false => currentStart.spherical.finalBearingTo(
              currentPerpendicularIntersect(vehicle),
            ),
        }
    };

    if (lineBearing.isNaN) {
      lineBearing = currentInitialBearing;
    }

    final angle = ((lineBearing - vehicle.bearing).wrap360() - 180).abs();
    return switch (angle >= 90) {
      true => 1,
      false => -1,
    };
  }

  /// The perpendicular intersection point from the [vehicle]'s path tracking
  /// point to the current line.
  Geographic currentPerpendicularIntersect(Vehicle vehicle) {
    if (activeTurn != null) {
      return activeTurn!.perpendicularIntersect(vehicle);
    }

    final distanceAlong =
        vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
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

  /// The signed perpendicular distance from the [vehicle]'s path tracking
  /// point to the line with [currentOffset] offsets.
  ///
  /// A negative value means that we're to the left of the line in the
  /// when accounting for the [vehicle]'s bearing and comparing it to the
  /// current line's bearing at the [currentPerpendicularIntersect], and a
  /// positive value means that we're to the right of the line.
  double signedPerpendicularDistanceToCurrentLine(Vehicle vehicle) {
    return switch (activeTurn != null) {
      true => activeTurn!.perpendicularDistance(vehicle),
      false => compareToBearing(vehicle) *
          vehicle.pathTrackingPoint.spherical.crossTrackDistanceTo(
            start: currentStart,
            end: currentEnd,
          )
    };
  }

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

  /// Moves the [currentOffset] in the right direction relative to the
  /// [vehicle]'s bearing.
  void moveOffsetRight(Vehicle vehicle) {
    if (snapToClosestLine) {
      snapToClosestLine = false;
      _awaitToReengageSnap = true;
    }
    currentOffset += compareToBearing(vehicle);
  }

  /// Moves the [currentOffset] in the left direction relative to the
  /// [vehicle]'s bearing.
  void moveOffsetLeft(Vehicle vehicle) {
    if (snapToClosestLine) {
      snapToClosestLine = false;
      _awaitToReengageSnap = true;
    }
    currentOffset -= compareToBearing(vehicle);
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
    if ((nextOffset - currentOffset).abs() == 1 && turnOffsetIncrease > 2) {
      offsetOppositeTurn = !offsetOppositeTurn;
    }
  }

  /// Checks if [activeTurn] or [upcomingTurn] should be set for the [vehicle]'s
  /// direction and position when the [limitMode] is not
  /// [ABLimitMode.unlimited].
  void checkIfTurnShouldBeInserted(Vehicle vehicle) {
    if (limitMode != ABLimitMode.unlimited) {
      if (activeTurn != null && (activeTurn?.isCompleted ?? false)) {
        finishedOffsets.add(currentOffset);
        currentOffset = numOffsetsToClosestLine(vehicle.pathTrackingPoint);
        _passedMiddle = false;
        activeTurn = null;
      } else if (activeTurn != null) {
        upcomingTurn = null;
        _passedMiddle = false;
        return;
      }

      updateNextOffset(vehicle);

      final startPoint = switch (limitMode) {
        ABLimitMode.limitedTurnWithin =>
          currentStart.spherical.destinationPoint(
            distance: turningRadius,
            bearing: currentInitialBearing,
          ),
        _ => currentStart,
      };

      final endPoint = switch (limitMode) {
        ABLimitMode.limitedTurnWithin => currentEnd.spherical.destinationPoint(
            distance: turningRadius,
            bearing: (currentInitialBearing + 180).wrap360(),
          ),
        _ => currentEnd,
      };
      final bearingAlongAToB = !compareToBearing(vehicle).isNegative;

      final turnPath = switch (bearingAlongAToB) {
        true => switch (vehicle.isReversing) {
            true => DubinsPath(
                start: WayPoint(
                  position: startPoint,
                  bearing: (currentInitialBearing + 180).wrap360(),
                ),
                end: WayPoint(
                  position: switch (limitMode) {
                    ABLimitMode.limitedTurnWithin =>
                      nextStart.spherical.destinationPoint(
                        distance: turningRadius,
                        bearing: currentInitialBearing,
                      ),
                    _ => nextStart
                  },
                  bearing: currentInitialBearing,
                ),
                turningRadius: turningRadius,
                stepSize: 0.5,
              ).bestDubinsPathPlan!.wayPoints!,
            false => DubinsPath(
                start: WayPoint(
                  position: endPoint,
                  bearing: currentFinalBearing,
                ),
                end: WayPoint(
                  position: switch (limitMode) {
                    ABLimitMode.limitedTurnWithin =>
                      nextEnd.spherical.destinationPoint(
                        distance: turningRadius,
                        bearing: (currentFinalBearing + 180).wrap360(),
                      ),
                    _ => nextEnd
                  },
                  bearing: (currentFinalBearing + 180).wrap360(),
                ),
                turningRadius: turningRadius,
                stepSize: 0.5,
              ).bestDubinsPathPlan!.wayPoints!
          },
        false => switch (vehicle.isReversing) {
            true => DubinsPath(
                start: WayPoint(
                  position: endPoint,
                  bearing: currentFinalBearing,
                ),
                end: WayPoint(
                  position: switch (limitMode) {
                    ABLimitMode.limitedTurnWithin =>
                      nextEnd.spherical.destinationPoint(
                        distance: turningRadius,
                        bearing: (currentFinalBearing + 180).wrap360(),
                      ),
                    _ => nextEnd
                  },
                  bearing: (currentFinalBearing + 180).wrap360(),
                ),
                turningRadius: turningRadius,
                stepSize: 0.5,
              ).bestDubinsPathPlan!.wayPoints!,
            false => DubinsPath(
                start: WayPoint(
                  position: startPoint,
                  bearing: (currentInitialBearing + 180).wrap360(),
                ),
                end: WayPoint(
                  position: switch (limitMode) {
                    ABLimitMode.limitedTurnWithin =>
                      nextStart.spherical.destinationPoint(
                        distance: turningRadius,
                        bearing: currentInitialBearing,
                      ),
                    _ => nextStart
                  },
                  bearing: currentInitialBearing,
                ),
                turningRadius: turningRadius,
                stepSize: 0.5,
              ).bestDubinsPathPlan!.wayPoints!,
          },
      };

      final turn = switch (vehicle.pathTrackingMode) {
        PathTrackingMode.purePursuit ||
        PathTrackingMode.pid =>
          PurePursuitPathTracking(
            wayPoints: switch (vehicle.isReversing) {
              false => turnPath,
              true => turnPath.reversed.toList()
            },
          ),
        PathTrackingMode.stanley => StanleyPathTracking(
            wayPoints: switch (vehicle.isReversing) {
              false => turnPath,
              true => turnPath.reversed
                  .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
                  .toList()
            },
          ),
      };
      if (vehicle.isReversing) {
        turn.cumulativeIndex--;
      }

      final progress = switch (bearingAlongAToB) {
            true => switch (vehicle.isReversing) {
                true => vehicle.pathTrackingPoint.spherical
                    .alongTrackDistanceTo(start: endPoint, end: startPoint),
                false => vehicle.pathTrackingPoint.spherical
                    .alongTrackDistanceTo(start: startPoint, end: endPoint),
              },
            false => switch (vehicle.isReversing) {
                true => vehicle.pathTrackingPoint.spherical
                    .alongTrackDistanceTo(start: startPoint, end: endPoint),
                false => vehicle.pathTrackingPoint.spherical
                    .alongTrackDistanceTo(start: endPoint, end: startPoint),
              },
          } +
          switch (vehicle.pathTrackingMode) {
            PathTrackingMode.purePursuit => vehicle.lookAheadDistance,
            _ => 0,
          };

      final lineLength = startPoint.spherical.distanceTo(endPoint);

      _passedMiddle = progress >= lineLength / 2;
      if (_passedMiddle) {
        upcomingTurn = turn;
      } else {
        upcomingTurn = null;
      }

      if (progress > lineLength &&
          _passedMiddle &&
          activeTurn == null &&
          vehicle.velocity.abs() > 0) {
        activeTurn = upcomingTurn;
        upcomingTurn = null;
      }
    }
  }

  /// Calculates a list of [num] points along the current offset line ahead of
  /// the [vehicle]'s path tracking point, in the forward direction of the
  /// vehicle according to the [vehicle]'s bearing.
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<Geographic> pointsAhead(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  }) {
    final point = vehicle.pathTrackingPoint;

    // Whether the heading closer to the line bearing or the opposite bearing.
    final sign = compareToBearing(vehicle);

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
  /// [vehicle]'s path tracking point, in the rearward direction of the vehicle
  ///  according to the [vehicle]'s bearing.
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<Geographic> pointsBehind(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  }) {
    final point = vehicle.pathTrackingPoint;

    // Whether the heading is closer to the line bearing or the opposite
    // bearing.
    final sign = compareToBearing(vehicle);

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

  /// The next point on the [currentOffset]'s line in the [vehicle]'s bearing
  /// direction from the [vehicle]'s path tracking point with
  /// [lookAheadDistance] step size.
  Geographic nextForwardPoint(
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
  Geographic nextReversingPoint(
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
    };

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
  double _nextSteeringAngleLookAhead(Vehicle vehicle) {
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
  double _nextSteeringAngleStanley(Vehicle vehicle) {
    final parameters = vehicle.stanleyParameters;

    final headingError = signedBearingDifference(
      vehicle.bearing,
      currentPerpendicularIntersect(vehicle).spherical.initialBearingTo(
            pointsAhead(vehicle).last,
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
  double _nextSteeringAnglePid(Vehicle vehicle) {
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
      PathTrackingMode.pid => _nextSteeringAnglePid(vehicle),
      PathTrackingMode.purePursuit => _nextSteeringAngleLookAhead(vehicle),
      PathTrackingMode.stanley => _nextSteeringAngleStanley(vehicle),
    };
  }
}
