import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu button with attached submenu for options related to the
/// simulated vehicle.
class VehicleSimMenu extends StatelessWidget {
  /// A menu button with attached submenu for options related to the
  /// simulated vehicle.
  const VehicleSimMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.agriculture,
      text: 'Vehicle',
      menuChildren: [
        Consumer(
          child: Text(
            'Auto center steering',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: child,
            value: ref.watch(simCoreVehicleAutoCenterSteeringProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(simCoreVehicleAutoCenterSteeringProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Auto slow down',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            secondary: child,
            value: ref.watch(simCoreVehicleAutoSlowDownProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(simCoreVehicleAutoSlowDownProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
      ],
    );
  }
}
