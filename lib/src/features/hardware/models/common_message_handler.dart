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
import 'package:autosteering/src/features/equipment/providers/equipment_providers.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A class with methods for handling common hardware messages.
class CommonMessageHandler {
  /// A class with a method for handling common hardware messages.
  /// [ref] is the Riverpod [Ref] object needed to be able to call providers.
  CommonMessageHandler(Ref ref) : _ref = ref;

  final Ref _ref;

  final _buttonTimers = <int, Timer?>{};

  static const _numButtons = 3;

  /// Attempt to handle the [message] with the common hardware message handlers.
  ///
  /// Returns true if the [message] has been handled, false otherwise to allow
  /// further handling of the message.
  bool attemptToHandleMessage(dynamic message) {
    return handleSteeringHardwareMessage(message) ||
        handleRemoteControlHardwareMessage(message);
  }

  /// Handles steering hardware update messages that are common and being
  /// received from decoded serial data or in the main thread from the
  /// simulation core.
  ///
  /// Returns true if the [message] has been handled, false otherwise to allow
  /// further handling of the message.
  bool handleSteeringHardwareMessage(dynamic message) {
    if (message is GnssPositionCommonSentence) {
      _ref.read(gnssCurrentSentenceProvider.notifier).update(message);
      _ref
          .read(steeringHardwareNetworkAliveProvider.notifier)
          .update(value: true);
    } else if (message is ({
      DateTime gnssUpdateTimeDevice,
      DateTime? gnssUpdateTimeReceiver,
      Duration? gnssUpdateDelay,
    })) {
      if (_ref.exists(gnssLastUpdateTimeProvider)) {
        _ref.read(gnssLastUpdateTimeProvider.notifier).update(
          (
            device: message.gnssUpdateTimeDevice,
            receiver: message.gnssUpdateTimeReceiver,
            delay: message.gnssUpdateDelay,
          ),
        );
      }
    } else if (message is ({double? gnssCurrentFrequency})) {
      if (_ref.exists(gnssCurrentFrequencyProvider)) {
        _ref
            .read(gnssCurrentFrequencyProvider.notifier)
            .update(message.gnssCurrentFrequency);
      }
    } else if (message is ({ImuReading? imuLatestRaw})) {
      if (_ref.exists(imuCurrentReadingProvider)) {
        _ref
            .read(imuCurrentReadingProvider.notifier)
            .update(message.imuLatestRaw);
      }
      if (message.imuLatestRaw != null) {
        _ref
            .read(steeringHardwareNetworkAliveProvider.notifier)
            .update(value: true);
      }
    } else if (message is ({double? imuCurrentFrequency})) {
      if (_ref.exists(imuCurrentFrequencyProvider)) {
        _ref
            .read(imuCurrentFrequencyProvider.notifier)
            .update(message.imuCurrentFrequency);
      }
    } else if (message is ({double? wasCurrentFrequency})) {
      if (_ref.exists(wasCurrentFrequencyProvider)) {
        _ref
            .read(wasCurrentFrequencyProvider.notifier)
            .update(message.wasCurrentFrequency);
      }
    } else if (message is ({WasReading? wasLatestRaw})) {
      if (_ref.exists(wasCurrentReadingProvider)) {
        _ref
            .read(wasCurrentReadingProvider.notifier)
            .update(message.wasLatestRaw);
      }
      if (message.wasLatestRaw != null) {
        _ref
            .read(steeringHardwareNetworkAliveProvider.notifier)
            .update(value: true);
      }
    } else if (message is ({double? steeringAngleTarget})) {
      if (_ref.exists(vehicleSteeringAngleTargetProvider)) {
        _ref
            .read(vehicleSteeringAngleTargetProvider.notifier)
            .update(message.steeringAngleTarget);
      }
    } else if (message is ({int? wasTarget})) {
      if (_ref.exists(steeringMotorWasTargetProvider)) {
        _ref
            .read(steeringMotorWasTargetProvider.notifier)
            .update(message.wasTarget);
      }
    } else if (message is ({double? motorActualRPM})) {
      _ref
          .read(steeringMotorActualRPMProvider.notifier)
          .update(message.motorActualRPM);
    } else if (message is ({bool motorEnabled})) {
      _ref.read(steeringMotorStatusProvider.notifier).update(
            switch (message.motorEnabled) {
              true => MotorStatus.running,
              false => MotorStatus.disabled,
            },
          );
    } else if (message is ({bool motorStalled})) {
      if (message.motorStalled) {
        _ref
            .read(simInputProvider.notifier)
            .send((enableAutoSteer: false, stalled: true));
        _ref
            .read(steeringMotorStatusProvider.notifier)
            .update(MotorStatus.stalled);
      }
    } else if (message is ({bool motorNoCommand})) {
      if (message.motorNoCommand) {
        _ref
            .read(simInputProvider.notifier)
            .send((enableAutoSteer: false, noCommand: true));
        _ref
            .read(steeringMotorStatusProvider.notifier)
            .update(MotorStatus.noCommand);
      }
    } else if (message is ({int? motorCurrentScale})) {
      if (_ref.exists(steeringMotorCurrentScaleProvider)) {
        _ref
            .read(steeringMotorCurrentScaleProvider.notifier)
            .update(message.motorCurrentScale);
      }
    } else if (message is ({int? motorStallguard})) {
      if (_ref.exists(steeringMotorStallguardProvider)) {
        _ref
            .read(steeringMotorStallguardProvider.notifier)
            .update(message.motorStallguard);
      }
    } else if (message is ({double? motorRotation})) {
      if (_ref.exists(steeringMotorRotationProvider)) {
        _ref
            .read(steeringMotorRotationProvider.notifier)
            .update(message.motorRotation);
      }
    } else if (message is ({double? motorTargetRotation})) {
      if (_ref.exists(steeringMotorTargetRotationProvider)) {
        _ref
            .read(steeringMotorTargetRotationProvider.notifier)
            .update(message.motorTargetRotation);
      }
    } else if (message is ({double? stepsPerWasIncrementMinToCenter})) {
      if (_ref.exists(steeringMotorStepsPerWasIncrementMinToCenterProvider)) {
        _ref
            .read(
              steeringMotorStepsPerWasIncrementMinToCenterProvider.notifier,
            )
            .update(message.stepsPerWasIncrementMinToCenter);
      }
    } else if (message is ({double? stepsPerWasIncrementCenterToMax})) {
      if (_ref.exists(steeringMotorStepsPerWasIncrementCenterToMaxProvider)) {
        _ref
            .read(
              steeringMotorStepsPerWasIncrementCenterToMaxProvider.notifier,
            )
            .update(message.stepsPerWasIncrementCenterToMax);
      }
    } else if (message is LogEvent) {
      Logger.instance.log(
        message.level,
        message.message,
        error: message.error,
        time: message.time,
        stackTrace: message.stackTrace,
      );
    } else {
      return false;
    }
    return true;
  }

  /// Handles remote control hardware update messages that are common and being
  /// received from decoded serial data or in the main thread from the
  /// simulation core.
  ///
  /// Returns true if the [message] has been handled, false otherwise to allow
  /// further handling of the message.
  bool handleRemoteControlHardwareMessage(dynamic message) {
    if (message is ({List<bool> buttonStates})) {
      final states = message.buttonStates;
      for (var i = 0; i < _numButtons; i++) {
        if (states[i]) {
          if (_buttonTimers[i] == null) {
            _buttonTimers[i] = Timer(const Duration(milliseconds: 250), () {
              _buttonTimers[i]?.cancel();
              _buttonTimers[i] = null;
            });
            _buttonHandler(i);
          } else {
            Logger.instance
                .i('Remote control button pressed too soon: ${i + 1}');
          }
        }
      }
    } else {
      return false;
    }
    _ref
        .read(remoteControlHardwareNetworkAliveProvider.notifier)
        .update(value: true);
    return true;
  }

  void _buttonHandler(int i) {
    final actions = _ref.read(remoteControlButtonActionsProvider);
    switch (actions[i]) {
      case RemoteControlButtonAction.toggleEquipmentSections:
        final equipments = _ref.read(
          allEquipmentsProvider.select(
            (value) =>
                value.values.where((element) => element.sections.isNotEmpty),
          ),
        );
        for (final equipment in equipments) {
          _ref.read(simInputProvider.notifier).send(
            (
              uuid: equipment.uuid,
              activeSections: (equipment
                    ..toggleAll(deactivateAllIfAnyActive: true))
                  .sectionActivationStatus,
            ),
          );
        }
        Logger.instance.i(
          '''Remote control active sections toggled.''',
        );

      case RemoteControlButtonAction.toggleABSnap:
        _ref.read(aBSnapToClosestLineProvider.notifier).toggle();
        Logger.instance.i(
          '''Remote control AB snap to closest line toggled.''',
        );

      case RemoteControlButtonAction.toggleAutosteering:
        final state = _ref.read(activeAutosteeringStateProvider);
        _ref
            .read(simInputProvider.notifier)
            .send((enableAutoSteer: state == AutosteeringState.disabled));
        Logger.instance.i(
          '''Remote control autosteering toggled.''',
        );

      case null:
        Logger.instance.i(
          'Remote control button pressed with no action assigned: ${i + 1}.',
        );
    }
  }
}
