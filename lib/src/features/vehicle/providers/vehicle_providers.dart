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

  void setVelocity(double value) {
    if (value != state.velocity) {
      Future(() => state = state.copyWith(velocity: value));
    }
  }

  void setSteeringAngle(double value) {
    if (value != state.steeringAngle) {
      Future(() => state = state.copyWith(steeringAngleInput: value));
    }
  }

  void setPositon(LatLng position) {
    if (position != state.position) {
      Future(() => state = state.copyWith(position: position));
    }
  }

  void setHeading(double heading) {
    if (heading != state.heading) {
      Future(() => state = state.copyWith(heading: heading));
    }
  }

  void update(Vehicle vehicle) => Future(() => state = vehicle);

  void reset() => ref.invalidateSelf();
}

/// A provider for the distance travelled by the vehicle.
@riverpod
class VehicleTravelledDistance extends _$VehicleTravelledDistance {
  @override
  double build() => 0;

  void update(double distance) => Future(() => state += distance);
}

/// A provider for the vehicle's velocity gauge.
@riverpod
class VehicleVelocity extends _$VehicleVelocity {
  @override
  double build() => 0;

  void update(double value) => Future(() => state = value);
}

/// A provider for the vehicle's heading gauge.
@riverpod
class VehicleHeading extends _$VehicleHeading {
  @override
  double build() => 0;

  void update(double value) => Future(() => state = value);
}
