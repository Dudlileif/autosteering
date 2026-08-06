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
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_connectors_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_dimensions_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_gnss_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_name.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_steering_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_type_selector_page.dart';
import 'package:autosteering/src/features/vehicle/widgets/vehicle_configurator/vehicle_wheels_page.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:quiver/strings.dart';

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
    initialIndex:
        ref.read(
          configuredVehicleProvider.select((value) => isNotBlank(value.name)),
        )
        ? ref.read(vehicleConfiguratorIndexProvider)
        : 0,
  );
  static const pages = <Widget>[
    VehicleTypeSelectorPage(),
    VehicleDimensionsPage(),
    VehicleGnssPage(),
    VehicleWheelsPage(),
    VehicleSteeringPage(),
    VehicleConnectorsPage(),
  ];

  late final AppLocalizations strings = AppLocalizations.of(context);

  late final destinations = [
    NavDest(
      icon: const Icon(Icons.agriculture),
      label: strings.type,
    ),
    NavDest(
      icon: const Icon(Icons.expand),
      label: strings.dimensions(0),
    ),
    NavDest(
      icon: const Icon(Icons.settings_input_antenna),
      label: strings.gnss,
    ),
    NavDest(
      icon: const Icon(Icons.circle_outlined),
      label: strings.wheels(0),
    ),
    NavDest(
      icon: const Icon(Icons.electric_meter),
      label: strings.steering,
    ),
    NavDest(
      icon: const Icon(Icons.commit),
      label: strings.hitches(0),
    ),
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
  Widget build(BuildContext context) {
    return switch (MediaQuery.sizeOf(context)) {
      Size(width: < 600) => _PortraitBuilder(
        tabController: tabController,
        pages: pages,
        destinations: destinations,
      ),
      _ => _LandscapeBuilder(
        tabController: tabController,
        destinations: destinations,
        pages: pages,
      ),
    };
  }
}

/// A button that applies the vehicle configuration in
/// [configuredVehicleProvider] to the [mainVehicleProvider].
class _SaveVehicleButton extends ConsumerWidget {
  /// A button that applies the vehicle configuration in
  /// [configuredVehicleProvider] to the [mainVehicleProvider].
  const _SaveVehicleButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);

    return FilledButton.icon(
      onPressed:
          ref.watch(
            configuredVehicleProvider.select(
              (value) => value.name?.isNotEmpty ?? false,
            ),
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
                ..bearing = bearing;

              ref.read(mainVehicleProvider.notifier).update(vehicle);

              ref.read(simInputProvider.notifier).send(vehicle);
              if (vehicle.id == null) {
                ref.read(insertVehicleProvider(vehicle));
              } else {
                ref.read(updateVehicleProvider(vehicle));
              }
              Navigator.of(context).pop();
            }
          : null,
      icon: const Icon(Symbols.save_rounded),
      label: Text(strings.save),
    );
  }
}

class _PortraitBuilder extends StatelessWidget {
  const _PortraitBuilder({
    required this.tabController,
    required this.pages,
    required this.destinations,
  });

  final TabController tabController;
  final List<Widget> pages;
  final List<NavDest> destinations;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);
    final colorScheme = ColorScheme.of(context);

    return Dialog.fullscreen(
      child: Column(
        children: [
          AppBar(
            title: Text(
              strings.configureValue(strings.vehicle.toLowerCase()),
              maxLines: 2,
            ),
            automaticallyImplyLeading: false,
            actions: const [
              _SaveVehicleButton(),
              CloseButton(),
            ],
          ),
          Expanded(
            child: _SliverBuilder(
              tabController: tabController,
              destinations: destinations,
              pages: pages,
            ),
          ),
          ExpansionTile(
            title: Text(strings.preview),
            shape: const RoundedRectangleBorder(
              borderRadius: .vertical(top: .circular(12)),
            ),
            collapsedShape: const RoundedRectangleBorder(
              borderRadius: .vertical(top: .circular(12)),
            ),
            collapsedBackgroundColor: colorScheme.surfaceContainerHighest,
            backgroundColor: colorScheme.surfaceContainerHighest,
            children: [
              SizedBox(
                height: 200,
                child: Consumer(
                  builder: (context, ref, child) => VehiclePreview(
                    vehicle: ref.watch(configuredVehicleProvider),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LandscapeBuilder extends StatelessWidget {
  const _LandscapeBuilder({
    required this.tabController,
    required this.pages,
    required this.destinations,
  });

  final TabController tabController;
  final List<Widget> pages;
  final List<NavDest> destinations;

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

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
                        strings.configureValue(strings.vehicle.toLowerCase()),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const _SaveVehicleButton(),
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
              children: [
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) => VehiclePreview(
                      vehicle: ref.watch(configuredVehicleProvider),
                    ),
                  ),
                ),
                Expanded(
                  child: _SliverBuilder(
                    tabController: tabController,
                    destinations: destinations,
                    pages: pages,
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

class _SliverBuilder extends StatelessWidget {
  const _SliverBuilder({
    required this.tabController,
    required this.destinations,
    required this.pages,
  });

  final TabController tabController;
  final List<NavDest> destinations;
  final List<Widget> pages;
  @override
  Widget build(BuildContext context) {
    final tabs = destinations
        .map(
          (d) => Tab(
            icon: d.icon,
            text: d.label,
          ),
        )
        .toList();

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          flexibleSpace: const VehicleName(),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          centerTitle: true,
          collapsedHeight: 80,
          bottom: TabBar(
            controller: tabController,
            tabs: tabs,
            isScrollable: true,
          ),
        ),
      ],
      body: TabBarView(controller: tabController, children: pages),
    );
  }
}
