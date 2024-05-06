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
      Center(
        child: Text(
          'Steering',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Icons.looks),
          labelText: 'Minimum turning radius',
          suffixText: 'm',
          counter: vehicle is AxleSteeredVehicle
              ? Consumer(
                  builder: (context, ref, child) {
                    final value = ref.watch(
                      configuredVehicleProvider.select(
                        (value) => (value as AxleSteeredVehicle)
                            .minTurningRadiusTheoretic
                            .toStringAsFixed(2),
                      ),
                    );
                    return Text(
                      '''Theoretical: $value m''',
                    );
                  },
                )
              : null,
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider
              .select((value) => value.minTurningRadius.toString()),
        ),
        onFieldSubmitted: (value) {
          final radius = double.tryParse(value.replaceAll(',', '.'));

          ref
              .read(configuredVehicleProvider.notifier)
              .update(vehicle.copyWith(minTurningRadius: radius?.abs()));
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          icon: Icon(Icons.signal_cellular_0_bar),
          labelText: 'Max steering angle (inner wheel)',
          suffixText: '°',
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        initialValue: ref.read(
          configuredVehicleProvider.select(
            (value) => switch (value is AxleSteeredVehicle) {
              true => (value as AxleSteeredVehicle).steeringAngleMaxRaw,
              false => value.steeringAngleMax
            }
                .toString(),
          ),
        ),
        onFieldSubmitted: (value) {
          final steeringAngleMax = double.tryParse(value.replaceAll(',', '.'));

          ref.read(configuredVehicleProvider.notifier).update(
                vehicle.copyWith(steeringAngleMax: steeringAngleMax?.abs()),
              );
        },
      ),
      if (vehicle is AxleSteeredVehicle)
        TextFormField(
          decoration: InputDecoration(
            icon: const Icon(Icons.tune),
            labelText: 'Ackermann percentage ',
            counter: Consumer(
              builder: (context, ref, child) {
                final vehicle =
                    ref.watch(configuredVehicleProvider) as AxleSteeredVehicle;
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Text(
                      '''Inner: ${vehicle.steeringAngleMaxRaw.toStringAsFixed(1)}°''',
                    ),
                    Text('Outer: ${WheelAngleToAckermann(
                      wheelAngle: vehicle.steeringAngleMaxRaw,
                      wheelBase: vehicle.wheelBase,
                      trackWidth: vehicle.trackWidth,
                      steeringRatio: vehicle.ackermannSteeringRatio,
                      ackermannPercentage: vehicle.ackermannPercentage,
                    ).oppositeAngle.toStringAsFixed(1)}°'),
                  ],
                );
              },
            ),
          ),
          initialValue: ref.read(
            configuredVehicleProvider.select(
              (value) => (value as AxleSteeredVehicle)
                  .ackermannPercentage
                  .round()
                  .toString(),
            ),
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onFieldSubmitted: (value) {
            final percentage = double.tryParse(value.replaceAll(',', '.'));
        
            ref.read(configuredVehicleProvider.notifier).update(
                  vehicle.copyWith(ackermannPercentage: percentage?.abs()),
                );
          },
        ),
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
