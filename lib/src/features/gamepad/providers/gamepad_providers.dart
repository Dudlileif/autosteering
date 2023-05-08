import 'dart:async';
import 'dart:developer' as dev;
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
        dev.log(
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
    final velocity = Tween<double>(begin: 0, end: 12)
        .transform(event.triggerValueDeadZoneAdjusted);
    ref
        .read(simVehicleInputProvider.notifier)
        .send(VehicleInput(velocity: velocity));
  }
  if (event.analogInput == GamepadAnalogInput.leftTrigger) {
    final velocity = Tween<double>(begin: 0, end: -12)
        .transform(event.triggerValueDeadZoneAdjusted);
    ref
        .read(simVehicleInputProvider.notifier)
        .send(VehicleInput(velocity: velocity));
  }
  // Steering
  else if (event.analogInput == GamepadAnalogInput.leftStickX) {
    final angle = Tween<double>(
      begin: -vehicle.steeringAngleMax,
      end: vehicle.steeringAngleMax,
    ).transform(
      event.joystickValueDeadZoneAdjusted,
    );
    ref.read(simVehicleInputProvider.notifier).send(
          VehicleInput(steeringAngle: angle),
        );
  }
}

void handleButtonInput(GamepadInput event, ProviderRef<void> ref) {
  if (event.buttonInput == GamepadButtonInput.home) {
    ref.read(simVehicleInputProvider.notifier).send(
          VehicleInput(
            position: ref.watch(homePositionProvider),
            velocity: 0,
          ),
        );
  } else if (event.buttonInput == GamepadButtonInput.start) {
    ref.read(simVehicleInputProvider.notifier).send(
          const VehicleInput(
            velocity: 0,
          ),
        );
  }
}
