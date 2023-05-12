import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinishedPolygonLayer extends ConsumerWidget {
  const FinishedPolygonLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(finishedPathRecordingListProvider) ?? [];

    return PolygonLayer(
      polygons: [
        Polygon(
          points: points.map((e) => e.position).toList(),
          isFilled: true,
          borderStrokeWidth: 2,
          color: Colors.pink.withOpacity(0.2),
        ),
      ],
    );
  }
}
