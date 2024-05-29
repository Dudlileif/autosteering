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

import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'virtual_led_bar_providers.g.dart';

/// A provider for whether the virtual led bar should be enabled/shown.
@riverpod
class VirtualLedBarEnabled extends _$VirtualLedBarEnabled {
  @override
  bool build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null && previous != next) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.virtualLedBarEnabled, next);
      }
    });

    return ref
            .read(settingsProvider.notifier)
            .getBool(SettingsKey.virtualLedBarEnabled) ??
        true;
  }

  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);
}

/// A provider for storing the configuration for the virtual led bar.
@riverpod
class VirtualLedBarConfiguration extends _$VirtualLedBarConfiguration {
  @override
  LedBarConfig build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.virtualLedBarConfig, next);
      }
    });

    if (ref
        .read(settingsProvider.notifier)
        .containsKey(SettingsKey.virtualLedBarConfig)) {
      return LedBarConfig.fromJson(
        ref
                .read(settingsProvider.notifier)
                .getMap(SettingsKey.virtualLedBarConfig) ??
            {},
      );
    }
    return const LedBarConfig();
  }

  /// Updates the [state] to [value].
  void update(LedBarConfig value) => Future(() => state = value);
}

/// A provider for whether we're testing the virtual LED bar with
/// [VirtualLedBarTestingDistance].
@riverpod
class VirtualLedBarTesting extends _$VirtualLedBarTesting {
  @override
  bool build() {
    ref.listenSelf((previous, next) {
      if (next) {
        ref.read(virtualLedBarTestingDistanceProvider.notifier).update(0);
      } else {
        ref.invalidate(virtualLedBarTestingDistanceProvider);
      }
    });
    return false;
  }

  /// Updates [state] to [value].
  void update({required bool value}) => Future(() => state = value);
}

/// A provider for a testing cross track distance for the virtual LED bar.
@riverpod
class VirtualLedBarTestingDistance extends _$VirtualLedBarTestingDistance {
  @override
  double? build() => null;

  /// Updates [state] to [value].
  void update(double? value) => Future(() => state = value);
}

/// A provider for the perpendicular distance to the currently active
/// guidance, otherwise 0.
@riverpod
double? virtualLedBarPerpendicularDistance(
  VirtualLedBarPerpendicularDistanceRef ref,
) =>
    ref.watch(virtualLedBarTestingDistanceProvider) ??
    ref.watch(abTrackingPerpendicularDistanceProvider) ??
    ref.watch(pathTrackingPerpendicularDistanceProvider);
