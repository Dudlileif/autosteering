part of '../path_tracking.dart';

/// A class for path tracking that utilizes the Stanley controller algorithm.
final class StanleyPathTracking extends PathTracking {
  /// A class for path tracking that utilizes the Stanley controller algorithm.
  ///
  /// The Stanley algorithm finds a point perpendicular to the
  /// [Vehicle.stanleyAxlePosition] (typically the steering axle) and measures
  /// the cross distance, and finds the difference in bearing between the
  /// point's curvature and the [Vehicle.bearing]. The resulting steering
  /// angle is the sum of the bearing difference and the [atan] of the
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
  /// The [loopMode] dictates what the vehicle should do when it finishes the
  /// path.
  StanleyPathTracking({
    required super.wayPoints,
    super.interpolationDistance,
    super.loopMode,
    super.name,
  });

  /// The next steering angle for the [vehicle] for following the [path].
  ///
  /// [mode] does nothing for this tracking type.
  @override
  double nextSteeringAngle(Vehicle vehicle, {PathTrackingMode? mode}) {
    tryChangeWayPoint(vehicle);

    final parameters = vehicle.stanleyParameters;

    final headingError = signedBearingDifference(
      vehicle.bearing,
      currentWayPoint(vehicle).bearing,
    );

    final sign = switch (vehicle.isReversing) {
      true => -1,
      false => 1,
    };

    final steeringAngle = sign * headingError +
        atan(
          parameters.crossDistanceGain *
              -perpendicularDistance(vehicle) /
              (parameters.softeningGain +
                  parameters.velocityGain * vehicle.velocity.abs()),
        ).toDegrees();

    return steeringAngle.clamp(
      -vehicle.steeringAngleMax,
      vehicle.steeringAngleMax,
    );
  }

  @override
  Map<String, dynamic> toJson() =>
      super.toJson()..['mode'] = PathTrackingMode.stanley;
}
