part of '../path_tracking.dart';

/// A class for path tracking that utilizes the pure pursuit algorithm.
///
/// The pure pursuit algorithm finds a point a certain distance ahead of it and
/// attempts to chase it. This continually happens until the end of the path is
/// reached, where it can loop back to the starting point in a couple different
/// ways or stop tracking.
final class PurePursuit extends PathTracking {
  /// A class for path tracking that utilizes the pure pursuit algorithm.
  ///
  /// The pure pursuit algorithm finds a point a certain distance ahead of it
  /// and attempts to chase it. This continually happens until the end of the
  /// path is reached, where it can loop back to the starting point in a couple
  /// different ways or stop tracking.
  ///
  /// The [wayPoints] gives the path that the vehicle should follow.
  ///
  /// The [interpolationDistance] is the maximum distance between
  /// points in the path, points will be interpolated if the [wayPoints] are
  /// too far apart.
  ///
  /// The [loopMode] dictates what the vehicle should do when it
  /// finishes the path.
  PurePursuit({
    required super.wayPoints,
    super.interpolationDistance,
    super.loopMode,
  });

  /// The PID controller for controlling the steering angle.
  final pidController = PidController();

  /// The intersection point that is projected from the vehicle onto the
  /// line from the current to the next waypoint.
  @override
  Geographic perpendicularIntersect(Vehicle vehicle) {
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
  @override
  double perpendicularDistance(Vehicle vehicle) {
    final sign = switch (vehicle.isReversing) {
      false => 1,
      true => -1,
    };

    return sign *
        vehicle.pursuitAxlePosition.spherical.crossTrackDistanceTo(
          start: currentWayPoint.position,
          end: nextWayPoint(vehicle).position,
        );
  }

  /// The waypoint in [path] that is closest to the [vehicle].
  @override
  WayPoint closestWayPoint(Vehicle vehicle) => path.reduce(
        (value, element) => element.position.spherical.distanceTo(
                  vehicle.pursuitAxlePosition,
                ) <
                value.position.spherical.distanceTo(vehicle.pursuitAxlePosition)
            ? element
            : value,
      );

  /// Try to advance to the next waypoint in the list.
  @override
  void tryChangeWayPoint(Vehicle vehicle) {
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

    return steeringAngle.clamp(
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
  ///
  /// https://thomasfermi.github.io/Algorithms-for-Automated-Driving/Control/PurePursuit.html
  double nextSteeringAngleLookAhead(
    Vehicle vehicle,
    double lookAheadDistance,
  ) {
    final bearingToPoint =
        vehicle.lookAheadStartPosition.spherical.initialBearingTo(
      findLookAheadCirclePoints(vehicle, lookAheadDistance).best.position,
    );

    final angle = signedBearingDifference(
      vehicle.bearing,
      bearingToPoint,
    );

    final steeringAngle = atan(
      2 * vehicle.wheelBase * sin(angle.toRadians()) / lookAheadDistance,
    ).toDegrees();

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }
}
