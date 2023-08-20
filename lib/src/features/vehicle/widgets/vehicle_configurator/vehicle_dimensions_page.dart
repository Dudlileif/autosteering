import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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
      TextFormField(
        decoration: const InputDecoration(
          icon: RotatedBox(
            quarterTurns: 1,
            child: Icon(Icons.expand),
          ),
          labelText: 'Vehicle total width, including wheels',
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
          labelText: 'Vehicle total length',
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
