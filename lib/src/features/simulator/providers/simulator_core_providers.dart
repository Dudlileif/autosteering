import 'dart:async';
import 'dart:isolate';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/hardware/hardware.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/settings/settings.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:async/async.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simulator_core_providers.g.dart';

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
  SimPlatform build() {
    ref.listenSelf(
      (previous, next) => Logger.instance.i('Simulator Platform set to $next.'),
    );

    return switch (Device.isWeb) {
      true => SimPlatform.web,
      false => SimPlatform.native,
    };
  }

  /// Send some [input] to the simulator.
  void send(dynamic input) => switch (state) {
        SimPlatform.web => Future(
            () => ref.read(_simCoreWebInputProvider).add(input),
          ),
        SimPlatform.native => Future(
            () => ref.read(_simCoreIsolatePortProvider)?.send(input),
          ),
      };
}

/// A provider for whether we should send messages to the hardware from the
/// Simulator Core when network is available, see [networkAvailable].
@Riverpod(keepAlive: true)
class SendMessagesToHardwareIfNetwork
    extends _$SendMessagesToHardwareIfNetwork {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.hardwareNetworkSendMessages, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.hardwareNetworkSendMessages) ??
        true;
  }

  /// Updates the [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether we should send messages to the hardware.
@riverpod
bool sendMessagesToHardware(SendMessagesToHardwareRef ref) {
  ref.listenSelf((previous, next) {
    ref.read(simInputProvider.notifier).send((sendMessagesToHardware: next));
  });

  return ref.watch(sendMessagesToHardwareIfNetworkProvider) &&
      ref.watch(networkAvailableProvider);
}

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.
@riverpod
void simCoreVehicleDriving(SimCoreVehicleDrivingRef ref) {
  if (ref.watch(mapReadyProvider)) {
    if (ref.watch(devicePositionAsVehiclePositionProvider)) {
      ref.watch(updatePositionFromDeviceProvider);
    }

    final vehicle = switch (ref.watch(simInputProvider)) {
      SimPlatform.web => ref.watch(simCoreWebStreamProvider).when(
            data: (data) => data,
            error: (error, stackTrace) => ref.watch(mainVehicleProvider),
            loading: () => ref.watch(mainVehicleProvider),
          ),
      SimPlatform.native => ref.watch(simCoreIsolateStreamProvider).when(
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
      for (final equipment in vehicle.hitchChildren) {
        equipment.runFunctionRecursively(
          ref.read(allEquipmentsProvider.notifier).update,
        );
      }
      final mapController = ref.watch(mainMapControllerProvider);
      if (vehicle.position != mapController.center.gbPosition &&
          ref.watch(centerMapOnVehicleProvider)) {
        mapController.moveAndRotate(
          ref.watch(offsetVehiclePositionProvider),
          mapController.zoom,
          -ref.watch(mainVehicleProvider.select((value) => value.bearing)),
        );
      }
    }
  }
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
        ref.read(_initializeSimCoreProvider);
      }
    });
    return null;
  }

  void update(SendPort? port) => Future(() => state = port);
}

/// A provider that creates a stream for sending vehicle inputs to the
/// vehicle simulator when on the web platform.
@Riverpod(keepAlive: true)
class _SimCoreWebInput extends _$SimCoreWebInput {
  @override
  StreamController<dynamic> build() {
    ref.listenSelf((previous, next) {
      ref.read(_initializeSimCoreProvider);
    });
    return StreamController<dynamic>();
  }

  Stream<dynamic> stream() => state.stream;
}

/// Sends initial parameters to  the sim core.
@riverpod
void _initializeSimCore(_InitializeSimCoreRef ref) {
  Logger.instance.i('Sending initial data to Simulator Core...');
  ref.read(simInputProvider.notifier)
    ..send(ref.read(hardwareCommunicationConfigProvider))
    ..send(ref.read(mainVehicleProvider))
    ..send((autoSlowDown: ref.read(simCoreVehicleAutoSlowDownProvider)))
    ..send(
      (autoCenterSteering: ref.read(simCoreVehicleAutoCenterSteeringProvider)),
    )
    ..send((allowManualSimInput: ref.read(simCoreAllowManualInputProvider)))
    ..send((allowSimInterpolation: ref.read(simCoreAllowInterpolationProvider)))
    ..send(ref.read(activeABConfigProvider))
    ..send((pathTracking: ref.read(displayPathTrackingProvider)))
    ..send((abTracking: ref.read(displayABTrackingProvider)))
    ..send(
      (enableAutoSteer: ref.read(autoSteerEnabledProvider)),
    )
    ..send((sendMessagesToHardware: ref.read(sendMessagesToHardwareProvider)));
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
      if (event is LogEvent) {
        Logger.instance.log(
          event.level,
          event.message,
          error: event.error,
          time: event.time,
          stackTrace: event.stackTrace,
        );
      } else if (event is GnssPositionCommonSentence) {
        ref.read(gnssCurrentSentenceProvider.notifier).update(event);
      }
    });

  final stream = SimulatorCore.webWorker(
    ref.watch(_simCoreWebInputProvider.notifier).stream(),
    updateMainStreamController,
  );

  return stream.map((event) {
    ref.read(gaugeVelocityProvider.notifier).update(event.velocity.toDouble());
    ref.read(gaugeBearingProvider.notifier).update(event.bearing.toDouble());
    ref
        .read(gaugeTravelledDistanceProvider.notifier)
        .updateWith(event.distance.toDouble());
    ref.read(displayPathTrackingProvider.notifier).update(event.pathTracking);
    ref.read(displayABTrackingProvider.notifier).update(event.abTracking);
    ref
        .read(autoSteerEnabledProvider.notifier)
        .update(value: event.autoSteerEnabled);
    ref
        .read(hardwareNetworkAliveProvider.notifier)
        .update(value: event.hardwareIsConnected);

    return event.vehicle;
  });
}

/// A provider for whether long breaks in the program (i.e. when using
/// breakpoints) should be allowed and not restart the sim core in
/// debug mode.
@Riverpod(keepAlive: true)
class SimCoreDebugAllowLongBreaks extends _$SimCoreDebugAllowLongBreaks {
  @override
  bool build() => true;

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider that creates a stream and watches the vehicle simulator on the
/// native platforms.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
@riverpod
Stream<Vehicle> simCoreIsolateStream(SimCoreIsolateStreamRef ref) async* {
  final receivePort = ReceivePort('Recieve from sim port');

  final isolate = await Isolate.spawn(
    SimulatorCore.isolateWorker,
    receivePort.sendPort,
    debugName: 'Simulator Core',
  );
  isolate.addErrorListener(receivePort.sendPort);
  // ..addOnExitListener(
  //   receivePort.sendPort,
  //   response: LogEvent(Level.warning, 'Isolate exited.'),
  // );

  Logger.instance.i('Simulator Core isolate spawned and started.');

  final simCoreReceiveStream = StreamQueue<dynamic>(receivePort);

  final sendPort = await simCoreReceiveStream.next as SendPort;

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
      double velocity,
      double bearing,
      double distance,
      PathTracking? pathTracking,
      ABTracking? abTracking,
      bool autoSteerEnabled,
      bool hardwareIsConnected,
    })) {
      ref.read(gaugeVelocityProvider.notifier).update(message.velocity);
      ref.read(gaugeBearingProvider.notifier).update(message.bearing);
      ref
          .read(gaugeTravelledDistanceProvider.notifier)
          .updateWith(message.distance);
      ref
          .read(displayPathTrackingProvider.notifier)
          .update(message.pathTracking);
      ref.read(displayABTrackingProvider.notifier).update(message.abTracking);
      ref
          .read(autoSteerEnabledProvider.notifier)
          .update(value: message.autoSteerEnabled);
      ref
          .read(hardwareNetworkAliveProvider.notifier)
          .update(value: message.hardwareIsConnected);

      yield message.vehicle;
    } else if (message is GnssPositionCommonSentence) {
      ref.read(gnssCurrentSentenceProvider.notifier).update(message);
    } else if (message is ({
      DateTime gnssUpdateTimeDevice,
      DateTime? gnssUpdateTimeReceiver,
      Duration? gnssUpdateDelay,
    })) {
      ref.read(gnssLastUpdateTimeProvider.notifier).update(
        (
          device: message.gnssUpdateTimeDevice,
          receiver: message.gnssUpdateTimeReceiver,
          delay: message.gnssUpdateDelay,
        ),
      );
    } else if (message is ({double? gnssCurrentFrequency})) {
      ref
          .read(gnssCurrentFrequencyProvider.notifier)
          .update(message.gnssCurrentFrequency);
    } else if (message is ({ImuReading? imuLatestRaw})) {
      ref.read(imuCurrentReadingProvider.notifier).update(message.imuLatestRaw);
    } else if (message is ({double? imuCurrentFrequency})) {
      ref
          .read(imuCurrentFrequencyProvider.notifier)
          .update(message.imuCurrentFrequency);
    } else if (message is LogEvent) {
      Logger.instance.log(
        message.level,
        message.message,
        error: message.error,
        time: message.time,
        stackTrace: message.stackTrace,
      );
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

/// A provider for whether the sim core should allow manual inputs from the
/// user, i.e. not only sensors from the vehicle.
@Riverpod(keepAlive: true)
class SimCoreAllowManualInput extends _$SimCoreAllowManualInput {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((allowManualSimInput: next));

      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.simAllowManualInput, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.simAllowManualInput) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// A provider for whether the sim core should allow interpolation steps
/// between the hardware GNSS updates.
@Riverpod(keepAlive: true)
class SimCoreAllowInterpolation extends _$SimCoreAllowInterpolation {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send((allowSimInterpolation: next));

      if (next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.simAllowInterpolation, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.simAllowInterpolation) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// A provider for whether the steering automatically should recenter when
/// no input is provided.
@Riverpod(keepAlive: true)
class SimCoreVehicleAutoCenterSteering
    extends _$SimCoreVehicleAutoCenterSteering {
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

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.simAutoCenterSteering) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}

/// A provider for whether the vehicle should slow down when no input is
/// provided.
@Riverpod(keepAlive: true)
class SimCoreVehicleAutoSlowDown extends _$SimCoreVehicleAutoSlowDown {
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

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.simAutoSlowDown) ??
        false;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state != state);
}
