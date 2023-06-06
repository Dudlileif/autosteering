import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:latlong2/latlong.dart';

part 'pure_pursuit_loop_mode.dart';
part 'pure_pursuit_mode.dart';

const _distance = Distance(roundResult: false);

/// A class for path tracking that utilizes the pure pursuit algorithm.
///
/// The pure pursuit algorithm finds a point a certain distance ahead of it and
/// attempts to chase it. This continually happens until the end of the path is
/// reached, where it can loop back to the starting point in a couple different
/// ways or stop tracking.
class PurePursuit {
  PurePursuit({
    required this.wayPoints,
    double interpolationDistance = 4,
    PurePursuitLoopMode loopMode = PurePursuitLoopMode.none,
  }) {
    interPolateWayPoints(
      maxDistance: interpolationDistance,
      loopMode: loopMode,
    );
  }

  /// The list of waypoints to interpolate from.
  final List<WayPoint> wayPoints;

  /// The list of waypoints that the vehicle should follow.
  late List<WayPoint> path;

  /// The PID controller for controlling the steering angle.
  final pidController = PidController();

  /// The index of the current way point.
  int currentIndex = 0;

  /// Interpolates the [wayPoints] and puts the result in [path].
  ///
  /// The maximum distances between the points are [maxDistance] and if
  /// [loopMode] is specified, a path from the last point to the first
  /// is added.
  void interPolateWayPoints({
    double maxDistance = 4,
    PurePursuitLoopMode loopMode = PurePursuitLoopMode.none,
  }) {
    path = List<WayPoint>.from(wayPoints);

    var index = 0;

    while (index + 1 < path.length) {
      final point = path[index];
      final nextPoint = path[index + 1];
      if (_distance.distance(point.position, nextPoint.position) >
          maxDistance) {
        path.insert(
          index + 1,
          point.copyWith(
            position: _distance.offset(
              point.position,
              maxDistance,
              _distance.bearing(point.position, nextPoint.position),
            ),
          ),
        );
      }
      index++;
    }

    if (loopMode == PurePursuitLoopMode.straight) {
      while (_distance.distance(
            path.last.position,
            path.first.position,
          ) >
          maxDistance) {
        path.add(
          path.last.copyWith(
            position: _distance.offset(
              path.last.position,
              maxDistance,
              _distance.bearing(
                path.last.position,
                path.first.position,
              ),
            ),
          ),
        );
      }
    } else if (loopMode == PurePursuitLoopMode.dubins) {
      final dubinsPath = DubinsPath(
        start: path.last,
        end: path.first,
        turningRadius: 6,
        stepSize: maxDistance / 3,
      ).bestDubinsPathPlan?.wayPoints;

      if (dubinsPath != null) {
        // Skip the first and last point of the dubins path to avoid duplicates
        // that cause wrong calculations.
        path.addAll(dubinsPath.getRange(1, dubinsPath.length - 2));
      }
    }
  }

  /// The index of the next waypoint when driving forward.
  int get nextForwardIndex => switch (currentIndex == path.length - 1) {
        true => 0,
        false => currentIndex + 1
      };

  /// The index of the next (previous) waypoint when driving in reverse.
  int get nextReversingIndex => switch (currentIndex == 0) {
        true => path.length - 1,
        false => currentIndex - 1
      };

  /// The current waypoint.
  WayPoint get currentWayPoint => path[currentIndex];

  /// The next waypoint when driving forward.
  WayPoint get nextForwardWayPoint => path[nextForwardIndex];

  /// The next waypoint when driving in reverse.
  WayPoint get nextReversingWayPoint => path[nextReversingIndex];

  /// The next waypoint index with vehicle driving direction taken into
  /// consideration.
  int nextIndex(Vehicle vehicle) => switch (vehicle.isReversing) {
        true => nextReversingIndex,
        false => nextForwardIndex,
      };

  /// The next waypoint with vehicle driving direction taken into consideration.
  WayPoint nextWayPoint(Vehicle vehicle) => switch (vehicle.isReversing) {
        true => nextReversingWayPoint,
        false => nextForwardWayPoint,
      };

  /// The intersection point that is projected from the vehicle onto the
  /// line from the current to the next waypoint.
  LatLng perpendicularIntersect(
    Vehicle vehicle,
  ) {
    final intersect = jts.LineSegment.fromCoordinates(
      currentWayPoint.position.jtsCoordinate,
      nextWayPoint(vehicle).position.jtsCoordinate,
    ).projectCoord(vehicle.pursuitAxlePosition.jtsCoordinate);

    return intersect.latLng;
  }

  /// The distance from the vehicle to the [perpendicularIntersect] point.
  ///
  /// The value is negative if the line is to the left of the vehicle.
  double perpendicularDistance(
    Vehicle vehicle,
  ) {
    final intersect = perpendicularIntersect(vehicle);

    final orientation = jts.Orientation.index(
      nextWayPoint(vehicle).position.jtsCoordinate,
      vehicle.pursuitAxlePosition.jtsCoordinate,
      intersect.jtsCoordinate,
    );

    return -orientation *
        _distance.distance(vehicle.pursuitAxlePosition, intersect);
  }

  /// The waypoint in [path] that is closest to the [vehicle].
  WayPoint closestWayPoint(
    Vehicle vehicle,
  ) =>
      path.reduce(
        (value, element) => _distance.distance(
                  element.position,
                  vehicle.pursuitAxlePosition,
                ) <
                _distance.distance(value.position, vehicle.pursuitAxlePosition)
            ? element
            : value,
      );

  /// The index of the [closestWayPoint].
  int closestIndex(Vehicle vehicle) => path.indexOf(closestWayPoint(vehicle));

  /// Try to advance to the next waypoint in the list.
  void tryChangeWayPoint(
    Vehicle vehicle,
  ) {
    final progress = jts.LineSegment.fromCoordinates(
      currentWayPoint.position.jtsCoordinate,
      nextWayPoint(vehicle).position.jtsCoordinate,
    ).projectionFactor(vehicle.pursuitAxlePosition.jtsCoordinate);
    if (progress > 1) {
      currentIndex = nextIndex(vehicle);
    }
  }

  /// Calculates the steering angle needed to reach the target point when
  /// using a PID controller.
  double nextSteeringAnglePid(Vehicle vehicle) {
    final steeringAngle = pidController.nextValue(
      perpendicularDistance(vehicle),
      vehicle.pidParameters,
    );

    final sign = switch (vehicle.isReversing) {
      true => -1,
      false => 1,
    };

    return sign *
        steeringAngle.clamp(
          -vehicle.steeringAngleMax,
          vehicle.steeringAngleMax,
        );
  }

  /// Finds the points that we use to get the secant line that intersects
  /// the circle with radius [lookAheadDistance] from the [vehicle]'s
  /// starting point.
  ///
  /// If the closest point is outside the circle, only this point will be
  /// returned.
  (WayPoint inside, WayPoint? outside) findLookAheadLinePoints(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    var insidePoint = nextWayPoint(vehicle);

    var insideDistance = _distance.distance(
      vehicle.lookAheadStartPosition,
      insidePoint.position,
    );

    // If the closest point is outside look ahead circle we create an
    // intermediate point on the circle in the direction of the closest point.
    if (insideDistance >= lookAheadDistance) {
      return (
        insidePoint.copyWith(
          position: _distance.offset(
            vehicle.lookAheadStartPosition,
            lookAheadDistance,
            _distance.bearing(vehicle.position, insidePoint.position),
          ),
        ),
        null,
      );
    }

    late WayPoint outsidePoint;

    for (var i = 1; i < path.length; i++) {
      final index = nextIndex(vehicle) +
          switch (vehicle.isReversing) {
            true => -i,
            false => i,
          };
      final point = path[index % path.length];
      final distance =
          _distance.distance(vehicle.lookAheadStartPosition, point.position);
      if (distance <= lookAheadDistance) {
        insidePoint = point;
        insideDistance = distance;
      } else {
        outsidePoint = point;
        break;
      }
    }
    return (insidePoint, outsidePoint);
  }

  /// The point on the secant line that is the shortest distance from the
  /// vehicle's starting point.
  LatLng? lookAheadVehicleToLineProjection(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final (insidePoint, outsidePoint) =
        findLookAheadLinePoints(vehicle, lookAheadDistance);

    if (outsidePoint == null) {
      return null;
    }
    final line = jts.LineSegment.fromCoordinates(
      insidePoint.position.jtsCoordinate,
      outsidePoint.position.jtsCoordinate,
    );

    return line
        .projectCoord(vehicle.lookAheadStartPosition.jtsCoordinate)
        .latLng;
  }

  /// Finds the intersection waypoints on the look ahead circle.
  ///
  /// A single waypoint is returned when there is no points in the look ahead
  /// circle. This waypoint is pointing directly towards the next waypoint
  /// outside the circle from the vehicle's starting position.
  ///
  /// If the secant line exists and intersects the circle, the intersection
  /// points are returned as the best and worst, sorted by their distance to
  /// the next point outside the circle. The best point is what should be
  /// used for path tracking.
  (WayPoint best, WayPoint? worst) findLookAheadCirclePoints(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final (insidePoint, outsidePoint) =
        findLookAheadLinePoints(vehicle, lookAheadDistance);

    if (outsidePoint == null) {
      return (insidePoint, null);
    }

    final line = jts.LineSegment.fromCoordinates(
      insidePoint.position.jtsCoordinate,
      outsidePoint.position.jtsCoordinate,
    );

    final vehicleToLineProjection =
        line.projectCoord(vehicle.lookAheadStartPosition.jtsCoordinate).latLng;

    final vehicleToLineDistance = _distance.distance(
      vehicle.lookAheadStartPosition,
      vehicleToLineProjection,
    );
    final projectionToCircleDistance =
        sqrt(pow(lookAheadDistance, 2) - pow(vehicleToLineDistance, 2));

    final pointA = _distance.offset(
      vehicleToLineProjection,
      projectionToCircleDistance,
      _distance.bearing(vehicleToLineProjection, insidePoint.position),
    );

    final pointB = _distance.offset(
      vehicleToLineProjection,
      projectionToCircleDistance,
      normalizeBearing(
        _distance.bearing(vehicleToLineProjection, insidePoint.position) + 180,
      ),
    );

    final distanceA = _distance.distance(pointA, outsidePoint.position);
    final distanceB = _distance.distance(pointB, outsidePoint.position);

    final wayPointA = WayPoint(
      position: pointA,
      heading: _distance.bearing(insidePoint.position, outsidePoint.position),
      velocity: insidePoint.velocity,
    );

    final wayPointB = WayPoint(
      position: pointB,
      heading: _distance.bearing(insidePoint.position, outsidePoint.position),
      velocity: insidePoint.velocity,
    );

    if (distanceA < distanceB) {
      return (wayPointA, wayPointB);
    }
    return (wayPointB, wayPointA);
  }

  /// Calculates the steering angle needed to reach the target point when
  /// using a the look ahead method.
  double nextSteeringAngleLookAhead(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final angle = _distance.bearing(
          vehicle.lookAheadStartPosition,
          findLookAheadCirclePoints(vehicle, lookAheadDistance).$1.position,
        ) -
        vehicle.heading;

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
