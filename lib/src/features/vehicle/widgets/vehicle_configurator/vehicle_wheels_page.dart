import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A page for configuring the wheels for the vehicle.
class VehicleWheelsPage extends ConsumerWidget {
  /// A page for configuring the wheels for the vehicle.
  const VehicleWheelsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                ToggleButtons(
                  isSelected: [
                    vehicle.numWheels == 1,
                    vehicle.numWheels == 2,
                    vehicle.numWheels == 3,
                  ],
                  children: List.generate(3, (index) => Text('${index + 1}')),
                  onPressed: (index) => ref
                      .read(configuredVehicleProvider.notifier)
                      .update(vehicle.copyWith(numWheels: index + 1)),
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
          const Padding(
            padding: EdgeInsets.all(8),
            child: VehicleConfiguratorNextButton(),
          ),
        ],
      ),
    );
  }
}
