import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordingPathLayer extends ConsumerWidget {
  const RecordingPathLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordingPathPoints = ref.watch(pathRecordingListProvider);

    return Stack(
      children: [
        PolylineLayer(
          polylines: [
            Polyline(
              points: [
                ...recordingPathPoints.map((point) => point.position),
                ref.watch(mainVehicleProvider).position
              ],
            )
          ],
        ),
        CircleLayer(
          circles: [
            if (recordingPathPoints.isNotEmpty)
              ...recordingPathPoints.map(
                (point) => CircleMarker(
                  point: point.position,
                  radius: 5,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
