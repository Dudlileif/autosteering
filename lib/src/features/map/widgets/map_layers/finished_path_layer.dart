import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishedPathLayer extends ConsumerWidget {
  const FinishedPathLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(editFinishedPathProvider);
    final showFinishedPath = ref.watch(showFinishedPathProvider);
    final finishedPathPoints = ref.watch(finishedPathRecordingListProvider);

    if (finishedPathPoints == null || isEditing || !showFinishedPath) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: [
        PolylineLayer(
          polylines: [
            Polyline(
              points:
                  finishedPathPoints.map((point) => point.position).toList(),
            )
          ],
        ),
        CircleLayer(
          circles: [
            ...finishedPathPoints.map(
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
