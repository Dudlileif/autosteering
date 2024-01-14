import 'package:autosteering/src/features/common/utils/position_projection_extensions.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the currently recording points and the
/// lines between.
class RecordingPathLayer extends ConsumerWidget {
  /// A combination layer for the currently recording points and the
  /// lines between.
  const RecordingPathLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(pathRecordingListProvider);
    final vehiclePosition =
        ref.watch(mainVehicleProvider.select((vehicle) => vehicle.position));

    return Stack(
      children: points.isNotEmpty
          ? [
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points: [
                      ...points.map((point) => point.position.latLng),
                      vehiclePosition.latLng,
                    ],
                  ),
                ],
              ),
              CircleLayer(
                circles: [
                  if (points.isNotEmpty)
                    ...points.map(
                      (point) => CircleMarker(
                        point: point.position.latLng,
                        radius: 5,
                      ),
                    ),
                ],
              ),
            ]
          : const [],
    );
  }
}
