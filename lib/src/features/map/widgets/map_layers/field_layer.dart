import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/field/field.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for debugging the field feature.
class FieldLayer extends ConsumerWidget {
  /// A combination layer for debugging the field feature.
  const FieldLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = ref.watch(activeFieldProvider);

    if (field != null) {
      final enabled = ref.watch(showFieldDebugLayerProvider);
      if (enabled) {
        final bufferedField = ref.watch(bufferedFieldProvider);

        final showField = ref.watch(showFieldProvider);
        final showBufferedField =
            ref.watch(showBufferedFieldProvider) && bufferedField != null;

        final showFieldBoundingBox =
            ref.watch(showFieldBoundingBoxProvider) && showField;

        final showBufferedFieldBoundingBox =
            ref.watch(showBufferedFieldBoundingBoxProvider) &&
                bufferedField != null;

        return Stack(
          children: [
            PolygonLayer(
              polygonCulling: true,
              polygons: [
                if (showField) field.mapPolygon,
                if (showBufferedField)
                  bufferedField.mapPolygon.copyWith(
                    color: Colors.red.withOpacity(0.25),
                    borderColor: Colors.red,
                  ),
                if (showFieldBoundingBox)
                  Polygon(
                    points:
                        field.mapBoundingBox((point) => point.latLng).toList(),
                    borderStrokeWidth: 1,
                    borderColor: Colors.yellow,
                  ),
                if (showBufferedFieldBoundingBox)
                  Polygon(
                    points: bufferedField
                        .mapBoundingBox((point) => point.latLng)
                        .toList(),
                    borderStrokeWidth: 1,
                    borderColor: Colors.red,
                  ),
              ],
            ),
            CircleLayer(
              circles: [
                if (showField) ...[
                  ...field.mapExteriorPoints(
                    (point) => CircleMarker(point: point.latLng, radius: 2),
                  ),
                  ...field
                      .mapInteriorPoints(
                        (point) => CircleMarker(point: point.latLng, radius: 2),
                      )
                      .flattened,
                ],
                if (showBufferedField) ...[
                  ...bufferedField.mapExteriorPoints(
                    (point) => CircleMarker(point: point.latLng, radius: 2),
                  ),
                  ...bufferedField
                      .mapInteriorPoints(
                        (point) => CircleMarker(point: point.latLng, radius: 2),
                      )
                      .flattened,
                ],
              ],
            ),
          ],
        );
      }
    }
    return const SizedBox.shrink();
  }
}
