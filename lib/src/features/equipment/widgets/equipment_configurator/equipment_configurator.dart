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
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/equipment/widgets/equipment_configurator/equipment_decoration_page.dart';
import 'package:autosteering/src/features/equipment/widgets/equipment_configurator/equipment_dimensions_page.dart';
import 'package:autosteering/src/features/equipment/widgets/equipment_configurator/equipment_hitches_page.dart';
import 'package:autosteering/src/features/equipment/widgets/equipment_configurator/equipment_sections_page.dart';
import 'package:autosteering/src/features/equipment/widgets/equipment_configurator/equipment_type_selector_page.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A [Dialog] for configuring an equipment, with ability to apply to the
/// one in the attached hierarchy, save to file or load from file.
class EquipmentConfigurator extends ConsumerWidget {
  /// A [Dialog] for configuring an equipment, with ability to apply to
  /// the equipment in the attached hierarchy, save to file or load from file.
  const EquipmentConfigurator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const pages = [
      EquipmentTypeSelectorPage(),
      EquipmentDimensionsPage(),
      EquipmentSectionsPage(),
      EquipmentDecorationPage(),
      EquipmentHitchesPage(),
    ];

    final destinations = [
      const NavigationRailDestination(
        icon: Icon(Icons.handyman),
        label: Text('Type'),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.expand),
        label: const Text('Dimensions'),
        disabled: ref.watch(
          configuredEquipmentProvider
              .select((value) => value.name?.isEmpty ?? true),
        ),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.view_column),
        label: const Text('Sections'),
        disabled: ref.watch(
          configuredEquipmentProvider
              .select((value) => value.name?.isEmpty ?? true),
        ), 
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.square_rounded),
        label: const Text('Decoration'),
        disabled: ref.watch(
          configuredEquipmentProvider
              .select((value) => value.name?.isEmpty ?? true),
        ),
      ),
      NavigationRailDestination(
        icon: const Icon(Icons.commit),
        label: const Text('Hitches'),
        disabled: ref.watch(
          configuredEquipmentProvider
              .select((value) => value.name?.isEmpty ?? true),
        ),
      ),
    ];

    return Dialog(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Text(
                        'Configure equipment',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const _ApplyConfigurationToAttachedEquipmentButton(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: CloseButton(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: IntrinsicHeight(
                      child: Consumer(
                        builder: (context, ref, child) => NavigationRail(
                          backgroundColor: Colors.transparent,
                          labelType: NavigationRailLabelType.all,
                          destinations: destinations,
                          selectedIndex: ref.watch(
                            equipmentConfiguratorIndexProvider,
                          ),
                          onDestinationSelected: ref
                              .read(
                                equipmentConfiguratorPageControllerProvider
                                    .notifier,
                              )
                              .animateToPage,
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) => Column(
                      children: [
                        AnimatedOpacity(
                          opacity: ref.watch(
                            equipmentConfiguratorIndexProvider
                                .select((value) => value > 0),
                          )
                              ? 1
                              : 0,
                          duration: Durations.medium1,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: EquipmentConfiguratorPreviousButton(
                              enabled: ref.watch(
                                equipmentConfiguratorIndexProvider.select(
                                  (value) => value > 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: PageView(
                            scrollDirection: Axis.vertical,
                            controller: ref.watch(
                              equipmentConfiguratorPageControllerProvider,
                            ),
                            children: pages,
                          ),
                        ),
                        AnimatedOpacity(
                          opacity: ref.watch(
                                    equipmentConfiguratorIndexProvider.select(
                                      (value) => value < pages.length - 1,
                                    ),
                                  ) &&
                                  ref.watch(
                                    configuredEquipmentProvider
                                        .select((value) => value.name != null),
                                  )
                              ? 1
                              : 0,
                          duration: Durations.medium1,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: EquipmentConfiguratorNextButton(
                              enabled: ref.watch(
                                    equipmentConfiguratorIndexProvider.select(
                                      (value) => value < pages.length - 1,
                                    ),
                                  ) &&
                                  ref.watch(
                                    configuredEquipmentProvider.select(
                                      (value) =>
                                          value.name?.isNotEmpty ?? false,
                                    ),
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// A button for going to the next page of the vehicle configurator.
class EquipmentConfiguratorNextButton extends ConsumerWidget {
  /// A button for going to the next page of the vehicle configurator.
  const EquipmentConfiguratorNextButton({
    this.enabled = true,
    this.extraOnPressed,
    super.key,
  });

  /// Whether the button is enabled.
  final bool enabled;

  /// Extra function that will run when the button is pressed.
  final void Function()? extraOnPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) => FilledButton.icon(
        onPressed: enabled
            ? () {
                extraOnPressed?.call();
                ref
                    .read(
                      equipmentConfiguratorPageControllerProvider.notifier,
                    )
                    .nextPage();
              }
            : null,
        icon: const Icon(Icons.arrow_downward),
        label: const Text('Next'),
      );
}

/// A button for going to the previous page of the vehicle configurator.
class EquipmentConfiguratorPreviousButton extends ConsumerWidget {
  /// A button for going to the previous page of the vehicle configurator.
  const EquipmentConfiguratorPreviousButton({
    this.enabled = true,
    this.extraOnPressed,
    super.key,
  });

  /// Whether the button is enabled.
  final bool enabled;

  /// Extra function that will run when the button is pressed.
  final void Function()? extraOnPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) => FilledButton.icon(
        onPressed: enabled
            ? () {
                extraOnPressed?.call();
                ref
                    .read(
                      equipmentConfiguratorPageControllerProvider.notifier,
                    )
                    .previousPage();
              }
            : null,
        icon: const Icon(Icons.arrow_upward),
        label: const Text('Previous'),
      );
}

/// A button that applies the equipment configuration in
/// [configuredEquipmentProvider] to the attached hierarchy
/// in the simulator.
class _ApplyConfigurationToAttachedEquipmentButton extends ConsumerWidget {
  /// A button that applies the vehicle configuration in
  /// [configuredVehicleProvider] to the attached hierarchy
  /// in the simulator.
  const _ApplyConfigurationToAttachedEquipmentButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) => FilledButton.icon(
        onPressed: () {
          final equipment = ref.watch(configuredEquipmentProvider)
            ..lastUsed = DateTime.now();

          ref
              .read(simInputProvider.notifier)
              .send((updatedEquipment: equipment));

          if (Device.isNative) {
            ref.read(saveEquipmentProvider(equipment));
          }
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.check),
        label: const Text('Apply configuration'),
      );
}
