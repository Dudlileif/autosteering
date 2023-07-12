import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/equipment/equipment.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu with attached submenu for debugging the equipment feature.
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
            'Attach to front',
            style: textStyle,
          ),
          builder: (context, ref, child) => ref.watch(
                    mainVehicleProvider
                        .select((vehicle) => vehicle.hitchFrontFixedPoint),
                  ) !=
                  null
              ? ListTile(
                  title: child,
                  onTap: ref
                      .read(configuredEquipmentProvider.notifier)
                      .attachToVehicleFront,
                )
              : const SizedBox.shrink(),
        ),
        Consumer(
          child: Text(
            'Attach to rear',
            style: textStyle,
          ),
          builder: (context, ref, child) => ref.watch(
                    mainVehicleProvider
                        .select((vehicle) => vehicle.hitchRearFixedPoint),
                  ) !=
                  null
              ? ListTile(
                  title: child,
                  onTap: ref
                      .read(configuredEquipmentProvider.notifier)
                      .attachToVehicleRear,
                )
              : const SizedBox.shrink(),
        ),
        Consumer(
          child: Text(
            'Attach to towbar',
            style: textStyle,
          ),
          builder: (context, ref, child) => ref.watch(
                    mainVehicleProvider
                        .select((vehicle) => vehicle.hitchRearTowbarPoint),
                  ) !=
                  null
              ? ListTile(
                  title: child,
                  onTap: ref
                      .read(configuredEquipmentProvider.notifier)
                      .attachToVehicleTowbar,
                )
              : const SizedBox.shrink(),
        ),
        Consumer(
          child: Text(
            'Show',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            title: child,
            value: ref.watch(showEquipmentDebugProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showEquipmentDebugProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        Consumer(
          child: Text(
            'Clear unused',
            style: textStyle,
          ),
          builder: (context, ref, child) => ListTile(
            leading: const Icon(Icons.clear),
            title: child,
            onTap: ref.read(allEquipmentsProvider.notifier).clear,
          ),
        )
      ],
    );
  }
}
