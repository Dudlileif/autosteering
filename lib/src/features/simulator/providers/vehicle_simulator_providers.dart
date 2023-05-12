import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_simulator_providers.g.dart';

enum SimPlatform {
  native,
  web;
}

@Riverpod(keepAlive: true)
class SimVehicleInput extends _$SimVehicleInput {
  @override
  SimPlatform build() => switch (kIsWeb) {
        true => SimPlatform.web,
        false => SimPlatform.native,
      };

  void send(dynamic input) => switch (state) {
        SimPlatform.web => Future(
            () => ref.read(_simVehicleWebInputProvider).add(input),
          ),
        SimPlatform.native => Future(
            () => ref.read(_simVehicleIsolatePortProvider)?.send(input),
          ),
      };
}

@riverpod
Future<void> simVehicleDriving(SimVehicleDrivingRef ref) async {
  if (ref.watch(mapReadyProvider)) {
    final vehicle = switch (ref.watch(simVehicleInputProvider)) {
      SimPlatform.web => ref.watch(simVehicleWebStreamProvider).when(
            data: (data) => data,
            error: (error, stackTrace) => ref.watch(mainVehicleProvider),
            loading: () => ref.watch(mainVehicleProvider),
          ),
      SimPlatform.native => ref.watch(simVehicleIsolateStreamProvider).when(
            data: (data) => data,
            error: (error, stackTrace) => ref.watch(mainVehicleProvider),
            loading: () => ref.watch(mainVehicleProvider),
          )
    };
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

@riverpod
Stream<Vehicle?> simVehicleWebStream(
  SimVehicleWebStreamRef ref,
) {
  final stream = VehicleSimulator.webWorker(
    ref.watch(_simVehicleWebInputProvider.notifier).stream(),
  );

  return stream.map((event) {
    ref
        .read(vehicleVelocityProvider.notifier)
        .update(event.velocity.toDouble());
    ref.read(vehicleHeadingProvider.notifier).update(event.heading.toDouble());
    return event.vehicle;
  });
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
    if (message is ({Vehicle vehicle, double velocity, double heading})) {
      ref.read(vehicleVelocityProvider.notifier).update(message.velocity);
      ref.read(vehicleHeadingProvider.notifier).update(message.heading);
      yield message.vehicle;
    }
  }
}
