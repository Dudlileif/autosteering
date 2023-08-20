import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A menu for loading, configuring and debugging the vehicle for the program.
class VehicleMenu extends StatelessWidget {
  /// A menu for loading, configuring and debugging the vehicle for the program.
  const VehicleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).menuButtonWithChildrenText;
    return MenuButtonWithChildren(
      text: 'Vehicle',
      icon: Icons.agriculture,
      menuChildren: [
        const _LoadVehicleMenu(),
        MenuItemButton(
          leadingIcon: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Icon(Icons.settings),
          ),
          child: Text(
            'Configure',
            style: textStyle,
          ),
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) => const VehicleConfigurator(),
            );
          },
        ),
        const VehicleDebugMenu(),
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
      return Container();
    }

    return MenuButtonWithChildren(
      text: 'Load',
      icon: Icons.history,
      menuChildren: vehicles
          .map(
            (vehicle) => MenuItemButton(
              child: Text(vehicle.name ?? ''),
              onPressed: () {
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

                ref.read(SaveVehicleProvider(vehicle));

                ref.read(configuredVehicleProvider.notifier).update(vehicle);
                ref.invalidate(configuredVehicleNameTextControllerProvider);
              },
            ),
          )
          .toList(),
    );
  }
}
