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
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button and attached submenu for configuring the map center offset.
class MapOffsetMenu extends ConsumerWidget {
  /// A menu button and attached submenu for configuring the map center offset.
  const MapOffsetMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    final using3D = ref.watch(mapUse3DPerspectiveProvider);

    final offset = ref.watch(mapOffsetProvider);

    return MenuButtonWithChildren(
      icon: Icons.zoom_out_map_sharp,
      iconRotation: 45,
      text: using3D ? 'Center offset 3D' : 'Center offset 2D',
      menuChildren: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'X: ${offset.x} m',
              style: textStyle,
            ),
            Slider(
              value: offset.x,
              onChanged: (value) => switch (using3D) {
                true => ref.read(mapOffset3DProvider.notifier).update(x: value),
                false => ref.read(mapOffset2DProvider.notifier).update(x: value)
              },
              min: -40,
              max: 40,
              divisions: 80,
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Y: ${offset.y} m',
              style: textStyle,
            ),
            Slider(
              value: offset.y,
              onChanged: (value) => switch (using3D) {
                true => ref.read(mapOffset3DProvider.notifier).update(y: value),
                false => ref.read(mapOffset2DProvider.notifier).update(y: value)
              },
              min: -40,
              max: 40,
              divisions: 80,
            ),
          ],
        ),
      ],
    );
  }
}
