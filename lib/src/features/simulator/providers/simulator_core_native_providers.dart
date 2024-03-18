// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'dart:isolate';

import 'package:async/async.dart';
import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simulator_core_native_providers.g.dart';

/// A provider for sending messages to the [SimulatorCore].
@Riverpod(keepAlive: true)
class SimInput extends _$SimInput {
  @override
  void build() {
    return;
  }

  /// Send some [input] to the simulator.
  void send(dynamic input) => Future(
        () => ref.read(_simCoreIsolatePortProvider)?.send(input),
      );
}

/// A provider for keeping the isolate [SendPort] for when working on a
/// native platform. Vehicle inputs gets directed here from [SimInput].
@Riverpod(keepAlive: true)
class _SimCoreIsolatePort extends _$SimCoreIsolatePort {
  @override
  SendPort? build() {
    ref.listenSelf((previous, next) {
      Logger.instance.i('Simulator Core sendport set to: $next');
      if (next != null) {
        ref.read(initializeSimCoreProvider);
      }
    });
    return null;
  }

  void update(SendPort? port) => Future(() => state = port);
}

/// A provider that creates a stream and watches the vehicle simulator on the
/// native platforms.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
@riverpod
Stream<Vehicle> simCoreIsolateStream(SimCoreIsolateStreamRef ref) async* {
  final receivePort = ReceivePort('Recieve from sim port');

  BackgroundIsolateBinaryMessenger.ensureInitialized(
    ServicesBinding.rootIsolateToken!,
  );

  final isolate = await Isolate.spawn(
    SimulatorCore.isolateWorker,
    receivePort.sendPort,
    debugName: 'Simulator Core',
  );
  isolate.addErrorListener(receivePort.sendPort);

  Logger.instance.i('Simulator Core isolate spawned and started.');

  final simCoreReceiveStream = StreamQueue<dynamic>(receivePort);

  final sendPort = (await simCoreReceiveStream.next as SendPort)
    ..send(ServicesBinding.rootIsolateToken);

  ref.read(_simCoreIsolatePortProvider.notifier).update(sendPort);

  // How long we will wait for a message until we restart the simulator, in
  // seconds.
  // An increased time is used for debug mode to allow for hot reloading
  // without destroying the sim state.
  final heartbeatThreshold = switch (kDebugMode) {
    false => 0.5,
    true => 5,
  };

// Use the restart timer if we're not in debug mode or if we're in
  // debug mode and don't allow long breaks.
  final restartTimer =
      switch (!kDebugMode || !ref.watch(simCoreDebugAllowLongBreaksProvider)) {
    true => RestartableTimer(
          Duration(milliseconds: (heartbeatThreshold * 1000).round()), () {
        Logger.instance
            .w('Simulator Core isolate unresponsive/died... Restarting...');

        ref.invalidateSelf();
      }),
    false => null
  };

  // Exit isolate when provider is disposed.
  ref.onDispose(() {
    sendPort.send(null);
    simCoreReceiveStream.cancel();
    restartTimer?.cancel();
    ref.read(_simCoreIsolatePortProvider.notifier).update(null);
    Logger.instance.w('Simulator Core shut down.');
  });

  while (true) {
    final message = await simCoreReceiveStream.next;
    restartTimer?.reset();

    if (message is ({
      Vehicle vehicle,
      num velocity,
      num bearing,
      num distance,
      PathTracking? pathTracking,
      ABTracking? abTracking,
      AutosteeringState autosteeringState,
      bool hardwareIsConnected,
    })) {
      ref.read(commonSimCoreMessageHandlerProvider(message));
      yield message.vehicle;
    } else if (CommonMessageHandler.handleHardwareMessage(ref, message)) {
    } else if (message == 'Heartbeat') {
    } else if (message is List) {
      if (message.any((element) => element is Exception)) {
        Logger.instance.log(
          Level.error,
          'Simulator Core hit error, restarting...: $message',
        );
        ref.invalidateSelf();
      }
    } else {
      Logger.instance.log(
        Level.warning,
        'Received unknown message from Simulator Core: $message',
      );
    }
  }
}

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.
@riverpod
void simCoreVehicleDriving(SimCoreVehicleDrivingRef ref) {
  if (ref.watch(mapReadyProvider)) {
    if (ref.watch(devicePositionAsVehiclePositionProvider)) {
      ref.watch(updatePositionFromDeviceProvider);
    }

    final vehicle = ref.watch(simCoreIsolateStreamProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => ref.watch(mainVehicleProvider),
          loading: () => ref.watch(mainVehicleProvider),
        );

    ref.read(mainVehicleProvider.notifier).update(vehicle);

    for (final equipment in vehicle.hitchChildren) {
      equipment.runFunctionRecursively(
        ref.read(allEquipmentsProvider.notifier).update,
      );
    }
    final mapController = ref.watch(mainMapControllerProvider);
    if (vehicle.position != mapController.camera.center.gbPosition &&
        ref.watch(centerMapOnVehicleProvider)) {
      mapController.moveAndRotate(
        ref.watch(offsetVehiclePositionProvider),
        mapController.camera.zoom,
        -ref.watch(mainVehicleProvider.select((value) => value.bearing)),
      );
    }
  }
}
