import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the vehicle type and set a name for the vehicle.
class VehicleTypeSelectorPage extends StatelessWidget {
  /// A page for configuring the vehicle type and set a name for the vehicle.
  const VehicleTypeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: _VehicleTypeSelector(),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              width: 500,
              child: Column(
                children: [
                  Consumer(
                    builder: (context, ref, child) => TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.label_outline),
                        labelText: 'Name',
                      ),
                      controller: ref
                          .watch(configuredVehicleNameTextControllerProvider),
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => value != null &&
                              value.isNotEmpty &&
                              !value.startsWith(' ')
                          ? null
                          : '''No name entered! Please enter a name so that the config can be saved!''',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Consumer(
              builder: (context, ref, child) => VehicleConfiguratorNextButton(
                enabled: ref.watch(
                  configuredVehicleProvider.select(
                    (value) =>
                        value.name != null && (value.name ?? '').isNotEmpty,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// The actual selector part of the page.
class _VehicleTypeSelector extends ConsumerWidget {
  const _VehicleTypeSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final vehicle = ref.watch(configuredVehicleProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 200,
            height: 200,
            child: ListTile(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Tractor\n(or front axle steered)',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Image.asset(
                      'assets/images/vehicle_types/side_view/Tractor.png',
                    ),
                  ),
                ],
              ),
              selected: vehicle is Tractor,
              selectedTileColor: theme.toggleButtonsTheme.splashColor,
              onTap: () {
                ref.read(configuredVehicleProvider.notifier).update(
                      PreconfiguredVehicles.tractor,
                    );
                ref.invalidate(configuredVehicleNameTextControllerProvider);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 200,
            height: 200,
            child: ListTile(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Articulated tractor\n(or articulated steering)',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Image.asset(
                      'assets/images/vehicle_types/side_view/ArticulatedTractor.png',
                    ),
                  ),
                ],
              ),
              selected: vehicle is ArticulatedTractor,
              selectedTileColor: theme.toggleButtonsTheme.splashColor,
              onTap: () {
                ref.read(configuredVehicleProvider.notifier).update(
                      PreconfiguredVehicles.articulatedTractor,
                    );
                ref.invalidate(configuredVehicleNameTextControllerProvider);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: SizedBox(
            width: 200,
            height: 200,
            child: ListTile(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Harvester\n(or rear axle steered)',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Image.asset(
                      'assets/images/vehicle_types/side_view/Harvester_no_header.png',
                    ),
                  ),
                ],
              ),
              selected: vehicle is Harvester,
              selectedTileColor: theme.toggleButtonsTheme.splashColor,
              onTap: () {
                ref.read(configuredVehicleProvider.notifier).update(
                      PreconfiguredVehicles.harvester,
                    );
                ref.invalidate(configuredVehicleNameTextControllerProvider);
              },
            ),
          ),
        ),
      ],
    );
  }
}
