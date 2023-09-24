import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:collection/collection.dart';
import 'package:geobase/geobase.dart';

/// An enumerator for the different types of joins when buffering rings.
enum BufferJoin {
  /// Bevelled corners, tangential (45 degrees) to the original point.
  ///
  /// The closest point on the bevel line is
  /// cos(pi/4)=sqrt(2)/2 * buffer distance away from the original point.
  bevel,

  /// All corners are extended in their original direction creating a
  /// pointy ring.
  miter,

  /// All corners are extended and rounded with radius equal to the buffer
  /// distance.
  round,
}

/// A class with methods for buffering polygon rings, i.e. shrinking or
/// inflating them by some distance.
class RingBuffer {
  /// Buffers the [ring] by [distance] meters by creating circles with radius
  /// [distance] at all the points and drawing tangent lines between the
  /// adjacent circles.
  ///
  /// The result can be visualized as dragging a circle with radius [distance]
  /// along the whole [ring] and creating lines from the outermost points
  /// of the circle. Negative [distance] means the inside line will be
  /// returned and positive [distance] means the outer line will be returned.
  ///
  /// If [distance] is negative, the ring will be shrunk, or inflated if
  /// [distance] is positive.
  ///
  /// If [distance] is 0 or the amount of points in [ring] is less than 2,
  /// the [ring] will be returned.
  ///
  /// By adjusting the [smoothingFactor] you can change how many points
  /// should be used to create a smooth curve. The factor is applied in the
  /// following manner.
  ///
  ///```dart
  /// numSmoothingPoints = (smoothingFactor * circleSecantLength / distance.abs()).floor()
  ///```
  ///
  /// The circleSecantLength is the distance from the intersection
  /// (start and end) points on the buffer distance circle.
  static Iterable<Geographic> bufferCircular({
    required Iterable<Geographic> ring,
    required double distance,
    BufferJoin joinType = BufferJoin.round,
    double smoothingFactor = 4,
    bool getRawPoints = false,
    bool extendEnds = true,
    bool filteredIntersections = true,
    bool getIntersectionsOnly = false,
    bool swapDirectionIfClockwise = false,
  }) {
    if (ring.length < 2 || distance.abs() == 0) {
      return ring;
    }

    // Whether the ring is counterclockwise (CCW).
    final isCCW = isCurveCounterclockwise(ring);

    final sign = switch ((!isCCW && swapDirectionIfClockwise) || isCCW) {
      true => 1,
      false => -1,
    };

    final resultRing = <Geographic>{};

    for (var i = 0; i < ring.length; i++) {
      if ((i == 0 || i == ring.length - 1) && !extendEnds) {
        continue;
      }
      final prevPoint = ring.elementAt((i - 1) % ring.length);
      final point = ring.elementAt(i);
      final nextPoint = ring.elementAt((i + 1) % ring.length);

      final prevBuffer = prevPoint.spherical.destinationPoint(
        distance: distance,
        bearing: prevPoint.spherical.initialBearingTo(point) + sign * 90,
      );

      final bufferCircleStart = point.spherical.destinationPoint(
        distance: distance,
        bearing: prevPoint.spherical.finalBearingTo(point) + sign * 90,
      );

      final bufferCircleEnd = point.spherical.destinationPoint(
        distance: distance,
        bearing: point.spherical.initialBearingTo(nextPoint) + sign * 90,
      );

      final nextBuffer = nextPoint.spherical.destinationPoint(
        distance: distance,
        bearing: point.spherical.finalBearingTo(nextPoint) + sign * 90,
      );

      final joinPoints = <Geographic>{};

      if (joinType != BufferJoin.bevel) {
        final circleSecantLength =
            bufferCircleStart.spherical.distanceTo(bufferCircleEnd);

        final numSmoothingPoints =
            (smoothingFactor * circleSecantLength / distance.abs()).floor();

        if (numSmoothingPoints > 0) {
          // Find and add points on the circle arc from start to end at
          // numSmoothingPoints equal intervals according.
          if (joinType == BufferJoin.round) {
            final arcAngle = sign *
                signedBearingDifference(
                  point.spherical.initialBearingTo(bufferCircleStart),
                  point.spherical.initialBearingTo(bufferCircleEnd),
                );

            final angleSection = arcAngle / numSmoothingPoints;

            for (var i = 1; i < numSmoothingPoints + 1; i++) {
              joinPoints.add(
                point.spherical.destinationPoint(
                  distance: distance,
                  bearing: point.spherical.initialBearingTo(bufferCircleStart) +
                      sign * i * angleSection +
                      switch (distance.isNegative) {
                        false => 0,
                        true => 180,
                      },
                ),
              );
            }
          }
          // Find and add the extension of the original point where the
          // lines through the circle start and end points intersects.
          else if (joinType == BufferJoin.miter) {
            var intersection = bufferCircleStart.spherical.intersectionWith(
              bearing:
                  point.spherical.finalBearingTo(bufferCircleStart) - sign * 90,
              other: bufferCircleEnd,
              otherBearing:
                  point.spherical.finalBearingTo(bufferCircleEnd) + sign * 90,
            );

            if (intersection != null) {
              final movedDistance = point.spherical.distanceTo(intersection);

              // Try to detect if the point is on the other side of the Earth.
              // If so, flip it back to the correct side.
              if (movedDistance > 2 * distance.abs()) {
                intersection = intersection.copyWith(
                  x: (intersection.x + 180).wrapLongitude(),
                  y: (intersection.y + 180).wrapLatitude(),
                );
              }

              joinPoints.add(intersection);
            }
          }
        }
      }

      resultRing.addAll(
        [
          prevBuffer,
          bufferCircleStart,
          ...joinPoints,
          bufferCircleEnd,
          nextBuffer,
        ],
      );
    }
    return getRawPoints
        ? resultRing
        : findAndInsertIntersections(
            originalRing: ring,
            bufferedRing: resultRing,
            distance: distance,
            joinType: joinType,
            extendEnds: extendEnds,
            filtered: filteredIntersections,
            getIntersectionsOnly: getIntersectionsOnly,
          );
  }

  /// Finds all the intersections in [bufferedRing].
  ///
  /// By using the [originalRing] and buffer [distance] we can skip
  /// intersections that are too close to the original ring.
  static List<({int begin, int end, Geographic intersection})>
      findIntersections({
    required Iterable<Geographic> originalRing,
    required List<Geographic> bufferedRing,
    required double distance,
    BufferJoin joinType = BufferJoin.round,
    bool filtered = true,
    bool includeEnds = true,
  }) {
    final intersectionList =
        <({int begin, int end, Geographic intersection})>[];

    for (var i = 0; i < bufferedRing.length - 1; i++) {
      final start1 = bufferedRing.elementAt(i);
      final end1 = bufferedRing.elementAt(i + 1);

      for (var j = 0; j < bufferedRing.length - 1; j++) {
        // Skip adjacent lines
        if ((i - j).abs() < 2) {
          continue;
        }

        final end2 = bufferedRing.elementAt(j);
        final start2 = bufferedRing.elementAt(j + 1);

        final intersection = start1.spherical.intersectionWith(
          bearing: start1.spherical.initialBearingTo(end1),
          other: start2,
          otherBearing: start2.spherical.initialBearingTo(end2),
        );

        if (intersection != null) {
          // For the different join types the buffer distance of some
          // intersections can be smaller (beveled) or larger (miter) or
          // the same as the actual buffer distance (round).
          final checkDistance = switch (joinType) {
            // Since the beveled edge is tangential (45 degrees) to the original
            // points, we allow a shorter distance since the edge can be
            // closer to the original points than the buffer distance.
            BufferJoin.bevel => cos(45.0.toRadians()) * distance.abs(),

            // For round and miter we just check that they aren't too close to
            // the original points wih some room for precision error for the
            // buffer distance.
            _ => 0.98 * distance.abs()
          };

          final startIndex = bufferedRing.indexOf(end1);
          final endIndex = bufferedRing.indexOf(start2);

          // Filter out intersections that are too close to the original ring
          if (originalRing.any(
            (point) => point.spherical.distanceTo(intersection) < checkDistance,
          )) {
            // When joint type is bevel we allow the intersection either way if
            // the buffered ring is inflated.
            // Probably not the best solution, but seems okay-ish
            if (joinType == BufferJoin.bevel && !distance.isNegative) {
            } else {
              continue;
            }
          }

          final along1 = intersection.spherical
              .alongTrackDistanceTo(start: start1, end: end1);

          final along2 = intersection.spherical
              .alongTrackDistanceTo(start: start2, end: end2);

          // If the intersection is between the points for both
          // the lines, i.e. on the actual line segments, not past them in
          // either direction, we add it to the list.
          if (along1 < start1.spherical.distanceTo(end1) &&
              along2 < start2.spherical.distanceTo(end2)) {
            intersectionList.add(
              (begin: startIndex, end: endIndex, intersection: intersection),
            );
          }
        }
      }
    }
    if (!filtered) {
      return intersectionList;
    }
    // A list of the intersections that we will filter to only the necessary
    // ones.
    final filteredIntersections = [...intersectionList];

    // Remove duplicates which start at the opposite ends.
    for (final intersection in intersectionList) {
      filteredIntersections.removeWhere(
        (other) =>
            filteredIntersections.contains(intersection) &&
            intersection.begin == other.end &&
            intersection.end == other.begin &&
            intersection.begin < other.begin,
      );
    }

    if (filteredIntersections.isNotEmpty) {
      // Sort by how many points the intersections will replace.
      // From few to many.
      filteredIntersections.sortByCompare(
        (element) {
          final length = element.end - element.begin;
          final lengthAroundStart = includeEnds
              ? bufferedRing.length - element.end + element.begin
              : double.maxFinite.floor();
          final min = [length, lengthAroundStart].min;
          return min;
        },
        (a, b) => a.compareTo(b),
      );
    }
    return filteredIntersections;
  }

  /// Cleans up [bufferedRing] by removing points that extends outside
  /// intersections between non-adjacent lines.
  ///
  /// By using the [originalRing] and buffer [distance] we can skip
  /// intersections that are too close to the original ring.
  ///
  /// Mostly useful when the [bufferedRing] has been shrunk or is concave.
  static Iterable<Geographic> findAndInsertIntersections({
    required Iterable<Geographic> originalRing,
    required Iterable<Geographic> bufferedRing,
    required double distance,
    BufferJoin joinType = BufferJoin.round,
    bool getIntersectionsOnly = false,
    bool filtered = true,
    bool extendEnds = true,
  }) {
    final intersectionList = findIntersections(
      originalRing: originalRing,
      bufferedRing: bufferedRing.toList(),
      distance: distance,
      joinType: joinType,
      filtered: filtered,
      includeEnds: extendEnds,
    );
    if (getIntersectionsOnly) {
      return intersectionList.map((e) => e.intersection).toSet();
    }

    final resultRing = [...bufferedRing];

    // Apply the replacement intersections for their ranges, i.e. the lowest
    // number of indices from begin to end.
    for (final replacement in intersectionList) {
      final length = replacement.end - replacement.begin;
      final lengthAroundStart = extendEnds
          ? resultRing.length - replacement.end + replacement.begin
          : double.maxFinite.floor();

      // Wraps around the end of the ring
      if (lengthAroundStart < length) {
        // From end to last index.
        final indices = List.generate(
          lengthAroundStart - replacement.begin,
          (index) => replacement.end + index,
        )
          // From 0 to begin.
          ..addAll(List.generate(replacement.begin, (index) => index));

        for (final index in indices) {
          resultRing[index] = replacement.intersection;
        }
      } else {
        if (length.isNegative) {
          continue;
        }
        resultRing.replaceRange(
          replacement.begin,
          replacement.end,
          List.generate(length, (index) => replacement.intersection),
        );
      }
    }
    return resultRing.toSet();
  }
}
