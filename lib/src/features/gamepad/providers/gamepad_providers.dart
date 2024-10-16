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
import 'dart:developer' as dev;
import 'dart:math';

import 'package:autosteering/src/features/gamepad/gamepad.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/widgets.dart';
import 'package:gamepads/gamepads.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gamepad_providers.g.dart';

/// The currently active configuration of the gamepad.
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

/// A stream of the input events from the gamepad mapped to a more friendly
/// input interface.
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

/// A provider for handling the inputs from the gamepad.
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

/// How to handle POV/D-pad inputs.
void handlePovInput(GamepadInput event, ProviderRef<void> ref) {
  if (event.povInput == GamepadPovInput.released) {
    ref.read(zoomTimerControllerProvider.notifier).cancel();
  } else if (event.povInput == GamepadPovInput.up) {
    ref.read(zoomTimerControllerProvider.notifier).zoomIn();
  } else if (event.povInput == GamepadPovInput.down) {
    ref.read(zoomTimerControllerProvider.notifier).zoomOut();
  }
}

/// How to handle analog inputs, i.e. triggers and joysticks.
void handleAnalogInput(GamepadInput event, ProviderRef<void> ref) {
  // Forward/backward
  if (event.analogInput == GamepadAnalogInput.rightTrigger) {
    final velocity = Tween<double>(begin: 0, end: 12)
        .transform(event.triggerValueDeadZoneAdjusted);
    ref.read(simInputProvider.notifier).send(VehicleInput(velocity: velocity));
  }
  if (event.analogInput == GamepadAnalogInput.leftTrigger) {
    final velocity = Tween<double>(begin: 0, end: -12)
        .transform(event.triggerValueDeadZoneAdjusted);
    ref.read(simInputProvider.notifier).send(VehicleInput(velocity: velocity));
  }
  // Steering
  else if (event.analogInput == GamepadAnalogInput.leftStickX) {
    final maxAngle = ref.watch(
        mainVehicleProvider.select((vehicle) => vehicle.steeringAngleMax));

    final angle = Tween<double>(
      begin: -maxAngle,
      end: maxAngle,
    ).transform(
      event.joystickValueDeadZoneAdjusted,
    );
    ref.read(simInputProvider.notifier).send(
          VehicleInput(steeringAngle: angle),
        );
  }
}

/// How to handle button presses.
void handleButtonInput(GamepadInput event, ProviderRef<void> ref) {
  if (event.buttonInput == GamepadButtonInput.home) {
    ref.read(simInputProvider.notifier).send(
          VehicleInput(
            position: ref.watch(homePositionProvider),
            velocity: 0,
          ),
        );
  } else if (event.buttonInput == GamepadButtonInput.start) {
    ref.read(simInputProvider.notifier).send(
          const VehicleInput(
            velocity: 0,
          ),
        );
  }
}
