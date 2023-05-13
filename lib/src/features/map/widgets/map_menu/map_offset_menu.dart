import 'dart:math';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button and attached submenu for configuring the map center offset.
class MapOffsetMenu extends ConsumerWidget {
  const MapOffsetMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset = ref.watch(mapOffsetProvider);

    return SubmenuButton(
      menuChildren: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('X: ${offset.x} m'),
            Slider(
              value: offset.x,
              onChanged: (value) =>
                  ref.read(mapOffsetProvider.notifier).update(x: value),
              min: -40,
              max: 40,
              divisions: 80,
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Y: ${offset.y} m'),
            Slider(
              value: offset.y,
              onChanged: (value) =>
                  ref.read(mapOffsetProvider.notifier).update(y: value),
              min: -40,
              max: 40,
              divisions: 80,
            )
          ],
        ),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Transform.rotate(
              angle: 45 * 2 * pi / 360,
              child: const Icon(Icons.zoom_out_map_sharp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'Center offset',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
