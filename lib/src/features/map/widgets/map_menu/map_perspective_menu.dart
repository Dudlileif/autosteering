import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
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
