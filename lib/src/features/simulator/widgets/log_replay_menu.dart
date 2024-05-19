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
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for options for using a [LogReplay].
class LogReplayMenu extends ConsumerWidget {
  /// A menu button with attached submenu for options for using a [LogReplay].
  const LogReplayMenu({super.key});

  String _durationToHMS(Duration? duration) {
    if (duration == null) {
      return '--:--';
    }
    var string = duration.toString();
    if (duration.inHours < 1) {
      string = string.substring(string.indexOf(':') + 1);
    }
    return string.substring(0, string.lastIndexOf('.'));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.history,
      text: 'Log replay',
      menuChildren: [
        Consumer(
          child: Text(
            'Choose log',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.folder_open),
            title: child,
            onTap: () => ref.read(importLogReplayProvider),
          ),
        ),
        Consumer(
          builder: (context, ref, child) => ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 175),
            child: CheckboxListTile(
              title: const Text(
                'Loop',
                maxLines: 1,
                softWrap: false,
              ),
              secondary: const Icon(Icons.loop),
              value: ref.watch(loopLogReplayProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(loopLogReplayProvider.notifier)
                      .update(value: value)
                  : null,
            ),
          ),
        ),
        Consumer(
          child: Text(
            'Resume',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.play_arrow),
            title: child,
            onTap: () =>
                ref.read(simInputProvider.notifier).send((replayResume: true)),
          ),
        ),
        Consumer(
          child: Text(
            'Pause',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.pause),
            title: child,
            onTap: () =>
                ref.read(simInputProvider.notifier).send((replayPause: true)),
          ),
        ),
        Consumer(
          child: Text(
            'Cancel',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.clear),
            title: child,
            onTap: () =>
                ref.read(simInputProvider.notifier).send((replayCancel: true)),
          ),
        ),
        Consumer(
          child: Text(
            'Restart',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.refresh),
            title: child,
            onTap: () =>
                ref.read(simInputProvider.notifier).send((replayRestart: true)),
          ),
        ),
        if (ref.watch(activeLogReplayProvider.select((value) => value != null)))
          Builder(
            builder: (context) {
              var changing = false;
              var changingIndex = 0.0;
              return StatefulBuilder(
                builder: (context, setState) => Consumer(
                  builder: (context, ref, child) {
                    final index = changing
                        ? changingIndex
                        : ref.watch(logReplayIndexProvider).toDouble();
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _durationToHMS(
                                  ref.watch(
                                    activeLogReplayProvider.select(
                                      (value) => value?.records
                                          .elementAtOrNull(index.round())
                                          ?.replayTime,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                _durationToHMS(
                                  ref.watch(
                                    activeLogReplayProvider.select(
                                      (value) =>
                                          value?.records.lastOrNull?.replayTime,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                          value: index,
                          max: ref
                              .watch(
                                activeLogReplayProvider.select(
                                  (value) => (value?.records.length ?? 0) - 1.0,
                                ),
                              )
                              .clamp(0, double.infinity),
                          divisions: ref.watch(
                            activeLogReplayProvider.select(
                              (value) => value?.records.length,
                            ),
                          ),
                          onChangeStart: (value) =>
                              setState(() => changing = true),
                          onChanged: (value) =>
                              setState(() => changingIndex = value),
                          onChangeEnd: (value) {
                            ref
                                .read(simInputProvider.notifier)
                                .send((replayScrubIndex: value.round()));
                            setState(() => changing = false);
                          },
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
      ],
    );
  }
}
