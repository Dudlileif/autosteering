// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/hardware/hardware.dart';
import 'package:autosteering/src/features/settings/settings.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for loading, configuring and debugging the vehicle for the program.
class VehicleMenu extends ConsumerWidget {
  /// A menu for loading, configuring and debugging the vehicle for the program.
  const VehicleMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Vehicle',
      icon: Icons.agriculture,
      menuChildren: [
        const _LoadVehicleMenu(),
        const _ImportExportMenu(),
        MenuItemButton(
          closeOnActivate: false,
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.settings),
          ),
          child: Text(
            'Configure',
            style: textStyle,
          ),
          onPressed: () => showDialog<void>(
            context: context,
            builder: (context) => const VehicleConfigurator(),
          ),
        ),
        Consumer(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.memory),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'IMU Configurator',
                  style: textStyle,
                ),
              ),
            ],
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(showIMUConfigProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showIMUConfigProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.electric_meter),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'WAS & Motor Configurator',
                  style: textStyle,
                ),
              ),
            ],
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(showSteeringHardwareConfigProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(
                      showSteeringHardwareConfigProvider.notifier,
                    )
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.abc),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Autosteering Parameters',
                  style: textStyle,
                ),
              ),
            ],
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(showAutosteeringParameterConfigProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(
                      showAutosteeringParameterConfigProvider.notifier,
                    )
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          builder: (context, ref, child) => CheckboxListTile(
            title: Text(
              'Show nudging controls',
              style: textStyle,
            ),
            secondary: const RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.vertical_align_center),
            ),
            value: ref.watch(showNudgingControlsProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showNudgingControlsProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
        if (ref.watch(enableDebugModeProvider)) const VehicleDebugMenu(),
        Consumer(
          builder: (context, ref, child) => CheckboxListTile(
            title: Text(
              'Show motor target override',
              style: textStyle,
            ),
            secondary: const Icon(Icons.warning_rounded),
            value: ref.watch(showOverrideSteeringProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(showOverrideSteeringProvider.notifier)
                    .update(value: value)
                : null,
          ),
        ),
      ],
    );
  }
}

class _LoadVehicleMenu extends ConsumerWidget {
  const _LoadVehicleMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicles = ref.watch(savedVehiclesProvider).when(
          data: (data) => data,
          error: (error, stackTrace) => <Vehicle>[],
          loading: () => <Vehicle>[],
        )..sort((a, b) => b.lastUsed.compareTo(a.lastUsed));

    if (vehicles.isEmpty) {
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load',
      icon: Icons.history,
      menuChildren: vehicles
          .map(
            (vehicle) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                title: Text(vehicle.name ?? vehicle.uuid, style: textStyle),
                subtitle: Text(vehicle.runtimeType.toString()),
                onTap: () {
                  final position = ref.watch(
                    mainVehicleProvider.select((value) => value.position),
                  );
                  final bearing = ref.watch(
                    mainVehicleProvider.select((value) => value.bearing),
                  );
                  vehicle
                    ..position = position
                    ..bearing = bearing
                    ..lastUsed = DateTime.now();

                  ref.read(mainVehicleProvider.notifier).update(vehicle);

                  ref.read(simInputProvider.notifier).send(vehicle);

                  ref.read(saveVehicleProvider(vehicle));

                  ref.read(configuredVehicleProvider.notifier).update(vehicle);
                  ref.invalidate(configuredVehicleNameTextControllerProvider);
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => Consumer(
                              builder: (context, ref, child) => DeleteDialog(
                                name: vehicle.name ?? vehicle.uuid,
                                onDelete: () async => await ref.watch(
                                  deleteVehicleProvider(
                                    vehicle,
                                  ).future,
                                ),
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.delete),
                      )
                    : null,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _ImportExportMenu extends StatelessWidget {
  const _ImportExportMenu();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.import_export,
      text: 'Import/Export',
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed: () => ref.read(importVehicleProvider),
              leadingIcon: const Icon(Icons.file_open),
              child: Text('Import', style: textStyle),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed: ref.watch(
                configuredVehicleProvider.select(
                  (value) =>
                      value.name != null && (value.name ?? '').isNotEmpty,
                ),
              )
                  ? () => ref.watch(
                        exportVehicleProvider(
                          ref.watch(configuredVehicleProvider),
                        ),
                      )
                  : null,
              leadingIcon: const Icon(Icons.save_alt),
              child: Text('Export', style: textStyle),
            );
          },
        ),
      ],
    );
  }
}
