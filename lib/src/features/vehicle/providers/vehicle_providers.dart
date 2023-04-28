import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_providers.g.dart';

@Riverpod(keepAlive: true)
class MainVehicle extends _$MainVehicle {
  @override
  Vehicle build() => Vehicle(
        position: ref.read(homePositionProvider),
        heading: 0,
        length: 4.358,
        width: 2.360,
        wheelBase: 2.550,
        rearAxleDistance: 1.275,
        minTurningRadius: 4.25,
        wheelAngleMax: 40,
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
    final vehicle = ref
        .watch(
          ref.watch(simVehicleInputProvider)
              ? simVehicleWebStreamProvider
              : simVehicleIsolateStreamProvider,
        )
        .when(
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

@Riverpod(keepAlive: true)
class _SimVehicleIsolatePort extends _$SimVehicleIsolatePort {
  @override
  SendPort? build() => null;

  void update(SendPort? port) => Future(() => state = port);
}

@Riverpod(keepAlive: true)
class _SimVehicleWebInput extends _$SimVehicleWebInput {
  @override
  StreamController<dynamic> build() => StreamController<dynamic>();

  Stream<dynamic> stream() => state.stream;
}

@Riverpod(keepAlive: true)
class SimVehicleInput extends _$SimVehicleInput {
  @override
  bool build() => kIsWeb;

  void send(dynamic input) => Future(
        () => state
            ? ref.read(_simVehicleWebInputProvider).add(input)
            : ref.read(_simVehicleIsolatePortProvider)?.send(input),
      );
}

@riverpod
Stream<Vehicle?> simVehicleWebStream(SimVehicleWebStreamRef ref) {
  return VehicleSimulator.webWorker(
    ref.watch(_simVehicleWebInputProvider.notifier).stream(),
  );
}

@riverpod
Stream<Vehicle> simVehicleIsolateStream(SimVehicleIsolateStreamRef ref) async* {
  final recievePort = ReceivePort();
  await Isolate.spawn(
    VehicleSimulator.isolateWorker,
    recievePort.sendPort,
  );
  log('Sim vehicle isolate spawned');

  final events = StreamQueue<dynamic>(recievePort);

  final sendPort = await events.next as SendPort;
  ref.read(_simVehicleIsolatePortProvider.notifier).update(sendPort);
  sendPort.send(ref.read(mainVehicleProvider));
  // Exit isolate when provider is disposed.
  ref.onDispose(() {
    sendPort.send(null);
    events.cancel();
    ref.read(_simVehicleIsolatePortProvider.notifier).update(null);
  });

  while (true) {
    final message = await events.next;
    if (message is Vehicle) {
      yield message;
    }
  }
}
