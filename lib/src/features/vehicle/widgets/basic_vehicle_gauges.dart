import 'package:autosteering/src/features/common/common.dart';
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
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consumer(
          builder: (context, ref, child) => ListTile(
            leading: const Icon(
              Icons.straighten,
              color: Colors.white,
              shadows: [Shadow(offset: Offset(2, 2))],
            ),
            onTap: () => ref
              ..invalidate(gaugeTravelledDistanceProvider)
              ..invalidate(debugTravelledPathListProvider),
            title: TextWithStroke(
              '''${ref.watch(gaugeTravelledDistanceProvider).toStringAsFixed(1)} m''',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
              strokeWidth: 3.5,
            ),
            subtitle: TextWithStroke(
              'Tap to reset',
              style: theme.textTheme.titleSmall?.copyWith(color: Colors.white),
              strokeWidth: 2,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.speed,
            color: Colors.white,
            shadows: [Shadow(offset: Offset(2, 2))],
          ),
          title: Consumer(
            builder: (context, ref, child) => TextWithStroke(
              '''${(ref.watch(gaugeVelocityProvider) * 3.6).toStringAsFixed(1)} km/h''',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
              strokeWidth: 3.5,
            ),
          ),
        ),        
        ListTile(
          leading: const Icon(
            Icons.navigation,
            color: Colors.white,
            shadows: [Shadow(offset: Offset(2, 2))],
          ),
          title: Consumer(
            builder: (context, ref, child) => TextWithStroke(
              '''${ref.watch(gaugeBearingProvider).toStringAsFixed(1)}º''',
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
              strokeWidth: 3.5,
            ),
          ),
        ),
      ],
    );
  }
}
