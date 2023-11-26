import 'dart:async';

import 'package:agopengps_flutter/src/features/hardware/hardware.dart';
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
