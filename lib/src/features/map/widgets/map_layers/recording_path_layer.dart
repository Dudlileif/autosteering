import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the currently recording points and the
/// lines between.
class RecordingPathLayer extends ConsumerWidget {
  const RecordingPathLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(pathRecordingListProvider);
    final vehicle = ref.watch(mainVehicleProvider);
    return Stack(
      children: points.isNotEmpty
          ? [
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points: [
                      ...points.map((point) => point.position),
                      vehicle.position,
                    ],
                  )
                ],
              ),
              CircleLayer(
                circles: [
                  if (points.isNotEmpty)
                    ...points.map(
                      (point) => CircleMarker(
                        point: point.position,
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
