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

part 'nudging_controls_providers.g.dart';

/// A provider for whether to show the vehicle nudging controls.
@riverpod
class ShowNudgingControls extends _$ShowNudgingControls {
  /// Update the [state] to [value].
  void update({required bool value}) => Future(() => state = value);

  /// Invert the current [state].
  void toggle() => Future(() => state = !state);

  @override
  bool build() => false;
}

/// A provider for the step size of a nudge.
@Riverpod(keepAlive: true)
class NudgeStepSize extends _$NudgeStepSize {
  /// Update the [state] to [value].
  void update(double value) => Future(() => state = value);

  @override
  double build() => 0.05;
}

/// A provider for the UI [Offset] for the nudging controls.
@riverpod
class NudgingControlsUiOffset extends _$NudgingControlsUiOffset {
  @override
  Offset build() {
    ref.watch(reloadAllSettingsProvider);
    listenSelf((previous, next) {
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
