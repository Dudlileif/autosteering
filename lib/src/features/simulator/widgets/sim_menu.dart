import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for configuring the simulator.
class SimMenu extends StatelessWidget {
  /// A menu button with attached submenu for configuring the simulator.
  const SimMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Sim core',
      icon: Icons.memory,
      menuChildren: [
        Consumer(
          child: const Text('Allow manual sim controls'),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(simCoreAllowManualInputProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(simCoreAllowManualInputProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        const VehicleSimMenu(),
        Consumer(
          child: Text(
            'Reset position',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            onTap: () {
              // The simulation has to have a stationary vehicle for the reset
              // to work.
              ref.read(simInputProvider.notifier).send((velocity: 0));
              ref.read(simInputProvider.notifier).send((steeringAngle: 0));

              ref.read(simInputProvider.notifier).send(
                (position: ref.watch(homePositionProvider).gbPosition),
              );
            },
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
              onTap: () => ref.invalidate(simCoreIsolateStreamProvider),
              leading: const Icon(Icons.replay),
              title: child,
            ),
          ),
      ],
    );
  }
}
