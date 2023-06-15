import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';

/// A menu button with attached submenu for enabling debugging features.
class DebugMenu extends StatelessWidget {
  const DebugMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const MenuButtonWithChildren(
      text: 'Debug',
      icon: Icons.bug_report,
      menuChildren: [
        VehicleDebugMenu(),
        FieldDebugMenu(),
        DubinsPathDebugMenu(),
      ],
    );
  }
}
