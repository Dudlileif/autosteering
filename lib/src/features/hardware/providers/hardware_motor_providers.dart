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
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_motor_providers.g.dart';

/// A provider for the WAS target for the steering motor when using guidance.

@riverpod
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
