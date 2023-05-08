import 'package:agopengps_flutter/src/features/common/widgets/widgets.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';

class DebugMenu extends StatelessWidget {
  const DebugMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuButtonWithChildren(
      text: 'Debug',
      icon: Icons.bug_report,
      menuChildren: [
        VehicleDebugMenu(),
      ],
    );
  }
}
