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

import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';
import 'package:uuid/uuid.dart';

export 'ab_config.dart';
export 'ab_limit_mode.dart';

part 'a_plus_line.dart';
part 'ab_curve.dart';
part 'ab_line.dart';

/// An enumerator for the different types of AB tracking.
enum ABTrackingType {
  /// A+ line
  aPlusLine('A+ Line'),

  /// AB line
  abLine('AB Line'),

  /// AB curve
  abCurve('AB Curve');

  const ABTrackingType(this.name);

  /// The ui friendly name of this.
  final String name;
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
    required this.type,
    this.boundary,
    String? boundaryString,
    this.turningRadius = 10,
    this.turnOffsetMinSkips = 0,
    this.limitMode = ABLimitMode.limitedTurnWithin,
    this.snapToClosestLine = false,
    bool calculateLinesOnCreation = true,
    this.name,
    String? uuid,
  })  : uuid = uuid ?? const Uuid().v4(),
        start = baseLine.first,
        end = baseLine.last,
        isCCW = isCurveCounterclockwise(baseLine.map((e) => e.position)),
        baseLinePathTracking = PurePursuitPathTracking(wayPoints: baseLine) {
    if (boundary == null && boundaryString != null) {
      boundary = Polygon.parse(boundaryString);
    }
    if (boundary == null && currentOffset != null) {
      offsetLine(currentOffset!);
      currentPathTracking = PurePursuitPathTracking(wayPoints: currentLine!);
      if (nextOffset != null) {
        offsetLine(nextOffset!);
        if (nextLine != null) {
          nextPathTracking = PurePursuitPathTracking(wayPoints: nextLine!);
        }
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
    } else if (boundary != null) {
      allOffsetsInsideBoundaryFound = true;
    }
  }

  /// Creates the corresponding [ABCurve], [ABLine] or [APlusLine] from the
  /// [json] object.
  factory ABTracking.fromJson(Map<String, dynamic> json) {
    if (json['type'] == ABTrackingType.abCurve.name) {
      return ABCurve.fromJson(json);
    } else if (json['type'] == ABTrackingType.aPlusLine.name) {
      return APlusLine.fromJson(json);
    }
    return ABLine.fromJson(json);
  }

  /// The unique identifier for this.
  final String uuid;

  /// Which subtype of [ABTracking] this is.
  final ABTrackingType type;

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
  int? _currentOffset;

  /// The number of [width] offsets that we should move the line.
  ///
  /// A positive number means that the line is moved to the right relative
  /// to the original recording direction.
  /// A negative number means that the line is move to the left relative to
  /// the original recording direction.
  int? get currentOffset => _currentOffset;

  /// The turning radius to use for the [upcomingTurn] and [activeTurn].
  double turningRadius;

  /// Whether the [baseLine] is counter clock wise.
  bool isCCW;

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

  /// Whether all the offsets within [boundary] are founde.
  bool allOffsetsInsideBoundaryFound = false;

  /// Offset lines that have been completed.
  final finishedOffsets = SplayTreeSet<int>();

  /// Whether the all the paths have been run through and completed.
  bool get isCompleted => const DeepCollectionEquality.unordered()
      .equals(offsetsInsideBoundary, finishedOffsets);

  /// Private variable for [nextOffset].
  int? _nextOffset;

  /// The next offset to use for the line.
  int? get nextOffset => _nextOffset;

  /// Whether the upcoming turn should be the opposite direction to the usual
  /// direction.
  bool offsetOppositeTurn = false;

  /// Whether the vehicle has passed the middle point of the line in the
  /// driving direction.
  bool passedMiddle = false;

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
  WayPoint? get currentStart => currentOffset != null
      ? pathAlongAToB
          ? currentLine?.firstOrNull ?? currentEnd
          : currentLine?.lastOrNull ?? offsetStart(currentOffset!)
      : null;

  /// The end point for the line with [currentOffset].
  WayPoint? get currentEnd => pathAlongAToB
      ? currentLine?.lastOrNull ??
          (currentOffset != null ? offsetEnd(currentOffset!) : null)
      : currentLine?.firstOrNull ?? currentStart;

  /// The bearing of the current line at the [currentStart].
  double? get currentInitialBearing => currentStart?.bearing;

  /// The bearing of the current line at the [currentEnd].
  double? get currentFinalBearing => currentEnd?.bearing;

  /// The offset [start] for the [nextOffset].
  WayPoint? get nextStart =>
      nextOffset != null ? offsetStart(nextOffset!) : null;

  /// The offset [end] for the [nextOffset].
  WayPoint? get nextEnd => nextOffset != null ? offsetEnd(nextOffset!) : null;

  /// The line for the [currentOffset].
  List<WayPoint>? get currentLine => currentOffset != null
      ? !pathAlongAToB
          ? offsetLine(currentOffset!)
              .reversed
              .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
              .toList()
          : offsetLine(currentOffset!)
      : null;

  /// The line for the [nextOffset].
  List<WayPoint>? get nextLine => nextOffset != null
      ? pathAlongAToB
          ? offsetLine(nextOffset!)
              .reversed
              .map((e) => e.copyWith(bearing: (e.bearing + 180).wrap360()))
              .toList()
          : offsetLine(nextOffset!)
      : null;

  set currentOffset(int? newOffset) {
    if (newOffset == null) {
      _currentOffset = null;
    } else if (currentOffset != newOffset) {
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

  /// Clears the finished offsets and sets the [currentOffset] to the first of
  /// the inside boundary lines or 0.
  void clearFinishedOffsets() {
    finishedOffsets.clear();
    currentOffset = offsetsInsideBoundary?.first ?? 0;
  }

  /// Calculates all the lines/offsets within the [boundary], if there is one.
  void calculateLinesWithinBoundary() {
    if (boundary?.exterior != null) {
      lines.clear();
      allOffsetsInsideBoundaryFound = false;

      offsetsInsideBoundary = SplayTreeSet();

      final boundingBox =
          GeoBox.from(boundary!.exterior!.toGeographicPositions);

      final diagonal = boundingBox.min.rhumb.distanceTo(boundingBox.max);

      final offsetsToCheck = (diagonal / width).ceil();

      for (var i = 0; i <= offsetsToCheck; i++) {
        offsetLine(
          i,
          extraStraightDistance: diagonal,
        );
        if (!offsetsInsideBoundary!.contains(i)) {
          break;
        }
      }
      for (var i = 1; i <= offsetsToCheck; i++) {
        offsetLine(
          -i,
          extraStraightDistance: diagonal,
        );
        if (!offsetsInsideBoundary!.contains(-i)) {
          break;
        }
      }

      nextOffset = currentOffset != null
          ? offsetsInsideBoundary!.reduce(
              (previousValue, element) =>
                  sqrt(pow(currentOffset! - element, 2)) <
                              sqrt(pow(currentOffset! - previousValue, 2)) &&
                          element != currentOffset
                      ? element
                      : previousValue,
            )
          : null;

      allOffsetsInsideBoundaryFound = true;
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
    double? extraStraightDistance,
  }) {
    if (lines[offset] != null) {
      return lines[offset]!;
    }
    if (allOffsetsInsideBoundaryFound) {
      return [];
    }

    final extendedStart = baseLine.first.position.rhumb.destinationPoint(
      distance: extraStraightDistance ?? 1000,
      bearing: baseLine[1].finalBearingToRhumb(baseLine.first),
    );

    final extendedEnd = baseLine.last.position.rhumb.destinationPoint(
      distance: extraStraightDistance ?? 1000,
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
      swapDirectionIfClockwise: !isCurveCounterclockwise(path),
    );

    final newPath = <WayPoint>[];
    if (buffered.length >= 2) {
      buffered.forEachIndexed((index, element) {
        {
          if (index == 0) {
            newPath.add(
              WayPoint(
                position: element,
                bearing: element.rhumb
                    .initialBearingTo(buffered.elementAt(index + 1)),
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

    if (boundary?.exterior != null && newPath.isNotEmpty) {
      final boundaryRing = boundary!.exterior!.toGeographicPositions;
      // Skip lines that don't have any possible intersections with the boundary
      if (!newPath.any(
        (element) => element.intersectionsWithRhumb(boundaryRing).isNotEmpty,
      )) {
        return [];
      }

      if (type == ABTrackingType.abLine || type == ABTrackingType.aPlusLine) {
        final intersectionsBehind = newPath.first.intersectionsWithRhumb(
          boundaryRing,
          oppositeOfBearing: true,
        );
        final intersectionsAhead = newPath.first.intersectionsWithRhumb(
          boundary!.exterior!.toGeographicPositions,
        );

        final ahead = [...intersectionsBehind, ...intersectionsAhead]
            .where(
              (element) =>
                  bearingDifference(
                    baseLine.first.bearing,
                    baseLine.first.initialBearingToRhumb(element),
                  ) <=
                  90,
            )
            .sortedBy<num>(
              (element) => baseLine.first.distanceToRhumb(element),
            );
        final behind = [...intersectionsBehind, ...intersectionsAhead]
            .where(
              (element) =>
                  bearingDifference(
                    baseLine.first.bearing,
                    baseLine.first.initialBearingToRhumb(element),
                  ) >
                  90,
            )
            .sortedBy<num>(
              (element) => -baseLine.first.distanceToRhumb(element),
            );
        newPath.replaceRange(
          0,
          newPath.length,
          [...behind, ...ahead],
        );
      } else if (type == ABTrackingType.abCurve) {
        // TODO(dudlileif): Wrong intersections might get picked if the curve
        // is shaped like a U or where A and B are roughly the same distance
        // from both of the intersection sides of the boundary.

        final indicesOutsideStart = <int>[];
        final indicesOutsideEnd = <int>[];

        for (var i = 0; i < newPath.length; i++) {
          final point = newPath[i];
          if (!point.position.isWithinRing(boundaryRing)) {
            indicesOutsideStart.add(i);
          } else {
            break;
          }
        }
        if (indicesOutsideStart.length != newPath.length) {
          final startIntersections = newPath
              .elementAt(indicesOutsideStart.lastOrNull ?? 0)
              .intersectionsWithRhumb(boundaryRing);

          if (indicesOutsideStart.isNotEmpty) {
            newPath.replaceRange(
              indicesOutsideStart.first,
              indicesOutsideStart.last + 1,
              [
                if (startIntersections.isNotEmpty)
                  startIntersections.reduce(
                    (value, element) => newPath.first.distanceToRhumb(element) <
                            newPath.first.distanceToRhumb(value)
                        ? element
                        : value,
                  ),
              ],
            );
          }
          for (var i = newPath.length - 1; i >= 0; i--) {
            final point = newPath[i];
            if (!point.position.isWithinRing(boundaryRing)) {
              indicesOutsideEnd.add(i);
            } else {
              break;
            }
          }
          final endIntersections = newPath
              .elementAt(indicesOutsideEnd.lastOrNull ?? 0)
              .intersectionsWithRhumb(boundaryRing, oppositeOfBearing: true);
          if (indicesOutsideEnd.isNotEmpty) {
            newPath.replaceRange(
              indicesOutsideEnd.last - 1,
              indicesOutsideEnd.first + 1,
              [
                if (endIntersections.isNotEmpty)
                  endIntersections
                      .reduce(
                        (value, element) =>
                            newPath.last.distanceToRhumb(element) <
                                    newPath.last.distanceToRhumb(value)
                                ? element
                                : value,
                      )
                      .rotateByAngle(180),
              ],
            );
          }
        } else if (newPath.length >= 2) {
          // Split the end-most lines in half and the new split lines until
          // a point is inside the boundary, or until the distance between the
          // points is less than the min distance, set to 10 meters as lines
          // shorter than this aren't really practical on the field.

          // Only split while distance is larger than this.
          const minDistance = 10;

          final intersections = <WayPoint>[];

          // From start
          final splitLinesStart = [newPath.first, newPath[1]];
          while (splitLinesStart.first.distanceToRhumb(splitLinesStart[1]) >
              minDistance) {
            var i = 0;
            var breakout = false;
            while (i < splitLinesStart.length - 1) {
              splitLinesStart.replaceRange(i, i + 2, [
                splitLinesStart[i],
                splitLinesStart[i].intermediatePointToRhumb(
                  splitLinesStart[i + 1],
                  fraction: 0.5,
                ),
                splitLinesStart[i + 1],
              ]);

              if (splitLinesStart.any(
                (element) => element.position.isWithinRing(boundaryRing),
              )) {
                intersections.addAll(
                  newPath.first.intersectionsWithRhumb(
                    boundaryRing,
                  ),
                );
                breakout = true;
                break;
              }
              i += 2;
            }
            if (breakout) {
              break;
            }
          }
          // From end
          final splitLinesEnd = [newPath.last, newPath[newPath.length - 2]];
          while (splitLinesEnd.first.distanceToRhumb(splitLinesEnd[1]) >
              minDistance) {
            var i = 0;
            var breakout = false;
            while (i < splitLinesEnd.length - 1) {
              splitLinesEnd.replaceRange(i, i + 2, [
                splitLinesEnd[i],
                splitLinesEnd[i].intermediatePointToRhumb(
                  splitLinesEnd[i + 1],
                  fraction: 0.5,
                ),
                splitLinesEnd[i + 1],
              ]);

              if (splitLinesEnd.any(
                (element) => element.position.isWithinRing(boundaryRing),
              )) {
                intersections.addAll(
                  newPath.last.intersectionsWithRhumb(
                    boundaryRing,
                    oppositeOfBearing: true,
                  ),
                );
                breakout = true;
                break;
              }
              i += 2;
            }
            if (breakout) {
              break;
            }
          }
          newPath.replaceRange(
            0,
            newPath.length,
            intersections,
          );
        }
      }
    }
    if (newPath.length < 2) {
      return [];
    }

    // Filter out points that are within 10 cm of others to mitigate bearing
    // errors, but preserve start/end points.
    if (newPath.length >= 2) {
      var index = 0;
      while (index < newPath.length) {
        final element = newPath.elementAt(index);
        if (index == newPath.length - 1) {
          if (element.distanceToRhumb(newPath.elementAt(index - 1)) < 0.1) {
            newPath.removeAt(index - 1);
          }
        } else if (index > 0) {
          if (element.distanceToRhumb(newPath.elementAt(index - 1)) < 0.1) {
            newPath.removeAt(index);
          }
        }
        index++;
      }
    }

    // Ensure that the end points have the correct bearings.
    if (newPath.length >= 2) {
      newPath[0] = newPath.first.copyWith(
        bearing: newPath.first.initialBearingToRhumb(
          newPath.firstWhere(
            (element) => newPath.first.distanceToRhumb(element) > 0.5,
          ),
        ),
      );
      newPath[newPath.length - 1] = newPath.last.copyWith(
        bearing: newPath.reversed
            .firstWhere(
              (element) => newPath.last.distanceToRhumb(element) > 0.5,
            )
            .finalBearingToRhumb(newPath.last),
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

  /// The perpendicular distance from [vehicle] to the base line.
  ///
  /// The distance is negative if the point is to the left of the base line.
  double perpendicularDistanceToBaseLine(Vehicle vehicle) =>
      baseLinePathTracking.vehiclePointingInPathDirection(vehicle)
          ? baseLinePathTracking.perpendicularDistance(vehicle)
          : -baseLinePathTracking.perpendicularDistance(vehicle);

  /// The perpendicular distance from [vehicle] to the line of [offset] offsets.
  double? perpendicularDistanceToOffsetLine(int offset, Vehicle vehicle) =>
      currentOffset != null
          ? signedPerpendicularDistanceToCurrentLine(vehicle) +
              (offset - currentOffset!) * width
          : null;

  /// How many [width] offsets from the original line we need to get the
  /// closest line.
  int numOffsetsToClosestLine(Vehicle vehicle) {
    final val = (compareToBearing(vehicle) *
                (currentPathTracking?.perpendicularDistance(vehicle) ?? 0) /
                width +
            (currentOffset ?? 0))
        .round();
    return val;
  }

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
    if (currentOffset != null) {
      final newOffset = currentOffset! + offset * compareToBearing(vehicle);
      offsetLine(newOffset);
      if ((offsetsInsideBoundary != null &&
              nextOffset != null &&
              !offsetsInsideBoundary!.contains(newOffset)) ||
          lines[newOffset] == null) {
        return;
      }
      if (snapToClosestLine) {
        snapToClosestLine = false;
      }
      currentOffset = newOffset;
      activeTurn = null;
      currentPathTracking?.setIndexToClosestPoint(vehicle);
    }
  }

  /// Moves the [currentOffset] in the right direction relative to the
  /// [vehicle]'s bearing.
  void moveOffsetRight(Vehicle vehicle, {int offset = 1}) =>
      moveOffset(vehicle, offset: offset);

  /// Moves the [currentOffset] in the left direction relative to the
  /// [vehicle]'s bearing.
  void moveOffsetLeft(Vehicle vehicle, {int offset = 1}) =>
      moveOffset(vehicle, offset: -offset);

  /// Sets the [currentOffset] to the closest line.
  void setCurrentOffsetToClosest(Vehicle vehicle) {
    final closest = numOffsetsToClosestLine(vehicle);
    offsetLine(closest);
    if (closest != currentOffset && lines[closest] != null) {
      if (boundary != null && offsetsInsideBoundary != null) {
        if (offsetsInsideBoundary!.contains(closest)) {
          currentOffset = closest;
        }
      } else if (boundary == null) {
        currentOffset = closest;
      }
    }
  }

  /// Check the automatic offset snap and update the [currentOffset] to the
  /// one closes to [vehicle].
  void checkAutoOffsetSnap(Vehicle vehicle) {
    if (snapToClosestLine && activeTurn == null) {
      setCurrentOffsetToClosest(vehicle);
    }
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
      if (isCompleted) {
        nextOffset = null;
        currentOffset = null;
        return;
      }
      final difference = offsetsInsideBoundary!.difference(finishedOffsets);
      if (difference.length == 1) {
        nextOffset = difference.first;
      }
    }
    final turnOffsetIncrease = turnOffsetMinSkips + 1;

    final bearingAlongAToB = !compareToBearing(vehicle).isNegative;
    if (currentOffset != null) {
      if ((bearingAlongAToB && !offsetOppositeTurn) ||
          (!bearingAlongAToB && offsetOppositeTurn)) {
        nextOffset = currentOffset! + turnOffsetIncrease;

        while ((finishedOffsets.contains(nextOffset) ||
                nextOffset == currentOffset) &&
            nextOffset != null) {
          final newOffset = nextOffset! - 1;
          if (offsetsInsideBoundary != null &&
              newOffset < offsetsInsideBoundary!.min) {
            final difference =
                offsetsInsideBoundary!.difference(finishedOffsets);
            if (difference.length >= 2) {
              nextOffset = difference.firstWhereOrNull(
                    (element) =>
                        element != currentOffset &&
                        element - turnOffsetIncrease > currentOffset!,
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
        nextOffset = currentOffset! - turnOffsetIncrease;

        while ((finishedOffsets.contains(nextOffset) ||
                nextOffset == currentOffset) &&
            nextOffset != null) {
          final newOffset = nextOffset! + 1;
          if (offsetsInsideBoundary != null &&
              newOffset > offsetsInsideBoundary!.max) {
            final difference =
                offsetsInsideBoundary!.difference(finishedOffsets);
            if (difference.length >= 2) {
              nextOffset = difference.lastWhereOrNull(
                    (element) =>
                        element != currentOffset &&
                        element - turnOffsetIncrease < currentOffset!,
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
          ((nextOffset! - currentOffset!).abs() == 1 &&
              turnOffsetIncrease > 2)) {
        offsetOppositeTurn = !offsetOppositeTurn;
      }

      if (oldNext != nextOffset) {
        updateCurrentPathTracking(vehicle, force: true);
      }
    }
  }

  /// Updates the current [PathTracking] of the [currentLine] for the [Vehicle].
  void updateCurrentPathTracking(Vehicle vehicle, {bool force = false}) {
    if (isCompleted) {
      currentPathTracking = null;
      return;
    }
    final pathTrackingIsCorrectMode = switch (vehicle.pathTrackingMode) {
      PathTrackingMode.stanley => currentPathTracking is StanleyPathTracking,
      PathTrackingMode.purePursuit =>
        currentPathTracking is PurePursuitPathTracking
    };

    // Return if we're already in the right mode.
    if (force || !pathTrackingIsCorrectMode) {
      if (currentLine != null) {
        currentPathTracking = switch (vehicle.pathTrackingMode) {
          PathTrackingMode.stanley =>
            StanleyPathTracking(wayPoints: currentLine!),
          PathTrackingMode.purePursuit =>
            PurePursuitPathTracking(wayPoints: currentLine!),
        }
          ..setIndexToClosestPoint(vehicle);
        baseLinePathTracking = switch (vehicle.pathTrackingMode) {
          PathTrackingMode.stanley => StanleyPathTracking(wayPoints: baseLine),
          PathTrackingMode.purePursuit =>
            PurePursuitPathTracking(wayPoints: baseLine),
        }
          ..setIndexToClosestPoint(vehicle);
      }
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
      if (isCompleted) {
        currentPathTracking = null;
        return;
      } else if (currentPathTracking?.isCompleted ?? false) {
        if (currentOffset != null) {
          finishedOffsets.add(currentOffset!);
        }
      }
      if (activeTurn != null) {
        if (currentOffset != null) {
          finishedOffsets.add(currentOffset!);
        }
        upcomingTurn = null;
        passedMiddle = false;
        currentOffset = null;
        if (activeTurn!.isCompleted) {
          currentOffset = nextOffset ?? currentOffset;
          activeTurn = null;
        }
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
  WayPoint? nextForwardPoint(
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
  WayPoint? nextReversingPoint(
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
      currentPathTracking = null;
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
        'uuid': uuid,
        'type': type.name,
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
              .map((line) => line.map((e) => e.toJson()).toList())
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
