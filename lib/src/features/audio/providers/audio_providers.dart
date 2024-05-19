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

import 'package:audioplayers/audioplayers.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_providers.g.dart';

/// A provider for playing an audio notification/sound when enabling
/// autosteering.
@riverpod
Future<void> audioAutosteeringEnabled(AudioAutosteeringEnabledRef ref) async {
  ref.keepAlive();
  final volume = ref.watch(audioVolumeAutosteeringEnabledProvider);
  if (volume == 0) {
    ref.invalidateSelf();
  }
  final player = AudioPlayer(playerId: 'autosteering_enabled');
  await player.setVolume(volume);

  await player.setSourceAsset('audio/autosteering_enabled.ogg');
  await player.resume();
  await player.onPlayerComplete.first;
  await player.dispose();
  ref.invalidateSelf();
}

/// A provider for playing an audio notification/sound when disabling
/// autosteering.
@riverpod
Future<void> audioAutosteeringDisabled(AudioAutosteeringDisabledRef ref) async {
  ref.keepAlive();
  final volume = ref.watch(audioVolumeAutosteeringDisabledProvider);
  if (volume == 0) {
    ref.invalidateSelf();
  }
  final player = AudioPlayer(playerId: 'autosteering_disabled');
  await player.setVolume(volume);
  await player.setSourceAsset('audio/autosteering_disabled.ogg');
  await player.resume();
  await player.onPlayerComplete.first;
  await player.dispose();
  ref.invalidateSelf();
}

/// A provider for playing an audio notification/sound when autosteering is
/// in standby.
@riverpod
Future<void> audioAutosteeringStandby(AudioAutosteeringStandbyRef ref) async {
  ref.keepAlive();
  final volume = ref.watch(audioVolumeAutosteeringStandbyProvider);
  if (volume == 0) {
    ref.invalidateSelf();
  }
  final player = AudioPlayer(playerId: 'autosteering_standby');
  await player.setVolume(volume);
  await player.setSourceAsset('audio/autosteering_standby.ogg');
  await player.resume();
  await player.onPlayerComplete.first;
  await player.dispose();
  ref.invalidateSelf();
}

/// A provider for playing an audio notification/sound when GNSS RTK fix
/// accuracy is lost.
@riverpod
Future<void> audioRTKLostAlarm(AudioRTKLostAlarmRef ref) async {
  ref.keepAlive();
  final volume = ref.watch(audioVolumeRTKLostAlarmProvider);
  if (volume == 0) {
    ref.invalidateSelf();
  }
  final player = AudioPlayer(playerId: 'rtk_lost_alarm');
  await player.setVolume(volume);
  await player.setSourceAsset('audio/rtk_lost_alarm.ogg');
  await player.resume();
  await player.onPlayerComplete.first;
  await player.dispose();
  ref.invalidateSelf();
}

/// A provider for the audio volume level for [audioAutosteeringEnabled].
@riverpod
class AudioVolumeAutosteeringEnabled extends _$AudioVolumeAutosteeringEnabled {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.audioVolumeAutosteeringEnabled,
              next.clamp(0, 1),
            );
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getDouble(SettingsKey.audioVolumeAutosteeringEnabled)
            ?.clamp(0, 1) ??
        1;
  }

  /// Update [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the audio volume level for [audioAutosteeringDisabled].
@riverpod
class AudioVolumeAutosteeringDisabled
    extends _$AudioVolumeAutosteeringDisabled {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.audioVolumeAutosteeringDisabled,
              next.clamp(0, 1),
            );
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getDouble(SettingsKey.audioVolumeAutosteeringDisabled)
            ?.clamp(0, 1) ??
        1;
  }

  /// Update [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the audio volume level for [audioAutosteeringStandby].
@riverpod
class AudioVolumeAutosteeringStandby extends _$AudioVolumeAutosteeringStandby {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref.read(settingsProvider.notifier).update(
              SettingsKey.audioVolumeAutosteeringStandby,
              next.clamp(0, 1),
            );
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getDouble(SettingsKey.audioVolumeAutosteeringStandby)
            ?.clamp(0, 1) ??
        1;
  }

  /// Update [state] to [value].
  void update(double value) => Future(() => state = value);
}

/// A provider for the audio volume level for [audioRTKLostAlarm].
@riverpod
class AudioVolumeRTKLostAlarm extends _$AudioVolumeRTKLostAlarm {
  @override
  double build() {
    ref.listenSelf((previous, next) {
      if (previous != null) {
        ref
            .read(settingsProvider.notifier)
            .update(SettingsKey.audioVolumeRTKLostAlarm, next.clamp(0, 1));
      }
    });
    return ref
            .read(settingsProvider.notifier)
            .getDouble(SettingsKey.audioVolumeRTKLostAlarm)
            ?.clamp(0, 1) ??
        1;
  }

  /// Update [state] to [value].
  void update(double value) => Future(() => state = value);
}
