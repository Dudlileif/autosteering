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

/// A menu button with attached submenu for configuring the map perspective.
class MapPerspectiveMenu extends StatelessWidget {
  /// A menu button with attached submenu for configuring the map perspective.
  const MapPerspectiveMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MenuButtonWithChildren(
      icon: Icons.threed_rotation,
      text: 'Perspective',
      menuChildren: [
        Consumer(
          child: Text(
            'Enable 3D',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          builder: (context, ref, child) {
            return CheckboxListTile(
              value: ref.watch(mapUse3DPerspectiveProvider),
              onChanged: (value) => value != null
                  ? ref
                      .read(mapUse3DPerspectiveProvider.notifier)
                      .update(value: value)
                  : null,
              secondary: child,
            );
          },
        ),
        ListTile(
          title: Consumer(
            builder: (context, ref, child) {
              final angle = ref.watch(map3DPerspectiveAngleProvider);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('$angle°'),
                  Slider(
                    value: angle,
                    onChanged:
                        ref.read(map3DPerspectiveAngleProvider.notifier).update,
                    min: 10,
                    max: 70,
                    divisions: 12,
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
