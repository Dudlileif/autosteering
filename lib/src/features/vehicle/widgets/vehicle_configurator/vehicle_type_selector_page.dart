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

import 'dart:math';

import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A page for configuring the vehicle type and set a name for the vehicle.
class VehicleTypeSelectorPage extends StatelessWidget {
  /// A page for configuring the vehicle type and set a name for the vehicle.
  const VehicleTypeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: min(216, constraints.maxHeight),
                    child: const _VehicleTypeSelector(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final textStyle =
                          Theme.of(context).menuButtonWithChildrenText;
                      final vehicle = ref.watch(configuredVehicleProvider);
                      return DropdownMenu<ManufacturerColors>(
                        leadingIcon: Icon(
                          Icons.color_lens,
                          color: vehicle.manufacturerColors.primary,
                        ),
                        initialSelection: vehicle.manufacturerColors,
                        textStyle: textStyle,
                        onSelected: (value) =>
                            ref.read(configuredVehicleProvider.notifier).update(
                                  vehicle.copyWith(manufacturerColors: value),
                                ),
                        dropdownMenuEntries: ManufacturerColors.values
                            .map(
                              (scheme) => DropdownMenuEntry<ManufacturerColors>(
                                label: scheme.name,
                                value: scheme,
                                leadingIcon: Icon(
                                  Icons.color_lens,
                                  color: scheme.primary,
                                ),
                                labelWidget: Text(
                                  scheme.name,
                                  style: textStyle,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
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
                            controller: ref.watch(
                              configuredVehicleNameTextControllerProvider,
                            ),
                            keyboardType: TextInputType.text,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                    builder: (context, ref, child) =>
                        VehicleConfiguratorNextButton(
                      enabled: ref.watch(
                        configuredVehicleProvider.select(
                          (value) =>
                              value.name != null &&
                              (value.name ?? '').isNotEmpty,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
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

    return LayoutBuilder(
      builder: (context, constraints) {
        final minDimension = min(constraints.maxWidth, constraints.maxHeight);
        final boxSize = min(200, minDimension).toDouble();
        return SizedBox(
          height: boxSize + 16,
          child: Material(
            type: MaterialType.transparency,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox.square(
                    dimension: boxSize,
                    child: ListTile(
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Text(
                              minDimension / 2 > 100
                                  ? 'Tractor\n(or front axle steering)'
                                  : 'Tractor',
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
                            child: SvgPicture(
                              height: boxSize * 0.4,
                              width: boxSize * 0.4,
                              SvgAssetLoader(
                                'assets/images/vehicle_types/side_view/tractor_side_view.svg',
                                colorMapper: _VehicleSideColorMapper(
                                  vehicle.manufacturerColors,
                                ),
                              ),
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
                        ref.invalidate(
                          configuredVehicleNameTextControllerProvider,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox.square(
                    dimension: boxSize,
                    child: ListTile(
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Text(
                              minDimension / 2 > 100
                                  ? '''Articulated tractor\n(or articulated steering)'''
                                  : 'Articulated',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          // TODO(dudlileif): make Articulated Tractor drawing
                          const Expanded(
                            flex: 18,
                            child: SizedBox.shrink(),
                          ),
                        ],
                      ),
                      selected: vehicle is ArticulatedTractor,
                      selectedTileColor: theme.toggleButtonsTheme.splashColor,
                      onTap: () {
                        ref.read(configuredVehicleProvider.notifier).update(
                              PreconfiguredVehicles.articulatedTractor,
                            );
                        ref.invalidate(
                          configuredVehicleNameTextControllerProvider,
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox.square(
                    dimension: boxSize,
                    child: ListTile(
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Text(
                              minDimension / 2 > 100
                                  ? 'Harvester\n(or rear axle steering)'
                                  : 'Harvester',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 18,
                            // TODO(dudlileif): make Harvester drawing
                            child: SizedBox.shrink(),
                          ),
                        ],
                      ),
                      selected: vehicle is Harvester,
                      selectedTileColor: theme.toggleButtonsTheme.splashColor,
                      onTap: () {
                        ref.read(configuredVehicleProvider.notifier).update(
                              PreconfiguredVehicles.harvester,
                            );
                        ref.invalidate(
                          configuredVehicleNameTextControllerProvider,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _VehicleSideColorMapper extends ColorMapper {
  const _VehicleSideColorMapper(this.manufacturerColors);
  final ManufacturerColors manufacturerColors;

  @override
  Color substitute(
    String? id,
    String elementName,
    String attributeName,
    Color color,
  ) {
    if (id != null) {
      if (id.contains('Color gradient bonnet paint')) {
        if (id.contains('start')) {
          return manufacturerColors.primary;
        } else if (id.contains('end')) {
          return manufacturerColors.primary.darken(5);
        }
      } else if (id.contains('Color gradient rear fender')) {
        if (id.contains('start')) {
          return manufacturerColors.primary.darken();
        } else if (id.contains('center')) {
          return manufacturerColors.primary;
        } else if (id.contains('end')) {
          return manufacturerColors.primary.darken();
        }
      } else if (id.contains('Bonnet branding stripe') &&
          attributeName == 'fill') {
        return manufacturerColors.secondary;
      } else if (id.contains('Cab frame') && attributeName == 'fill') {
        return manufacturerColors.cabFrame ?? color;
      } else if (id.contains('Cab frame') && attributeName == 'fill') {
        return manufacturerColors.cabFrame ?? color;
      } else if (id.contains('Frame') && attributeName == 'fill') {
        return manufacturerColors.frame?.darken(5) ?? color;
      } else if (id.contains('Roof') && attributeName == 'fill') {
        return manufacturerColors.roof ?? color;
      } else if (id.toLowerCase().contains('rim')) {
        return manufacturerColors.rims ?? color;
      }
    }
    return color;
  }
}
