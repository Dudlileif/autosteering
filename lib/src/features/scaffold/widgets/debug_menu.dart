import 'package:agopengps_flutter/src/features/vehicle/widgets/vehicle_debug_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebugMenu extends ConsumerWidget {
  const DebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubmenuButton(
      menuChildren: const [
        VehicleDebugMenu(),
      ],
      child: Text(
        'Debug',
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
