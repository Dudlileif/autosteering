import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';
import 'package:geobase/geobase.dart';

/// A class for creating and tracking straight lines by using the bearing
/// from point A to point B and their positions to create parallel lines.
///
/// The lines are based on [SphericalGreatCircle].
class ABLine extends ABTracking with EquatableMixin {
  /// Create an AB-line from the [start] point A and the [end] point B.
  ///
  /// The [width] of the line determines when we should swap to the next line
  /// over, i.e. when the perpendicular distance to the line is larger than
  /// [width]/2.
  ABLine({
    required super.start,
    required super.end,
    required super.width,
    super.turningRadius = 10,
    super.turnOffsetIncrease = 1,
    super.limitMode = ABLimitMode.limitedTurnWithin,
    super.snapToClosestLine = false,
  }) {
    super.length = start.distanceToSpherical(end);
  }

  /// The perpendicular intersection point from the [vehicle]'s path tracking
  /// point to the current line.
  @override
  Geographic currentPerpendicularIntersect(Vehicle vehicle) {
    if (activeTurn != null) {
      return activeTurn!.perpendicularIntersect(vehicle);
    }

    final distanceAlong =
        vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
      start: currentStart.position,
      end: currentEnd.position,
    );

    return currentStart.position.spherical.destinationPoint(
      distance: distanceAlong,
      bearing: currentInitialBearing,
    );
  }

  @override
  double perpendicularDistanceToOffsetLine(int offset, Vehicle vehicle) =>
      vehicle.pathTrackingPoint.spherical.crossTrackDistanceTo(
        start: offsetStart(offset).position,
        end: offsetEnd(offset).position,
      );

  @override
  double perpendicularDistanceToBaseLine(Vehicle vehicle) =>
      vehicle.pathTrackingPoint.spherical.crossTrackDistanceTo(
        start: start.position,
        end: end.position,
      );

  @override
  double signedPerpendicularDistanceToCurrentLine(Vehicle vehicle) {
    return switch (activeTurn != null) {
      true => activeTurn!.perpendicularDistance(vehicle),
      false => compareToBearing(vehicle) *
          vehicle.pathTrackingPoint.spherical.crossTrackDistanceTo(
            start: currentStart.position,
            end: currentEnd.position,
          )
    };
  }

  @override
  double alongProgress({
    required bool bearingAlongAToB,
    required Vehicle vehicle,
    WayPoint? startPoint,
    WayPoint? endPoint,
  }) =>
      switch (bearingAlongAToB) {
        true => switch (vehicle.isReversing) {
            true => vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
                start: (endPoint ?? end).position,
                end: (startPoint ?? start).position,
              ),
            false => vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
                start: (startPoint ?? start).position,
                end: (endPoint ?? end).position,
              ),
          },
        false => switch (vehicle.isReversing) {
            true => vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
                start: (startPoint ?? start).position,
                end: (endPoint ?? end).position,
              ),
            false => vehicle.pathTrackingPoint.spherical.alongTrackDistanceTo(
                start: (endPoint ?? end).position,
                end: (startPoint ?? start).position,
              ),
          },
      } +
      switch (vehicle.pathTrackingMode) {
        PathTrackingMode.purePursuit => vehicle.lookAheadDistance,
        _ => 0,
      };

  /// The distance from [point] to the [offsetStart] point.
  ///
  /// The distance is positive in the [currentInitialBearing] from the
  /// [currentStart] point and negative in the opposite direction.
  double offsetIntersectToStartDistance(int offset, Geographic point) =>
      point.spherical.alongTrackDistanceTo(
        start: offsetStart(offset).position,
        end: offsetEnd(offset).position,
      );

  @override
  void checkIfTurnShouldBeInserted(Vehicle vehicle) {
    if (limitMode != ABLimitMode.unlimited) {
      if (activeTurn != null && (activeTurn?.isCompleted ?? false)) {
        finishedOffsets.add(currentOffset);
        currentOffset = numOffsetsToClosestLine(vehicle);
        passedMiddle = false;
        activeTurn = null;
      } else if (activeTurn != null) {
        upcomingTurn = null;
        passedMiddle = false;
        return;
      }

      updateNextOffset(vehicle);

      final startPoint = switch (limitMode) {
        ABLimitMode.limitedTurnWithin =>
          currentStart.moveSpherical(distance: turningRadius),
        _ => currentStart,
      };

      final endPoint = switch (limitMode) {
        ABLimitMode.limitedTurnWithin => currentEnd.moveSpherical(
            distance: turningRadius,
            angleFromBearing: 180,
          ),
        _ => currentEnd,
      };
      final bearingAlongAToB = !compareToBearing(vehicle).isNegative;

      final turnPath = switch (bearingAlongAToB) {
        true => switch (vehicle.isReversing) {
            true => DubinsPath(
                start: startPoint.copyWith(
                  bearing: (startPoint.bearing + 180).wrap360(),
                ),
                end: switch (limitMode) {
                  ABLimitMode.limitedTurnWithin =>
                    nextStart.moveSpherical(distance: turningRadius),
                  _ => nextStart
                },
                turningRadius: turningRadius,
                stepSize: 0.5,
              ).bestDubinsPathPlan!.wayPoints!,
            false => DubinsPath(
                start: endPoint,
                end: switch (limitMode) {
                  ABLimitMode.limitedTurnWithin => nextEnd
                      .moveSpherical(
                        distance: turningRadius,
                        angleFromBearing: 180,
                      )
                      .copyWith(bearing: (nextEnd.bearing + 180).wrap360()),
                  _ => nextEnd.copyWith(
                      bearing: (nextEnd.bearing + 180).wrap360(),
                    ),
                },
                turningRadius: turningRadius,
                stepSize: 0.5,
              ).bestDubinsPathPlan!.wayPoints!
          },
        false => switch (vehicle.isReversing) {
            true => DubinsPath(
                start: endPoint,
                end: switch (limitMode) {
                  ABLimitMode.limitedTurnWithin => nextEnd
                      .moveSpherical(
                        distance: turningRadius,
                        angleFromBearing: 180,
                      )
                      .copyWith(
                        bearing: (currentFinalBearing + 180).wrap360(),
                      ),
                  _ => nextEnd.copyWith(
                      bearing: (currentFinalBearing + 180).wrap360(),
                    )
                },
                turningRadius: turningRadius,
                stepSize: 0.5,
              ).bestDubinsPathPlan!.wayPoints!,
            false => DubinsPath(
                start: startPoint.copyWith(
                  bearing: (startPoint.bearing + 180).wrap360(),
                ),
                end: switch (limitMode) {
                  ABLimitMode.limitedTurnWithin => nextStart.moveSpherical(
                      distance: turningRadius,
                    ),
                  _ => nextStart
                },
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
                  .map(
                    (e) => e.copyWith(bearing: (e.bearing + 180).wrap360()),
                  )
                  .toList()
            },
          ),
      };
      if (vehicle.isReversing) {
        turn.cumulativeIndex--;
      }

      final progress = alongProgress(
        bearingAlongAToB: bearingAlongAToB,
        vehicle: vehicle,
        startPoint: startPoint,
        endPoint: endPoint,
      );

      final lineLengthBetweenTurns = startPoint.distanceToSpherical(endPoint);

      passedMiddle = progress >= lineLengthBetweenTurns / 2;
      if (passedMiddle) {
        upcomingTurn = turn;
      } else {
        upcomingTurn = null;
      }

      if (progress > lineLengthBetweenTurns &&
          passedMiddle &&
          activeTurn == null &&
          vehicle.velocity.abs() > 0) {
        activeTurn = upcomingTurn;
        upcomingTurn = null;
      }
    }
  }

  @override
  List<WayPoint> pointsAhead(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  }) {
    // Whether the heading closer to the line bearing or the opposite bearing.
    final sign = compareToBearing(vehicle);

    var stepOffset = (offsetIntersectToStartDistance(
              currentOffset,
              vehicle.pathTrackingPoint,
            ) /
            stepSize)
        .ceil();

    if (sign.isNegative) {
      stepOffset--;
    }

    return List.generate(
      num,
      (index) => currentStart.moveSpherical(
        distance: stepSize * (index + sign * stepOffset),
        angleFromBearing: switch (sign.isNegative) {
          true => 180,
          false => 0,
        },
      ),
      growable: false,
    );
  }

  @override
  List<WayPoint> pointsBehind(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  }) {
    // Whether the heading is closer to the line bearing or the opposite
    // bearing.
    final sign = compareToBearing(vehicle);

    var stepOffset = (offsetIntersectToStartDistance(
              currentOffset,
              vehicle.pathTrackingPoint,
            ) /
            stepSize)
        .floor();

    if (sign.isNegative) {
      stepOffset++;
    }

    return List.generate(
      num,
      (index) => currentStart.moveSpherical(
        distance: stepSize * (index - sign * stepOffset),
        angleFromBearing: switch (sign.isNegative) {
          true => 0,
          false => 180,
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
        awaitToReengageSnap,
        currentOffset,
        initialBearing,
        finalBearing,
      ];
}
