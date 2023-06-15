import 'package:agopengps_flutter/src/features/common/utils/utils.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for debugging the field feature.
class FieldLayer extends ConsumerWidget {
  const FieldLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = ref.watch(testFieldProvider);

    if (field != null) {
      final enabled = ref.watch(showFieldDebugLayerProvider);
      if (enabled) {
        final bufferedField = ref.watch(bufferedTestFieldProvider);

        final showField = ref.watch(showTestFieldProvider);
        final showBuffered =
            ref.watch(showBufferedTestFieldProvider) && bufferedField != null;

        return Stack(
          children: [
            PolygonLayer(
              polygonCulling: true,
              polygons: [
                if (showField) field.polygon,
                if (showBuffered)
                  bufferedField.polygon.copyWith(
                    color: Colors.red.withOpacity(0.25),
                    borderColor: Colors.red,
                  ),
              ],
            ),
            CircleLayer(
              circles: [
                if (showField) ...[
                  ...field.border.map((e) => CircleMarker(point: e, radius: 2)),
                  if (field.holes != null)
                    ...field.holes!.expand(
                      (element) =>
                          element.map((e) => CircleMarker(point: e, radius: 2)),
                    ),
                ],
                if (showBuffered) ...[
                  ...bufferedField.border.map(
                    (e) => CircleMarker(point: e, radius: 2),
                  ),
                  if (bufferedField.holes != null)
                    ...bufferedField.holes!.expand(
                      (e) => e.map((e) => CircleMarker(point: e, radius: 2)),
                    ),
                ]
              ],
            )
          ],
        );
      }
    }
    return const SizedBox.shrink();
  }
}
