import 'dart:async';
import 'dart:developer';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/gnss/providers/device_position_providers.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/network/network.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:async/async.dart';
import 'package:geobase/geobase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'vehicle_simulator_providers.g.dart';

/// An enumeration class for determining which platform we're running on.
enum SimPlatform {
  /// Running natively on a platform with multithreading.
  native,

  /// Running on the web browser, i.e. no multithreading.
  web;
}

/// A provider used to send vehicle input data to the simulation thread/worker.
///
/// It will automatically select the right type of thread/worker depending
/// on the platform.
@Riverpod(keepAlive: true)
class SimInput extends _$SimInput {
  @override
  SimPlatform build() => switch (Device.isWeb) {
        true => SimPlatform.web,
        false => SimPlatform.native,
      };

  /// Send some [input] to the simulator.
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
    if (ref.watch(devicePositionAsVehiclePositionProvider)) {
      ref.watch(devicePositionProvider);
    }

    ref
      ..watch(simVehicleAutoCenterSteeringProvider)
      ..watch(simVehicleAutoSlowDownProvider);

    final vehicle = switch (ref.watch(simInputProvider)) {
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
      ref.read(simInputProvider.notifier).send(ref.read(mainVehicleProvider));
    } else {
      if (Device.isWeb &&
          vehicle.runtimeType == ref.watch(mainVehicleProvider).runtimeType) {
        ref.read(mainVehicleProvider.notifier).updateStateOnly(vehicle);
      } else {
        ref.read(mainVehicleProvider.notifier).update(vehicle);
      }
      for (final equipment in vehicle.hitchChildren.whereType<Equipment>()) {
        equipment.runFunctionRecursively(
          ref.read(allEquipmentsProvider.notifier).update,
        );
      }

      if (vehicle.position !=
              ref.watch(
                mainMapControllerProvider
                    .select((controller) => controller.center.gbPosition),
              ) &&
          ref.watch(centerMapOnVehicleProvider)) {
        ref.read(mainMapControllerProvider).moveAndRotate(
              ref.watch(offsetVehiclePositionProvider),
              ref.watch(
                mainMapControllerProvider
                    .select((controller) => controller.zoom),
              ),
              -ref
                  .watch(
                    mainVehicleProvider.select((vehicle) => vehicle.bearing),
                  )
                  .wrap360(),
            );
      }
    }
  }
}

/// A provider for keeping the isolate [SendPort] for when working on a
/// native platform. Vehicle inputs gets directed here from [SimInput].
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
    ref.read(gaugeVelocityProvider.notifier).update(event.velocity.toDouble());
    ref.read(gaugeBearingProvider.notifier).update(event.bearing.toDouble());
    ref
        .read(gaugeTravelledDistanceProvider.notifier)
        .updateWith(event.distance.toDouble());
    ref.read(displayPurePursuitProvider.notifier).update(event.purePursuit);
    ref.read(displayABLineProvider.notifier).update(event.abLine);

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
  final recievePort = ReceivePort('Recieve from sim port');

  await Isolate.spawn(
    VehicleSimulator.isolateWorker,
    recievePort.sendPort,
    debugName: 'VehicleSimulator',
  );
  log('Sim vehicle isolate spawned');

  final events = StreamQueue<dynamic>(recievePort);

  final sendPort = await events.next as SendPort;
  ref.read(_simVehicleIsolatePortProvider.notifier).update(sendPort);
  sendPort
    ..send(ref.read(hardwareCommunicationConfigProvider))
    ..send(ref.read(mainVehicleProvider))
    ..send((autoSlowDown: ref.read(simVehicleAutoSlowDownProvider)))
    ..send(
      (autoCenterSteering: ref.read(simVehicleAutoCenterSteeringProvider)),
    );

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
      double bearing,
      double distance,
      PurePursuit? purePursuit,
      ABLine? abLine,
    })) {
      ref.read(gaugeVelocityProvider.notifier).update(message.velocity);
      ref.read(gaugeBearingProvider.notifier).update(message.bearing);
      ref
          .read(gaugeTravelledDistanceProvider.notifier)
          .updateWith(message.distance);
      ref.read(displayPurePursuitProvider.notifier).update(message.purePursuit);
      ref.read(displayABLineProvider.notifier).update(message.abLine);

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
      ref.read(simInputProvider.notifier).send((autoCenterSteering: next));

      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.simAutoCenterSteering, next);
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.simAutoCenterSteering)) {
      return ref
              .read(settingsProvider.notifier)
              .getBool(SettingsKey.simAutoCenterSteering) ??
          false;
    }

    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// A provider for whether the vehicle should slow down when no input is
/// provided.
@Riverpod(keepAlive: true)
class SimVehicleAutoSlowDown extends _$SimVehicleAutoSlowDown {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((autoSlowDown: next));

      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.simAutoSlowDown, next);
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.simAutoSlowDown)) {
      return ref
              .read(settingsProvider.notifier)
              .getBool(SettingsKey.simAutoSlowDown) ??
          false;
    }
    return false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}
