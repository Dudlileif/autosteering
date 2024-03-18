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
import 'package:autosteering/src/features/guidance/widgets/guidance_menu/path_recorder_menu.dart';
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
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Path tracking',
      icon: Icons.route,
      menuChildren: [
        const PathRecorderMenu(),
        Consumer(
          child: Text(
            'Enable',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              secondary: child,
              value: ref.watch(enablePathTrackingProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(enablePathTrackingProvider.notifier)
                      .update(value: value)
                  : null,
            );
          },
        ),
        Consumer(
          child: Text(
            'Show',
            style: textStyle,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              secondary: child,
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
          title: Text(
            'Loop',
            style: textStyle,
          ),
          trailing: Consumer(
            builder: (context, ref, child) {
              final loopMode = ref.watch(pathTrackingLoopProvider);

              return ToggleButtons(
                isSelected: PathTrackingLoopMode.values
                    .map((mode) => mode == loopMode)
                    .toList(),
                onPressed: (index) => ref
                    .read(pathTrackingLoopProvider.notifier)
                    .update(PathTrackingLoopMode.values[index]),
                children: PathTrackingLoopMode.values
                    .map(
                      (mode) => Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(mode.name.capitalize),
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
      ],
    );
  }
}
