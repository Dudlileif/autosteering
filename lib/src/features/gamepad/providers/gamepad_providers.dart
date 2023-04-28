import 'dart:async';
import 'dart:math';

import 'package:agopengps_flutter/src/features/gamepad/gamepad.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/widgets.dart';
import 'package:gamepads/gamepads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gamepad_providers.g.dart';

@Riverpod(keepAlive: true)
class ActiveGamepadConfig extends _$ActiveGamepadConfig {
  @override
  GamepadConfig build() => GamepadConfig(
        analogMaxValue: pow(2, 16).toInt() - 1,
        analogDeadZoneMin: {
          GamepadAnalogInput.leftStickX: 0.2,
          GamepadAnalogInput.leftStickY: 0.2,
          GamepadAnalogInput.rightStickX: 0.2,
          GamepadAnalogInput.rightStickY: 0.2,
          GamepadAnalogInput.leftTrigger: 0.1,
          GamepadAnalogInput.rightTrigger: 0.1,
        },
        analogDeadZoneMax: {
          GamepadAnalogInput.leftStickX: 0.8,
          GamepadAnalogInput.leftTrigger: 0.9,
          GamepadAnalogInput.rightTrigger: 0.9,
        },
      );
}

@Riverpod(keepAlive: true)
Stream<GamepadInput> gamepadInputEvents(GamepadInputEventsRef ref) =>
    Gamepads.events.map(
      (event) {
        print(
          'id: ${event.gamepadId}\tkey: ${event.key}\tvalue: ${event.value}',
        );
        return GamepadInput(
          event: event,
          config: ref.watch(activeGamepadConfigProvider),
        );
      },
    );

@Riverpod(keepAlive: true)
void handleGamepadInput(HandleGamepadInputRef ref) {
  ref.watch(gamepadInputEventsProvider).when(
        data: (event) {
          if (event.povInput != null) {
            handlePovInput(event, ref);
          } else if (event.analogInput != null) {
            handleAnalogInput(event, ref);
          } else if (event.buttonInput != null) {
            handleButtonInput(event, ref);
          }
        },
        error: (error, stackTrace) {},
        loading: () {},
      );
}

void handlePovInput(GamepadInput event, ProviderRef<void> ref) {
  if (event.povInput == GamepadPovInput.released) {
    ref.read(zoomTimerControllerProvider.notifier).cancel();
  } else if (event.povInput == GamepadPovInput.up) {
    ref.read(zoomTimerControllerProvider.notifier).update(Zoom.zoomIn);
  } else if (event.povInput == GamepadPovInput.down) {
    ref.read(zoomTimerControllerProvider.notifier).update(Zoom.zoomOut);
  }
}

void handleAnalogInput(GamepadInput event, ProviderRef<void> ref) {
  final vehicle = ref.watch(mainVehicleProvider);

  // Forward/backward
  if (event.analogInput == GamepadAnalogInput.rightTrigger) {
    final acceleration = Tween<double>(begin: 0, end: 4)
        .transform(event.triggerValueDeadZoneAdjusted);
    ref.read(mainVehicleProvider.notifier).setAcceleration(acceleration);
  }
  if (event.analogInput == GamepadAnalogInput.leftTrigger) {
    final acceleration = Tween<double>(begin: 0, end: -4)
        .transform(event.triggerValueDeadZoneAdjusted);
    ref.read(mainVehicleProvider.notifier).setAcceleration(acceleration);
  }
  // Steering
  else if (event.analogInput == GamepadAnalogInput.leftStickX) {
    final angle = Tween<double>(
      begin: -vehicle.wheelAngleMax,
      end: vehicle.wheelAngleMax,
    ).transform(
      event.joystickValueDeadZoneAdjusted,
    );
    ref.read(mainVehicleProvider.notifier).setWheelAngle(angle);
  }
}

void handleButtonInput(GamepadInput event, ProviderRef<void> ref) {
  if (event.buttonInput == GamepadButtonInput.home) {
    ref.read(mainVehicleProvider.notifier).reset();
    ref.read(mainMapControllerProvider).moveAndRotate(
          ref.watch(offsetVehiclePositionProvider),
          19,
          -ref.watch(mainVehicleProvider).heading,
        );
  } else if (event.buttonInput == GamepadButtonInput.start) {
    ref.read(mainVehicleProvider.notifier).update(
          ref.watch(mainVehicleProvider).copyWith(
                velocity: 0,
                acceleration: 0,
                wheelAngle: 0,
              ),
        );
  }
}
