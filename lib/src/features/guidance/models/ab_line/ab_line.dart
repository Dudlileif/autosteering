import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:latlong2/latlong.dart';

/// A class for creating and tracking straight lines by using the bearing
/// from point A to point B and their positions to create parallel lines.
class ABLine {
  /// Create an AB-line from the [start] point A and the [end] point B.
  ///
  /// The [width] of the line determines when we should swap to the next line
  /// over, i.e. when the perpendicular distance to the line is larger than
  /// [width]/2.
  ABLine({
    required this.start,
    required this.end,
    required this.width,
  })  : bearing = start.bearingTo(end),
        _line = jts.LineSegment.fromCoordinates(
          start.jtsCoordinate,
          end.jtsCoordinate,
        );

  /// Point A, the starting point for creating the AB-line.
  final LatLng start;

  /// Point B, the ending point for creating the AB-line.
  final LatLng end;

  /// How wide an AB-line should be, as in when to skip to the next line over.
  final double width;

  /// The bearing of the AB-line, i.e. the bearing from [start] point A to [end]
  /// point B.
  final double bearing;

  /// The line segment between [start] and [end].
  final jts.LineSegment _line;

  /// The perpendicular intersect from the [point] to the original [_line].
  jts.Coordinate perpendicularIntersect(LatLng point) =>
      _line.projectCoord(point.jtsCoordinate);

  /// The perpendicular distance from [point] to the original [_line].
  ///
  /// The distance is negative if the point is to the left of the [_line].
  double distanceToLine(LatLng point) {
    final orientation = jts.Orientation.index(
      start.jtsCoordinate,
      end.jtsCoordinate,
      point.jtsCoordinate,
    );
    return -orientation *
        point.distanceTo(perpendicularIntersect(point).latLng);
  }

  /// How many [width] offsets from the original [_line] we need to get the
  /// [closestLine].
  int numOffsetsToClosestLine(LatLng point) =>
      (distanceToLine(point) / width).round();

  /// The start point A for the line closest to [point].
  LatLng closestStart(LatLng point) =>
      start.offset(numOffsetsToClosestLine(point) * width, bearing + 90);

  /// The end point B for the line closest to [point].
  LatLng closestEnd(LatLng point) =>
      end.offset(numOffsetsToClosestLine(point) * width, bearing + 90);

  /// The offset line closest to [point].
  jts.LineSegment closestLine(LatLng point) => jts.LineSegment.fromCoordinates(
        closestStart(point).jtsCoordinate,
        closestEnd(point).jtsCoordinate,
      );

  /// The perpendicular intersect from [point] to the [closestLine].
  jts.Coordinate closestPerpendicularIntersect(LatLng point) =>
      closestLine(point).projectCoord(point.jtsCoordinate);

  /// The perpendicular distance from [point] to the [closestLine].
  ///
  /// The distance is negative if the point is to the left of the [closestLine].
  double distanceToClosestLine(LatLng point) {
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
  double closestIntersectToStartDistance(LatLng point) {
    final distance = closestStart(point).distanceTo(point);

    return switch (inNegativeDirection(point)) {
      true => -distance,
      false => distance
    };
  }

  /// Calculates a list of [num] points along the [closestLine] ahead of the
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
    final sign =
        (normalizeBearing(bearing - heading) - 180).abs() >= 90 ? 1 : -1;

    var stepOffset = (closestIntersectToStartDistance(point) / stepSize).ceil();

    if (sign.isNegative) {
      stepOffset--;
    }

    return List.generate(
      num,
      (index) => closestStart(point).offset(
        stepSize * (index + sign * stepOffset),
        switch (sign.isNegative) {
          true => bearing + 180,
          false => bearing,
        },
      ),
      growable: false,
    );
  }

  /// Calculates a list of [num] points along the [closestLine] behind of the
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
    final sign =
        (normalizeBearing(bearing - heading) - 180).abs() >= 90 ? 1 : -1;

    var stepOffset =
        (closestIntersectToStartDistance(point) / stepSize).floor();

    if (sign.isNegative) {
      stepOffset++;
    }

    return List.generate(
      num,
      (index) => closestStart(point).offset(
        stepSize * (index - sign * stepOffset),
        switch (sign.isNegative) {
          true => bearing,
          false => bearing + 180,
        },
      ),
      growable: false,
    );
  }
}
