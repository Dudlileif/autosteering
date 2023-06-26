import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/providers/equipment_providers.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquipmentDebugMenu extends ConsumerWidget {
  const EquipmentDebugMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MenuButtonWithChildren(
      text: 'Equipment',
      menuChildren: [
        ListTile(
          title: Text(
            'Attach to vehicle',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          onTap: ref.read(configuredEquipmentProvider.notifier).attachToVehicle,
        ),
        CheckboxListTile(
          title: Text(
            'Show',
            style: Theme.of(context).menuButtonWithChildrenText,
          ),
          value: ref.watch(showEquipmentProvider),
          onChanged: (value) => value != null
              ? ref.read(showEquipmentProvider.notifier).update(value: value)
              : null,
        )
      ],
    );
  }
}
