import 'dart:async';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_providers.g.dart';

/// The main provider for the vehicle state.
@Riverpod(keepAlive: true)
class MainVehicle extends _$MainVehicle {
  @override
  Vehicle build() => Tractor(
        position: ref.read(homePositionProvider).gbPosition,
        antennaHeight: 2.822,
        length: 4.358,
        width: 2.360,
        trackWidth: 1.8,
        wheelBase: 2.550,
        solidAxleDistance: 1.275,
        minTurningRadius: 4.25,
        steeringAngleMax: 32,
        isSimulated: true,
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
  void setPositon(Geographic value) {
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

/// A provider for whether the vehicle should steer automatically.
@Riverpod(keepAlive: true)
class AutoSteerEnabled extends _$AutoSteerEnabled {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next != previous) {
        ref.read(simInputProvider.notifier).send((autoSteerEnabled: next));
      }
    });

    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for whether the vehicle's bearing is set by the IMU input.
@Riverpod(keepAlive: true)
class UseIMUBearing extends _$UseIMUBearing {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != next) {
        ref.read(simInputProvider.notifier).send((useIMUBearing: next));
      }
    });

    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}
