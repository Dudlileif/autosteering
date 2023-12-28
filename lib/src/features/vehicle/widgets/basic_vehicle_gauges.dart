import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Basic vehicle gauges to show the travelled distance (clearable), velocity
/// and bearing.
class BasicVehicleGauges extends StatelessWidget {
  /// Basic vehicle gauges to show the travelled distance (clearable), velocity
  /// and bearing.
  const BasicVehicleGauges({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor.withOpacity(0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(
                builder: (context, ref, child) => IconButton(
                  onPressed: () => ref
                    ..invalidate(gaugeTravelledDistanceProvider)
                    ..invalidate(debugTravelledPathListProvider),
                  icon: const Icon(Icons.clear),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) => Text(
                    '''Travelled distance: ${ref.watch(gaugeTravelledDistanceProvider).toStringAsFixed(1)} m''',
                  ),
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
                Consumer(
                  builder: (context, ref, child) => Text(
                    '''${(ref.watch(gaugeVelocityProvider) * 3.6).toStringAsFixed(1)} km/h''',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Consumer(
              builder: (context, ref, child) => Text(
                '''Bearing: ${ref.watch(gaugeBearingProvider).toStringAsFixed(1)}º''',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
