import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for configuring the map perspective.
class MapPerspectiveMenu extends ConsumerWidget {
  const MapPerspectiveMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final angle = ref.watch(map3DPerspectiveAngleProvider);

    return MenuButtonWithChildren(
      icon: Icons.threed_rotation,
      text: 'Perspective',
      menuChildren: [
        CheckboxListTile(
          value: ref.watch(mapUse3DPerspectiveProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(mapUse3DPerspectiveProvider.notifier)
                  .update(value: value)
              : null,
          secondary: Text(
            'Enable 3D',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        ),
        ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(angle * 180 / pi).round()}°'),
              Slider(
                value: angle,
                onChanged:
                    ref.read(map3DPerspectiveAngleProvider.notifier).update,
                min: 10 * pi / 180,
                max: 70 * pi / 180,
                divisions: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
