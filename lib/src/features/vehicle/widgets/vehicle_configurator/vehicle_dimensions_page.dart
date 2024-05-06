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

/// A page for configuring the vehicle's dimensions.
class VehicleDimensionsPage extends ConsumerWidget {
  /// A page for configuring the vehicle's dimensions.
  const VehicleDimensionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      Center(
        child: Text(
          'Dimensions',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.expand),
          ),
          labelText: 'Vehicle body width, excluding wheels',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider.select((value) => value.width.toString()),
        ),
        onChanged: (value) {
          final width = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredVehicleProvider.notifier)
              .update(vehicle.copyWith(width: width?.abs()));
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Vehicle body length, excluding wheels',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider.select((value) => value.length.toString()),
        ),
        onChanged: (value) {
          final length = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredVehicleProvider.notifier)
              .update(vehicle.copyWith(length: length?.abs()));
        },
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.expand),
          ),
          labelText:
              'Track width, between the centers of the ${switch (vehicle) {
            Tractor() => 'rear wheels',
            ArticulatedTractor() => 'rear wheels',
            Harvester() => 'front wheels'
          }}',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider
              .select((value) => value.trackWidth.toString()),
        ),
        onChanged: (value) {
          final width = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredVehicleProvider.notifier)
              .update(vehicle.copyWith(trackWidth: width?.abs()));
        },
      ),
      if (vehicle is AxleSteeredVehicle)
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.expand),
            labelText: 'Wheelbase',
            suffixText: 'm',
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: ref.read(
            configuredVehicleProvider.select(
              (value) => (value as AxleSteeredVehicle).wheelBase.toString(),
            ),
          ),
          onChanged: (value) {
            final distance = double.tryParse(value.replaceAll(',', '.'));

            ref
                .read(configuredVehicleProvider.notifier)
                .update(vehicle.copyWith(wheelBase: distance?.abs()));
          },
        )
      else if (vehicle is ArticulatedTractor) ...[
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.expand),
            labelText: 'Pivot center to front axle',
            suffixText: 'm',
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: ref.read(
            configuredVehicleProvider.select(
              (value) =>
                  (value as ArticulatedTractor).pivotToFrontAxle.toString(),
            ),
          ),
          onChanged: (value) {
            final distance = double.tryParse(value.replaceAll(',', '.'));

            ref
                .read(configuredVehicleProvider.notifier)
                .update(vehicle.copyWith(pivotToFrontAxle: distance?.abs()));
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.expand),
            labelText: 'Pivot center to rear axle',
            suffixText: 'm',
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: ref.read(
            configuredVehicleProvider.select(
              (value) =>
                  (value as ArticulatedTractor).pivotToRearAxle.toString(),
            ),
          ),
          onChanged: (value) {
            final distance = double.tryParse(value.replaceAll(',', '.'));

            ref
                .read(configuredVehicleProvider.notifier)
                .update(vehicle.copyWith(pivotToRearAxle: distance?.abs()));
          },
        ),
      ],
    ];

    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: children
              .map(
              (widget) => Padding(
                padding: const EdgeInsets.all(8),
                child: SizedBox(width: 400, child: widget),
              ),
              )
              .toList(),
        ),
      ),
    );
  }
}
