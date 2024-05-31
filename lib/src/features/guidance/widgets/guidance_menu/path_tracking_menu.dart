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
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for working with the path tracking
/// feature.
class PathTrackingMenu extends ConsumerWidget {
  /// A menu button with attached submenu for working with the path tracking
  ///  feature.
  const PathTrackingMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textStyle = theme.menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Path tracking',
      icon: Icons.route,
      menuChildren: [
        MenuItemButton(
          closeOnActivate: false,
          onPressed: ref.watch(
            configuredPathTrackingProvider.select((value) => value != null),
          )
              ? () {
                  if (ref.watch(
                    displayABTrackingProvider.select((value) => value != null),
                  )) {
                    showDialog<void>(
                      context: context,
                      builder: (context) => Consumer(
                        builder: (context, ref, child) => ConfirmationDialog(
                          title: 'Close active AB tracking?',
                          onConfirmation: () async => ref
                              .read(
                                configuredPathTrackingProvider.notifier,
                              )
                              .sendToSim(),
                        ),
                      ),
                    );
                  } else {
                    ref
                        .read(configuredPathTrackingProvider.notifier)
                        .sendToSim();
                  }
                }
              : null,
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.check),
          ),
          child: Text('Apply and use', style: textStyle),
        ),
        MenuItemButton(
          closeOnActivate: false,
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.voicemail),
          ),
          onPressed: () {
            ref.read(enablePathRecorderProvider.notifier).update(value: true);
            ref
                .read(activePathRecordingTargetProvider.notifier)
                .update(PathRecordingTarget.pathTracking);
            ref
                .read(showPathRecordingMenuProvider.notifier)
                .update(value: true);
          },
          child: Text('Path recording', style: textStyle),
        ),
        Consumer(
          child: Text(
            'Show',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              secondary: switch (ref.watch(showPathTrackingProvider)) {
                true => const Icon(Icons.visibility),
                false => const Icon(Icons.visibility_off),
              },
              title: child,
              value: ref.watch(showPathTrackingProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(showPathTrackingProvider.notifier)
                      .update(value: value)
                  : null,
            );
          },
        ),
        ListTile(
          leading: Text(
            'Loop',
            style: textStyle,
          ),
          title: Consumer(
            builder: (context, ref, child) {
              final loopMode = ref.watch(pathTrackingLoopProvider);

              return SegmentedButton<PathTrackingLoopMode>(
                style: theme.segmentedButtonTheme.style?.copyWith(
                  visualDensity: VisualDensity.compact,
                ),
                showSelectedIcon: false,
                selected: {loopMode},
                onSelectionChanged: (values) => ref
                    .read(pathTrackingLoopProvider.notifier)
                    .update(values.first),
                segments: PathTrackingLoopMode.values
                    .map(
                      (mode) => ButtonSegment(
                        value: mode,
                        label: Text(mode.name.capitalize),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
        ListTile(
          title: Consumer(
            builder: (context, ref, child) {
              final distance = ref.watch(pathInterpolationDistanceProvider);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Interpolation distance: $distance m',
                    style: textStyle,
                  ),
                  Slider(
                    value: distance,
                    onChanged: ref
                        .read(pathInterpolationDistanceProvider.notifier)
                        .update,
                    max: 20,
                    min: 1,
                    divisions: 19,
                  ),
                ],
              );
            },
          ),
        ),
        if (ref.watch(enableDebugModeProvider))
          Consumer(
            builder: (context, ref, child) => CheckboxListTile(
              secondary: const Icon(Icons.bug_report),
              title: Text(
                'Debug',
                style: textStyle,
              ),
              value: ref.watch(debugPathTrackingProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(debugPathTrackingProvider.notifier)
                      .update(value: value)
                  : null,
            ),
          ),
      ],
    );
  }
}
