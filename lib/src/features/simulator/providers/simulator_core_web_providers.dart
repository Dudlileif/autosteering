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
  final updateMainStreamController = StreamController<dynamic>()
    ..stream.listen((event) {
      CommonMessageHandler.handleHardwareMessage(ref, event);
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
}

/// A dummy provider for the web version.
@riverpod
void simCoreIsolateStream(SimCoreIsolateStreamRef ref) {
  return;
}
