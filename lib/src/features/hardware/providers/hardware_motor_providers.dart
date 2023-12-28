import 'dart:async';

import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_motor_providers.g.dart';

/// A provider for the target steering motor rpm when using guidance.

@riverpod
class SteeringMotorTargetRPM extends _$SteeringMotorTargetRPM {
  @override
  double? build() => null;

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
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
