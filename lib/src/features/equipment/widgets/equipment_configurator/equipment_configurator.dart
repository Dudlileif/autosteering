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

/// A [SimpleDialog] for configuring an equipment, with ability to apply to the
/// one in the attached hierarchy, save to file or load from file.
class EquipmentConfigurator extends StatelessWidget {
  /// A [SimpleDialog] for configuring an equipment, with ability to apply to
  /// the equipment in the attached hierarchy, save to file or load from file.
  const EquipmentConfigurator({super.key});

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
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            'Configure equipment',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: _ApplyConfigurationToAttachedEquipmentButton(),
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
                          icon: Icon(Icons.view_column),
                          label: Text('Sections'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.square_rounded),
                          label: Text('Decoration'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.commit),
                          label: Text('Hitches'),
                        ),
                      ],
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
                  const VerticalDivider(),
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) => PageView(
                        scrollDirection: Axis.vertical,
                        controller: ref
                            .watch(equipmentConfiguratorPageControllerProvider),
                        children: const [
                          EquipmentTypeSelectorPage(),
                          EquipmentDimensionsPage(),
                          EquipmentSectionsPage(),
                          EquipmentDecorationPage(),
                          EquipmentHitchesPage(),
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

/// A button for loading an [Equipment] to the [configuredEquipmentProvider]
/// from a file.
class _ImportButton extends ConsumerWidget {
  /// A button for loading an [Equipment] to the [configuredEquipmentProvider]
  /// from a file.
  const _ImportButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: () => ref.read(loadFileConfiguredEquipmentProvider),
      icon: const Icon(Icons.file_open),
      label: const Text('Import'),
    );
  }
}

/// A button for saving the [Equipment] int [configuredEquipmentProvider] to
/// a file.
class _SaveButton extends ConsumerWidget {
  /// A button for saving the [Equipment] int [configuredEquipmentProvider] to
  /// a file.
  const _SaveButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: ref.watch(
        configuredEquipmentProvider.select(
          (value) => value.name != null && (value.name ?? '').isNotEmpty,
        ),
      )
          ? () => ref.watch(
                saveEquipmentProvider(
                  ref.watch(configuredEquipmentProvider),
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
