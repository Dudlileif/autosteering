import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasicVehicleGauges extends ConsumerWidget {
  const BasicVehicleGauges({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).cardColor.withOpacity(0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => ref
                  ..invalidate(vehicleTravelledDistanceProvider)
                  ..invalidate(debugTravelledPathListProvider),
                icon: const Icon(Icons.clear),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Travelled distance: ${ref.watch(vehicleTravelledDistanceProvider).toStringAsFixed(1)} m',
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.speed),
                ),
                Text(
                  '${ref.watch(vehicleVelocityProvider).toStringAsFixed(1)} m/s',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Heading: ${ref.watch(vehicleHeadingProvider).toStringAsFixed(1)} deg',
            ),
          ),
        ],
      ),
    );
  }
}