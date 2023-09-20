import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';

/// A class for creating and tracking parallel curved lines from point A to
/// point B.
class ABCurve extends ABTracking {
  /// A class for creating and tracking parallel curved lines from point A
  /// [start] to point B [end].
  ///
  /// The parallel lines are spaced by [width].
  ABCurve({
    required this.baseCurve,
    required super.start,
    required super.end,
    required super.width,
    super.turningRadius = 10,
    super.turnOffsetIncrease = 1,
    super.limitMode = ABLimitMode.limitedTurnWithin,
    super.snapToClosestLine = false,
  })  : assert(
          baseCurve.length >= 2,
          'Base curve has to have at least two points',
        ),
        currentPathTracking = PurePursuitPathTracking(wayPoints: baseCurve),
        baseCurvePathTracking = PurePursuitPathTracking(wayPoints: baseCurve),
        isCCW = isCurveCounterclockwise(baseCurve.map((e) => e.position)) {
    super.length = baseCurve.foldIndexed(
      0,
      (index, prevValue, element) => index + 1 < baseCurve.length
          ? prevValue +
              element.distanceToSpherical(baseCurve.elementAt(index + 1))
          : prevValue,
    );
    nextPathTracking = PurePursuitPathTracking(wayPoints: nextCurve);
    _curves[0] = baseCurve;
    _curves[nextOffset] = nextCurve;
  }

  /// The recorded base curve.
  final List<WayPoint> baseCurve;

  /// Whether the curve is counterclockwise or not (clockwise).
  final bool isCCW;

  /// Whether the [currentPathTracking] is in the same or opposite direction as
  /// [baseCurve].
  bool pathAlongAToB = true;

  /// The path tracking for the [baseCurve].
  PathTracking baseCurvePathTracking;

  /// The path tracking for the [currentCurve].
  PathTracking currentPathTracking;

  /// The path tracking for the [nextCurve].
  late PathTracking nextPathTracking;

  /// A map of the already calculated offset curves.
  final Map<int, List<WayPoint>> _curves = {};

  @override
  set currentOffset(int newOffset) {
    if (currentOffset != newOffset) {
      super.currentOffset = newOffset;
      currentPathTracking.interPolateWayPoints(newWayPoints: currentCurve);
    }
  }

  @override
  WayPoint offsetStart(int offset) => baseCurve.first
      .moveSpherical(distance: offset * width, angleFromBearing: 90);

  @override
  WayPoint offsetEnd(int offset) => baseCurve.last
      .moveSpherical(distance: offset * width, angleFromBearing: 90);

  @override
  WayPoint get currentStart => pathAlongAToB
      ? currentPathTracking.path.first
      : currentPathTracking.path.last;

  @override
  WayPoint get currentEnd => pathAlongAToB
      ? currentPathTracking.path.last
      : currentPathTracking.path.first;

  @override
  WayPoint get nextStart =>
      pathAlongAToB ? nextPathTracking.path.last : nextPathTracking.path.first;

  @override
  WayPoint get nextEnd =>
      pathAlongAToB ? nextPathTracking.path.first : nextPathTracking.path.last;

  /// Offsets the [baseCurve] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  List<WayPoint> offsetCurve(int offset) {
    if (_curves[offset] != null) {
      return _curves[offset]!;
    }

    final buffered = RingBuffer.bufferCircular(
      ring: baseCurve.map((e) => e.position).toList()
        ..add(
          baseCurve.last.moveSpherical(distance: 100).position,
        )
        ..insert(
          0,
          baseCurve.first
              .moveSpherical(distance: 100, angleFromBearing: 180)
              .position,
        ),
      distance: offset * width,
      extendEnds: false,
      smoothingFactor: 4.0 * (1 + offset),
      swapDirectionIfClockwise: !isCCW,
    );

    final newCurve = <WayPoint>[];
    if (buffered.length >= 2) {
      buffered.forEachIndexed((index, element) {
        if (index == 0) {
          newCurve.add(
            WayPoint(
              position: element,
              bearing: element.spherical
                  .initialBearingTo(buffered.elementAt(index + 1)),
            ),
          );
        } else {
          newCurve.add(
            WayPoint(
              position: element,
              bearing: buffered
                  .elementAt(index - 1)
                  .spherical
                  .finalBearingTo(element),
            ),
          );
        }
      });
    }
    if (newCurve.length > 2) {
      final pointsToRemove = <WayPoint>[];
      for (var i = 1; i < newCurve.length - 1; i++) {
        final point = newCurve[i];
        final fromStartBearing =
            newCurve.first.initialBearingToSpherical(point);
        final fromEndBearing = newCurve.last.initialBearingToSpherical(point);

        if (signedBearingDifference(newCurve.first.bearing, fromStartBearing)
                    .abs() >
                90 ||
            signedBearingDifference(newCurve.last.bearing, fromEndBearing)
                    .abs() <
                90) {
          pointsToRemove.add(point);
        }
      }
      for (final element in pointsToRemove) {
        newCurve.remove(element);
      }
    }

    final bbox = GeoBox.from([
      offsetStart(offset - 1).position,
      offsetEnd(offset - 1).position,
      offsetEnd(offset + 1).position,
      offsetStart(offset + 1).position,
    ]);

    // Filter out points outside the bounding box.
    newCurve
      ..removeWhere(
        (element) => !bbox.intersectsPoint2D(element.position),
      )
      // Filter out points that are within 10 cm of others to mitigate bearing
      // errors.
      ..forEachIndexed((index, element) {
        if (index == newCurve.length - 1) {
          if (element.distanceToSpherical(newCurve.elementAt(index - 1)) <
              0.1) {
            newCurve.removeAt(index - 1);
          }
        } else if (index > 0) {
          if (element.distanceToSpherical(newCurve.elementAt(index - 1)) <
              0.1) {
            newCurve.removeAt(index);
          }
        }
      });

    // Ensure that the end points has the correct bearings.
    if (newCurve.length >= 2) {
      newCurve[0] = newCurve.first.copyWith(
        bearing: newCurve.first.initialBearingToSpherical(newCurve[1]),
      );
      newCurve[newCurve.length - 1] = newCurve.last.copyWith(
        bearing: newCurve[newCurve.length - 2]
            .finalBearingToSpherical(newCurve.last),
      );
    }
    _curves[offset] = newCurve;
    return newCurve;
  }

  /// Updates [pathAlongAToB] depending on if the [vehicle] is along the
  /// A-B direction.
  void updatePathAlongAToB(Vehicle vehicle) {
    final bearingAlongStartToEndOfCurrentPath = bearingDifference(
          vehicle.bearing,
          currentPathTracking.currentWayPoint(vehicle).bearing,
        ) <
        90;

    if (!bearingAlongStartToEndOfCurrentPath && activeTurn == null) {
      pathAlongAToB = !pathAlongAToB;
      currentPathTracking
        ..interPolateWayPoints(newWayPoints: currentCurve)
        ..cumulativeIndex = switch (vehicle.isReversing) {
          true => -1,
          false => 0,
        };
      nextPathTracking
        ..interPolateWayPoints(newWayPoints: nextCurve)
        ..cumulativeIndex = switch (vehicle.isReversing) {
          true => -1,
          false => 0,
        };
    }
  }

  /// The next curve to follow after the current one.
  List<WayPoint> get nextCurve => pathAlongAToB
      ? offsetCurve(nextOffset)
          .reversed
          .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
          .toList()
      : offsetCurve(nextOffset);

  /// The curve for the [currentOffset].
  List<WayPoint> get currentCurve => !pathAlongAToB
      ? offsetCurve(currentOffset)
          .reversed
          .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
          .toList()
      : offsetCurve(currentOffset);

  @override
  int compareToBearing(Vehicle vehicle) {
    updatePathAlongAToB(vehicle);

    return switch (pathAlongAToB) {
      true => 1,
      false => -1,
    };
  }

  /// The current [PathTracking] of the [currentCurve] for the [Vehicle].
  void updateCurrentPathTracking(Vehicle vehicle, {bool force = false}) {
    final pathTrackingIsCorrectMode = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => currentPathTracking is StanleyPathTracking,
      PathTrackingMode.purePursuit ||
      PathTrackingMode.pid =>
        currentPathTracking is PurePursuitPathTracking
    };

    // Return if we're already in the right mode.
    if (!force && pathTrackingIsCorrectMode) {
      // currentPathTracking.interPolateWayPoints(newWayPoints: currentCurve);
      return;
    }

    currentPathTracking = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => StanleyPathTracking(wayPoints: currentCurve),
      PathTrackingMode.purePursuit ||
      PathTrackingMode.pid =>
        PurePursuitPathTracking(wayPoints: currentCurve),
    }
      ..setIndexToClosestPoint(vehicle);

    nextPathTracking = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => StanleyPathTracking(wayPoints: nextCurve),
      PathTrackingMode.purePursuit ||
      PathTrackingMode.pid =>
        PurePursuitPathTracking(wayPoints: nextCurve),
    }
      ..cumulativeIndex = switch (vehicle.isReversing) {
        true => -1,
        false => 0,
      };

    baseCurvePathTracking = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => StanleyPathTracking(wayPoints: baseCurve),
      PathTrackingMode.purePursuit ||
      PathTrackingMode.pid =>
        PurePursuitPathTracking(wayPoints: baseCurve),
    }
      ..setIndexToClosestPoint(vehicle);

    activeTurn = null;
  }

  @override
  Geographic currentPerpendicularIntersect(Vehicle vehicle) =>
      activeTurn?.perpendicularIntersect(vehicle) ??
      currentPathTracking.perpendicularIntersect(vehicle);

  @override
  double signedPerpendicularDistanceToCurrentLine(Vehicle vehicle) =>
      activeTurn?.perpendicularDistance(vehicle) ??
      currentPathTracking.perpendicularDistance(vehicle);

  @override
  double perpendicularDistanceToBaseLine(Vehicle vehicle) =>
      baseCurvePathTracking.perpendicularDistance(vehicle);

  @override
  double perpendicularDistanceToOffsetLine(int offset, Vehicle vehicle) =>
      signedPerpendicularDistanceToCurrentLine(vehicle) +
      (offset - currentOffset) * width;

  /// How far along the current curve the [vehicle] is depending on the
  /// direction [bearingAlongAToB].
  ///
  /// The parameters [startPoint] and [endPoint] do nothing for the
  /// curve version.
  @override
  double alongProgress({
    required bool bearingAlongAToB,
    required Vehicle vehicle,
    WayPoint? startPoint,
    WayPoint? endPoint,
  }) =>
      switch (pathAlongAToB) {
        true => switch (bearingAlongAToB) {
              true => switch (vehicle.isReversing) {
                  true =>
                    currentPathTracking.cumulativePathSegmentLengths.last -
                        currentPathTracking.distanceAlongPathFromStart(vehicle),
                  false =>
                    currentPathTracking.distanceAlongPathFromStart(vehicle),
                },
              false => switch (vehicle.isReversing) {
                  true =>
                    currentPathTracking.cumulativePathSegmentLengths.last -
                        currentPathTracking.distanceAlongPathFromStart(vehicle),
                  false =>
                    currentPathTracking.distanceAlongPathFromStart(vehicle),
                },
            } +
            switch (vehicle.pathTrackingMode) {
              PathTrackingMode.purePursuit => vehicle.lookAheadDistance,
              _ => 0,
            },
        false => switch (bearingAlongAToB) {
              true => switch (vehicle.isReversing) {
                  true =>
                    currentPathTracking.cumulativePathSegmentLengths.last -
                        currentPathTracking.distanceAlongPathFromStart(vehicle),
                  false =>
                    currentPathTracking.distanceAlongPathFromStart(vehicle),
                },
              false => switch (vehicle.isReversing) {
                  true =>
                    currentPathTracking.cumulativePathSegmentLengths.last -
                        currentPathTracking.distanceAlongPathFromStart(vehicle),
                  false =>
                    currentPathTracking.distanceAlongPathFromStart(vehicle),
                },
            } +
            switch (vehicle.pathTrackingMode) {
              PathTrackingMode.purePursuit => vehicle.lookAheadDistance,
              _ => 0,
            }
      };

  @override
  void updateNextOffset(Vehicle vehicle) {
    final oldNext = nextOffset;
    super.updateNextOffset(vehicle);
    if (oldNext != nextOffset) {
      updateCurrentPathTracking(vehicle, force: true);
    }
  }

  @override
  void checkIfTurnShouldBeInserted(Vehicle vehicle) {
    updatePathAlongAToB(vehicle);
    if (limitMode != ABLimitMode.unlimited) {
      if (activeTurn != null && (activeTurn?.isCompleted ?? false)) {
        finishedOffsets.add(currentOffset);
        currentOffset = nextOffset;
        updateNextOffset(vehicle);
        passedMiddle = false;
        activeTurn = null;
      } else if (activeTurn != null) {
        upcomingTurn = null;
        passedMiddle = false;
        return;
      }
      final bearingAlongAToB = !compareToBearing(vehicle).isNegative;

      final progress = alongProgress(
        bearingAlongAToB: bearingAlongAToB,
        vehicle: vehicle,
      );

      final lineLengthBetweenTurns =
          currentPathTracking.cumulativePathSegmentLengths.last -
              switch (limitMode) {
                ABLimitMode.limitedTurnWithin => turningRadius,
                _ => 0
              };

      passedMiddle = progress >= lineLengthBetweenTurns / 2;
      if (!passedMiddle) {
        upcomingTurn = null;
        return;
      } else if (progress > lineLengthBetweenTurns && upcomingTurn != null
          // &&vehicle.velocity.abs() > 0
          ) {
        activeTurn = upcomingTurn;
        upcomingTurn = null;
        return;
      }

      final startPoint = switch (vehicle.isReversing) {
        false => currentPathTracking.path.last.moveSpherical(
            distance: switch (limitMode) {
              ABLimitMode.limitedTurnWithin => turningRadius,
              _ => 0
            },
            angleFromBearing: 180,
          ),
        true => currentPathTracking.path.first
            .moveSpherical(
              distance: switch (limitMode) {
                ABLimitMode.limitedTurnWithin => turningRadius,
                _ => 0
              },
            )
            .rotateByAngle(180),
      };

      final endPoint = switch (vehicle.isReversing) {
        false => nextPathTracking.path.first.moveSpherical(
            distance: switch (limitMode) {
              ABLimitMode.limitedTurnWithin => turningRadius,
              _ => 0
            },
          ),
        true => nextPathTracking.path.last
            .moveSpherical(
              distance: switch (limitMode) {
                ABLimitMode.limitedTurnWithin => turningRadius,
                _ => 0
              },
              angleFromBearing: 180,
            )
            .rotateByAngle(180)
      };

      final dubinsPath = DubinsPath(
            start: startPoint,
            end: endPoint,
            turningRadius: turningRadius,
            stepSize: 0.5,
          ).bestDubinsPathPlan?.wayPoints ??
          [startPoint, endPoint];

      final turnPath = switch (vehicle.isReversing) {
        true => dubinsPath.reversed.toList(),
        false => dubinsPath,
      };

      final turn = switch (vehicle.pathTrackingMode) {
        PathTrackingMode.purePursuit ||
        PathTrackingMode.pid =>
          PurePursuitPathTracking(wayPoints: turnPath),
        PathTrackingMode.stanley => StanleyPathTracking(wayPoints: turnPath),
      };

      if (vehicle.isReversing) {
        turn.cumulativeIndex--;
      }

      if (passedMiddle) {
        upcomingTurn = turn;
      }
    }
  }

  @override
  ({Geographic best, Geographic? worst}) findLookAheadCirclePoints(
    Vehicle vehicle, {
    double? lookAheadDistance,
  }) {
    final pathTracking = currentPathTracking;
    if (pathTracking is PurePursuitPathTracking) {
      final points = pathTracking.findLookAheadCirclePoints(
        vehicle,
        lookAheadDistance ?? vehicle.lookAheadDistance,
      );

      return (best: points.best.position, worst: points.worst?.position);
    }
    return super.findLookAheadCirclePoints(
      vehicle,
      lookAheadDistance: lookAheadDistance,
    );
  }

  @override
  ({Geographic inside, Geographic? outside}) findLookAheadLinePoints(
    Vehicle vehicle, {
    double? lookAheadDistance,
  }) {
    final pathTracking = currentPathTracking;
    if (pathTracking is PurePursuitPathTracking) {
      final points = pathTracking.findLookAheadLinePoints(
        vehicle,
        lookAheadDistance ?? vehicle.lookAheadDistance,
      );
      return (
        inside: points.inside.position,
        outside: points.outside?.position
      );
    }
    return super
        .findLookAheadLinePoints(vehicle, lookAheadDistance: lookAheadDistance);
  }

  @override
  double nextSteeringAngleLookAhead(Vehicle vehicle) {
    final pathTracking = currentPathTracking;
    if (pathTracking is PurePursuitPathTracking) {
      return pathTracking.nextSteeringAngle(
        vehicle,
        mode: PathTrackingMode.purePursuit,
      );
    }
    return super.nextSteeringAngleLookAhead(vehicle);
  }

  @override
  double nextSteeringAnglePid(Vehicle vehicle) {
    final pathTracking = currentPathTracking;
    if (pathTracking is PurePursuitPathTracking) {
      return pathTracking.nextSteeringAngle(
        vehicle,
        mode: PathTrackingMode.pid,
      );
    }
    return super.nextSteeringAnglePid(vehicle);
  }

  @override
  double nextSteeringAngleStanley(Vehicle vehicle) {
    final pathTracking = currentPathTracking;
    if (pathTracking is StanleyPathTracking) {
      return pathTracking.nextSteeringAngle(vehicle);
    }
    return super.nextSteeringAnglePid(vehicle);
  }

  @override
  double nextSteeringAngle(Vehicle vehicle, {PathTrackingMode? mode}) {
    updateCurrentPathTracking(vehicle);
    currentPathTracking.tryChangeWayPoint(vehicle);
    return super.nextSteeringAngle(vehicle, mode: mode);
  }

  @override
  List<WayPoint> pointsAhead(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  }) {
    final oldOffset = currentOffset;
    if (snapToClosestLine && activeTurn == null) {
      currentOffset = numOffsetsToClosestLine(vehicle);
    }
    checkIfShouldReengageSnap(vehicle);

    if (oldOffset != currentOffset) {
      updateCurrentPathTracking(vehicle, force: true);
    }

    var endIndex = currentPathTracking.currentIndex + num;
    if (endIndex >= currentPathTracking.path.length) {
      endIndex = currentPathTracking.path.length - 1;
    }

    return currentPathTracking.path
        .getRange(currentPathTracking.currentIndex, endIndex)
        .toList();
  }

  @override
  List<WayPoint> pointsBehind(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  }) {
    final oldOffset = currentOffset;
    if (snapToClosestLine && activeTurn == null) {
      currentOffset = numOffsetsToClosestLine(vehicle);
    }
    checkIfShouldReengageSnap(vehicle);

    if (oldOffset != currentOffset) {
      updateCurrentPathTracking(vehicle, force: true);
    }

    var startIndex = currentPathTracking.currentIndex - num;
    if (startIndex < 0) {
      startIndex = 0;
    }
    return currentPathTracking.path
        .getRange(
          startIndex,
          currentPathTracking.currentIndex,
        )
        .toList();
  }

  @override
  void manualUpdate(Vehicle vehicle) {
    currentPathTracking.tryChangeWayPoint(vehicle);
    super.manualUpdate(vehicle);
  }
}
