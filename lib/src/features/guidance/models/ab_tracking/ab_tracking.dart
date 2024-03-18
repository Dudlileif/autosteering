import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:geobase/geobase.dart';

export 'ab_config.dart';
export 'ab_limit_mode.dart';

part 'a_plus_line.dart';
part 'ab_curve.dart';
part 'ab_line.dart';

/// An enumerator for the different types of AB tracking.
enum ABTrackingType {
  /// A+ line
  aPlusLine,

  /// AB line
  abLine,

  /// AB curve
  abCurve;
}

// TODO(dudlileif): Improve line creation, sometimes wrong side of polygon
// border

/// A base class for common variables and methods for AB-path based guidance
/// models.
sealed class ABTracking {
  /// A base class for common variables and methods for AB-path based guidance
  /// models.
  ABTracking({
    required this.baseLine,
    required this.width,
    this.boundary,
    String? boundaryString,
    this.turningRadius = 10,
    this.turnOffsetMinSkips = 0,
    this.limitMode = ABLimitMode.limitedTurnWithin,
    this.snapToClosestLine = false,
    bool calculateLinesOnCreation = true,
    this.name,
  })  : start = baseLine.first,
        end = baseLine.last,
        _nextOffset = turnOffsetMinSkips + 1,
        isCCW = isCurveCounterclockwise(baseLine.map((e) => e.position)),
        baseLinePathTracking = PurePursuitPathTracking(wayPoints: baseLine) {
    if (boundary == null && boundaryString != null) {
      boundary = Polygon.parse(boundaryString);
    }
    if (boundary == null) {
      currentPathTracking = PurePursuitPathTracking(wayPoints: currentLine);
      if (nextOffset != null && nextLine != null) {
        nextPathTracking = PurePursuitPathTracking(wayPoints: nextLine!);
        lines[0] = currentLine;
        lines[nextOffset!] = offsetLine(nextOffset!);
      }
    }
    length = baseLine.foldIndexed(
      0,
      (index, prevValue, element) => index + 1 < baseLine.length
          ? prevValue + element.distanceToRhumb(baseLine.elementAt(index + 1))
          : prevValue,
    );
    if (calculateLinesOnCreation) {
      calculateLinesWithinBoundary();
    }
  }

  /// Creates the corresponding [ABCurve], [ABLine] or [APlusLine] from the
  /// [json] object.
  factory ABTracking.fromJson(Map<String, dynamic> json) {
    if (json['type'] == 'AB Curve') {
      return ABCurve.fromJson(json);
    } else if (json['type'] == 'A+ Line') {
      return APlusLine.fromJson(json);
    }
    return ABLine.fromJson(json);
  }

  /// The line from A [start] to B [end].
  final List<WayPoint> baseLine;

  /// Point A, the starting point for creating the AB-path.
  final WayPoint start;

  /// Point B, the ending point for creating the AB-path.
  final WayPoint end;

  /// The boundary that the tracking lines are limited to, if there is one.
  late final Polygon? boundary;

  /// Name or description of this.
  String? name;

  /// How wide an AB-line should be, as in when to skip to the next line over.
  double width;

  /// How long the AB-line is.
  late final double length;

  /// The mode for what should happen at the end of the line.
  ABLimitMode limitMode;

  /// How many offsets we should add when performing a turn to the next line.
  int turnOffsetMinSkips;

  /// Whether or not the closest line should always be snapped to, otherwise
  /// the [currentOffset] has to be manually set/updated.
  bool snapToClosestLine = false;

  /// Private value for [currentOffset].
  int _currentOffset = 0;

  /// The number of [width] offsets that we should move the line.
  ///
  /// A positive number means that the line is moved to the right relative
  /// to the original recording direction.
  /// A negative number means that the line is move to the left relative to
  /// the original recording direction.
  int get currentOffset => _currentOffset;

  /// The turning radius to use for the [upcomingTurn] and [activeTurn].
  double turningRadius;

  /// Whether the [baseLine] is counter clock wise.
  bool isCCW;

  /// Whether the all the paths have been run through and completed.
  bool isCompleted = false;

  /// The path tracking for the [baseLine].
  PathTracking baseLinePathTracking;

  /// The path tracking for the [currentLine].
  PathTracking? currentPathTracking;

  /// The path tracking for the [nextLine].
  PathTracking? nextPathTracking;

  /// Whether the [currentPathTracking] is in the same or opposite direction as
  /// [baseLine].
  bool pathAlongAToB = true;

  /// The upcoming turn placed at the end point ahead of the vehicle in the
  /// driving direction.
  PathTracking? upcomingTurn;

  /// The current active turn that the vehicle is tracking.
  PathTracking? activeTurn;

  /// A map of the already calculated offset lines.
  Map<int, List<WayPoint>> lines = {};

  /// The offset lines that are within the [boundary], if one is given.
  SplayTreeSet<int>? offsetsInsideBoundary;

  /// Offset lines that have been completed.
  final finishedOffsets = SplayTreeSet<int>();

  /// Private variable for [nextOffset].
  int? _nextOffset = 0;

  /// The next offset to use for the line.
  int? get nextOffset => _nextOffset;

  /// Whether the upcoming turn should be the opposite direction to the usual
  /// direction.
  bool offsetOppositeTurn = false;

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
  WayPoint _offsetStartRaw(int offset) =>
      start.moveRhumb(distance: offset * width, angleFromBearing: 90);

  /// Offsets the [end] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  WayPoint _offsetEndRaw(int offset) =>
      end.moveRhumb(distance: offset * width, angleFromBearing: 90);

  /// Offsets the [start] point by [offset]*[width] meters to the side, the
  /// line will be clipped by the [boundary] if there is one.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  WayPoint offsetStart(int offset) =>
      offsetLine(offset).firstOrNull ?? _offsetStartRaw(offset);

  /// Offsets the [end] point by [offset]*[width] meters to the side, the
  /// line will be clipped by the [boundary] if there is one.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  WayPoint offsetEnd(int offset) =>
      offsetLine(offset).lastOrNull ?? _offsetEndRaw(offset);

  /// The start point for the line with [currentOffset].
  WayPoint get currentStart => pathAlongAToB
      ? currentLine.firstOrNull ?? currentEnd
      : currentLine.lastOrNull ?? offsetStart(currentOffset);

  /// The end point for the line with [currentOffset].
  WayPoint get currentEnd => pathAlongAToB
      ? currentLine.lastOrNull ?? offsetEnd(currentOffset)
      : currentLine.firstOrNull ?? currentStart;

  /// The bearing of the current line at the [currentStart].
  double get currentInitialBearing => currentStart.bearing;

  /// The bearing of the current line at the [currentEnd].
  double get currentFinalBearing => currentEnd.bearing;

  /// The offset [start] for the [nextOffset].
  WayPoint? get nextStart =>
      nextOffset != null ? offsetStart(nextOffset!) : null;

  /// The offset [end] for the [nextOffset].
  WayPoint? get nextEnd => nextOffset != null ? offsetEnd(nextOffset!) : null;

  /// The line for the [currentOffset].
  List<WayPoint> get currentLine => !pathAlongAToB
      ? offsetLine(currentOffset)
          .reversed
          .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
          .toList()
      : offsetLine(currentOffset);

  /// The line for the [nextOffset].
  List<WayPoint>? get nextLine => nextOffset != null
      ? pathAlongAToB
          ? offsetLine(nextOffset!)
              .reversed
              .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
              .toList()
          : offsetLine(nextOffset!)
      : null;

  set currentOffset(int newOffset) {
    if (currentOffset != newOffset) {
      if ((boundary != null &&
              offsetsInsideBoundary != null &&
              (offsetsInsideBoundary?.contains(newOffset) ?? false)) ||
          boundary == null) {
        _currentOffset = newOffset;
        currentPathTracking?.interPolateWayPoints(newWayPoints: currentLine);
      }
    }
  }

  set nextOffset(int? newOffset) {
    if (newOffset == null) {
      _nextOffset = null;
    } else if (nextOffset != newOffset) {
      if ((boundary != null &&
              offsetsInsideBoundary != null &&
              (offsetsInsideBoundary?.contains(newOffset) ?? false)) ||
          boundary == null) {
        _nextOffset = newOffset;
        nextPathTracking?.interPolateWayPoints(newWayPoints: nextLine);
      }
    }
  }

  /// Calculates all the lines/offsets within the [boundary], if there is one.
  void calculateLinesWithinBoundary() {
    if (boundary != null && boundary?.exterior != null) {
      lines.clear();

      offsetsInsideBoundary = SplayTreeSet();

      final boundingBox =
          GeoBox.from(boundary!.exterior!.toGeographicPositions);

      final diagonal = boundingBox.min.rhumb.distanceTo(boundingBox.max);

      final offsetsToCheck = (diagonal / width).ceil();

      for (var i = 0; i <= offsetsToCheck; i++) {
        offsetLine(
          i,
          boundaryBox: boundingBox,
          extraStraightDistance: diagonal,
        );
        if (!offsetsInsideBoundary!.contains(i)) {
          break;
        }
      }
      for (var i = 1; i <= offsetsToCheck; i++) {
        offsetLine(
          -i,
          boundaryBox: boundingBox,
          extraStraightDistance: diagonal,
        );
        if (!offsetsInsideBoundary!.contains(-i)) {
          break;
        }
      }

      nextOffset = offsetsInsideBoundary!.reduce(
        (previousValue, element) => sqrt(pow(currentOffset - element, 2)) <
                    sqrt(pow(currentOffset - previousValue, 2)) &&
                element != currentOffset
            ? element
            : previousValue,
      );
    }
    if (nextOffset != null && nextLine != null) {
      nextPathTracking = PurePursuitPathTracking(wayPoints: nextLine!);
    }
  }

  /// Offsets the [baseLine] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  List<WayPoint> offsetLine(
    int offset, {
    GeoBox? boundaryBox,
    double? extraStraightDistance,
  }) {
    if (lines[offset] != null) {
      return lines[offset]!;
    }

    // A single straight line
    if (baseLine.length == 2 && boundary == null) {
      final line = baseLine
          .map(
            (e) => e.moveRhumb(distance: offset * width, angleFromBearing: 90),
          )
          .toList();
      lines[offset] = line;
      return line;
    }

    final extendedStart = baseLine.first.position.rhumb.destinationPoint(
      distance: extraStraightDistance ?? 100,
      bearing: baseLine[1].finalBearingToRhumb(baseLine.first),
    );

    final extendedEnd = baseLine.last.position.rhumb.destinationPoint(
      distance: extraStraightDistance ?? 100,
      bearing: baseLine[baseLine.length - 2].finalBearingToRhumb(baseLine.last),
    );

    final path = baseLine.map((e) => e.position).toList()
      ..insert(0, extendedStart)
      ..add(extendedEnd);

    final buffered = RingBuffer.bufferCircular(
      ring: path,
      distance: offset * width,
      extendEnds: false,
      smoothingFactor: 4.0 * (1 + offset.abs()).clamp(1, 30),
      swapDirectionIfClockwise: !isCCW,
    );

    final newPath = <WayPoint>[];
    if (buffered.length >= 2) {
      buffered.forEachIndexed((index, element) {
        if (index == 0) {
          newPath.add(
            WayPoint(
              position: element,
              bearing:
                  element.rhumb.initialBearingTo(buffered.elementAt(index + 1)),
            ),
          );
        } else {
          newPath.add(
            WayPoint(
              position: element,
              bearing:
                  buffered.elementAt(index - 1).rhumb.finalBearingTo(element),
            ),
          );
        }
      });
    }

    if (newPath.length > 2) {
      final pointsToRemove = <WayPoint>[];
      for (var i = 1; i < newPath.length - 1; i++) {
        final point = newPath[i];
        final fromStartBearing = newPath.first.initialBearingToRhumb(point);
        final fromEndBearing = newPath.last.initialBearingToRhumb(point);

        if (signedBearingDifference(newPath.first.bearing, fromStartBearing)
                    .abs() >
                90 ||
            signedBearingDifference(newPath.last.bearing, fromEndBearing)
                    .abs() <
                90) {
          pointsToRemove.add(point);
        }
      }
      for (final element in pointsToRemove) {
        newPath.remove(element);
      }
    }

    final boundaryRing = boundary?.exterior?.toGeographicPositions ??
        [
          _offsetStartRaw(offset - 1).position,
          _offsetEndRaw(offset - 1).position,
          _offsetEndRaw(offset + 1).position,
          _offsetStartRaw(offset + 1).position,
        ];

    // Find indices for points outside the start end of the field.
    final outsideStartIndices = <int>[];

    for (var i = 0; i < newPath.length; i++) {
      final point = newPath.elementAt(i);
      var pointInsideRing = false;
      final pointInsideBoundaryBox =
          boundaryBox?.intersectsPoint2D(point.position) ?? true;
      if (pointInsideBoundaryBox) {
        pointInsideRing = point.position.isWithinRing(boundaryRing);
      }
      if (pointInsideRing) {
        break;
      }
      outsideStartIndices.add(i);
    }

    if (outsideStartIndices.length == newPath.length) {
      if (newPath.length < 2) {
        return [];
      }
      // check if any line passes through ring, if so return for now
      if (newPath.length >= 2) {
        final intersects = <int>[];
        for (var i = 0; i < newPath.length; i++) {
          if (newPath[i].intersectionWithRhumb(boundaryRing) != null) {
            intersects.add(i);
          }
        }
        if (intersects.isNotEmpty) {
          // Interpolate the path from the last intersection
          var index = intersects.last;
          if (intersects.length > 1) {
            var prevIndex = intersects[intersects.length - 2];
            while (index - prevIndex > 1) {
              index = prevIndex;
              prevIndex = intersects[(intersects.indexOf(index) - 1)
                  .clamp(0, intersects.length - 1)];
            }
          }
          // Interpolate the path to ensure that some points are within
          // boundary
          while (index + 1 < newPath.length) {
            final point = newPath[index];
            final nextPoint = newPath[index + 1];
            if (point.position.rhumb.distanceTo(nextPoint.position) >
                width / 2) {
              newPath.insert(
                index + 1,
                point.copyWith(
                  position: point.position.rhumb.destinationPoint(
                    distance: width / 2,
                    bearing: point.position.rhumb
                        .initialBearingTo(nextPoint.position),
                  ),
                ),
              );
            }
            index++;
          }
          // Retest to see if there are any point's within.
          outsideStartIndices.clear();
          for (var i = 0; i < newPath.length; i++) {
            final point = newPath.elementAt(i);
            var pointInsideRing = false;
            final pointInsideBoundaryBox =
                boundaryBox?.intersectsPoint2D(point.position) ?? true;
            if (pointInsideBoundaryBox) {
              pointInsideRing = point.position.isWithinRing(boundaryRing);
            }
            if (pointInsideRing) {
              break;
            }
            outsideStartIndices.add(i);
          }
        }
      }
    }

    // Filter out points outside the start end of the field.
    if (outsideStartIndices.isNotEmpty) {
      final lastPointOutside = newPath.elementAt(outsideStartIndices.last);

      if (outsideStartIndices.length > 1) {
        newPath.replaceRange(
          0,
          outsideStartIndices.last + 1,
          [],
        );
      } else {
        newPath.removeAt(outsideStartIndices.first);
      }
      if (newPath.isNotEmpty) {
        final firstPointInside = newPath.first;

        final boundaryIntersection = firstPointInside
            .copyWith(
              bearing: lastPointOutside.finalBearingToRhumb(firstPointInside),
            )
            .intersectionWithRhumb(
              boundaryRing,
              oppositeOfBearing: true,
            );
        if (boundaryIntersection != null) {
          final distanceAlong =
              boundaryIntersection.alongTrackDistanceToSpherical(
            start: lastPointOutside,
            end: firstPointInside,
          );

          final intersectingLength =
              lastPointOutside.distanceToRhumb(firstPointInside);

          final pointOnLine = lastPointOutside.intermediatePointToSpherical(
            firstPointInside,
            fraction: distanceAlong / intersectingLength,
          );

          newPath.insert(
            0,
            switch (pointOnLine.isValid) {
              true => pointOnLine,
              false => boundaryIntersection,
            },
          );
        }
      }
    }

    // Find indices for points outside the start end of the field.
    final outsideEndIndices = <int>[];

    for (var i = newPath.length - 1; i >= 0; i--) {
      final point = newPath.elementAt(i);

      var pointInsideRing = false;
      final pointInsideBoundaryBox =
          boundaryBox?.intersectsPoint2D(point.position) ?? true;
      if (pointInsideBoundaryBox) {
        pointInsideRing = point.position.isWithinRing(boundaryRing);
      }
      if (!pointInsideRing && i != 0) {
        outsideEndIndices.add(i);
      }
    }

    // Filter out points outside the start end of the field.
    if (outsideEndIndices.isNotEmpty) {
      final lastOutsideIndex =
          outsideEndIndices.firstWhereIndexedOrNull((index, element) {
                if (index < outsideEndIndices.length - 1) {
                  // > 1 doesn't give correct points all the time
                  if (element - outsideEndIndices[index + 1] > 2) {
                    return true;
                  }
                }
                return false;
              }) ??
              outsideEndIndices.last;
      final lastPointOutside = newPath.elementAt(lastOutsideIndex);

      if (outsideEndIndices.length > 1) {
        newPath.replaceRange(
          lastOutsideIndex,
          newPath.length,
          [],
        );
      } else {
        newPath.removeLast();
      }
      if (newPath.isNotEmpty) {
        final lastPointInside = newPath.last;

        final boundaryIntersection = lastPointInside
            .copyWith(
              bearing: lastPointInside.initialBearingToRhumb(lastPointOutside),
            )
            .intersectionWithRhumb(
              boundaryRing,
            );
        if (boundaryIntersection != null) {
          final distanceAlong =
              boundaryIntersection.alongTrackDistanceToSpherical(
            start: lastPointInside,
            end: lastPointOutside,
          );

          final intersectingLength =
              lastPointInside.distanceToRhumb(lastPointOutside);

          final pointOnLine = lastPointInside.intermediatePointToSpherical(
            lastPointOutside,
            fraction: distanceAlong / intersectingLength,
          );

          newPath.add(
            switch (pointOnLine.isValid) {
              true => pointOnLine,
              false => boundaryIntersection,
            },
          );
        }
      }
    }

    // Remove all points outside the rectangular bounding box
    if (boundaryBox != null) {
      newPath.removeWhere(
        (element) => !boundaryBox.intersectsPoint2D(element.position),
      );
    }

    if (newPath.length < 2) {
      return [];
    }

    // Filter out points that are within 10 cm of others to mitigate bearing
    // errors, but preserve start/end points.
    if (newPath.length >= 2) {
      newPath.forEachIndexed((index, element) {
        if (index == newPath.length - 1) {
          if (element.distanceToRhumb(newPath.elementAt(index - 1)) < 0.1) {
            newPath.removeAt(index - 1);
          }
        } else if (index > 0) {
          if (element.distanceToRhumb(newPath.elementAt(index - 1)) < 0.1) {
            newPath.removeAt(index);
          }
        }
      });
    }

    // Ensure that the end points have the correct bearings.
    if (newPath.length >= 2) {
      newPath[0] = newPath.first.copyWith(
        bearing: newPath.first.initialBearingToRhumb(newPath[1]),
      );
      newPath[newPath.length - 1] = newPath.last.copyWith(
        bearing: newPath[newPath.length - 2].finalBearingToRhumb(newPath.last),
      );
    }

    offsetsInsideBoundary?.add(offset);
    lines[offset] = newPath;
    return newPath;
  }

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
      turnOffsetMinSkips = config.turnOffsetMinSkips;
      limitMode = config.limitMode;
      snapToClosestLine = config.snapToClosestLine;
      offsetOppositeTurn = config.offsetOppositeTurn;
      if (limitMode == ABLimitMode.unlimited) {
        activeTurn = null;
        upcomingTurn = null;
      }
    }
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
  double perpendicularDistanceToBaseLine(Vehicle vehicle) =>
      baseLinePathTracking.perpendicularDistance(vehicle);

  /// The perpendicular distance from [vehicle] to the line of [offset] offsets.
  double perpendicularDistanceToOffsetLine(int offset, Vehicle vehicle) =>
      signedPerpendicularDistanceToCurrentLine(vehicle) +
      (offset - currentOffset) * width;

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
    updatePathAlongAToB(vehicle);

    return switch (pathAlongAToB) {
      true => 1,
      false => -1,
    };
  }

  /// The perpendicular intersection point from the [vehicle]'s path tracking
  /// point to the current line.
  Geographic currentPerpendicularIntersect(Vehicle vehicle) =>
      activeTurn?.perpendicularIntersect(vehicle) ??
      currentPathTracking?.perpendicularIntersect(vehicle) ??
      vehicle.pathTrackingPoint;

  /// The signed perpendicular distance from the [vehicle]'s path tracking
  /// point to the line with [currentOffset] offsets.
  ///
  /// A negative value means that we're to the left of the line in the
  /// when accounting for the [vehicle]'s bearing and comparing it to the
  /// current line's bearing at the [currentPerpendicularIntersect], and a
  /// positive value means that we're to the right of the line.
  double signedPerpendicularDistanceToCurrentLine(Vehicle vehicle) =>
      activeTurn?.perpendicularDistance(vehicle) ??
      currentPathTracking?.perpendicularDistance(vehicle) ??
      0;

  /// Moves the [currentOffset] in the right direction relative to the
  /// [vehicle]'s bearing.
  ///
  /// If [offset] is negative the [currentOffset] will move to the left
  /// relative to the [vehicle]'s bearing.
  void moveOffset(Vehicle vehicle, {int offset = 1}) {
    final newOffset = currentOffset + offset * compareToBearing(vehicle);
    if (offsetsInsideBoundary != null &&
        nextOffset != null &&
        !offsetsInsideBoundary!.contains(newOffset)) {
      return;
    }
    if (snapToClosestLine) {
      snapToClosestLine = false;
      awaitToReengageSnap = true;
    }
    currentOffset = newOffset;
    activeTurn = null;
    currentPathTracking?.setIndexToClosestPoint(vehicle);
  }

  /// Moves the [currentOffset] in the right direction relative to the
  /// [vehicle]'s bearing.
  void moveOffsetRight(Vehicle vehicle, {int offset = 1}) =>
      moveOffset(vehicle, offset: offset);

  /// Moves the [currentOffset] in the left direction relative to the
  /// [vehicle]'s bearing.
  void moveOffsetLeft(Vehicle vehicle, {int offset = 1}) =>
      moveOffset(vehicle, offset: -offset);

  /// Check the automatic offset snap and update the [currentOffset] to the
  /// one closes to [vehicle].
  void checkAutoOffsetSnap(Vehicle vehicle) {
    if (snapToClosestLine && activeTurn == null) {
      final closest = numOffsetsToClosestLine(vehicle);
      if (closest != currentOffset) {
        if (boundary != null && offsetsInsideBoundary != null) {
          if (offsetsInsideBoundary!.contains(closest)) {
            currentOffset = closest;
          }
        } else if (boundary == null) {
          currentOffset = closest;
        }
      }
    }

    checkIfShouldReengageSnap(vehicle);
  }

  /// Update the [nextOffset] to cover a new line.
  ///
  /// The [turnOffsetMinSkips] is applied according to the [vehicle] driving
  /// direction and the [offsetOppositeTurn]. If the [nextOffset] is already
  /// covered in [finishedOffsets], we reduce (relative to direction) the
  /// [nextOffset] so that we cover missing offsets.
  void updateNextOffset(Vehicle vehicle) {
    final oldNext = nextOffset;

    if (offsetsInsideBoundary != null) {
      if (setEquals(offsetsInsideBoundary, finishedOffsets)) {
        nextOffset = null;
        isCompleted = true;
        return;
      }
      final difference = offsetsInsideBoundary!.difference(finishedOffsets);
      if (difference.length == 1) {
        nextOffset = difference.first;
      }
    }
    final turnOffsetIncrease = turnOffsetMinSkips + 1;

    final bearingAlongAToB = !compareToBearing(vehicle).isNegative;

    if ((bearingAlongAToB && !offsetOppositeTurn) ||
        (!bearingAlongAToB && offsetOppositeTurn)) {
      nextOffset = currentOffset + turnOffsetIncrease;

      while ((finishedOffsets.contains(nextOffset) ||
              nextOffset == currentOffset) &&
          nextOffset != null) {
        final newOffset = nextOffset! - 1;
        if (offsetsInsideBoundary != null &&
            newOffset < offsetsInsideBoundary!.min) {
          final difference = offsetsInsideBoundary!.difference(finishedOffsets);
          if (difference.length >= 2) {
            nextOffset = difference.firstWhereOrNull(
                  (element) =>
                      element != currentOffset &&
                      element - turnOffsetIncrease > currentOffset,
                ) ??
                difference.last;
          } else {
            nextOffset = null;
          }
          break;
        }
        nextOffset = newOffset;
      }
    } else {
      nextOffset = currentOffset - turnOffsetIncrease;

      while ((finishedOffsets.contains(nextOffset) ||
              nextOffset == currentOffset) &&
          nextOffset != null) {
        final newOffset = nextOffset! + 1;
        if (offsetsInsideBoundary != null &&
            newOffset > offsetsInsideBoundary!.max) {
          final difference = offsetsInsideBoundary!.difference(finishedOffsets);
          if (difference.length >= 2) {
            nextOffset = difference.lastWhereOrNull(
                  (element) =>
                      element != currentOffset &&
                      element - turnOffsetIncrease < currentOffset,
                ) ??
                difference.first;
          } else {
            nextOffset = null;
          }
          break;
        }
        nextOffset = newOffset;
      }
    }

    if (nextOffset == currentOffset) {
      nextOffset = nextOffset! + turnOffsetIncrease;
    }

    if (offsetsInsideBoundary != null &&
        nextOffset != null &&
        !offsetsInsideBoundary!.contains(nextOffset)) {
      offsetOppositeTurn = !offsetOppositeTurn;
      return;
    }
    if (nextOffset != null &&
        ((nextOffset! - currentOffset).abs() == 1 && turnOffsetIncrease > 2)) {
      offsetOppositeTurn = !offsetOppositeTurn;
    }

    if (oldNext != nextOffset) {
      updateCurrentPathTracking(vehicle, force: true);
    }
  }

  /// The current [PathTracking] of the [currentLine] for the [Vehicle].
  void updateCurrentPathTracking(Vehicle vehicle, {bool force = false}) {
    final pathTrackingIsCorrectMode = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => currentPathTracking is StanleyPathTracking,
      PathTrackingMode.purePursuit =>
        currentPathTracking is PurePursuitPathTracking
    };

    // Return if we're already in the right mode.
    if (force || !pathTrackingIsCorrectMode) {
      currentPathTracking = switch (vehicle.pathTrackingMode) {
        PathTrackingMode.stanley => StanleyPathTracking(wayPoints: currentLine),
        PathTrackingMode.purePursuit =>
          PurePursuitPathTracking(wayPoints: currentLine),
      }
        ..setIndexToClosestPoint(vehicle);
      baseLinePathTracking = switch (vehicle.pathTrackingMode) {
        PathTrackingMode.stanley => StanleyPathTracking(wayPoints: baseLine),
        PathTrackingMode.purePursuit =>
          PurePursuitPathTracking(wayPoints: baseLine),
      }
        ..setIndexToClosestPoint(vehicle);
    }
    if (activeTurn == null) {
      if (boundary != null &&
          !(offsetsInsideBoundary?.contains(nextOffset) ?? false)) {
        nextPathTracking = null;
      } else if (nextOffset != null && nextLine != null) {
        nextPathTracking = switch (vehicle.pathTrackingMode) {
          PathTrackingMode.stanley => StanleyPathTracking(wayPoints: nextLine!),
          PathTrackingMode.purePursuit =>
            PurePursuitPathTracking(wayPoints: nextLine!),
        }
          ..cumulativeIndex = switch (vehicle.isReversing) {
            true => -1,
            false => 0,
          };
      } else {
        nextPathTracking = null;
      }
      baseLinePathTracking.setIndexToClosestPoint(vehicle);
    }
  }

  /// Checks if [activeTurn] or [upcomingTurn] should be set for the [vehicle]'s
  /// direction and position when the [limitMode] is not
  /// [ABLimitMode.unlimited].
  void checkIfTurnShouldBeInserted(Vehicle vehicle) {
    updatePathAlongAToB(vehicle);
    if (limitMode != ABLimitMode.unlimited) {
      if (setEquals(offsetsInsideBoundary, finishedOffsets)) {
        isCompleted = true;
        return;
      } else if (activeTurn != null && (activeTurn?.isCompleted ?? false)) {
        finishedOffsets.add(currentOffset);
        currentOffset = nextOffset ?? currentOffset;
        passedMiddle = false;
        activeTurn = null;
      } else if (activeTurn != null) {
        upcomingTurn = null;
        passedMiddle = false;
        return;
      } else if (currentPathTracking?.isCompleted ?? false) {
        finishedOffsets.add(currentOffset);
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
          startPoint = startPoint.moveRhumb(
            distance: turningRadius,
            angleFromBearing: 180,
          );
          endPoint = endPoint.moveRhumb(distance: turningRadius);
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
          PathTrackingMode.purePursuit =>
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

  /// How far along the current tracking line/curve the [vehicle] is depending
  /// on the direction [bearingAlongAToB].
  double alongProgress({
    required bool bearingAlongAToB,
    required Vehicle vehicle,
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

  /// Calculates a list of [count] points along the current offset line ahead of
  /// the [vehicle]'s path tracking point, in the forward direction of the
  /// vehicle according to the [vehicle]'s bearing.
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<WayPoint> pointsAhead(
    Vehicle vehicle, {
    double stepSize = 10,
    int count = 2,
  }) {
    final pathTracking = activeTurn ?? currentPathTracking;
    if (pathTracking != null) {
      final currentIndex =
          pathTracking.currentIndex.clamp(0, pathTracking.path.length - 1);

      var endIndex = currentIndex + count;
      if (endIndex >= pathTracking.path.length) {
        endIndex = pathTracking.path.length - 1;
      }

      return pathTracking.path.getRange(currentIndex, endIndex).toList();
    }
    return [];
  }

  /// Calculates a list of [count] points along the current line behind of the
  /// [vehicle]'s path tracking point, in the rearward direction of the vehicle
  ///  according to the [vehicle]'s bearing.
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<WayPoint> pointsBehind(
    Vehicle vehicle, {
    double stepSize = 10,
    int count = 2,
  }) {
    final pathTracking = activeTurn ?? currentPathTracking;
    if (pathTracking != null) {
      final currentIndex =
          pathTracking.currentIndex.clamp(0, pathTracking.path.length - 1);

      var startIndex = currentIndex - count;
      if (startIndex < 0) {
        startIndex = 0;
      }
      return pathTracking.path
          .getRange(
            startIndex,
            currentIndex,
          )
          .toList();
    }
    return [];
  }

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
      ).firstOrNull ??
      currentEnd;

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
      ).firstOrNull ??
      currentStart;

  /// The next steering angle for chasing the line.
  ///
  /// The steering mode used is according to the [mode] if set, otherwise
  /// the [vehicle]'s path tracking mode will be used.
  double? nextSteeringAngle(Vehicle vehicle, {PathTrackingMode? mode}) {
    if (isCompleted) {
      return null;
    }
    updateCurrentPathTracking(vehicle);
    checkIfTurnShouldBeInserted(vehicle);
    if (activeTurn != null) {
      return activeTurn!.nextSteeringAngle(vehicle);
    }
    return currentPathTracking?.nextSteeringAngle(vehicle);
  }

  /// Manually updates the tracking when not using auto steering.
  ///
  /// Will update turns in the same way as when using path tracking with
  /// auto steering.
  void manualUpdate(Vehicle vehicle) {
    if (isCompleted) {
      return;
    }
    currentPathTracking?.tryChangeWayPoint(vehicle);
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

  /// Creates a json compatible structure of the object.
  Map<String, dynamic> toJson() => {
        'name': name,
        'base_line': baseLine.map((e) => e.toJson()).toList(),
        'boundary': boundary?.toText(),
        'width': width,
        'is_CCW': isCCW,
        'turning_radius': turningRadius,
        'turn_offset_skips': turnOffsetMinSkips,
        'offsets_inside_boundary': offsetsInsideBoundary?.toList(),
        'finished_offsets': finishedOffsets.toList(),
        'lines': {
          'offsets': lines.keys.toList(),
          'paths': lines.values
              .map((curve) => curve.map((e) => e.toJson()).toList())
              .toList(),
        },
        'calculate_lines': boundary != null && lines.isEmpty,
      };

  /// Creates an [ABTracking] object from the [json] string and returns
  /// the [toJson] object as a string.
  ///
  /// Useful for running [calculateLinesWithinBoundary] in a different
  /// isolate and then return the results.
  static Future<String> createAndReturnABTrackingString(String json) async {
    final abTracking = await Future(
      () => ABTracking.fromJson(
        Map<String, dynamic>.from(jsonDecode(json) as Map),
      ),
    );
    return Future(() => jsonEncode(abTracking.toJson()));
  }
}
