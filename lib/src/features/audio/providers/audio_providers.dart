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
import 'package:autosteering/src/features/audio/audio.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audio_providers.g.dart';

/// A provider for playing an audio notification/sound when GNSS RTK fix
/// accuracy is lost.
@riverpod
Future<void> audioPlayer(AudioPlayerRef ref, AudioAsset asset) async {
  ref.keepAlive();
  final volume =
      ref.watch(audioVolumeProvider.select((value) => value[asset])) ?? 1;
  if (volume == 0) {
    ref.invalidateSelf();
  }
  final player = AudioPlayer(playerId: asset.path);
  await player.setVolume(volume);
  await player.setSourceAsset('audio/${asset.path}.ogg');
  await player.resume();
  await player.onPlayerComplete.first;
  await player.dispose();
  ref.invalidateSelf();
}

/// A provider for all the audio volume levels.
@Riverpod(keepAlive: true)
class AudioVolume extends _$AudioVolume {
  @override
  Map<AudioAsset, double> build() {
    ref
      ..watch(reloadAllSettingsProvider)
      ..listenSelf((previous, next) {
        if (previous != null &&
            const MapEquality<AudioAsset, double>().equals(previous, next)) {
          ref.read(settingsProvider.notifier).update(
                SettingsKey.audioVolumes,
                next.map((key, value) => MapEntry(key.path, value)),
              );
        }
      });
    final map =
        ref.read(settingsProvider.notifier).getMap(SettingsKey.audioVolumes);
    if (map != null && map is Map<String, double>) {
      return map.map(
        (key, value) =>
            MapEntry(AudioAsset.fromPath(key), clampDouble(value, 0, 1)),
      );
    }
    return {for (final asset in AudioAsset.values) asset: 1};
  }

  /// Update the [volume] of the [source].
  void update(AudioAsset source, double volume) => Future(
        () => state = state
          ..update(
            source,
            (value) => clampDouble(volume, 0, 1),
            ifAbsent: () => clampDouble(volume, 0, 1),
          ),
      );

  @override
  bool updateShouldNotify(
    Map<AudioAsset, double> previous,
    Map<AudioAsset, double> next,
  ) =>
      const MapEquality<AudioAsset, double>().equals(previous, next);
}
