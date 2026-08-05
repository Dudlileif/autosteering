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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the wheels for the vehicle.
class VehicleWheelsPage extends ConsumerWidget {
  /// A page for configuring the wheels for the vehicle.
  const VehicleWheelsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      Center(
        child: Text(
          strings.wheels(0),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      ...switch (vehicle) {
        AxleSteeredVehicle() => [
          TextFormField(
            decoration: InputDecoration(
              icon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.expand),
              ),
              labelText: [
                switch (vehicle) {
                  Tractor() => strings.front,
                  Harvester() => strings.rear,
                },
                strings.wheelWidth,
              ].join(' '),
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as AxleSteeredVehicle)
                    .geometry
                    .steeringAxleWheelWidth
                    .toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.numberInput) case final width?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          steeringAxleWheelWidth: width,
                        ),
                      ),
                    );
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.expand),
              ),
              labelText: [
                switch (vehicle) {
                  Tractor() => strings.rear,
                  Harvester() => strings.front,
                },
                strings.wheelWidth,
              ].join(' '),
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as AxleSteeredVehicle)
                    .geometry
                    .solidAxleWheelWidth
                    .toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.numberInput) case final width?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          solidAxleWheelWidth: width,
                        ),
                      ),
                    );
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Stack(
                children: [Icon(Icons.expand), Icon(Icons.circle_outlined)],
              ),
              labelText: [
                switch (vehicle) {
                  Tractor() => strings.front,
                  Harvester() => strings.rear,
                },
                strings.wheelDiameter,
              ].join(' '),
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as AxleSteeredVehicle)
                    .geometry
                    .steeringAxleWheelDiameter
                    .toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.numberInput) case final diameter?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          steeringAxleWheelDiameter: diameter,
                        ),
                      ),
                    );
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Stack(
                children: [Icon(Icons.expand), Icon(Icons.circle_outlined)],
              ),
              labelText: [
                switch (vehicle) {
                  Tractor() => strings.rear,
                  Harvester() => strings.front,
                },
                strings.wheelDiameter,
              ].join(' '),
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as AxleSteeredVehicle)
                    .geometry
                    .solidAxleWheelDiameter
                    .toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.numberInput) case final diameter?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          solidAxleWheelDiameter: diameter,
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
              icon: const RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.expand),
              ),
              labelText: strings.wheelWidth,
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as ArticulatedTractor).geometry.wheelWidth
                    .toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.numberInput) case final width?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(wheelWidth: width),
                      ),
                    );
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: const Stack(
                children: [Icon(Icons.expand), Icon(Icons.circle_outlined)],
              ),
              labelText: strings.wheelDiameter,
              suffixText: 'm',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            initialValue: ref.read(
              configuredVehicleProvider.select(
                (value) => (value as ArticulatedTractor).geometry.wheelDiameter
                    .toString(),
              ),
            ),
            onChanged: (value) {
              if (double.tryParse(value.numberInput) case final diameter?) {
                ref
                    .read(configuredVehicleProvider.notifier)
                    .update(
                      vehicle.copyWith(
                        geometry: vehicle.geometry.copyWith(
                          wheelDiameter: diameter,
                        ),
                      ),
                    );
              }
            },
          ),
        ],
      },
      Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          Text(strings.numberOfWheelsDescription),
          const VerticalDivider(),
          SegmentedButton<int>(
            style: theme.segmentedButtonTheme.style?.copyWith(
              visualDensity: VisualDensity.compact,
            ),
            showSelectedIcon: false,
            selected: {vehicle.geometry.numWheels},
            segments: List.generate(
              3,
              (index) => ButtonSegment(
                value: index + 1,
                label: Text('${index + 1}'),
              ),
            ).toList(),
            onSelectionChanged: (values) => ref
                .read(configuredVehicleProvider.notifier)
                .update(
                  vehicle.copyWith(
                    geometry: vehicle.geometry.copyWith(
                      numWheels: values.first,
                    ),
                  ),
                ),
          ),
        ],
      ),
      if (vehicle.geometry.numWheels > 1)
        TextFormField(
          decoration: InputDecoration(
            icon: const RotatedBox(quarterTurns: 1, child: Icon(Icons.expand)),
            labelText: strings.wheelSpacing,
            suffixText: 'm',
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          initialValue: ref.read(
            configuredVehicleProvider.select(
              (value) => value.geometry.wheelSpacing.toString(),
            ),
          ),
          onChanged: (value) {
            if (double.tryParse(value.numberInput) case final wheelSpacing?) {
              ref
                  .read(configuredVehicleProvider.notifier)
                  .update(
                    vehicle.copyWith(
                      geometry: vehicle.geometry.copyWith(
                        wheelSpacing: wheelSpacing.abs(),
                      ),
                    ),
                  );
            }
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
