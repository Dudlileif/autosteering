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
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for loading, configuring and debugging the vehicle for the program.
class VehicleMenu extends ConsumerWidget {
  /// A menu for loading, configuring and debugging the vehicle for the program.
  const VehicleMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    final dadMode = ref.watch(enableDadModeProvider);

    return MenuButtonWithChildren(
      text: strings.vehicle,
      icon: Icons.agriculture,
      menuChildren: [
        const _LoadVehicleMenu(),
        if (!dadMode) const _ImportExportMenu(),
        if (Device.isNative)
          MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.navigation),
            ),
            child: Text(
              strings.resetValue(strings.bearing.toLowerCase()),
              style: textStyle,
            ),
            onPressed: () => ref.read(simInputProvider.notifier).send((
              setZeroIMUBearingToNextGNSSBearing: true,
            )),
          ),
        if (!dadMode)
          MenuItemButton(
            closeOnActivate: false,
            leadingIcon: const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Icon(Icons.settings),
            ),
            child: Text(strings.configure, style: textStyle),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => const VehicleConfigurator(),
            ),
          ),
        if (!dadMode)
          Consumer(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.memory),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(strings.imuConfigurator, style: textStyle),
                  ),
                ],
              ),
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
        if (!dadMode)
          Consumer(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.electric_meter),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(strings.wasMotorConfigurator, style: textStyle),
                  ),
                ],
              ),
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
        if (!dadMode)
          Consumer(
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.abc),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      strings.autosteeringParameters,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
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
              strings.showValue(strings.nudgeControls.toLowerCase()),
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
        if (ref.watch(enableDebugModeProvider))
          const VehicleDebugMenu()
        else if (!dadMode)
          const VehicleTrajectoryButton(),
        if (!dadMode)
          Consumer(
            builder: (context, ref, child) => CheckboxListTile(
              title: Text(strings.showMotorTargetOverride, style: textStyle),
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
    final vehicles = ref
        .watch(vehiclesProvider())
        .maybeWhen(
          data: (data) => data,
          orElse: () => <Vehicle>[],
          skipLoadingOnRefresh: false,
        );

    if (vehicles.isEmpty) {
      return const SizedBox.shrink();
    }
    final strings = AppLocalizations.of(context);
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: strings.load,
      icon: Icons.history,
      menuChildren: vehicles
          .map(
            (vehicle) => ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 200),
              child: ListTile(
                title: Text(vehicle.name ?? strings.noName, style: textStyle),
                subtitle: Text(
                  strings.vehicleType(vehicle.runtimeType.toString()),
                ),
                onTap: () {
                  final position = ref.watch(
                    mainVehicleProvider.select((value) => value.position),
                  );
                  final bearing = ref.watch(
                    mainVehicleProvider.select((value) => value.bearing),
                  );
                  vehicle
                    ..position = position
                    ..bearing = bearing;

                  ref.read(mainVehicleProvider.notifier).update(vehicle);

                  ref.read(simInputProvider.notifier).send(vehicle);

                  ref.read(updateVehicleProvider(vehicle));

                  ref.read(configuredVehicleProvider.notifier).update(vehicle);
                  ref.invalidate(
                    configuredVehicleNameTextControllerProvider,
                  );
                },
                trailing: Device.isNative
                    ? IconButton(
                        onPressed: () async {
                          await showDialog<bool>(
                            context: context,
                            builder: (context) => Consumer(
                              builder:
                                  (
                                    context,
                                    ref,
                                    child,
                                  ) => DeleteDialog(
                                    name: vehicle.name ?? strings.noName,
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
    final strings = AppLocalizations.of(context);
    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      icon: Icons.import_export,
      text: strings.importExport,
      menuChildren: [
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed: () => ref.read(
                importVehicleProvider(
                  dialogTitle: strings.selectValueFile(
                    strings.vehicle.toLowerCase(),
                  ),
                ),
              ),
              leadingIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.file_open),
              ),
              child: Text(strings.importAction, style: textStyle),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) {
            return MenuItemButton(
              closeOnActivate: false,
              onPressed:
                  ref.watch(
                    configuredVehicleProvider.select(
                      (value) =>
                          value.name != null && (value.name ?? '').isNotEmpty,
                    ),
                  )
                  ? () => ref.watch(
                      exportVehicleProvider(
                        ref.watch(configuredVehicleProvider),
                        dialogTitle: strings.selectExportFolder,
                      ),
                    )
                  : null,
              leadingIcon: const Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(Icons.save_alt),
              ),
              child: Text(strings.exportAction, style: textStyle),
            );
          },
        ),
        Consumer(
          builder: (context, ref, child) => ExportAllMenuButton(
            onPressed: () => ref.read(
              exportAllProvider(
                directory: 'vehicles',
                dialogTitle: strings.selectExportFolder,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
