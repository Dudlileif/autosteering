import 'package:agopengps_flutter/src/features/common/widgets/widgets.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for configuring the simulator.
class SimMenu extends ConsumerWidget {
  const SimMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuButtonWithChildren(
      text: 'Sim',
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
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
        ),
        if (!kIsWeb)
          ListTile(
            onTap: () => ref.invalidate(simVehicleIsolateStreamProvider),
            leading: const Icon(Icons.replay),
            title: Text(
              'Restart sim',
              style: Theme.of(context).menuButtonWithChildrenText,
            ),
          ),
      ],
    );
  }
}
