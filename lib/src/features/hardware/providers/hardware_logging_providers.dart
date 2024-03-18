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
