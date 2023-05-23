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

/// An enumeration class for determining which platform we're running on.
enum SimPlatform {
  native,
  web;
}

/// A provider used to send vehicle input data to the simulation thread/worker.
///
/// It will automatically select the right type of thread/worker depending
/// on the platform.
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

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.
@riverpod
void simVehicleDriving(SimVehicleDrivingRef ref) {
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

/// A provider for keeping the isolate [SendPort] for when working on a
/// native platform. Vehicle inputs gets directed here from [SimVehicleInput].
@Riverpod(keepAlive: true)
class _SimVehicleIsolatePort extends _$SimVehicleIsolatePort {
  @override
  SendPort? build() => null;

  void update(SendPort? port) => Future(() => state = port);
}

/// A provider that creates a stream for sending vehicle inputs to the
/// vehicle simulator when on the web platform.
@Riverpod(keepAlive: true)
class _SimVehicleWebInput extends _$SimVehicleWebInput {
  @override
  StreamController<dynamic> build() => StreamController<dynamic>();

  Stream<dynamic> stream() => state.stream;
}

/// A provider that creates a stream and watches the vehicle simulator on the
/// web platform.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
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
    ref
        .read(vehicleTravelledDistanceProvider.notifier)
        .update(event.distance.toDouble());
    return event.vehicle;
  });
}

/// A provider that creates a stream and watches the vehicle simulator on the
/// native platform.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
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
    if (message is ({
      Vehicle vehicle,
      double velocity,
      double heading,
      double distance
    })) {
      ref.read(vehicleVelocityProvider.notifier).update(message.velocity);
      ref.read(vehicleHeadingProvider.notifier).update(message.heading);
      ref
          .read(vehicleTravelledDistanceProvider.notifier)
          .update(message.distance);
      yield message.vehicle;
    }
  }
}

/// A provider for whether the steering automatically should recenter when
/// no input is provided.
@Riverpod(keepAlive: true)
class SimVehicleAutoCenterSteering extends _$SimVehicleAutoCenterSteering {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref
          .read(simVehicleInputProvider.notifier)
          .send((autoCenterSteering: next));
    });
    return false;
  }

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}

/// A provider for whether the vehicle should slow down when no input is
/// provided.
@Riverpod(keepAlive: true)
class SimVehicleAutoSlowDown extends _$SimVehicleAutoSlowDown {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simVehicleInputProvider.notifier).send((autoSlowDown: next));
    });
    return false;
  }

  void update({required bool value}) => Future(() => state = value);

  void toggle() => Future(() => state != state);
}
