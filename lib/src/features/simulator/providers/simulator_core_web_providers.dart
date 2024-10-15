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

import 'dart:async';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simulator_core_web_providers.g.dart';

/// A provider for sending messages to the [SimulatorCore].
@Riverpod(keepAlive: true)
class SimInput extends _$SimInput {
  @override
  void build() {
    return;
  }

  /// Send some [input] to the simulator.
  void send(dynamic input) => Future(
        () => ref.read(_simCoreWebInputProvider).add(input),
      );
}

/// A provider that creates a stream for sending vehicle inputs to the
/// vehicle simulator when on the web platform.
@Riverpod(keepAlive: true)
class _SimCoreWebInput extends _$SimCoreWebInput {
  @override
  StreamController<dynamic> build() {
    ref.listenSelf((previous, next) {
      ref.read(initializeSimCoreProvider);
    });
    return StreamController<dynamic>();
  }

  Stream<dynamic> stream() => state.stream;
}

/// A provider that creates a stream and watches the vehicle simulator on the
/// web platform.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
@riverpod
Stream<Vehicle?> simCoreWebStream(
  SimCoreWebStreamRef ref,
) {
  ref.onDispose(() => Logger.instance.i('Simulator Core shut down.'));
  final commonMessageHandler = CommonMessageHandler(ref);
  final updateMainStreamController = StreamController<dynamic>()
    ..stream.listen((event) {
      if (!commonMessageHandler.attemptToHandleMessage(event)) {
        if (event is ({int logReplayIndex})) {
          if (ref.exists(logReplayIndexProvider)) {
            ref
                .read(logReplayIndexProvider.notifier)
                .update(event.logReplayIndex);
          }
        }
      }
    });

  final stream = SimulatorCore.webWorker(
    ref.watch(_simCoreWebInputProvider.notifier).stream(),
    updateMainStreamController,
  );

  return stream.map((event) {
    ref.read(commonSimCoreMessageHandlerProvider(event));
    return event.vehicle;
  });
}

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.
@riverpod
void simCoreVehicleDriving(SimCoreVehicleDrivingRef ref) {
  if (ref.watch(mapReadyProvider)) {
    if (ref.watch(devicePositionAsVehiclePositionProvider)) {
      ref.watch(updatePositionFromDeviceProvider);
    }

    final vehicle = ref.watch(simCoreWebStreamProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => ref.watch(mainVehicleProvider),
          loading: () => ref.watch(mainVehicleProvider),
        );

    if (vehicle == null) {
      ref.read(simInputProvider.notifier).send(ref.read(mainVehicleProvider));
    } else {
      if (Device.isWeb &&
          vehicle.runtimeType == ref.watch(mainVehicleProvider).runtimeType) {
        ref.read(mainVehicleProvider.notifier).updateStateOnly(vehicle);
      } else {
        ref.read(mainVehicleProvider.notifier).update(vehicle);
      }
      for (final equipment in vehicle.hitchChildren) {
        equipment.runFunctionRecursively(
          ref.read(allEquipmentsProvider.notifier).update,
        );
      }
      final mapController = ref.watch(mainMapControllerProvider);
      if (vehicle.position != mapController.camera.center.geoPosition &&
          ref.watch(centerMapOnVehicleProvider)) {
        mapController.moveAndRotate(
          ref.watch(offsetVehiclePositionProvider),
          mapController.camera.zoom,
          -ref.watch(mainVehicleProvider.select((value) => value.bearing)),
        );
      }
    }
  }
}

/// A dummy provider for the web version.
@riverpod
void simCoreIsolateStream(SimCoreIsolateStreamRef ref) {
  return;
}
