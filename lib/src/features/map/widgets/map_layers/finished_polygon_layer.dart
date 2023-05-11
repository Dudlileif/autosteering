import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishedPolygonLayer extends ConsumerWidget {
  const FinishedPolygonLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showPolygon = ref.watch(showFinishedPolygonProvider);
    final points = ref.watch(finishedPathRecordingListProvider);
    if (!showPolygon || points == null) {
      return const SizedBox.shrink();
    }
    return PolygonLayer(
      polygons: [
        Polygon(
          points: ref
              .watch(finishedPathRecordingListProvider)!
              .map((e) => e.position)
              .toList(),
          isFilled: true,
          borderStrokeWidth: 2,
          color: Colors.pink.withOpacity(0.2),
        ),
      ],
    );
  }
}
