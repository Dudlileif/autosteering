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

/// A page for configuring the vehicle's steering parameters.
class VehicleSteeringPage extends ConsumerWidget {
  /// A page for configuring the vehicle's steering parameters.
  const VehicleSteeringPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.looks),
          labelText: 'Minimum turning radius',
          suffixText: 'm',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider
              .select((value) => value.minTurningRadius.toString()),
        ),
        onChanged: (value) {
          final radius = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredVehicleProvider.notifier)
              .update(vehicle.copyWith(minTurningRadius: radius?.abs()));
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.signal_cellular_0_bar),
          labelText: 'Max steering angle',
          suffixText: '°',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider
              .select((value) => value.steeringAngleMax.toString()),
        ),
        onChanged: (value) {
          final radius = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredVehicleProvider.notifier)
              .update(vehicle.copyWith(steeringAngleMax: radius?.abs()));
        },
      ),
      if (vehicle is AxleSteeredVehicle)
        TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.tune),
            labelText: 'Ackermann steering ratio ',
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: ref.read(
            configuredVehicleProvider.select(
              (value) => (value as AxleSteeredVehicle)
                  .ackermannSteeringRatio
                  .toString(),
            ),
          ),
          onChanged: (value) {
            final ratio = double.tryParse(value.replaceAll(',', '.'));

            ref
                .read(configuredVehicleProvider.notifier)
                .update(vehicle.copyWith(ackermannSteeringRatio: ratio?.abs()));
          },
        ),
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
