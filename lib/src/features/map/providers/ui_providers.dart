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

import 'dart:ui';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ui_providers.g.dart';

/// A provider for the UI [Offset] for the autosteering configurator.
@riverpod
class AutosteeringConfiguratorUiOffset
    extends _$AutosteeringConfiguratorUiOffset {
  @override
  Offset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.uiAutosteeringConfiguratorOffset,
              next.toJson(),
            );
      }
    });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiAutosteeringConfiguratorOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}

/// A provider for the UI [Offset] for the IMU configurator.
@riverpod
class ImuConfiguratorUiOffset extends _$ImuConfiguratorUiOffset {
  @override
  Offset build() {
    ref.listenSelf((previous, next) {
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


/// A provider for the UI [Offset] for the path recording configurator.
@riverpod
class PathRecordingMenuUiOffset extends _$PathRecordingMenuUiOffset {
  @override
  Offset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.uiPathRecordingMenuOffset,
              next.toJson(),
            );
      }
    });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiPathRecordingMenuOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}

/// A provider for the UI [Offset] for the steering hardware configurator.
@riverpod
class SteeringHardwareConfiguratorUiOffset
    extends _$SteeringHardwareConfiguratorUiOffset {
  @override
  Offset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.uiSteeringHardwareConfiguratorOffset,
              next.toJson(),
            );
      }
    });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiSteeringHardwareConfiguratorOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}


/// A provider for the UI [Offset] for the nudging controls.
@riverpod
class NudgingControlsUiOffset extends _$NudgingControlsUiOffset {
  @override
  Offset build() {
    ref.listenSelf((previous, next) {
      if (previous != null && next != previous) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.uiNudgningControlsOffset,
              next.toJson(),
            );
      }
    });

    final setting = ref
        .read(settingsProvider.notifier)
        .getMap(SettingsKey.uiNudgningControlsOffset);
    return setting != null
        ? OffsetJsonExtension.fromJson(Map<String, dynamic>.from(setting))
        : Offset.zero;
  }

  /// Updates [state] to [value].
  void update(Offset value) => Future(() => state = value);
}
