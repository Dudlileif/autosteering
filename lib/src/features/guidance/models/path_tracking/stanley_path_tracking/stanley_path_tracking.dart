part of '../path_tracking.dart';

/// A class for path tracking that utilizes the Sanley controller algorithm.
final class StanleyPathTracking extends PathTracking {
  /// A class for path tracking that utilizes the Sanley controller algorithm.
  ///
  /// The Stanley algorithm finds a point perpendicular to the
  /// [Vehicle.stanleyAxlePosition] (typically the steering axle) and measures
  /// the cross distance, and finds the difference in bearing between the
  /// point's curvature and the [Vehicle.bearing]. The resulting steering
  /// angle is the sum of the bearing difference and the atan of the
  /// cross distance.
  ///
  /// This continually happens until the end of the
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
  StanleyPathTracking({
    required super.wayPoints,
    super.interpolationDistance,
    super.loopMode,
  });

  @override
  Geographic perpendicularIntersect(Vehicle vehicle) {
    final nextPoint = nextWayPoint(vehicle).position;

    final distanceAlong = vehicle.stanleyAxlePosition.spherical
        .alongTrackDistanceTo(start: currentWayPoint.position, end: nextPoint);

    final bearing =
        currentWayPoint.position.spherical.initialBearingTo(nextPoint);

    assert(!bearing.isNaN, 'Bearing error');

    return currentWayPoint.position.spherical
        .destinationPoint(distance: distanceAlong, bearing: bearing);
  }

  @override
  double perpendicularDistance(Vehicle vehicle) {
    final sign = switch (vehicle.isReversing) {
      false => 1,
      true => -1,
    };

    return sign *
        vehicle.stanleyAxlePosition.spherical.crossTrackDistanceTo(
          start: currentWayPoint.position,
          end: nextWayPoint(vehicle).position,
        );
  }

  @override
  WayPoint closestWayPoint(Vehicle vehicle) => path.reduce(
        (value, element) => element.position.spherical.distanceTo(
                  vehicle.stanleyAxlePosition,
                ) <
                value.position.spherical.distanceTo(vehicle.stanleyAxlePosition)
            ? element
            : value,
      );

  @override
  void tryChangeWayPoint(Vehicle vehicle) {
    final nextPoint = nextWayPoint(vehicle).position;

    final progress = vehicle.stanleyAxlePosition.spherical.alongTrackDistanceTo(
      start: currentWayPoint.position,
      end: nextPoint,
    );
    if (progress > currentWayPoint.position.spherical.distanceTo(nextPoint)) {
      currentIndex = nextIndex(vehicle);
    }
  }

  /// The next steering angle for the [vehicle] for following the [path].
  double nextSteeringAngle({required Vehicle vehicle}) {
    final parameters = vehicle.stanleyParameters;

    final headingError = signedBearingDifference(
      vehicle.bearing,
      currentWayPoint.bearing,
    );

    final sign = switch (vehicle.isReversing) {
      true => -1,
      false => 1,
    };

    final steeringAngle = sign * headingError +
        atan(
          parameters.crossDistanceCoefficient *
              -perpendicularDistance(vehicle) /
              (parameters.softeningCoefficient +
                  parameters.velocityCoefficient * vehicle.velocity.abs()),
        ).toDegrees();

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }
}
