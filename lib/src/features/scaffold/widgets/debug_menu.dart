import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';

class DebugMenu extends StatelessWidget {
  const DebugMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SubmenuButton(
      menuChildren: const [
        VehicleDebugMenu(),
      ],
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bug_report),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              'Debug',
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
