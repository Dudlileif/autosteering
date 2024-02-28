part of 'ab_tracking.dart';

/// A class for creating and tracking straight lines by using the bearing
/// from point A to point B and their positions to create parallel lines.
///
/// The lines are based on [SphericalRhumbLine] and [SphericalGreatCircle].
class ABLine extends ABTracking with EquatableMixin {
  /// Create an AB-line from the [start] point A and the [end] point B.
  ///
  /// The [width] of the line determines when we should swap to the next line
  /// over, i.e. when the perpendicular distance to the line is larger than
  /// [width]/2.
  ABLine({
    required super.baseLine,
    required super.width,
    super.boundary,
    super.boundaryString,
    super.turningRadius,
    super.turnOffsetMinSkips,
    super.limitMode,
    super.snapToClosestLine,
    super.calculateLinesOnCreation,
  }) {
    super.length = start.distanceToRhumb(end);
  }

  /// Creates an [ABLine] where the [lines] already has been calculated.
  ABLine.preCalculated({
    required super.baseLine,
    required super.width,
    super.boundary,
    super.turningRadius,
    super.turnOffsetMinSkips,
    super.limitMode,
    super.snapToClosestLine,
    Map<int, List<WayPoint>>? lines,
    Iterable<int>? finishedOffsets,
    Iterable<int>? offsetsInsideBoundary,
    super.calculateLinesOnCreation = false,
  }) {
    this.lines.addAll(lines ?? {});
    this.finishedOffsets.addAll(finishedOffsets ?? []);
    if (boundary != null && offsetsInsideBoundary != null) {
      this.offsetsInsideBoundary = SplayTreeSet.from(offsetsInsideBoundary);
    }
  }

  /// Creates an [ABLine] from the [json] object.
  factory ABLine.fromJson(Map<String, dynamic> json) {
    final baseLine = List<Map<String, dynamic>>.from(json['base_line'] as List)
        .map(WayPoint.fromJson)
        .toList();

    final boundary = json['boundary'] != null
        ? Polygon.parse(json['boundary'] as String)
        : null;

    Map<int, List<WayPoint>> getLinesFromMap(Map<String, dynamic> map) {
      final offsets = List<int>.from(map['offsets'] as List);
      final rawPaths = List<List<dynamic>>.from(map['paths'] as List);
      final paths = rawPaths
          .map(
            (path) => path
                .map(
                  (e) => WayPoint.fromJson(Map<String, dynamic>.from(e as Map)),
                )
                .toList(),
          )
          .toList();
      return Map.fromIterables(offsets, paths);
    }

    final lines = json['lines'] != null
        ? getLinesFromMap(Map<String, dynamic>.from(json['lines'] as Map))
        : null;

    final finishedOffsets = json['finished_offsets'] != null
        ? Set<int>.from(json['finished_offsets'] as Iterable)
        : null;

    final offsetsInsideBoundary = json['offsets_inside_boundary'] != null
        ? Set<int>.from(json['offsets_inside_boundary'] as Iterable)
        : null;

    return ABLine.preCalculated(
      baseLine: baseLine,
      boundary: boundary,
      width: json['width'] as double,
      turningRadius: json['turning_radius'] as double? ?? 10,
      turnOffsetMinSkips: json['turn_offset_skips'] as int? ?? 1,
      lines: lines,
      finishedOffsets: finishedOffsets,
      offsetsInsideBoundary: offsetsInsideBoundary,
      calculateLinesOnCreation: json['calculate_lines'] as bool,
    );
  }

  /// Creates a json compatible structure of the object.
  @override
  Map<String, dynamic> toJson() => super.toJson()..['type'] = 'AB Line';

  @override
  set currentOffset(int newOffset) {
    if (currentOffset != newOffset) {
      if ((boundary != null &&
              offsetsInsideBoundary != null &&
              (offsetsInsideBoundary?.contains(newOffset) ?? false)) ||
          boundary == null) {
        super.currentOffset = newOffset;
      }
    }
  }

  @override
  set nextOffset(int newOffset) {
    if (nextOffset != newOffset) {
      if ((boundary != null &&
              offsetsInsideBoundary != null &&
              (offsetsInsideBoundary?.contains(newOffset) ?? false)) ||
          boundary == null) {
        super.nextOffset = newOffset;
      }
    }
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

    return currentStart.position.rhumb.destinationPoint(
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
          currentStart.moveRhumb(distance: turningRadius),
        _ => currentStart,
      };

      final endPoint = switch (limitMode) {
        ABLimitMode.limitedTurnWithin => currentEnd.moveRhumb(
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
                    nextStart.moveRhumb(distance: turningRadius),
                  _ => nextStart
                },
                turningRadius: turningRadius,
                stepSize: 0.5,
              ).bestDubinsPathPlan!.wayPoints!,
            false => DubinsPath(
                start: endPoint,
                end: switch (limitMode) {
                  ABLimitMode.limitedTurnWithin => nextEnd
                      .moveRhumb(
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
                      .moveRhumb(
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
                  ABLimitMode.limitedTurnWithin => nextStart.moveRhumb(
                      distance: turningRadius,
                    ),
                  _ => nextStart
                },
                turningRadius: turningRadius,
                stepSize: 0.5,
                allowCrossingDirectLine: false,
              ).bestDubinsPathPlan!.wayPoints!,
          },
      };

      final turn = switch (vehicle.pathTrackingMode) {
        PathTrackingMode.purePursuit => PurePursuitPathTracking(
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

      final lineLengthBetweenTurns = startPoint.distanceToRhumb(endPoint);

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
    int count = 2,
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
      count,
      (index) => currentStart.alongLineByDistanceFromStart(
        end: currentEnd,
        distance: sign * stepSize * (index + sign * stepOffset),
      ),
      growable: false,
    );
  }

  @override
  List<WayPoint> pointsBehind(
    Vehicle vehicle, {
    double stepSize = 10,
    int count = 2,
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
      count,
      (index) => currentStart.alongLineByDistanceFromStart(
        end: currentEnd,
        distance: -sign * stepSize * (index - sign * stepOffset),
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
