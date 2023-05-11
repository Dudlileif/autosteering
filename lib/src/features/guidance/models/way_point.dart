import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:latlong2/latlong.dart';

class WayPoint extends Equatable {
  const WayPoint({
    required this.position,
    required this.heading,
    required this.velocity,
  });

  final LatLng position;
  final double heading;
  final double velocity;

  WayPoint copyWith({
    LatLng? position,
    double? heading,
    double? velocity,
  }) =>
      WayPoint(
        position: position ?? this.position,
        heading: heading ?? this.heading,
        velocity: velocity ?? this.velocity,
      );

  @override
  List<Object?> get props => [
        position,
        heading,
        velocity,
      ];
}

extension VehicleWayPoint on Vehicle {
  /// A [WayPoint] for the vehicle in it's current state, i.e. position, heading
  /// and velocity.
  WayPoint get wayPoint => WayPoint(
        position: position,
        heading: heading,
        velocity: velocity,
      );
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

    final heading = Tween<double>(
      begin: begin?.heading,
      end: end?.heading,
    ).lerp(t);

    final velocity = Tween<double>(
      begin: begin?.velocity,
      end: end?.velocity,
    ).lerp(t);

    return WayPoint(
      position: position,
      heading: heading,
      velocity: velocity,
    );
  }
}
