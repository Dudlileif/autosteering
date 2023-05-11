import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditablePathLayer extends ConsumerWidget {
  const EditablePathLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(editFinishedPathProvider);
    final points = ref.watch(finishedPathRecordingListProvider);
    final closedPath = ref.watch(showFinishedPolygonProvider);

    if (!isEditing || points == null) {
      return const SizedBox.shrink();
    }
    return Stack(
      children: [
        PolylineLayer(
          polylines: [
            Polyline(
              points: points.map((point) => point.position).toList(),
            )
          ],
        ),
        MarkerLayer(
          markers: [
            ...points
                .getRange(0, closedPath ? points.length : points.length - 1)
                .mapIndexed(
              (index, point) {
                final nextPoint = index == points.length - 1
                    ? points.first
                    : points[index + 1];

                final midPoint =
                    WayPointTween(begin: point, end: nextPoint).transform(0.5);

                return Marker(
                  point: midPoint.position,
                  builder: (context) {
                    return AddPointMarker(
                      point: midPoint.position,
                      radius: 5,
                      onTap: () => ref
                          .read(
                            finishedPathRecordingListProvider.notifier,
                          )
                          .insert(
                            index + 1,
                            midPoint,
                          ),
                    );
                  },
                );
              },
            ),
            ...points.mapIndexed(
              (index, point) => Marker(
                point: point.position,
                builder: (context) => GestureDetector(
                  onSecondaryTap: () => ref
                      .read(finishedPathRecordingListProvider.notifier)
                      .remove(index),
                  child: MovableMapMarker(
                    point: point.position,
                    radius: 5,
                    onMoved: (position) {
                      ref
                          .read(
                            finishedPathRecordingListProvider.notifier,
                          )
                          .movePoint(
                            index,
                            point.copyWith(position: position),
                          );
                    },
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
