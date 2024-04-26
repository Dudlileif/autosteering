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

import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the wheels for the vehicle.
class VehicleWheelsPage extends ConsumerWidget {
  /// A page for configuring the wheels for the vehicle.
  const VehicleWheelsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      ...switch (vehicle) {
        AxleSteeredVehicle() => [
            TextFormField(
              decoration: InputDecoration(
                icon: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.expand),
                ),
                labelText: '${switch (vehicle) {
                  Tractor() => 'Front',
                  Harvester() => 'Rear'
                }} wheel width',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as AxleSteeredVehicle)
                      .steeringAxleWheelWidth
                      .toString(),
                ),
              ),
              onChanged: (value) {
                final width = double.tryParse(value.replaceAll(',', '.'));

                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(vehicle.copyWith(steeringAxleWheelWidth: width));
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.expand),
                ),
                labelText: '${switch (vehicle) {
                  Tractor() => 'Rear',
                  Harvester() => 'Front'
                }} wheel width',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as AxleSteeredVehicle)
                      .solidAxleWheelWidth
                      .toString(),
                ),
              ),
              onChanged: (value) {
                final width = double.tryParse(value.replaceAll(',', '.'));

                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(vehicle.copyWith(solidAxleWheelWidth: width));
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: const Stack(
                  children: [
                    Icon(Icons.expand),
                    Icon(Icons.circle_outlined),
                  ],
                ),
                labelText: '${switch (vehicle) {
                  Tractor() => 'Front',
                  Harvester() => 'Rear'
                }} wheel diameter',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as AxleSteeredVehicle)
                      .steeringAxleWheelDiameter
                      .toString(),
                ),
              ),
              onChanged: (value) {
                final diameter = double.tryParse(value.replaceAll(',', '.'));

                ref.read(configuredVehicleProvider.notifier).update(
                      vehicle.copyWith(steeringAxleWheelDiameter: diameter),
                    );
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: const Stack(
                  children: [
                    Icon(Icons.expand),
                    Icon(Icons.circle_outlined),
                  ],
                ),
                labelText: '${switch (vehicle) {
                  Tractor() => 'Rear',
                  Harvester() => 'Front'
                }} wheel diameter',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as AxleSteeredVehicle)
                      .solidAxleWheelDiameter
                      .toString(),
                ),
              ),
              onChanged: (value) {
                final diameter = double.tryParse(value.replaceAll(',', '.'));

                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(vehicle.copyWith(solidAxleWheelDiameter: diameter));
              },
            ),
          ],
        ArticulatedTractor() => [
            TextFormField(
              decoration: const InputDecoration(
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.expand),
                ),
                labelText: 'Wheel width',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) =>
                      (value as ArticulatedTractor).wheelWidth.toString(),
                ),
              ),
              onChanged: (value) {
                final width = double.tryParse(value.replaceAll(',', '.'));

                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(vehicle.copyWith(wheelWidth: width));
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Stack(
                  children: [
                    Icon(Icons.expand),
                    Icon(Icons.circle_outlined),
                  ],
                ),
                labelText: 'Wheel diameter',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) =>
                      (value as ArticulatedTractor).wheelDiameter.toString(),
                ),
              ),
              onChanged: (value) {
                final diameter = double.tryParse(value.replaceAll(',', '.'));

                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(vehicle.copyWith(wheelDiameter: diameter));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('''
Number of wheels,
i.e. does your vehicle have twin 
or triple wheels'''),
                const VerticalDivider(),
                SegmentedButton<int>(
                  style: theme.segmentedButtonTheme.style?.copyWith(
                    visualDensity: VisualDensity.compact,
                  ),
                  showSelectedIcon: false,
                  selected: {vehicle.numWheels},
                  segments: List.generate(
                    3,
                    (index) => ButtonSegment(
                      value: index + 1,
                      label: Text('${index + 1}'),
                    ),
                  ).toList(),
                  onSelectionChanged: (values) => ref
                      .read(configuredVehicleProvider.notifier)
                      .update(vehicle.copyWith(numWheels: values.first)),
                ),
              ],
            ),
            if (vehicle.numWheels > 1)
              TextFormField(
                decoration: const InputDecoration(
                  icon: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.expand),
                  ),
                  labelText: 'Wheel spacing',
                  suffixText: 'm',
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                initialValue: ref.read(
                  configuredVehicleProvider.select(
                    (value) =>
                        (value as ArticulatedTractor).wheelSpacing.toString(),
                  ),
                ),
                onChanged: (value) {
                  final width = double.tryParse(value.replaceAll(',', '.'));

                  ref
                      .read(configuredVehicleProvider.notifier)
                      .update(vehicle.copyWith(wheelSpacing: width));
                },
              ),
          ],
      },
    ];

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: VehicleConfiguratorPreviousButton(),
            ),
            ...children.map(
              (widget) => Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(width: 400, child: widget),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: VehicleConfiguratorNextButton(),
            ),
          ],
        ),
      ),
    );
  }
}
