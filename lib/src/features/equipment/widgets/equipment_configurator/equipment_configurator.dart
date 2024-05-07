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
class EquipmentConfigurator extends ConsumerStatefulWidget {
  /// A [Dialog] for configuring an equipment, with ability to apply to
  /// the equipment in the attached hierarchy, save to file or load from file.
  const EquipmentConfigurator({super.key});

  @override
  ConsumerState<EquipmentConfigurator> createState() =>
      _EquipmentConfiguratorState();
}

class _EquipmentConfiguratorState extends ConsumerState<EquipmentConfigurator>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(
    length: pages.length,
    vsync: this,
    initialIndex: ref.read(equipmentConfiguratorIndexProvider),
  );
  static const pages = [
    EquipmentTypeSelectorPage(),
    EquipmentDimensionsPage(),
    EquipmentSectionsPage(),
    EquipmentDecorationPage(),
    Padding(
      padding: EdgeInsets.only(top: 16),
      child: EquipmentHitchesPage(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    tabController.addListener(() {
      ref
          .read(equipmentConfiguratorIndexProvider.notifier)
          .update(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Consumer(
                      builder: (context, ref, child) => NavigationRail(
                        backgroundColor: Colors.transparent,
                        labelType: NavigationRailLabelType.all,
                        destinations: destinations,
                        selectedIndex: ref.watch(
                          equipmentConfiguratorIndexProvider,
                        ),
                        onDestinationSelected: tabController.animateTo,
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ListenableBuilder(
                              listenable: tabController,
                              builder: (context, child) => AnimatedOpacity(
                                opacity: tabController.index > 0 ? 1 : 0,
                                duration: Durations.medium1,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: IconButton.filled(
                                    icon: const Icon(Icons.arrow_left),
                                    onPressed: tabController.index > 0
                                        ? () => tabController.animateTo(
                                              tabController.index - 1,
                                            )
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                            ListenableBuilder(
                              listenable: tabController,
                              builder: (context, child) => AnimatedOpacity(
                                opacity: tabController.index <
                                            pages.length - 1 &&
                                        ref.watch(
                                          configuredEquipmentProvider.select(
                                            (value) =>
                                                value.name?.isNotEmpty ?? false,
                                          ),
                                        )
                                    ? 1
                                    : 0,
                                duration: Durations.medium1,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: IconButton.filled(
                                    onPressed: tabController.index <
                                                pages.length - 1 &&
                                            ref.watch(
                                              configuredEquipmentProvider
                                                  .select(
                                                (value) =>
                                                    value.name?.isNotEmpty ??
                                                    false,
                                              ),
                                            )
                                        ? () => tabController.animateTo(
                                              tabController.index + 1,
                                            )
                                        : null,
                                    icon: const Icon(Icons.arrow_right),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Consumer(
                            builder: (context, ref, child) => TabBarView(
                              controller: tabController,
                              physics: ref.watch(
                                configuredEquipmentProvider.select(
                                  (value) => value.name?.isEmpty ?? true,
                                ),
                              )
                                  ? const NeverScrollableScrollPhysics()
                                  : null,
                              children: pages,
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
        onPressed: ref.watch(
          configuredEquipmentProvider
              .select((value) => value.name?.isNotEmpty ?? false),
        )
            ? () {
                final equipment = ref.watch(configuredEquipmentProvider)
                  ..lastUsed = DateTime.now();

                ref
                    .read(simInputProvider.notifier)
                    .send((updatedEquipment: equipment));

                if (Device.isNative) {
                  ref.read(saveEquipmentProvider(equipment));
                }
                Navigator.of(context).pop();
              }
            : null,
        icon: const Icon(Icons.check),
        label: const Text('Apply configuration'),
      );
}
