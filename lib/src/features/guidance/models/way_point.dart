import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:latlong2/latlong.dart';

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
  final LatLng position;

  /// The bearing of the vehicle at the time of recording.
  final double bearing;

  /// The velocity of the vehicle at the time of the recording.
  final double velocity;

  /// Returns a new [WayPoint] from this with altered parameters.
  WayPoint copyWith({
    LatLng? position,
    double? bearing,
    double? velocity,
  }) =>
      WayPoint(
        position: position ?? this.position,
        bearing: bearing ?? this.bearing,
        velocity: velocity ?? this.velocity,
      );

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
  /// Creates a [LatLng] tween.
  ///
  /// The [begin] and [end] properties must be non-null before the tween is
  /// first used, but the arguments can be null if the values are going to be
  /// filled in later.
  WayPointTween({super.begin, super.end});

  // The inherited lerp() function doesn't work with WayPoint because it is a
  // complex object with two doubles that individually needs to be interpolated.
  @override
  WayPoint lerp(double t) {
    final position = LatLngTween(
      begin: begin?.position,
      end: end?.position,
    ).lerp(t);

    final bearing = Tween<double>(
      begin: begin?.bearing,
      end: end?.bearing,
    ).lerp(t);

    final velocity = Tween<double>(
      begin: begin?.velocity,
      end: end?.velocity,
    ).lerp(t);

    return WayPoint(
      position: position,
      bearing: bearing,
      velocity: velocity,
    );
  }
}
