import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        CheckboxListTile(
          value: ref.watch(debugTrajectoryProvider),
          onChanged: (value) => value != null
              ? ref.read(debugTrajectoryProvider.notifier).update(value: value)
              : null,
          secondary: Text(
            'Trajectory',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
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
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w500),
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
        )
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
