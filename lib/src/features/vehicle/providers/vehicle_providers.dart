import 'dart:async';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_providers.g.dart';

@Riverpod(keepAlive: true)
class MainVehicle extends _$MainVehicle {
  @override
  Vehicle build() => Vehicle(
        type: VehicleType.conventionalTractor,
        position: ref.read(homePositionProvider),
        antennaHeight: 2.822,
        heading: 0,
        length: 4.358,
        width: 2.360,
        trackWidth: 1.8,
        wheelBase: 2.550,
        solidAxleDistance: 1.275,
        minTurningRadius: 4.25,
        wheelAngleMax: 32,
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

  void setWheelAngle(double value) {
    if (value != state.wheelAngle) {
      Future(() => state = state.copyWith(wheelAngle: value));
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
Future<void> vehicleDriving(VehicleDrivingRef ref) async {
  if (ref.watch(mapReadyProvider)) {
    final vehicle = ref.watch(simVehicleInputProvider)
        ? ref.watch(simVehicleWebStreamProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => ref.watch(mainVehicleProvider),
              loading: () => ref.watch(mainVehicleProvider),
            )
        : ref.watch(simVehicleIsolateStreamProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => ref.watch(mainVehicleProvider),
              loading: () => ref.watch(mainVehicleProvider),
            );
    if (vehicle == null) {
      ref
          .read(simVehicleInputProvider.notifier)
          .send(ref.read(mainVehicleProvider));
    } else {
      ref.read(mainVehicleProvider.notifier).update(vehicle);

      if (vehicle.position != ref.watch(mainMapControllerProvider).center &&
          ref.watch(centerMapOnVehicleProvider)) {
        ref.read(mainMapControllerProvider).moveAndRotate(
              ref.watch(offsetVehiclePositionProvider),
              ref.watch(mainMapControllerProvider).zoom,
              -normalizeBearing(ref.watch(mainVehicleProvider).heading),
            );
      }
    }
  }
}
