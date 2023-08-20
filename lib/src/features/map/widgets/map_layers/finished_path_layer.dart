import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the finished recorded points and the lines between.
class FinishedPathLayer extends ConsumerWidget {
  /// A combination layer for the finished recorded points and the lines
  ///  between.
  const FinishedPathLayer({super.key});

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
                    points:
                        points.map((point) => point.position.latLng).toList(),
                  ),
                ],
              ),
              CircleLayer(
                circles: [
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
