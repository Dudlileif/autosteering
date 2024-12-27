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

/// A provider for a set queue of [AudioAsset]s, which also automatically plays
/// and removes them after they are added.
@Riverpod(keepAlive: true)
class AudioQueue extends _$AudioQueue {
  AudioPlayer? _player;
  @override
  Set<AudioAsset> build() {
    listenSelf((previous, next) async {
      if (next.isNotEmpty) {
        if (_player?.state != PlayerState.playing) {
          _player = AudioPlayer()
            ..onPlayerComplete.listen((event) {
              _player?.dispose();
              _player = null;
              removeFirst();
            });
          final asset = next.first;
          final volume =
              ref.read(audioVolumeProvider.select((value) => value[asset])) ??
                  1;
          await _player?.setVolume(volume);
          await _player?.setSourceAsset('audio/${asset.path}.ogg');
          await _player?.resume();
        }
      }
    });

    return {};
  }

  /// Add [asset] to the [state] queue.
  void add(AudioAsset asset) => Future(() => state = state..add(asset));

  /// Removes the first asset of the [state] queue.
  void removeFirst() => Future(() {
        if (state.isNotEmpty) {
          state = state..remove(state.first);
        }
      });

  @override
  bool updateShouldNotify(Set<AudioAsset> previous, Set<AudioAsset> next) =>
      const SetEquality<AudioAsset>().equals(previous, next);
}

/// A provider for all the audio volume levels.
@Riverpod(keepAlive: true)
class AudioVolume extends _$AudioVolume {
  @override
  Map<AudioAsset, double> build() {
    ref.watch(reloadAllSettingsProvider);
    listenSelf((previous, next) {
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
    if (map != null) {
      return map.cast<String, double>().map(
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
