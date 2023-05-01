import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_simulator_providers.g.dart';

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
