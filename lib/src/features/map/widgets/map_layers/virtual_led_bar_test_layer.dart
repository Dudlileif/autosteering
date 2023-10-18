import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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
    if (!ref.watch(virtualLedBarTestingProvider)) {
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
            vehicle.position.spherical
                .destinationPoint(distance: 100, bearing: vehicle.bearing)
                .spherical
                .destinationPoint(
                  distance: distance,
                  bearing: vehicle.bearing - 90,
                )
                .latLng,
            vehicle.position.spherical
                .destinationPoint(distance: 100, bearing: vehicle.bearing + 180)
                .spherical
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
