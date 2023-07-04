import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/providers/equipment_providers.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquipmentDebugMenu extends StatelessWidget {
  const EquipmentDebugMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Equipment',
      menuChildren: [
        Consumer(
          child: Text(
            'Attach to vehicle',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            title: child,
            onTap:
                ref.read(configuredEquipmentProvider.notifier).attachToVehicle,
          ),
        ),
        Consumer(
          child: Text(
            'Show',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(showEquipmentProvider),
            onChanged: (value) => value != null
                ? ref.read(showEquipmentProvider.notifier).update(value: value)
                : null,
          ),
        )
      ],
    );
  }
}
