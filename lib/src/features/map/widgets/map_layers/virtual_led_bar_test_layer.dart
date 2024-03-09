import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';

/// A map layer for showing a line to help visualizing when testing the
/// virtual LED bar.
class VirtualLedBarTestLayer extends ConsumerWidget {
  /// A map layer for showing a line to help visualizing when testing the
  /// virtual LED bar.
  const VirtualLedBarTestLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(virtualLedBarTestingProvider) ||
        !ref.watch(virtualLedBarEnabledProvider)) {
      return const SizedBox.shrink();
    }
    final distance = ref.watch(virtualLedBarPerpendicularDistanceProvider);

    if (distance == null) {
      return const SizedBox.shrink();
    }

    final vehicle = ref.watch(mainVehicleProvider);

    return PolylineLayer(
      polylineCulling: true,
      polylines: [
        Polyline(
          points: [
            vehicle.position.rhumb
                .destinationPoint(distance: 100, bearing: vehicle.bearing)
                .rhumb
                .destinationPoint(
                  distance: distance,
                  bearing: vehicle.bearing - 90,
                )
                .latLng,
            vehicle.position.rhumb
                .destinationPoint(distance: 100, bearing: vehicle.bearing + 180)
                .rhumb
                .destinationPoint(
                  distance: distance,
                  bearing: vehicle.bearing - 90,
                )
                .latLng,
          ],
        ),
      ],
    );
  }
}
