import 'package:agopengps_flutter/src/features/common/utils/position_projection_extensions.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the editable points and the lines between.
class EditablePathLayer extends ConsumerWidget {
  /// A combination layer for the editable points and the lines between.
  const EditablePathLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(finishedPathRecordingListProvider) ?? const [];

    return Stack(
      children: points.isNotEmpty
          ? [
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points: [
                      ...points.map((point) => point.position.latLng),
                    ],
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  ...points.mapIndexed(
                    (index, point) {
                      final nextPoint = index == points.length - 1
                          ? points.first
                          : points[index + 1];

                      final midPoint =
                          WayPointTween(begin: point, end: nextPoint)
                              .transform(0.5);

                      return Marker(
                        point: midPoint.position.latLng,
                        child: AddPointMarker(
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
                        ),
                      );
                    },
                  ),
                  ...points.mapIndexed(
                    (index, point) => Marker(
                      point: point.position.latLng,
                      child: GestureDetector(
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
              ),
            ]
          : const [],
    );
  }
}
