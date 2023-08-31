import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:geobase/geobase.dart';

/// A class for combining vehicle information with it's position.
/// Useful to record paths and function as targets for auto-steering.
class WayPoint extends Equatable {
  /// A class for combining vehicle information with it's position.
  /// Useful to record paths and function as targets for auto-steering.
  ///
  /// [bearing] in degrees from 0-360.
  /// [velocity] in m/s.
  const WayPoint({
    required this.position,
    required this.bearing,
    this.velocity = 0,
  });

  /// The position of the waypoint.
  final Geographic position;

  /// The bearing of the vehicle at the time of recording.
  final double bearing;

  /// The velocity of the vehicle at the time of the recording.
  final double velocity;

  /// Returns a new [WayPoint] from this with altered parameters.
  WayPoint copyWith({
    Geographic? position,
    double? bearing,
    double? velocity,
  }) =>
      WayPoint(
        position: position ?? this.position,
        bearing: bearing ?? this.bearing,
        velocity: velocity ?? this.velocity,
      );

  /// Move the waypoint with a spherical great line by [distance] in the
  /// direction of [bearing] + [angleFromBearing].
  ///
  /// The updated bearing will be calculated at the new point as the
  /// bearing from old position to new minus the [angleFromBearing].
  WayPoint moveSpherical({
    required double distance,
    double angleFromBearing = 0,
  }) {
    final newPos = position.spherical.destinationPoint(
      distance: distance,
      bearing: bearing + angleFromBearing,
    );

    return copyWith(
      position: newPos,
      bearing: position.spherical.finalBearingTo(newPos) - angleFromBearing,
    );
  }

  /// Properties used to compare with [Equatable].
  @override
  List<Object?> get props => [
        position,
        bearing,
        velocity,
      ];
}

/// A class for tweening two [WayPoint].
///
/// Get the [WayPoint] at any given fraction value with [evaluate].
class WayPointTween extends Tween<WayPoint> {
  /// Creates a [WayPoint] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  WayPointTween({super.begin, super.end});

  // The inherited lerp() function doesn't work with WayPoint because it is a
  // complex object with two doubles that individually needs to be interpolated.
  @override
  WayPoint lerp(double t) {
    final position = switch (begin != null && end != null) {
      true => begin?.position.spherical
          .intermediatePointTo(end!.position, fraction: t),
      false => null
    };

    final bearing = switch (begin != null && position != null) {
      true => begin!.position.spherical.finalBearingTo(position!),
      false => null
    };

    final velocity = Tween<double>(
      begin: begin?.velocity,
      end: end?.velocity,
    ).lerp(t);

    return WayPoint(
      position: position ?? const Geographic(lon: 0, lat: 0),
      bearing: bearing ?? 0,
      velocity: velocity,
    );
  }
}
