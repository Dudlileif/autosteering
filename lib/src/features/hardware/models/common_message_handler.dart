import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A class with a method for handling common messages.
class CommonMessageHandler {
  /// Handles hardware update messages that are common and being received from
  /// from decoded serial data or in the main thread from the simulation core.
  ///
  /// Returns true if the [message] has been handled, false otherwise to allow
  /// further handling of the message.
  ///
  /// [ref] is the Riverpod [Ref] object to be able to call providers.
  static bool handleHardwareMessage(
    Ref ref,
    dynamic message,
  ) {
    if (message is GnssPositionCommonSentence) {
      ref.read(gnssCurrentSentenceProvider.notifier).update(message);
    } else if (message is ({
      DateTime gnssUpdateTimeDevice,
      DateTime? gnssUpdateTimeReceiver,
      Duration? gnssUpdateDelay,
    })) {
      if (ref.exists(gnssLastUpdateTimeProvider)) {
        ref.read(gnssLastUpdateTimeProvider.notifier).update(
          (
            device: message.gnssUpdateTimeDevice,
            receiver: message.gnssUpdateTimeReceiver,
            delay: message.gnssUpdateDelay,
          ),
        );
      }
    } else if (message is ({double? gnssCurrentFrequency})) {
      if (ref.exists(gnssCurrentFrequencyProvider)) {
        ref
            .read(gnssCurrentFrequencyProvider.notifier)
            .update(message.gnssCurrentFrequency);
      }
    } else if (message is ({ImuReading? imuLatestRaw})) {
      if (ref.exists(imuCurrentReadingProvider)) {
        ref
            .read(imuCurrentReadingProvider.notifier)
            .update(message.imuLatestRaw);
      }
    } else if (message is ({double? imuCurrentFrequency})) {
      if (ref.exists(imuCurrentFrequencyProvider)) {
        ref
            .read(imuCurrentFrequencyProvider.notifier)
            .update(message.imuCurrentFrequency);
      }
    } else if (message is ({double? wasCurrentFrequency})) {
      if (ref.exists(wasCurrentFrequencyProvider)) {
        ref
            .read(wasCurrentFrequencyProvider.notifier)
            .update(message.wasCurrentFrequency);
      }
    } else if (message is ({WasReading? wasLatestRaw})) {
      if (ref.exists(wasCurrentReadingProvider)) {
        ref
            .read(wasCurrentReadingProvider.notifier)
            .update(message.wasLatestRaw);
      }
    } else if (message is ({double? steeringAngleTarget})) {
      if (ref.exists(vehicleSteeringAngleTargetProvider)) {
        ref
            .read(vehicleSteeringAngleTargetProvider.notifier)
            .update(message.steeringAngleTarget);
      }
    } else if (message is ({int? wasTarget})) {
      if (ref.exists(steeringMotorWasTargetProvider)) {
        ref
            .read(steeringMotorWasTargetProvider.notifier)
            .update(message.wasTarget);
      }
    } else if (message is ({double? motorActualRPM})) {
      ref
          .read(steeringMotorActualRPMProvider.notifier)
          .update(message.motorActualRPM);
    } else if (message is ({bool motorEnabled})) {
      ref.read(steeringMotorStatusProvider.notifier).update(
            switch (message.motorEnabled) {
              true => MotorStatus.running,
              false => MotorStatus.disabled,
            },
          );
    } else if (message is ({bool motorStalled})) {
      if (message.motorStalled) {
        ref
            .read(simInputProvider.notifier)
            .send((enableAutoSteer: false, stalled: true));
        ref
            .read(steeringMotorStatusProvider.notifier)
            .update(MotorStatus.stalled);
      }
    } else if (message is ({bool motorNoCommand})) {
      if (message.motorNoCommand) {
        ref
            .read(simInputProvider.notifier)
            .send((enableAutoSteer: false, noCommand: true));
        ref
            .read(steeringMotorStatusProvider.notifier)
            .update(MotorStatus.noCommand);
      }
    } else if (message is ({int? motorCurrentScale})) {
      if (ref.exists(steeringMotorCurrentScaleProvider)) {
        ref
            .read(steeringMotorCurrentScaleProvider.notifier)
            .update(message.motorCurrentScale);
      }
    } else if (message is ({int? motorStallguard})) {
      if (ref.exists(steeringMotorStallguardProvider)) {
        ref
            .read(steeringMotorStallguardProvider.notifier)
            .update(message.motorStallguard);
      }
    } else if (message is ({double? motorRotation})) {
      if (ref.exists(steeringMotorRotationProvider)) {
        ref
            .read(steeringMotorRotationProvider.notifier)
            .update(message.motorRotation);
      }
    } else if (message is ({double? motorTargetRotation})) {
      if (ref.exists(steeringMotorTargetRotationProvider)) {
        ref
            .read(steeringMotorTargetRotationProvider.notifier)
            .update(message.motorTargetRotation);
      }
    } else if (message is ({double? stepsPerWasIncrementMinToCenter})) {
      if (ref.exists(steeringMotorStepsPerWasIncrementMinToCenterProvider)) {
        ref
            .read(
              steeringMotorStepsPerWasIncrementMinToCenterProvider.notifier,
            )
            .update(message.stepsPerWasIncrementMinToCenter);
      }
    } else if (message is ({double? stepsPerWasIncrementCenterToMax})) {
      if (ref.exists(steeringMotorStepsPerWasIncrementCenterToMaxProvider)) {
        ref
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
}
