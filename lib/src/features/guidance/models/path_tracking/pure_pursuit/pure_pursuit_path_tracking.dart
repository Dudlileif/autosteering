part of '../path_tracking.dart';

/// A class for path tracking that utilizes the pure pursuit algorithm.
///
/// The pure pursuit algorithm finds a point a certain distance ahead of the
/// vehicle and attempts to chase it. This continually happens until the end of
/// the path is reached, where it can loop back to the starting point in a
/// couple different ways or stop tracking.
final class PurePursuitPathTracking extends PathTracking {
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
  /// The [loopMode] dictates what the vehicle should do when it finishes the
  /// path.
  PurePursuitPathTracking({
    required super.wayPoints,
    super.interpolationDistance,
    super.loopMode,
    super.name,
  });

  /// Finds the points that we use to get the secant line that intersects
  /// the circle with radius [lookAheadDistance] from the [vehicle]'s
  /// starting point.
  ///
  /// If the closest point is outside the circle, only this point will be
  /// returned.
  ({WayPoint inside, WayPoint? outside}) findLookAheadLinePoints(
    Vehicle vehicle, [
    double? lookAheadDistance,
  ]) {
    var insidePoint = nextWayPoint(vehicle);

    var insideDistance = vehicle.lookAheadStartPosition.rhumb.distanceTo(
      insidePoint.position,
    );

    // If the closest point is outside look ahead circle we create an
    // intermediate point on the circle in the direction of the closest point.
    if (insideDistance >= (lookAheadDistance ?? vehicle.lookAheadDistance)) {
      return (
        inside: insidePoint.copyWith(
          position: vehicle.lookAheadStartPosition.rhumb.destinationPoint(
            distance: lookAheadDistance ?? vehicle.lookAheadDistance,
            bearing: vehicle.lookAheadStartPosition.rhumb
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
          vehicle.lookAheadStartPosition.rhumb.distanceTo(point.position);
      if (distance <= (lookAheadDistance ?? vehicle.lookAheadDistance)) {
        insidePoint = point;
        insideDistance = distance;
      } else {
        outsidePoint = point;
        break;
      }
    }

    if (loopMode == PathTrackingLoopMode.none) {
      if (vehicle.isReversing && outsidePoint == path.last) {
        return (
          inside: path.first.moveRhumb(
            distance: vehicle.lookAheadDistance -
                vehicle.lookAheadStartPosition.rhumb
                    .distanceTo(path.first.position)
                    .clamp(0, vehicle.lookAheadDistance),
          ),
          outside: null
        );
      } else if (!vehicle.isReversing && outsidePoint == path.first) {
        return (
          inside: path.last.moveRhumb(
            distance: vehicle.lookAheadDistance -
                vehicle.lookAheadStartPosition.rhumb
                    .distanceTo(path.last.position)
                    .clamp(0, vehicle.lookAheadDistance),
          ),
          outside: null
        );
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

    final secantBearing =
        points.inside.position.rhumb.initialBearingTo(points.outside!.position);

    return vehicle.lookAheadStartPosition.rhumb.destinationPoint(
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
    Vehicle vehicle, [
    double? lookAheadDistance,
  ]) {
    final points = findLookAheadLinePoints(
      vehicle,
      lookAheadDistance ?? vehicle.lookAheadDistance,
    );

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

    final projectionToCircleDistance = sqrt(
      pow(lookAheadDistance ?? vehicle.lookAheadDistance, 2) -
          pow(vehicleToLineDistance, 2),
    );

    final secantBearing =
        points.inside.position.rhumb.initialBearingTo(points.outside!.position);

    final vehicleToLineProjection =
        points.inside.position.rhumb.destinationPoint(
      distance: vehicleAlongDistance,
      bearing: secantBearing,
    );

    var vehicleLineProjectionToInsidePointBearing =
        vehicleToLineProjection.rhumb.initialBearingTo(points.inside.position);
    if (vehicleLineProjectionToInsidePointBearing.isNaN) {
      vehicleLineProjectionToInsidePointBearing = secantBearing;
    }

    final pointA = vehicleToLineProjection.rhumb.destinationPoint(
      distance: projectionToCircleDistance,
      bearing: vehicleLineProjectionToInsidePointBearing,
    );

    final pointB = vehicleToLineProjection.rhumb.destinationPoint(
      distance: projectionToCircleDistance,
      bearing: (vehicleLineProjectionToInsidePointBearing + 180).wrap360(),
    );

    final distanceA = pointA.rhumb.distanceTo(points.outside!.position);
    final distanceB = pointB.rhumb.distanceTo(points.outside!.position);

    final wayPointA = WayPoint(
      position: pointA,
      bearing: points.inside.position.rhumb.finalBearingTo(pointA),
      velocity: points.inside.velocity,
    );
    final wayPointB = WayPoint(
      position: pointB,
      bearing: points.inside.position.rhumb.finalBearingTo(pointB),
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
  double _nextSteeringAngleLookAhead(Vehicle vehicle) {
    final lookAheadPoint =
        findLookAheadCirclePoints(vehicle, vehicle.lookAheadDistance)
            .best
            .position;

    final bearingToPoint =
        vehicle.lookAheadStartPosition.rhumb.initialBearingTo(lookAheadPoint);

    final angle = signedBearingDifference(
      vehicle.bearing,
      bearingToPoint,
    );

    final steeringAngle = atan(
      2 *
          vehicle.wheelBase *
          sin(angle.toRadians()) /
          vehicle.lookAheadDistance,
    ).toDegrees();

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }

  @override
  double nextSteeringAngle(Vehicle vehicle) {
    tryChangeWayPoint(vehicle);
    return _nextSteeringAngleLookAhead(vehicle);
  }

  @override
  Map<String, dynamic> toJson() =>
      super.toJson()..['mode'] = PathTrackingMode.purePursuit;
}
