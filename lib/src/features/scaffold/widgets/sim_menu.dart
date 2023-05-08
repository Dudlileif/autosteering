import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimMenu extends ConsumerWidget {
  const SimMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubmenuButton(
      menuChildren: [
        const VehicleSimMenu(),
        ListTile(
          onTap: () => ref.read(simVehicleInputProvider.notifier).send(
                ref.watch(mainVehicleProvider).copyWith(
                      position: ref.watch(homePositionProvider),
                    ),
              ),
          leading: const Icon(Icons.replay),
          title: Text(
            'Reset position',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        if (!kIsWeb)
          ListTile(
            onTap: () => ref.invalidate(simVehicleIsolateStreamProvider),
            leading: const Icon(Icons.replay),
            title: Text(
              'Restart sim',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
      ],
      child: Text(
        'Sim',
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
