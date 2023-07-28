import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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

  /// Compares [heading] to [bearing] to determine what should be left and
  /// right.
  ///
  /// Returns 1 if the [heading] is in the general forward direction of
  /// [bearing] (think upper half circle), and -1 when [heading] is in the
  /// general reverse direction of [bearing] (think lower half circle).
  int compareToBearing(double heading) =>
      (normalizeBearing(bearing - heading) - 180).abs() >= 90 ? 1 : -1;

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

  /// The signed perpendicular distance from [point] to the [offsetLine] with
  /// [currentOffset] offsets.
  ///
  /// A negative value means that we're to the left of the line in the
  /// when accounting for the [heading] and comparing it to the [bearing], and
  /// a positive value means that we're to the right of the line.
  double signedPerpendicularDistanceToCurrentLine({
    required LatLng point,
    required double heading,
  }) =>
      perpendicularDistanceToOffsetLine(currentOffset, point) *
      compareToBearing(heading);

  /// How many [width] offsets from the original [_line] we need to get the
  /// closest line.
  int numOffsetsToClosestLine(LatLng point) =>
      (perpendicularDistanceToLine(point) / width).round();

  /// Whether the [point] has a negative x-value on the realtive coordinate
  /// system where [start] is origo and [end] is along positive x axis.
  bool inNegativeDirection(LatLng point) =>
      jts.Angle.angleBetweenOriented(
        point.jtsCoordinate,
        start.jtsCoordinate,
        end.jtsCoordinate,
      ).abs() >
      pi / 2;

  /// The distance from [point] to the [offsetStart] point.
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
  List<LatLng> pointsAhead({
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
        _awaitToReengageSnap,
        currentOffset,
        bearing,
        _line,
      ];

  /// The next point on the [currentOffset]'s [offsetLine] in the [heading]
  /// direction from [point] with [lookAheadDistance] step size.
  LatLng nextForwardPoint(
    LatLng point,
    double heading,
    double lookAheadDistance,
  ) =>
      pointsAhead(
        point: point,
        heading: heading,
        stepSize: lookAheadDistance,
      ).first;

  /// The next point on the [currentOffset]'s [offsetLine] in the opposite
  /// direction to [heading] from [point] with [lookAheadDistance] step size.
  LatLng nextReversingPoint(
    LatLng point,
    double heading,
    double lookAheadDistance,
  ) =>
      pointsBehind(
        point: point,
        heading: heading,
        stepSize: lookAheadDistance,
      ).first;

  /// Finds the points that we use to get the secant line that intersects
  /// the circle with radius [lookAheadDistance] from the [vehicle]'s
  /// starting point.
  ///
  /// If the closest point is outside the circle, only this point will be
  /// returned.
  ({LatLng inside, LatLng? outside}) findLookAheadLinePoints(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final points = switch (vehicle.isReversing) {
      true => pointsBehind(
          point: vehicle.lookAheadStartPosition,
          heading: vehicle.bearing,
          stepSize: lookAheadDistance,
        ),
      false => pointsAhead(
          point: vehicle.lookAheadStartPosition,
          heading: vehicle.bearing,
          stepSize: lookAheadDistance,
        )
    };

    var insidePoint = points.first;

    var insideDistance = vehicle.lookAheadStartPosition.distanceTo(insidePoint);

    // If the closest point is outside look ahead circle we create an
    // intermediate point on the circle in the direction of the closest point.
    if (insideDistance >= lookAheadDistance) {
      return (
        inside: insidePoint = vehicle.lookAheadStartPosition
            .offset(lookAheadDistance, vehicle.position.bearingTo(insidePoint)),
        outside: null,
      );
    }

    LatLng? outsidePoint;
    for (var i = 1; i < points.length; i++) {
      final point = points[i];
      final distance = vehicle.lookAheadStartPosition.distanceTo(point);
      if (distance <= lookAheadDistance) {
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
  LatLng? vehicleToLookAheadLineProjection(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final points = findLookAheadLinePoints(vehicle, lookAheadDistance);

    if (points.outside == null) {
      return null;
    }
    final line = jts.LineSegment.fromCoordinates(
      points.inside.jtsCoordinate,
      points.outside!.jtsCoordinate,
    );

    return line
        .projectCoord(vehicle.lookAheadStartPosition.jtsCoordinate)
        .latLng;
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
  ({LatLng best, LatLng? worst}) findLookAheadCirclePoints(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final points = findLookAheadLinePoints(vehicle, lookAheadDistance);

    if (points.outside == null) {
      return (best: points.inside, worst: null);
    }

    final line = jts.LineSegment.fromCoordinates(
      points.inside.jtsCoordinate,
      points.outside!.jtsCoordinate,
    );

    final vehicleToLineProjection =
        line.projectCoord(vehicle.lookAheadStartPosition.jtsCoordinate).latLng;

    final vehicleToLineDistance = vehicle.lookAheadStartPosition.distanceTo(
      vehicleToLineProjection,
    );
    final projectionToCircleDistance =
        sqrt(pow(lookAheadDistance, 2) - pow(vehicleToLineDistance, 2));

    final pointA = vehicleToLineProjection.offset(
      projectionToCircleDistance,
      vehicleToLineProjection.bearingTo(points.inside),
    );

    final pointB = vehicleToLineProjection.offset(
      projectionToCircleDistance,
      normalizeBearing(
        vehicleToLineProjection.bearingTo(points.inside) + 180,
      ),
    );

    final distanceA = pointA.distanceTo(points.outside!);
    final distanceB = pointB.distanceTo(points.outside!);

    if (distanceA < distanceB) {
      return (best: pointA, worst: pointB);
    }
    return (best: pointB, worst: pointA);
  }

  /// Finds the next steering angle to reach the [currentOffset]'s [offsetLine]
  /// for the for the [vehicle] with the specified [lookAheadDistance].
  double nextSteeringAngleLookAhead({
    required Vehicle vehicle,
    required double lookAheadDistance,
  }) {
    final angle = vehicle.lookAheadStartPosition.bearingTo(
          findLookAheadCirclePoints(vehicle, lookAheadDistance).best,
        ) -
        vehicle.bearing;

    final steeringAngle = atan(
          2 * vehicle.wheelBase * sin(angle * pi / 180) / lookAheadDistance,
        ) *
        180 /
        pi;

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }
}
