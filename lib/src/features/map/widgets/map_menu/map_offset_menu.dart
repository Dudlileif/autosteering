import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
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
