import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for toggling vehicle debugging
/// features.
class VehicleDebugMenu extends ConsumerWidget {
  const VehicleDebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubmenuButton(
      menuChildren: [
        CheckboxListTile(
          value: ref.watch(debugSteeringProvider),
          onChanged: (value) => value != null
              ? ref.read(debugSteeringProvider.notifier).update(value: value)
              : null,
          secondary: Text(
            'Steering',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        ),
        CheckboxListTile(
          value: ref.watch(debugTrajectoryProvider),
          onChanged: (value) => value != null
              ? ref.read(debugTrajectoryProvider.notifier).update(value: value)
              : null,
          secondary: Text(
            'Trajectory',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        ),
        CheckboxListTile(
          value: ref.watch(debugTravelledPathProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(debugTravelledPathProvider.notifier)
                  .update(value: value)
              : null,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Travelled path',
                style: Theme.of(context).menuButtonWithChildrenText,
              ),
              Slider.adaptive(
                value: ref.watch(debugTravelledPathSizeProvider).toDouble(),
                onChanged: (value) => ref
                    .read(debugTravelledPathSizeProvider.notifier)
                    .update(value.toInt()),
                min: 1,
                max: 1000,
                divisions: 10,
              ),
            ],
          ),
        ),
        CheckboxListTile(
          value: ref.watch(debugVehiclePolygonsProvider),
          onChanged: (value) => value != null
              ? ref
                  .read(debugVehiclePolygonsProvider.notifier)
                  .update(value: value)
              : null,
          secondary: Text(
            'Polygons',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        ),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.agriculture),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'Vehicle',
              style: Theme.of(context).menuButtonWithChildrenText,
            ),
          ),
        ],
      ),
    );
  }
}
