import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
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
            value: ref.watch(debugVehicleIMUProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleIMUProvider.notifier)
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
                  'Steering Configurator',
                  style: textStyle,
                ),  
              ),
            ],
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleWASProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleWASProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
        ),
        Consumer(
          child: Text(
            'Autosteering parameters',
            style: textStyle,
          ),
          builder: (context, ref, child) => CheckboxListTile(
            value: ref.watch(debugVehicleAutosteerParametersProvider),
            onChanged: (value) => value != null
                ? ref
                    .read(debugVehicleAutosteerParametersProvider.notifier)
                    .update(value: value)
                : null,
            secondary: child,
          ),
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
      return const SizedBox.shrink();
    }

    final textStyle = Theme.of(context).menuButtonWithChildrenText;

    return MenuButtonWithChildren(
      text: 'Load',
      icon: Icons.history,
      menuChildren: vehicles
          .map(
            (vehicle) => MenuItemButton(
              closeOnActivate: false,
              child: Text(vehicle.name ?? vehicle.uuid, style: textStyle),
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

                ref.read(saveVehicleProvider(vehicle));

                ref.read(configuredVehicleProvider.notifier).update(vehicle);
                ref.invalidate(configuredVehicleNameTextControllerProvider);
              },
            ),
          )
          .toList(),
    );
  }
}
