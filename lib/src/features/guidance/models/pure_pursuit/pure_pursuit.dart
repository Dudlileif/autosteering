import 'dart:math';

import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

/// An enumerator for which steering mode the [PurePursuit] model should
/// use.
enum PurePursuitMode {
  /// Use a PID-controller mode to control the steering.
  pid,

  /// Use a look ahead mode to control the steering.
  lookAhead,
}

/// An enumerator for if/how the last and first points of the path of the
/// [PurePursuit] should loop.
enum PurePursuitLoopMode {
  /// Don't loop when reaching the end.
  none,

  /// Loop to the start point by using a straight line from the end point.
  straight,

  /// Loop to the start point by using a Dubins path from the end point.
  dubins,
}

/// A class for path tracking that utilizes the pure pursuit algorithm.
///
/// The pure pursuit algorithm finds a point a certain distance ahead of it and
/// attempts to chase it. This continually happens until the end of the path is
/// reached, where it can loop back to the starting point in a couple different
/// ways or stop tracking.
class PurePursuit {
  /// A class for path tracking that utilizes the pure pursuit algorithm.
  ///
  /// The pure pursuit algorithm finds a point a certain distance ahead of it
  /// and attempts to chase it. This continually happens until the end of the
  /// path is reached, where it can loop back to the starting point in a couple
  /// different ways or stop tracking.
  ///
  /// The [wayPoints] gives the path that the vehicle should follow.
  /// The [interpolationDistance] is the maximum distance between points in the
  /// path, points will be interpolated if the [wayPoints] are too far apart.
  /// The [loopMode] dictates what the vehicle should do when it finishes the
  /// path.
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
      if (point.position.spherical.distanceTo(nextPoint.position) >
          maxDistance) {
        path.insert(
          index + 1,
          point.copyWith(
            position: point.position.spherical.destinationPoint(
              distance: maxDistance,
              bearing:
                  point.position.spherical.initialBearingTo(nextPoint.position),
            ),
          ),
        );
      }
      index++;
    }

    if (loopMode == PurePursuitLoopMode.straight) {
      while (path.last.position.spherical.distanceTo(
            path.first.position,
          ) >
          maxDistance) {
        path.add(
          path.last.copyWith(
            position: path.last.position.spherical.destinationPoint(
              distance: maxDistance,
              bearing: path.last.position.spherical
                  .initialBearingTo(path.first.position),
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
  Geographic perpendicularIntersect(
    Vehicle vehicle,
  ) {
    final nextPoint = nextWayPoint(vehicle).position;

    final distanceAlong = vehicle.pursuitAxlePosition.spherical
        .alongTrackDistanceTo(start: currentWayPoint.position, end: nextPoint);

    final bearing =
        currentWayPoint.position.spherical.initialBearingTo(nextPoint);

    assert(!bearing.isNaN, 'Bearing error');

    return currentWayPoint.position.spherical
        .destinationPoint(distance: distanceAlong, bearing: bearing);
  }

  /// The distance from the vehicle to the [perpendicularIntersect] point.
  ///
  /// The value is negative if the vehicle is to the left of the line.
  double perpendicularDistance(
    Vehicle vehicle,
  ) =>
      vehicle.pursuitAxlePosition.spherical.crossTrackDistanceTo(
        start: currentWayPoint.position,
        end: nextWayPoint(vehicle).position,
      );

  /// The waypoint in [path] that is closest to the [vehicle].
  WayPoint closestWayPoint(
    Vehicle vehicle,
  ) =>
      path.reduce(
        (value, element) => element.position.spherical.distanceTo(
                  vehicle.pursuitAxlePosition,
                ) <
                value.position.spherical.distanceTo(vehicle.pursuitAxlePosition)
            ? element
            : value,
      );

  /// The index of the [closestWayPoint].
  int closestIndex(Vehicle vehicle) => path.indexOf(closestWayPoint(vehicle));

  /// Try to advance to the next waypoint in the list.
  void tryChangeWayPoint(
    Vehicle vehicle,
  ) {
    final nextPoint = nextWayPoint(vehicle).position;

    final progress = vehicle.pursuitAxlePosition.spherical.alongTrackDistanceTo(
      start: currentWayPoint.position,
      end: nextPoint,
    );
    if (progress > currentWayPoint.position.spherical.distanceTo(nextPoint)) {
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
  ({WayPoint inside, WayPoint? outside}) findLookAheadLinePoints(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    var insidePoint = nextWayPoint(vehicle);

    var insideDistance = vehicle.lookAheadStartPosition.spherical.distanceTo(
      insidePoint.position,
    );

    // If the closest point is outside look ahead circle we create an
    // intermediate point on the circle in the direction of the closest point.
    if (insideDistance >= lookAheadDistance) {
      return (
        inside: insidePoint.copyWith(
          position: vehicle.lookAheadStartPosition.spherical.destinationPoint(
            distance: lookAheadDistance,
            bearing: vehicle.lookAheadStartPosition.spherical
                .initialBearingTo(insidePoint.position),
          ),
        ),
        outside: null,
      );
    }

    WayPoint? outsidePoint;

    for (var i = 1; i < path.length; i++) {
      final index = nextIndex(vehicle) +
          switch (vehicle.isReversing) {
            true => -i,
            false => i,
          };
      final point = path[index % path.length];
      final distance =
          vehicle.lookAheadStartPosition.spherical.distanceTo(point.position);
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
  /// vehicle's starting point.
  Geographic? lookAheadVehicleToLineProjection(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final points = findLookAheadLinePoints(vehicle, lookAheadDistance);

    if (points.outside == null) {
      return null;
    }

    final crossDistance =
        vehicle.lookAheadStartPosition.spherical.crossTrackDistanceTo(
      start: points.inside.position,
      end: points.outside!.position,
    );

    final secantBearing = points.inside.position.spherical
        .initialBearingTo(points.outside!.position);

    return vehicle.lookAheadStartPosition.spherical.destinationPoint(
      distance: crossDistance,
      bearing: secantBearing - 90,
    );
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
  ({WayPoint best, WayPoint? worst}) findLookAheadCirclePoints(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final points = findLookAheadLinePoints(vehicle, lookAheadDistance);

    if (points.outside == null) {
      return (best: points.inside, worst: null);
    }

    final vehicleAlongDistance =
        vehicle.lookAheadStartPosition.spherical.alongTrackDistanceTo(
      start: points.inside.position,
      end: points.outside!.position,
    );

    final vehicleToLineDistance =
        vehicle.lookAheadStartPosition.spherical.crossTrackDistanceTo(
      start: points.inside.position,
      end: points.outside!.position,
    );

    final projectionToCircleDistance =
        sqrt(pow(lookAheadDistance, 2) - pow(vehicleToLineDistance, 2));

    final secantBearing = points.inside.position.spherical
        .initialBearingTo(points.outside!.position);

    final vehicleToLineProjection =
        points.inside.position.spherical.destinationPoint(
      distance: vehicleAlongDistance,
      bearing: secantBearing,
    );

    var vehicleLineProjectionToInsidePointBearing = vehicleToLineProjection
        .spherical
        .initialBearingTo(points.inside.position);
    if (vehicleLineProjectionToInsidePointBearing.isNaN) {
      vehicleLineProjectionToInsidePointBearing = secantBearing;
    }

    final pointA = vehicleToLineProjection.spherical.destinationPoint(
      distance: projectionToCircleDistance,
      bearing: vehicleLineProjectionToInsidePointBearing,
    );

    final pointB = vehicleToLineProjection.spherical.destinationPoint(
      distance: projectionToCircleDistance,
      bearing: (vehicleLineProjectionToInsidePointBearing + 180).wrap360(),
    );

    final distanceA = pointA.spherical.distanceTo(points.outside!.position);
    final distanceB = pointB.spherical.distanceTo(points.outside!.position);

    final wayPointA = WayPoint(
      position: pointA,
      bearing: points.inside.position.spherical.finalBearingTo(pointA),
      velocity: points.inside.velocity,
    );
    final wayPointB = WayPoint(
      position: pointB,
      bearing: points.inside.position.spherical.finalBearingTo(pointB),
      velocity: points.inside.velocity,
    );

    if (distanceA < distanceB) {
      return (best: wayPointA, worst: wayPointB);
    }
    return (best: wayPointB, worst: wayPointA);
  }

  /// Calculates the steering angle needed to reach the target point when
  /// using a the look ahead method.
  double nextSteeringAngleLookAhead(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final angle = vehicle.lookAheadStartPosition.spherical.initialBearingTo(
          findLookAheadCirclePoints(vehicle, lookAheadDistance).best.position,
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
