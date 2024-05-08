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
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_antenna_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_dimensions_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_hitches_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_steering_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_type_selector_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_wheels_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A [Dialog] for configuring a vehicle, with ability to apply to the
/// current one, save to file or load from file.
class VehicleConfigurator extends ConsumerStatefulWidget {
  /// A [Dialog] for configuring a vehicle, with ability to apply to the
  /// current one, save to file or load from file.
  const VehicleConfigurator({super.key});

  @override
  ConsumerState<VehicleConfigurator> createState() =>
      _VehicleConfiguratorState();
}

class _VehicleConfiguratorState extends ConsumerState<VehicleConfigurator>
    with SingleTickerProviderStateMixin {
  late final tabController = TabController(
    length: pages.length,
    vsync: this,
    initialIndex: ref.read(
      configuredVehicleProvider.select(
        (value) =>
            value.name == null ||
            (value.name!.isEmpty || value.name!.startsWith(' ')),
      ),
    )
        ? 0
        : ref.read(vehicleConfiguratorIndexProvider),
  );
  static const pages = [
    VehicleTypeSelectorPage(),
    VehicleDimensionsPage(),
    VehicleAntennaPage(),
    VehicleWheelsPage(),
    VehicleSteeringPage(),
    VehicleHitchesPage(),
  ];

  @override
  void initState() {
    super.initState();
    tabController.addListener(() {
      ref
          .read(vehicleConfiguratorIndexProvider.notifier)
          .update(tabController.index);
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Dialog(
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
                          'Configure vehicle',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const _ApplyConfigurationToMainVehicleButton(),
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final disabled = ref.watch(
                    configuredVehicleProvider.select(
                      (value) =>
                          value.name == null ||
                          (value.name!.isEmpty || value.name!.startsWith(' ')),
                    ),
                  );

                  final orientation = MediaQuery.orientationOf(context);
                  if (orientation == Orientation.portrait ||
                      (constraints.maxHeight > 250 &&
                          constraints.maxWidth > 800)) {
                    final tabs = [
                      const Tab(
                        icon: Icon(Icons.agriculture),
                        text: 'Type',
                      ),
                      const Tab(
                        icon: Icon(Icons.expand),
                        text: 'Dimensions',
                      ),
                      const Tab(
                        icon: Icon(Icons.settings_input_antenna),
                        text: 'Antenna',
                      ),
                      const Tab(
                        icon: Icon(Icons.circle_outlined),
                        text: 'Wheels',
                      ),
                      const Tab(
                        icon: Icon(Icons.electric_meter),
                        text: 'Steering',
                      ),
                      const Tab(
                        icon: Icon(Icons.commit),
                        text: 'Hitches',
                      ),
                    ];

                    return Column(
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            final tabBar = TabBar(
                              tabAlignment: constraints.maxWidth < 500
                                  ? TabAlignment.center
                                  : TabAlignment.fill,
                              isScrollable: constraints.maxWidth < 500,
                              padding: const EdgeInsets.all(8),
                              dividerHeight: 1,
                              dividerColor: Theme.of(context).dividerColor,
                              controller: tabController,
                              tabs: tabs,
                            );
                            if (ref.watch(
                              configuredVehicleProvider.select(
                                (value) => value.name?.isEmpty ?? true,
                              ),
                            )) {
                              return IgnorePointer(child: tabBar);
                            }
                            return tabBar;
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: TabBarView(
                              controller: tabController,
                              physics: disabled
                                  ? const NeverScrollableScrollPhysics()
                                  : null,
                              children: pages,
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  final destinations = [
                    const NavigationRailDestination(
                      icon: Icon(Icons.agriculture),
                      label: Text('Type'),
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.expand),
                      label: const Text('Dimensions'),
                      disabled: disabled,
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.settings_input_antenna),
                      label: const Text('Antenna'),
                      disabled: disabled,
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.circle_outlined),
                      label: const Text('Wheels'),
                      disabled: disabled,
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.electric_meter),
                      label: const Text('Steering'),
                      disabled: disabled,
                    ),
                    NavigationRailDestination(
                      icon: const Icon(Icons.commit),
                      label: const Text('Hitches'),
                      disabled: disabled,
                    ),
                  ];

                  return Row(
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
                                vehicleConfiguratorIndexProvider,
                              ),
                              onDestinationSelected: tabController.animateTo,
                            ),
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Expanded(
                        child: Row(
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
                            Expanded(
                              child: TabBarView(
                                controller: tabController,
                                physics: disabled
                                    ? const NeverScrollableScrollPhysics()
                                    : null,
                                children: pages,
                              ),
                            ),
                            ListenableBuilder(
                              listenable: tabController,
                              builder: (context, child) => AnimatedOpacity(
                                opacity:
                                    tabController.index < pages.length - 1 &&
                                            !disabled
                                        ? 1
                                        : 0,
                                duration: Durations.medium1,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: IconButton.filled(
                                    onPressed: tabController.index <
                                                pages.length - 1 &&
                                            !disabled
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
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
}

/// A button that applies the vehicle configuration in
/// [configuredVehicleProvider] to the [mainVehicleProvider].
class _ApplyConfigurationToMainVehicleButton extends ConsumerWidget {
  /// A button that applies the vehicle configuration in
  /// [configuredVehicleProvider] to the [mainVehicleProvider].
  const _ApplyConfigurationToMainVehicleButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) => FilledButton.icon(
        onPressed: ref.watch(
          configuredVehicleProvider
              .select((value) => value.name?.isNotEmpty ?? false),
        )
            ? () {
                final position = ref.watch(
                  mainVehicleProvider.select((value) => value.position),
                );
                final bearing = ref.watch(
                  mainVehicleProvider.select((value) => value.bearing),
                );

                final vehicle = ref.watch(configuredVehicleProvider)
                  ..position = position
                  ..bearing = bearing
                  ..lastUsed = DateTime.now();

                ref.read(mainVehicleProvider.notifier).update(vehicle);

                ref.read(simInputProvider.notifier).send(vehicle);
                if (Device.isNative) {
                  ref.read(saveVehicleProvider(vehicle));
                }
                Navigator.of(context).pop();
              }
            : null,
        icon: const Icon(Icons.check),
        label: const Text('Apply configuration'),
      );
}
