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
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the vehicle's dimensions.
class VehicleDimensionsPage extends ConsumerWidget {
  /// A page for configuring the vehicle's dimensions.
  const VehicleDimensionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      Center(
        child: Text(
          strings.dimensions(0),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const RotatedBox(quarterTurns: 1, child: Icon(Icons.expand)),
          labelText: strings.vehicleBodyWidth,
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
        decoration: InputDecoration(
          icon: const Icon(Icons.expand),
          labelText: strings.vehicleBodyLength,
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
          icon: const RotatedBox(quarterTurns: 1, child: Icon(Icons.expand)),
          labelText: strings.trackWidth(switch (vehicle) {
            Tractor() ||
            ArticulatedTractor() => strings.rearWheels.toLowerCase(),
            Harvester() => strings.frontWheels.toLowerCase(),
          }),
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider.select(
            (value) => value.trackWidth.toString(),
          ),
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
          decoration: InputDecoration(
            icon: const Icon(Icons.expand),
            labelText: strings.wheelbase,
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
          decoration: InputDecoration(
            icon: const Icon(Icons.expand),
            labelText: strings.pivotCenterToValue(
              strings.frontAxle.toLowerCase(),
            ),
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
          decoration: InputDecoration(
            icon: const Icon(Icons.expand),
            labelText: strings.pivotCenterToValue(
              strings.rearAxle.toLowerCase(),
            ),
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
