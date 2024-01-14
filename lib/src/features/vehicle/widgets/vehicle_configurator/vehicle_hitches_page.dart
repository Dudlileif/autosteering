import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the vehicle's hitches.
class VehicleHitchesPage extends ConsumerWidget {
  /// A page for configuring the vehicle's hitches.
  const VehicleHitchesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(configuredVehicleProvider);

    final children = [
      ...switch (vehicle) {
        AxleSteeredVehicle() => [
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.expand),
                labelText: '${switch (vehicle) {
                  Tractor() => 'Rear',
                  Harvester() => 'Front'
                }} axle to front hitch distance',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as AxleSteeredVehicle)
                      .solidAxleToFrontHitchDistance
                      ?.toString(),
                ),
              ),
              onChanged: (value) {
                final distance = double.tryParse(value.replaceAll(',', '.'));

                ref.read(configuredVehicleProvider.notifier).update(
                      vehicle..solidAxleToFrontHitchDistance = distance?.abs(),
                    );
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.expand),
                labelText: '${switch (vehicle) {
                  Tractor() => 'Rear',
                  Harvester() => 'Front'
                }} axle to rear hitch distance',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as AxleSteeredVehicle)
                      .solidAxleToRearHitchDistance
                      ?.toString(),
                ),
              ),
              onChanged: (value) {
                final distance = double.tryParse(value.replaceAll(',', '.'));

                ref.read(configuredVehicleProvider.notifier).update(
                      vehicle..solidAxleToRearHitchDistance = distance?.abs(),
                    );
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: const Icon(Icons.expand),
                labelText: '${switch (vehicle) {
                  Tractor() => 'Rear',
                  Harvester() => 'Front'
                }} axle to rear towbar distance',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as AxleSteeredVehicle)
                      .solidAxleToRearTowbarDistance
                      ?.toString(),
                ),
              ),
              onChanged: (value) {
                final distance = double.tryParse(value.replaceAll(',', '.'));

                ref.read(configuredVehicleProvider.notifier).update(
                      vehicle..solidAxleToRearTowbarDistance = distance?.abs(),
                    );
              },
            ),
          ],
        ArticulatedTractor() => [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.expand),
                labelText: 'Front axle to front hitch distance',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as ArticulatedTractor)
                      .frontAxleToHitchDistance
                      ?.toString(),
                ),
              ),
              onChanged: (value) {
                final distance = double.tryParse(value.replaceAll(',', '.'));

                ref.read(configuredVehicleProvider.notifier).update(
                      vehicle..frontAxleToHitchDistance = distance?.abs(),
                    );
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.expand),
                labelText: 'Rear axle to rear hitch distance',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as ArticulatedTractor)
                      .rearAxleToHitchDistance
                      ?.toString(),
                ),
              ),
              onChanged: (value) {
                final distance = double.tryParse(value.replaceAll(',', '.'));

                ref.read(configuredVehicleProvider.notifier).update(
                      vehicle..rearAxleToHitchDistance = distance?.abs(),
                    );
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.expand),
                labelText: 'Rear axle to rear towbar distance',
                suffixText: 'm',
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              initialValue: ref.read(
                configuredVehicleProvider.select(
                  (value) => (value as ArticulatedTractor)
                      .rearAxleToTowbarDistance
                      ?.toString(),
                ),
              ),
              onChanged: (value) {
                final distance = double.tryParse(value.replaceAll(',', '.'));

                ref.read(configuredVehicleProvider.notifier).update(
                      vehicle..rearAxleToTowbarDistance = distance?.abs(),
                    );
              },
            ),
          ],
      },
    ];

    return Align(
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
        ],
      ),
    );
  }
}
