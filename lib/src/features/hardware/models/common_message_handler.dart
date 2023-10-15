import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/gnss/gnss.dart';
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
      return true;
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
      return true;
    } else if (message is ({double? gnssCurrentFrequency})) {
      ref
          .read(gnssCurrentFrequencyProvider.notifier)
          .update(message.gnssCurrentFrequency);
      return true;
    } else if (message is ({ImuReading? imuLatestRaw})) {
      ref.read(imuCurrentReadingProvider.notifier).update(message.imuLatestRaw);
      return true;
    } else if (message is ({double? imuCurrentFrequency})) {
      ref
          .read(imuCurrentFrequencyProvider.notifier)
          .update(message.imuCurrentFrequency);
      return true;
    } else if (message is ({double? wasCurrentFrequency})) {
      ref
          .read(wasCurrentFrequencyProvider.notifier)
          .update(message.wasCurrentFrequency);
      return true;
    } else if (message is ({WasReading? wasLatestRaw})) {
      ref.read(wasCurrentReadingProvider.notifier).update(message.wasLatestRaw);
      return true;
    } else if (message is LogEvent) {
      Logger.instance.log(
        message.level,
        message.message,
        error: message.error,
        time: message.time,
        stackTrace: message.stackTrace,
      );
      return true;
    }

    return false;
  }
}
