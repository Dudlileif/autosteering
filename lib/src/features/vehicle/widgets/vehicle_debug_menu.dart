import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehicleDebugMenu extends ConsumerWidget {
  const VehicleDebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubmenuButton(
      menuChildren: [
        if (ref.watch(mainVehicleProvider) is AxleSteeredVehicle)
          CheckboxListTile(
            value: ref.watch(debugAckermannProvider),
            onChanged: (value) => value != null
                ? ref.read(debugAckermannProvider.notifier).update(value: value)
                : null,
            secondary: Text(
              'Ackermann steering',
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
        )
      ],
      child: Text(
        'Vehicle',
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
