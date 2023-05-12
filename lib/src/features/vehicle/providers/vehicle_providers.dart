import 'dart:async';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_providers.g.dart';

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

  void setAcceleration(double value) {
    if (value != state.acceleration) {
      Future(() => state = state.copyWith(acceleration: value));
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

@riverpod
class VehicleTravelledDistance extends _$VehicleTravelledDistance {
  @override
  double build() {
    ref.listen(mainVehicleProvider, (previous, next) {
      if (previous != null) {
        if (previous.position != next.position) {
          update(
            const Distance(roundResult: false)
                .distance(previous.position, next.position),
          );
        }
      }
    });
    return 0;
  }

  void update(double distance) => Future(() => state += distance);
}

@riverpod
class VehicleVelocity extends _$VehicleVelocity {
  @override
  double build() => 0;

  void update(double value) => Future(() => state = value);
}

@riverpod
class VehicleHeading extends _$VehicleHeading {
  @override
  double build() => 0;

  void update(double value) => Future(() => state = value);
}
