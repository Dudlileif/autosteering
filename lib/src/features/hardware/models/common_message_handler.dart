import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
import 'package:agopengps_flutter/src/features/hardware/hardware.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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
      ref.read(gnssLastUpdateTimeProvider.notifier).update(
        (
          device: message.gnssUpdateTimeDevice,
          receiver: message.gnssUpdateTimeReceiver,
          delay: message.gnssUpdateDelay,
        ),
      );
    } else if (message is ({double? gnssCurrentFrequency})) {
      ref
          .read(gnssCurrentFrequencyProvider.notifier)
          .update(message.gnssCurrentFrequency);
    } else if (message is ({ImuReading? imuLatestRaw})) {
      ref.read(imuCurrentReadingProvider.notifier).update(message.imuLatestRaw);
    } else if (message is ({double? imuCurrentFrequency})) {
      ref
          .read(imuCurrentFrequencyProvider.notifier)
          .update(message.imuCurrentFrequency);
    } else if (message is ({double? wasCurrentFrequency})) {
      ref
          .read(wasCurrentFrequencyProvider.notifier)
          .update(message.wasCurrentFrequency);
    } else if (message is ({WasReading? wasLatestRaw})) {
      ref.read(wasCurrentReadingProvider.notifier).update(message.wasLatestRaw);
    } else if (message is ({double? steeringAngleTarget})) {
      ref
          .read(vehicleSteeringAngleTargetProvider.notifier)
          .update(message.steeringAngleTarget);
    } else if (message is ({double? motorTargetRPM})) {
      ref
          .read(steeringMotorTargetRPMProvider.notifier)
          .update(message.motorTargetRPM);
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
        ref.read(simInputProvider.notifier).send((enableAutoSteer: false));
        ref
            .read(steeringMotorStatusProvider.notifier)
            .update(MotorStatus.stalled);
      }
    } else if (message is ({bool motorNoCommand})) {
      if (message.motorNoCommand) {
        ref.read(simInputProvider.notifier).send((enableAutoSteer: false));
        ref
            .read(steeringMotorStatusProvider.notifier)
            .update(MotorStatus.noCommand);
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
