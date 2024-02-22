import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hardware_logging_providers.g.dart';

/// A provider for whether received NMEA messages should be logged.
@Riverpod(keepAlive: true)
class HardwareLogGnss extends _$HardwareLogGnss {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send(
        (logGNSS: next, logIMU: null, logWAS: null, logCombined: null),
      );
      if (previous != null) {
        Logger.instance.i('GNSS logging ${next ? 'enabled' : 'disabled'}');
      }
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether received IMU messages should be logged.
@Riverpod(keepAlive: true)
class HardwareLogImu extends _$HardwareLogImu {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send(
        (logGNSS: null, logIMU: next, logWAS: null, logCombined: null),
      );
      if (previous != null) {
        Logger.instance.i('IMU logging ${next ? 'enabled' : 'disabled'}');
      }
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether received WAS messages should be logged.
@Riverpod(keepAlive: true)
class HardwareLogWas extends _$HardwareLogWas {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send(
        (logGNSS: null, logIMU: null, logWAS: next, logCombined: null),
      );
      if (previous != null) {
        Logger.instance.i('WAS logging ${next ? 'enabled' : 'disabled'}');
      }
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether received NMEA, IMU and WAS messages should be logged
/// in a single file.
@Riverpod(keepAlive: true)
class HardwareLogCombined extends _$HardwareLogCombined {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      ref.read(simInputProvider.notifier).send(
        (logGNSS: null, logIMU: null, logWAS: null, logCombined: next),
      );
      if (previous != null) {
        Logger.instance
            .i('Combined hardware logging ${next ? 'enabled' : 'disabled'}');
      }
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for whether any hardware logging is taking place.
@riverpod
bool hardwareAnyLoggingEnabled(HardwareAnyLoggingEnabledRef ref) =>
    ref.watch(hardwareLogGnssProvider) ||
    ref.watch(hardwareLogImuProvider) ||
    ref.watch(hardwareLogWasProvider) ||
    ref.watch(hardwareLogCombinedProvider);
