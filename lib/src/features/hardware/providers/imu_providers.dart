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
import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'imu_providers.g.dart';

/// A provider for the frequency of the IMU updates.
@riverpod
class ImuCurrentFrequency extends _$ImuCurrentFrequency {
  Timer? _resetTimer;

  @override
  double? build() {
    listenSelf((previous, next) {
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

/// A provider for the current raw [ImuReading] from the hardware.
@riverpod
class ImuCurrentReading extends _$ImuCurrentReading {
  Timer? _resetTimer;

  @override
  ImuReading? build() {
    listenSelf((previous, next) {
      _resetTimer?.cancel();
      _resetTimer = Timer(
        const Duration(milliseconds: 350),
        ref.invalidateSelf,
      );
    });

    return null;
  }

  /// Updates [state] to [value].
  void update(ImuReading? value) => Future(() => state = value);
}

/// Whether to show the IMU configurator.
@riverpod
class ShowIMUConfig extends _$ShowIMUConfig {
  @override
  bool build() => false;

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for the UI [Offset] for the IMU configurator.
@riverpod
class ImuConfiguratorUiOffset extends _$ImuConfiguratorUiOffset {
  @override
  Offset build() {
    ref.watch(reloadAllSettingsProvider);
    listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.uiImuConfiguratorOffset,
              next.toJson(),
            );
      }
    });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiImuConfiguratorOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}
