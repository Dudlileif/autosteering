import 'dart:async';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_providers.g.dart';

/// The main provider for the vehicle state.
@Riverpod(keepAlive: true)
class MainVehicle extends _$MainVehicle {
  @override
  Vehicle build() => Tractor(
        position: ref.read(homePositionProvider),
        antennaHeight: 2.822,
        length: 4.358,
        width: 2.360,
        trackWidth: 1.8,
        wheelBase: 2.550,
        solidAxleDistance: 1.275,
        minTurningRadius: 4.25,
        steeringAngleMax: 32,
        simulated: true,
      );

  /// Set the velocity of the [state] to [value].
  void setVelocity(double value) {
    if (value != state.velocity) {
      Future(() => state = state.copyWith(velocity: value));
    }
  }

  /// Set the steering angle input of the [state] to [value].
  void setSteeringAngle(double value) {
    if (value != state.steeringAngle) {
      Future(() => state = state.copyWith(steeringAngleInput: value));
    }
  }

  /// Set the position of the [state] to [value].
  void setPositon(LatLng value) {
    if (value != state.position) {
      Future(() => state = state.copyWith(position: value));
    }
  }

  /// Set the bearing of the [state] to [value].

  void setBearing(double value) {
    if (value != state.bearing) {
      Future(() => state = state.copyWith(bearing: value));
    }
  }

  /// Update the [state] to [vehicle].
  void update(Vehicle vehicle) => Future(() => state = vehicle);

  /// Update the [state] with only the position, velocity, bearing and
  /// steering input angle from [vehicle].
  void updateStateOnly(Vehicle vehicle) => Future(() {
        state = state.copyWith(
          velocity: vehicle.velocity,
          bearing: vehicle.bearing,
          steeringAngleInput: vehicle.steeringAngleInput,
          position: vehicle.position,
        );
      });

  /// Reset the [state] to the initial value by recreating the [state].
  void reset() => ref.invalidateSelf();
}

/// A provider for the distance travelled by the vehicle.
@riverpod
class VehicleTravelledDistance extends _$VehicleTravelledDistance {
  @override
  double build() => 0;

  /// Update the [state] by adding [value].
  void updateWith(double value) => Future(() => state += value);
}

/// A provider for the vehicle's velocity gauge.
@riverpod
class VehicleVelocity extends _$VehicleVelocity {
  @override
  double build() => 0;

  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the vehicle's bearing gauge.
@riverpod
class VehicleBearing extends _$VehicleBearing {
  @override
  double build() => 0;

  /// Update the [state] by adding [value].
  void update(double value) => Future(() => state = value);
}
