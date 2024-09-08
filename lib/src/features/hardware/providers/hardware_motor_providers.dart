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
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_motor_providers.g.dart';

/// A provider for the WAS target for the steering motor when using guidance.

@Riverpod(keepAlive: true)
class SteeringMotorWasTarget extends _$SteeringMotorWasTarget {
  @override
  int? build() => null;

  /// Updates [state] to [value].
  void update(int? value) => Future(() => state = value);
}

/// A provider for the actual current steering motor rpm when using guidance.
@riverpod
class SteeringMotorActualRPM extends _$SteeringMotorActualRPM {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the steering motor is enabled when using guidance.
@riverpod
class SteeringMotorStatus extends _$SteeringMotorStatus {
  Timer? _resetTimer;

  @override
  MotorStatus? build() {
    ref.listenSelf((previous, next) {
      if (previous != next) {
        if (ref.read(activeAutosteeringStateProvider) ==
            AutosteeringState.standby) {
          Logger.instance.log(
            Level.warning,
            'Motor status: standby',
          );
        } else {
          Logger.instance.log(
            Level.warning,
            'Motor status: $next',
          );
        }
      }

      _resetTimer?.cancel();
      _resetTimer = Timer(
        Duration(
          milliseconds: switch (next) {
            MotorStatus.stalled || MotorStatus.noCommand => 5000,
            _ => 350,
          },
        ),
        ref.invalidateSelf,
      );
    });
    return MotorStatus.disabled;
  }

  /// Updates [state] to [value].
  void update(MotorStatus? value) {
    if (state == MotorStatus.stalled || state == MotorStatus.noCommand) {
      if (value != MotorStatus.running) {
        return;
      }
    }
    Future(() => state = value);
  }
}

/// A provider for the steering motor Stallguard reading.
@riverpod
class SteeringMotorCurrentScale extends _$SteeringMotorCurrentScale {
  Timer? _resetTimer;

  @override
  int? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 5000),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(int? value) => Future(() => state = value);
}

/// A provider for the steering motor Stallguard reading.
@riverpod
class SteeringMotorStallguard extends _$SteeringMotorStallguard {
  Timer? _resetTimer;

  @override
  int? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 5000),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(int? value) => Future(() => state = value);
}

/// A provider whether the steering motor should be in calibration mode.
@Riverpod(keepAlive: true)
class SteeringMotorEnableCalibration extends _$SteeringMotorEnableCalibration {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (previous != next) {
        ref
            .read(simInputProvider.notifier)
            .send((enableMotorCalibration: next));
      }
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for the current rotational position of the steering motor.
@riverpod
class SteeringMotorRotation extends _$SteeringMotorRotation {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 5000),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for target rotational position of the steering motor,
/// only used in calibration mode.
@riverpod
class SteeringMotorTargetRotation extends _$SteeringMotorTargetRotation {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 5000),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the motor steps per WAS increment between WAS min and center
/// value.
@riverpod
class SteeringMotorStepsPerWasIncrementMinToCenter
    extends _$SteeringMotorStepsPerWasIncrementMinToCenter {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 5000),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the motor steps per WAS increment between WAS center and max
/// value.
@riverpod
class SteeringMotorStepsPerWasIncrementCenterToMax
    extends _$SteeringMotorStepsPerWasIncrementCenterToMax {
  Timer? _resetTimer;

  @override
  double? build() {
    ref.listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 5000),
        ref.invalidateSelf,
      );
    });
    return null;
  }

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for getting the motor configuration from the hardware.
@Riverpod(keepAlive: true)
FutureOr<void> getSteeringHardwareConfig(
  GetSteeringHardwareConfigRef ref,
) async {
  try {
    final url =
        'http://${ref.watch(steeringHardwareAddressProvider)}/motor_config.json';
    Logger.instance.i('Requesting motor config from hardware: $url');
    final response = await Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    ).get<Map<String, dynamic>>(url);
    if (response.data != null && response.statusCode == 200) {
      final steeringHardwareConfig =
          SteeringHardwareConfig.fromJson(response.data!);
      Logger.instance
          .i('Retrieved motor config from hardware: $steeringHardwareConfig');
      ref.read(simInputProvider.notifier).send(steeringHardwareConfig);
      Timer(const Duration(milliseconds: 100), () {
        final vehicle = ref.read(mainVehicleProvider);
        ref.read(saveVehicleProvider(vehicle));
        Logger.instance.i(
          '''Updated vehicle motor config: ${vehicle.steeringHardwareConfig}''',
        );
      });
    } else {
      Logger.instance.w(
        'Did not recieve valid motor config response: $response',
      );
    }
  } catch (error, stackTrace) {
    Logger.instance.e(
      'Failed to get motor config from hardware.',
      error: error,
      stackTrace: stackTrace,
    );
  }
  ref.invalidateSelf();
}

/// A provider for updating the motor configuration on the hardware with the
/// parameters corresponding to [keyContainer].
@Riverpod(keepAlive: true)
FutureOr<void> updateSteeringHardwareConfig(
  UpdateSteeringHardwareConfigRef ref,
  SteeringHardwareConfigKeysContainer keyContainer,
) async {
  if (ref.watch(networkAvailableProvider) &&
      ref.read(steeringHardwareNetworkAliveProvider)) {
    try {
      final steeringHardwareConfig = ref.read(
        mainVehicleProvider.select((value) => value.steeringHardwareConfig),
      );
      final url =
          '''http://${ref.watch(steeringHardwareAddressProvider)}/update_motor_config?${steeringHardwareConfig.httpHeader(keyContainer.keys)}''';
      Logger.instance.i('Updating motor config with: $url');

      final response = await Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      ).get<String>(url);
      if (response.statusCode == 200) {
        Logger.instance.i(
          '''Successfully updated motor config on hardware for parameters: ${keyContainer.keys}.''',
        );
      } else {
        Logger.instance
            .e('Failed to update motor config on hardware: $response');
      }
    } catch (error, stackTrace) {
      Logger.instance.e(
        'Failed to update motor config on hardware.',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
  ref.invalidateSelf();
}

/// A provider for sending the whole motor configuration to the hardware.
@Riverpod(keepAlive: true)
FutureOr<void> sendSteeringHardwareConfig(
  SendSteeringHardwareConfigRef ref,
) async {
  try {
    Logger.instance.i(
      'Sending motor config to: http://${ref.watch(steeringHardwareAddressProvider)}/update_motor_config',
    );
    final steeringHardwareConfig = ref.read(
      mainVehicleProvider.select((value) => value.steeringHardwareConfig),
    );

    final response = await Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      ),
    ).get<String>(
      '''http://${ref.watch(steeringHardwareAddressProvider)}/update_motor_config?${steeringHardwareConfig.httpHeader}''',
    );
    if (response.statusCode == 200) {
      Logger.instance.i('Successfully sent motor config to hardware.');
    } else {
      Logger.instance.e('Failed to send motor config to hardware: $response');
    }
  } catch (error, stackTrace) {
    Logger.instance.e(
      'Failed to send motor config to hardware.',
      error: error,
      stackTrace: stackTrace,
    );
  }
  ref.invalidateSelf();
}

/// A provider for the UI [Offset] for the steering hardware configurator.
@riverpod
class SteeringHardwareConfiguratorUiOffset
    extends _$SteeringHardwareConfiguratorUiOffset {
  @override
  Offset build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
        if (previous != null && next != previous) {
          ref.read(settingsProvider.notifier).update(
                SettingsKey.uiSteeringHardwareConfiguratorOffset,
                next.toJson(),
              );
        }
      });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiSteeringHardwareConfiguratorOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}
