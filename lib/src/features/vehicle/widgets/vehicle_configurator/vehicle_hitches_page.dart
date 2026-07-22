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

/// A page for configuring the vehicle's hitches.
class VehicleHitchesPage extends ConsumerWidget {
  /// A page for configuring the vehicle's hitches.
  const VehicleHitchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      Center(
        child: Text(
          strings.hitches(0),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ...switch (vehicle) {
        AxleSteeredVehicle() => [
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.expand),
              labelText: switch (vehicle) {
                Tractor() => strings.rearAxleToFrontHitchDistance,
                Harvester() => strings.frontAxleToFrontHitchDistance,
              },
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as AxleSteeredVehicle)
                    .geometry
                    .solidAxleToFrontHitchDistance
                    ?.toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.replaceAll(',', '.'))
                  case final distance?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          solidAxleToFrontHitchDistance: distance.abs(),
                        ),
                      ),
                    );
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.expand),
              labelText: switch (vehicle) {
                Tractor() => strings.rearAxleToRearHitchDistance,
                Harvester() => strings.frontAxleToRearHitchDistance,
              },
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as AxleSteeredVehicle)
                    .geometry
                    .solidAxleToRearHitchDistance
                    ?.toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.replaceAll(',', '.'))
                  case final distance?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          solidAxleToRearHitchDistance: distance.abs(),
                        ),
                      ),
                    );
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.expand),
              labelText: switch (vehicle) {
                Tractor() => strings.rearAxleToRearDrawbarDistance,
                Harvester() => strings.frontAxleToRearDrawbarDistance,
              },
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as AxleSteeredVehicle)
                    .geometry
                    .solidAxleToRearDrawbarDistance
                    ?.toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.replaceAll(',', '.'))
                  case final distance?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          solidAxleToRearDrawbarDistance: distance.abs(),
                        ),
                      ),
                    );
              }
            },
          ),
        ],
        ArticulatedTractor() => [
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.expand),
              labelText: strings.frontAxleToFrontHitchDistance,
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as ArticulatedTractor)
                    .geometry
                    .frontAxleToHitchDistance
                    ?.toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.replaceAll(',', '.'))
                  case final distance?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          frontAxleToHitchDistance: distance.abs(),
                        ),
                      ),
                    );
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.expand),
              labelText: strings.rearAxleToRearHitchDistance,
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as ArticulatedTractor)
                    .geometry
                    .rearAxleToHitchDistance
                    .toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.replaceAll(',', '.'))
                  case final distance?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          rearAxleToHitchDistance: distance.abs(),
                        ),
                      ),
                    );
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Icon(Icons.expand),
              labelText: strings.rearAxleToRearDrawbarDistance,
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as ArticulatedTractor)
                    .geometry
                    .rearAxleToDrawbarDistance
                    .toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.replaceAll(',', '.'))
                  case final distance?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          rearAxleToDrawbarDistance: distance.abs(),
                        ),
                      ),
                    );
              }
            },
          ),
        ],
      },
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
