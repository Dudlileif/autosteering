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

/// A page for configuring the antenna's position on the vehicle.
class VehicleAntennaPage extends ConsumerWidget {
  /// A page for configuring the antenna's position on the vehicle.
  const VehicleAntennaPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      TextFormField(
        decoration: const InputDecoration(
          icon: RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.expand),
          ),
          labelText: 'Antenna lateral offset',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider
              .select((value) => value.antennaLateralOffset.toString()),
        ),
        onChanged: (value) {
          final offset = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredVehicleProvider.notifier)
              .update(vehicle.copyWith(antennaLateralOffset: offset));
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.expand),
          labelText: 'Antenna height',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider
              .select((value) => value.antennaHeight.toString()),
        ),
        onChanged: (value) {
          final height = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredVehicleProvider.notifier)
              .update(vehicle.copyWith(antennaHeight: height?.abs()));
        },
      ),
      ...switch (vehicle) {
        AxleSteeredVehicle() => [
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.expand),
                labelText: 'Antenna to ${switch (vehicle) {
                  Tractor() => 'rear axle',
                  Harvester() => 'front axle'
                }}',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) {
                    if (value is Harvester) {
                      return (-value.antennaToSolidAxleDistance).toString();
                    }
                    return (value as AxleSteeredVehicle)
                        .antennaToSolidAxleDistance
                        .toString();
                  },
                ),
              ),
              onChanged: (value) {
                final distance = double.tryParse(value.replaceAll(',', '.'));

                if (distance != null) {
                  ref.read(configuredVehicleProvider.notifier).update(
                        vehicle.copyWith(
                          antennaToSolidAxleDistance:
                              (vehicle is Harvester) ? -distance : distance,
                        ),
                      );
                }
              },
            ),
          ],
        ArticulatedTractor() => [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.expand),
                labelText: 'Antenna to pivot center',
                suffixText: 'm',
                helperText: 'Antenna MUST be on the front body of the vehicle!',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as ArticulatedTractor)
                      .antennaToPivotDistance
                      .toString(),
                ),
              ),
              onChanged: (value) {
                final distance = double.tryParse(value.replaceAll(',', '.'));

                ref.read(configuredVehicleProvider.notifier).update(
                      vehicle.copyWith(antennaToPivotDistance: distance),
                    );
              },
            ),
          ]
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
