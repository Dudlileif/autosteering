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
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/providers/simulator_core_native_providers.dart'
    if (dart.library.js_interop) 'simulator_core_web_providers.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'simulator_core_providers.g.dart';

/// A provider for the target simulation update frequency.
@Riverpod(keepAlive: true)
class SimulatorUpdateFrequency extends _$SimulatorUpdateFrequency {
  @override
  int build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.simTargetUpdateHz, next);
        ref.read(simInputProvider.notifier).send((simulationTargetHz: next));
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getInt(SettingsKey.simTargetUpdateHz) ??
        60;
  }

  /// Updates [state] to [value].
  void update(int value) => Future(() => state = value);
}

/// Sends initial parameters to  the sim core.
@riverpod
void initializeSimCore(InitializeSimCoreRef ref) {
  Logger.instance.i('Sending initial data to Simulator Core...');
  ref.read(simInputProvider.notifier)
    ..send(ref.read(mainVehicleProvider))
    ..send((simulationTargetHz: ref.read(simulatorUpdateFrequencyProvider)))
    ..send((autoSlowDown: ref.read(simCoreVehicleAutoSlowDownProvider)))
    ..send(
      (autoCenterSteering: ref.read(simCoreVehicleAutoCenterSteeringProvider)),
    )
    ..send((allowManualSimInput: ref.read(simCoreAllowManualInputProvider)))
    ..send((allowSimInterpolation: ref.read(simCoreAllowInterpolationProvider)))
    ..send(ref.read(activeABConfigProvider))
    ..send((pathTracking: ref.read(displayPathTrackingProvider)))
    ..send((abTracking: ref.read(displayABTrackingProvider)));
  if (Device.isNative) {
    ref.read(simInputProvider.notifier)
      ..send(ref.read(hardwareCommunicationConfigProvider))
      ..send((networkAvailable: ref.read(networkAvailableProvider)))
      ..send(
        (
          logGNSS: ref.read(hardwareLogGnssProvider),
          logIMU: ref.read(hardwareLogImuProvider),
          logWAS: ref.read(hardwareLogWasProvider),
          logCombined: ref.read(hardwareLogCombinedProvider)
        ),
      );
  }
}

/// A provider for handling the common sim core messages for the state of the
/// simulation.
@riverpod
void commonSimCoreMessageHandler(
  CommonSimCoreMessageHandlerRef ref,
  ({
    Vehicle? vehicle,
    num velocity,
    num bearing,
    num distance,
    PathTracking? pathTracking,
    ABTracking? abTracking,
    AutosteeringState autosteeringState,
  }) message,
) {
  ref.read(gaugeVelocityProvider.notifier).update(message.velocity.toDouble());
  ref.read(gaugeBearingProvider.notifier).update(message.bearing.toDouble());
  ref
      .read(gaugeTravelledDistanceProvider.notifier)
      .updateWith(message.distance.toDouble());
  ref.read(displayPathTrackingProvider.notifier).update(message.pathTracking);
  ref.read(displayABTrackingProvider.notifier).update(message.abTracking);
  ref
      .read(activeAutosteeringStateProvider.notifier)
      .update(message.autosteeringState);
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
