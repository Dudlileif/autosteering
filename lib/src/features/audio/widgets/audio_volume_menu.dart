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

import 'package:autosteering/src/features/audio/audio.dart';
import 'package:autosteering/src/features/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for changing the audio volume levels of the alarm/notification
/// sounds.
class AudioVolumeMenu extends StatelessWidget {
  /// A menu for changing the audio volume levels of the alarm/notification
  /// sounds.
  const AudioVolumeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuButtonWithChildren(
      text: 'Audio levels',
      icon: Icons.volume_up,
      menuChildren: [
        _AudioVolumeTile(
          title: 'Autosteering enabled',
          audioProvider: audioAutosteeringEnabledProvider,
          volumeProvider: audioVolumeAutosteeringEnabledProvider,
        ),
        _AudioVolumeTile(
          title: 'Autosteering disable',
          audioProvider: audioAutosteeringDisabledProvider,
          volumeProvider: audioVolumeAutosteeringDisabledProvider,
        ),
        _AudioVolumeTile(
          title: 'Autosteering standby',
          audioProvider: audioAutosteeringStandbyProvider,
          volumeProvider: audioVolumeAutosteeringStandbyProvider,
        ),
        _AudioVolumeTile(
          title: 'RTK lost alarm',
          audioProvider: audioRTKLostAlarmProvider,
          volumeProvider: audioVolumeRTKLostAlarmProvider,
        ),
      ],
    );
  }
}

class _AudioVolumeTile extends ConsumerWidget {
  const _AudioVolumeTile({
    required this.title,
    required this.audioProvider,
    required this.volumeProvider,
  });

  final String title;
  final AutoDisposeFutureProvider<void> audioProvider;
  final AutoDisposeNotifierProvider<dynamic, double> volumeProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var volume = ref.read(volumeProvider);
    return ListTile(
      title: Text(title),
      subtitle: StatefulBuilder(
        builder: (context, setState) {
          return Slider(
            value: volume,
            onChanged: (value) => setState(() => volume = value),
            onChangeEnd: (value) =>
                ref.read(volumeProvider.notifier).update(value),
            divisions: 10,
          );
        },
      ),
      trailing: IconButton(
        onPressed: () => ref.read(audioProvider),
        icon: const Icon(Icons.play_arrow),
      ),
    );
  }
}
