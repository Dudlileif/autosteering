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

/// A [SimpleDialog] for configuring a vehicle, with ability to apply to the
/// current one, save to file or load from file.
class VehicleConfigurator extends ConsumerWidget {
  /// A [SimpleDialog] for configuring a vehicle, with ability to apply to the
  /// current one, save to file or load from file.
  const VehicleConfigurator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Configure vehicle',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8),
                        child: _ApplyConfigurationToMainVehicleButton(),
                      ),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: _ImportButton(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: _SaveButton(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: CloseButton(),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(
                  builder: (context, ref, child) => NavigationRail(
                    backgroundColor: Colors.transparent,
                    labelType: NavigationRailLabelType.all,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.agriculture),
                        label: Text('Type'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.expand),
                        label: Text('Dimensions'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings_input_antenna),
                        label: Text('Antenna'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.circle_outlined),
                        label: Text('Wheels'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.electric_meter),
                        label: Text('Steering'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.commit),
                        label: Text('Hitches'),
                      ),
                    ],
                    selectedIndex: ref.watch(
                      vehicleConfiguratorIndexProvider,
                    ),
                    onDestinationSelected: ref
                        .read(
                          vehicleConfiguratorPageControllerProvider.notifier,
                        )
                        .animateToPage,
                  ),
                ),
                const VerticalDivider(),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.vertical,
                    controller:
                        ref.watch(vehicleConfiguratorPageControllerProvider),
                    children: const [
                      VehicleTypeSelectorPage(),
                      VehicleDimensionsPage(),
                      VehicleAntennaPage(),
                      VehicleWheelsPage(),
                      VehicleSteeringPage(),
                      VehicleHitchesPage(),
                    ],
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

/// A button for importing an [Vehicle] to the [configuredVehicleProvider]
/// from a file.
class _ImportButton extends ConsumerWidget {
  /// A button for importing an [Vehicle] to the [configuredVehicleProvider]
  /// from a file.

  const _ImportButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: () => ref.read(loadFileConfiguredVehicleProvider),
      icon: const Icon(Icons.file_open),
      label: const Text('Import'),
    );
  }
}

/// A button for saving the [Vehicle] in [configuredVehicleProvider] to
/// a file.
class _SaveButton extends ConsumerWidget {
  /// A button for saving the [Vehicle] in [configuredVehicleProvider] to
  /// a file.
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: ref.watch(
        configuredVehicleProvider.select(
          (value) => value.name != null && (value.name ?? '').isNotEmpty,
        ),
      )
          ? () => ref.watch(
                saveVehicleProvider(
                  ref.watch(configuredVehicleProvider),
                  downloadIfWeb: true,
                ),
              )
          : null,
      icon: const Icon(Icons.save),
      label: const Text('Save'),
    );
  }
}

/// A button for going to the next page of the vehicle configurator.
class VehicleConfiguratorNextButton extends ConsumerWidget {
  /// A button for going to the next page of the vehicle configurator.
  const VehicleConfiguratorNextButton({
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
                      vehicleConfiguratorPageControllerProvider.notifier,
                    )
                    .nextPage();
              }
            : null,
        icon: const Icon(Icons.arrow_downward),
        label: const Text('Next'),
      );
}

/// A button for going to the previous page of the vehicle configurator.
class VehicleConfiguratorPreviousButton extends ConsumerWidget {
  /// A button for going to the previous page of the vehicle configurator.
  const VehicleConfiguratorPreviousButton({
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
                      vehicleConfiguratorPageControllerProvider.notifier,
                    )
                    .previousPage();
              }
            : null,
        icon: const Icon(Icons.arrow_upward),
        label: const Text('Previous'),
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
        onPressed: () {
          final position =
              ref.watch(mainVehicleProvider.select((value) => value.position));
          final bearing =
              ref.watch(mainVehicleProvider.select((value) => value.bearing));

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
        },
        icon: const Icon(Icons.check),
        label: const Text('Apply configuration'),
      );
}
