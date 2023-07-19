import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

/// A class for creating and tracking straight lines by using the bearing
/// from point A to point B and their positions to create parallel lines.
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
  })  : bearing = start.bearingTo(end),
        _line = jts.LineSegment.fromCoordinates(
          start.jtsCoordinate,
          end.jtsCoordinate,
        );

  /// Point A, the starting point for creating the AB-line.
  final LatLng start;

  /// Point B, the ending point for creating the AB-line.
  final LatLng end;

  /// The bearing of the AB-line, i.e. the bearing from [start] point A to [end]
  /// point B.
  final double bearing;

  /// The line segment between [start] and [end].
  final jts.LineSegment _line;

  /// How wide an AB-line should be, as in when to skip to the next line over.
  double width;

  /// Whether or not the closest line should always be snapped to, otherwise
  /// the [currentOffset] has to be manually set/updated.
  bool snapToClosestLine = false;

  /// The number of [width] offsets that we should move the line.
  ///
  /// A positive number means offsetting to the right of the [bearing],
  /// a negative number means offsetting to the left of the [bearing].
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
  void _checkIfShouldReengageSnap(LatLng point) {
    if (_awaitToReengageSnap) {
      if (currentOffset == numOffsetsToClosestLine(point)) {
        snapToClosestLine = true;
        _awaitToReengageSnap = false;
      }
    }
  }

  /// Toggles the [snapToClosestLine] to the inverse value.
  void toggleSnapToClosestLine() => snapToClosestLine = !snapToClosestLine;

  /// The perpendicular intersect from the [point] to the original [_line].
  jts.Coordinate perpendicularIntersect(LatLng point) =>
      _line.projectCoord(point.jtsCoordinate);

  /// The perpendicular distance from [point] to the original [_line].
  ///
  /// The distance is negative if the point is to the left of the [_line].
  double perpendicularDistanceToLine(LatLng point) {
    final orientation = jts.Orientation.index(
      start.jtsCoordinate,
      end.jtsCoordinate,
      point.jtsCoordinate,
    );
    return -orientation *
        point.distanceTo(perpendicularIntersect(point).latLng);
  }

  /// Offsets the [start] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  LatLng offsetStart(int offset) => start.offset(offset * width, bearing + 90);

  /// Offsets the [end] point by [offset]*[width] meters to the side.
  ///
  /// Negative [offset] means the point is offset in the opposite direction.
  LatLng offsetEnd(int offset) => end.offset(offset * width, bearing + 90);

  /// Offset the [_line] by [offset]*[width] meters to the side.
  jts.LineSegment offsetLine(int offset) => jts.LineSegment.fromCoordinates(
        offsetStart(offset).jtsCoordinate,
        offsetEnd(offset).jtsCoordinate,
      );

  /// The perpendicular intersect from [point] to the [offsetLine] with
  /// [offset] offsets.
  jts.Coordinate offsetPerpendicularIntersect(int offset, LatLng point) =>
      offsetLine(offset).projectCoord(point.jtsCoordinate);

  /// The perpendicular distance from [point] to the [offsetLine] with
  /// [offset] offsets.
  double perpendicularDistanceToOffsetLine(int offset, LatLng point) {
    final orientation = jts.Orientation.index(
      offsetStart(offset).jtsCoordinate,
      offsetEnd(offset).jtsCoordinate,
      point.jtsCoordinate,
    );
    return -orientation *
        point.distanceTo(offsetPerpendicularIntersect(offset, point).latLng);
  }

  /// How many [width] offsets from the original [_line] we need to get the
  /// [closestLine].
  int numOffsetsToClosestLine(LatLng point) =>
      (perpendicularDistanceToLine(point) / width).round();

  /// The start point A for the line closest to [point].
  LatLng closestStart(LatLng point) =>
      offsetStart(numOffsetsToClosestLine(point));

  /// The end point B for the line closest to [point].
  LatLng closestEnd(LatLng point) => offsetEnd(numOffsetsToClosestLine(point));

  /// The offset line closest to [point].
  jts.LineSegment closestLine(LatLng point) =>
      offsetLine(numOffsetsToClosestLine(point));

  /// The perpendicular intersect from [point] to the [closestLine].
  jts.Coordinate closestPerpendicularIntersect(LatLng point) =>
      closestLine(point).projectCoord(point.jtsCoordinate);

  /// The perpendicular distance from [point] to the [closestLine].
  ///
  /// The distance is negative if the point is to the left of the [closestLine].
  double perpendicularDistanceToClosestLine(LatLng point) {
    final orientation = jts.Orientation.index(
      closestStart(point).jtsCoordinate,
      closestEnd(point).jtsCoordinate,
      point.jtsCoordinate,
    );

    return -orientation *
        point.distanceTo(closestPerpendicularIntersect(point).latLng);
  }

  /// Whether the [point] has a negative x-value on the realtive coordinate
  /// system where [start] is origo and [end] is along positive x axis.
  bool inNegativeDirection(LatLng point) =>
      jts.Angle.angleBetweenOriented(
        point.jtsCoordinate,
        start.jtsCoordinate,
        end.jtsCoordinate,
      ).abs() >
      pi / 2;

  /// The distance from [point] to the [closestStart] point.
  ///
  /// The distance is positive in [bearing] direction and
  /// negative in opposite direction.
  double offsetIntersectToStartDistance(int offset, LatLng point) {
    final distance = offsetStart(offset)
        .distanceTo(offsetPerpendicularIntersect(offset, point).latLng);

    return switch (inNegativeDirection(point)) {
      true => -distance,
      false => distance
    };
  }

  /// The distance from [point] to the [closestStart] point.
  ///
  /// The distance is positive in [bearing] direction and
  /// negative in opposite direction.
  double closestIntersectToStartDistance(LatLng point) {
    final distance = closestStart(point)
        .distanceTo(closestPerpendicularIntersect(point).latLng);

    return switch (inNegativeDirection(point)) {
      true => -distance,
      false => distance
    };
  }

  /// Compares [heading] to [bearing] to determine what should be left or right.
  ///
  /// Returns 1 if the [heading] is in the general forward direction of
  /// [bearing] (think upper half circle), and -1 when [heading] is in the
  /// general reverse direction of [bearing] (think lower half circle).
  int compareToBearing(double heading) =>
      (normalizeBearing(bearing - heading) - 180).abs() >= 90 ? 1 : -1;

  /// Moves the [currentOffset] in the right direction relative to [heading].
  void moveOffsetRight(double heading) {
    if (snapToClosestLine) {
      snapToClosestLine = false;
      _awaitToReengageSnap = true;
    }
    currentOffset += compareToBearing(heading);
  }

  /// Moves the [currentOffset] in the left direction relative to [heading];
  void moveOffsetLeft(double heading) {
    if (snapToClosestLine) {
      snapToClosestLine = false;
      _awaitToReengageSnap = true;
    }
    currentOffset -= compareToBearing(heading);
  }

  /// Calculates a list of [num] points along the [offsetLine] ahead of the
  /// [point], in the forward direction of the vehicle according to [heading].
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<LatLng> pointsAheadOf({
    required LatLng point,
    required double heading,
    double stepSize = 10,
    int num = 2,
  }) {
    // Whether the heading closer to the line bearing or the opposite bearing.
    final sign = compareToBearing(heading);

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
      (index) => offsetStart(currentOffset).offset(
        stepSize * (index + sign * stepOffset),
        switch (sign.isNegative) {
          true => bearing + 180,
          false => bearing,
        },
      ),
      growable: false,
    );
  }

  /// Calculates a list of [num] points along the [offsetLine] behind of the
  /// [point], in the rearward direction of the vehicle according to [heading].
  ///
  /// The [stepSize] is the distance between the points in meters.
  List<LatLng> pointsBehind({
    required LatLng point,
    required double heading,
    double stepSize = 10,
    int num = 2,
  }) {
    // Whether the heading is closer to the line bearing or the opposite
    // bearing.
    final sign = compareToBearing(heading);

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
      (index) => offsetStart(currentOffset).offset(
        stepSize * (index - sign * stepOffset),
        switch (sign.isNegative) {
          true => bearing,
          false => bearing + 180,
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
        currentOffset,
        bearing,
        _line,
      ];
}
