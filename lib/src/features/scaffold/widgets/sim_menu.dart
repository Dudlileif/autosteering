import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for configuring the simulator.
class SimMenu extends StatelessWidget {
  const SimMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Sim',
      menuChildren: [
        const VehicleSimMenu(),
        Consumer(
          child: Text(
            'Reset position',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            onTap: () => ref.read(simInputProvider.notifier).send(
                  ref.watch(mainVehicleProvider).copyWith(
                        position: ref.watch(homePositionProvider),
                      ),
                ),
            leading: const Icon(Icons.replay),
            title: child,
          ),
        ),
        if (!Device.isWeb)
          Consumer(
            child: Text(
              'Restart sim',
              style: textStyle,
            ),
            builder: (context, ref, child) => ListTile(
              onTap: () => ref.invalidate(simVehicleIsolateStreamProvider),
              leading: const Icon(Icons.replay),
              title: child,
            ),
          ),
      ],
    );
  }
}
