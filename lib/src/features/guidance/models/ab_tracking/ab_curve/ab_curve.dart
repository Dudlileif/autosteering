import 'dart:collection';

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
    required super.baseLine,
    required super.width,
    super.boundary,
    super.boundaryString,
    super.turningRadius,
    super.turnOffsetMinSkips,
    super.limitMode,
    super.snapToClosestLine,
    super.calculateLinesOnCreation,
  })  : assert(
          baseLine.length >= 2,
          'Base curve has to have at least two points',
        ),
        currentPathTracking = PurePursuitPathTracking(wayPoints: baseLine),
        baseLinePathTracking = PurePursuitPathTracking(wayPoints: baseLine) {
    super.length = baseLine.foldIndexed(
      0,
      (index, prevValue, element) => index + 1 < baseLine.length
          ? prevValue +
              element.distanceToSpherical(baseLine.elementAt(index + 1))
          : prevValue,
    );
    if (boundary == null) {
      currentPathTracking = PurePursuitPathTracking(wayPoints: baseLine);
      nextPathTracking = PurePursuitPathTracking(wayPoints: nextLine);
      lines[0] = baseLine;
      lines[nextOffset] = offsetLine(nextOffset);
    }
  }

  /// Creates an ABCurve
  ABCurve.preCalculated({
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
  })  : baseLinePathTracking = PurePursuitPathTracking(wayPoints: baseLine),
        currentPathTracking = PurePursuitPathTracking(wayPoints: baseLine) {
    this.lines.addAll(lines ?? {});
    this.finishedOffsets.addAll(finishedOffsets ?? []);
    if (boundary != null && offsetsInsideBoundary != null) {
      this.offsetsInsideBoundary = SplayTreeSet.from(offsetsInsideBoundary);
    }
  }

  /// Creates an [ABCurve] from the [json] object.
  factory ABCurve.fromJson(Map<String, dynamic> json) {
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

    return ABCurve.preCalculated(
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
  Map<String, dynamic> toJson() => super.toJson()..['type'] = 'AB Curve';

  /// Whether the [currentPathTracking] is in the same or opposite direction as
  /// [baseLine].
  bool pathAlongAToB = true;

  /// The path tracking for the [baseLine].
  PathTracking baseLinePathTracking;

  /// The path tracking for the [currentLine].
  PathTracking? currentPathTracking;

  /// The path tracking for the [nextLine].
  PathTracking? nextPathTracking;

  @override
  set currentOffset(int newOffset) {
    if (currentOffset != newOffset) {
      if ((boundary != null &&
              offsetsInsideBoundary != null &&
              (offsetsInsideBoundary?.contains(newOffset) ?? false)) ||
          boundary == null) {
        super.currentOffset = newOffset;
        currentPathTracking?.interPolateWayPoints(newWayPoints: currentLine);
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
        nextPathTracking?.interPolateWayPoints(newWayPoints: nextLine);
      }
    }
  }

  @override
  WayPoint get currentStart => pathAlongAToB
      ? currentLine.firstOrNull ?? super.currentEnd
      : currentLine.lastOrNull ?? super.currentStart;

  @override
  WayPoint get currentEnd => pathAlongAToB
      ? currentLine.lastOrNull ?? super.currentEnd
      : currentLine.firstOrNull ?? super.currentStart;

  @override
  void calculateLinesWithinBoundary() {
    super.calculateLinesWithinBoundary();
    nextPathTracking = PurePursuitPathTracking(wayPoints: nextLine);
  }

  /// Updates [pathAlongAToB] depending on if the [vehicle] is along the
  /// A-B direction.
  void updatePathAlongAToB(Vehicle vehicle) {
    if (currentPathTracking != null) {
      final bearingAlongStartToEndOfCurrentPath = bearingDifference(
            vehicle.bearing,
            currentPathTracking!.currentWayPoint(vehicle).bearing,
          ) <
          90;

      if (!bearingAlongStartToEndOfCurrentPath && activeTurn == null) {
        pathAlongAToB = !pathAlongAToB;
        currentPathTracking
          ?..interPolateWayPoints(newWayPoints: currentLine)
          ..cumulativeIndex = switch (vehicle.isReversing) {
            true => -1,
            false => 0,
          };
        nextPathTracking
          ?..interPolateWayPoints(newWayPoints: nextLine)
          ..cumulativeIndex = switch (vehicle.isReversing) {
            true => -1,
            false => 0,
          };
      }
    }
  }

  /// The next line to follow after the current one.
  @override
  List<WayPoint> get nextLine => pathAlongAToB
      ? super
          .nextLine
          .reversed
          .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
          .toList()
      : super.nextLine;

  /// The line for the [currentOffset].
  @override
  List<WayPoint> get currentLine => !pathAlongAToB
      ? super
          .currentLine
          .reversed
          .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
          .toList()
      : super.currentLine;

  @override
  void moveOffsetRight(Vehicle vehicle, {int offset = 1}) {
    super.moveOffsetRight(vehicle, offset: offset);
    currentPathTracking?.setIndexToClosestPoint(vehicle);
  }

  @override
  void moveOffsetLeft(Vehicle vehicle, {int offset = 1}) {
    super.moveOffsetLeft(vehicle, offset: offset);
    currentPathTracking?.setIndexToClosestPoint(vehicle);
  }

  @override
  int compareToBearing(Vehicle vehicle) {
    updatePathAlongAToB(vehicle);

    return switch (pathAlongAToB) {
      true => 1,
      false => -1,
    };
  }

  /// The current [PathTracking] of the [currentLine] for the [Vehicle].
  void updateCurrentPathTracking(Vehicle vehicle, {bool force = false}) {
    final pathTrackingIsCorrectMode = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => currentPathTracking is StanleyPathTracking,
      PathTrackingMode.purePursuit ||
      PathTrackingMode.pid =>
        currentPathTracking is PurePursuitPathTracking
    };

    // Return if we're already in the right mode.
    if (!force && pathTrackingIsCorrectMode) {
      // currentPathTracking.interPolateWayPoints(newWayPoints: currentLine);
      return;
    }

    currentPathTracking = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => StanleyPathTracking(wayPoints: currentLine),
      PathTrackingMode.purePursuit ||
      PathTrackingMode.pid =>
        PurePursuitPathTracking(wayPoints: currentLine),
    }
      ..setIndexToClosestPoint(vehicle);

    if (boundary != null &&
        !(offsetsInsideBoundary?.contains(nextOffset) ?? false)) {
      nextPathTracking = null;
    } else {
      nextPathTracking = switch (vehicle.pathTrackingMode) {
        PathTrackingMode.stanley => StanleyPathTracking(wayPoints: nextLine),
        PathTrackingMode.purePursuit ||
        PathTrackingMode.pid =>
          PurePursuitPathTracking(wayPoints: nextLine),
      }
        ..cumulativeIndex = switch (vehicle.isReversing) {
          true => -1,
          false => 0,
        };
    }
    baseLinePathTracking = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => StanleyPathTracking(wayPoints: baseLine),
      PathTrackingMode.purePursuit ||
      PathTrackingMode.pid =>
        PurePursuitPathTracking(wayPoints: baseLine),
    }
      ..setIndexToClosestPoint(vehicle);

    activeTurn = null;
  }

  @override
  Geographic currentPerpendicularIntersect(Vehicle vehicle) =>
      activeTurn?.perpendicularIntersect(vehicle) ??
      currentPathTracking?.perpendicularIntersect(vehicle) ??
      vehicle.pathTrackingPoint;

  @override
  double signedPerpendicularDistanceToCurrentLine(Vehicle vehicle) =>
      activeTurn?.perpendicularDistance(vehicle) ??
      currentPathTracking?.perpendicularDistance(vehicle) ??
      0;

  @override
  double perpendicularDistanceToBaseLine(Vehicle vehicle) =>
      baseLinePathTracking.perpendicularDistance(vehicle);

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
  }) {
    if (currentPathTracking != null) {
      return switch (pathAlongAToB) {
        true => switch (bearingAlongAToB) {
              true => switch (vehicle.isReversing) {
                  true => currentPathTracking!
                          .cumulativePathSegmentLengths.last -
                      currentPathTracking!.distanceAlongPathFromStart(vehicle),
                  false =>
                    currentPathTracking!.distanceAlongPathFromStart(vehicle),
                },
              false => switch (vehicle.isReversing) {
                  true => currentPathTracking!
                          .cumulativePathSegmentLengths.last -
                      currentPathTracking!.distanceAlongPathFromStart(vehicle),
                  false =>
                    currentPathTracking!.distanceAlongPathFromStart(vehicle),
                },
            } +
            switch (vehicle.pathTrackingMode) {
              PathTrackingMode.purePursuit => vehicle.lookAheadDistance,
              _ => 0,
            },
        false => switch (bearingAlongAToB) {
              true => switch (vehicle.isReversing) {
                  true => currentPathTracking!
                          .cumulativePathSegmentLengths.last -
                      currentPathTracking!.distanceAlongPathFromStart(vehicle),
                  false =>
                    currentPathTracking!.distanceAlongPathFromStart(vehicle),
                },
              false => switch (vehicle.isReversing) {
                  true => currentPathTracking!
                          .cumulativePathSegmentLengths.last -
                      currentPathTracking!.distanceAlongPathFromStart(vehicle),
                  false =>
                    currentPathTracking!.distanceAlongPathFromStart(vehicle),
                },
            } +
            switch (vehicle.pathTrackingMode) {
              PathTrackingMode.purePursuit => vehicle.lookAheadDistance,
              _ => 0,
            }
      };
    }
    return 0;
  }

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
        passedMiddle = false;
        activeTurn = null;
      } else if (activeTurn != null) {
        upcomingTurn = null;
        passedMiddle = false;
        return;
      } else if (currentPathTracking?.isCompleted ?? false) {
        finishedOffsets.add(currentOffset);
      }
      if (nextPathTracking == null) {
        return;
      }
      updateNextOffset(vehicle);

      if (currentPathTracking != null &&
          nextPathTracking != null &&
          currentOffset != nextOffset) {
        final bearingAlongAToB = !compareToBearing(vehicle).isNegative;

        final progress = alongProgress(
          bearingAlongAToB: bearingAlongAToB,
          vehicle: vehicle,
        );

        final lineLengthBetweenTurns =
            currentPathTracking!.cumulativePathSegmentLengths.last -
                switch (limitMode) {
                  ABLimitMode.limitedTurnWithin => turningRadius,
                  _ => 0
                };

        passedMiddle = progress >= lineLengthBetweenTurns / 2;
        if (!passedMiddle) {
          upcomingTurn = null;
          return;
        } else if (progress > lineLengthBetweenTurns && upcomingTurn != null) {
          activeTurn = upcomingTurn;
          upcomingTurn = null;
          return;
        }

        var startPoint = switch (vehicle.isReversing) {
          false => currentPathTracking!.path.last,
          true => currentPathTracking!.path.first.rotateByAngle(180),
        };

        var endPoint = switch (vehicle.isReversing) {
          false => nextPathTracking!.path.first,
          true => nextPathTracking!.path.last.rotateByAngle(180),
        };

        if (limitMode == ABLimitMode.limitedTurnWithin) {
          startPoint = startPoint.moveSpherical(
            distance: turningRadius,
            angleFromBearing: 180,
          );
          endPoint = endPoint.moveSpherical(distance: turningRadius);
        }

        final dubinsPath = DubinsPath(
              start: startPoint,
              end: endPoint,
              turningRadius: turningRadius,
              stepSize: 0.5,
              allowCrossingDirectLine: false,
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
    currentPathTracking?.tryChangeWayPoint(vehicle);
    return super.nextSteeringAngle(vehicle, mode: mode);
  }

  @override
  List<WayPoint> pointsAhead(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  }) {
    if (currentPathTracking != null) {
      final currentIndex = currentPathTracking!.currentIndex
          .clamp(0, currentPathTracking!.path.length - 1);

      var endIndex = currentIndex + num;
      if (endIndex >= currentPathTracking!.path.length) {
        endIndex = currentPathTracking!.path.length - 1;
      }

      return currentPathTracking!.path
          .getRange(currentIndex, endIndex)
          .toList();
    }
    return [];
  }

  @override
  List<WayPoint> pointsBehind(
    Vehicle vehicle, {
    double stepSize = 10,
    int num = 2,
  }) {
    if (currentPathTracking != null) {
      final currentIndex = currentPathTracking!.currentIndex
          .clamp(0, currentPathTracking!.path.length - 1);

      var startIndex = currentIndex - num;
      if (startIndex < 0) {
        startIndex = 0;
      }
      return currentPathTracking!.path
          .getRange(
            startIndex,
            currentIndex,
          )
          .toList();
    }
    return [];
  }

  @override
  void manualUpdate(Vehicle vehicle) {
    currentPathTracking?.tryChangeWayPoint(vehicle);
    super.manualUpdate(vehicle);
  }
}
