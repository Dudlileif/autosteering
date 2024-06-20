// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/field/field.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/map/map.dart';
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

    final darkModeEnabled = Theme.of(context).brightness == Brightness.dark;
    if (field != null) {
      final enabled = ref.watch(showFieldLayerProvider);
      if (enabled) {
        final bufferedField = ref.watch(bufferedFieldProvider).when(
              data: (data) => data,
              error: (error, stackTrace) => null,
              loading: () => null,
            );

        final showField = ref.watch(showFieldProvider);

        final showBufferedField =
            ref.watch(showBufferedFieldProvider) && bufferedField != null;

        final showFieldBoundingBox =
            ref.watch(showFieldBoundingBoxProvider) && showField;

        final showBufferedFieldBoundingBox =
            ref.watch(showBufferedFieldBoundingBoxProvider) &&
                bufferedField != null;

        final showBorderPoints = ref.watch(showFieldBorderPointsProvider);
        
        return Stack(
          children: [
            PolygonLayer(
              polygons: [
                if (showField)
                  field.mapPolygon.copyWith(
                    borderColor: darkModeEnabled ? Colors.white : Colors.black,
                    borderStrokeWidth: 2,
                  ),
                if (showBufferedField)
                  bufferedField.mapPolygon.copyWith(
                    borderColor: Colors.red,
                    borderStrokeWidth: 2,
                  ),
                if (showFieldBoundingBox)
                  Polygon(
                    points:
                        field.mapBoundingBox((point) => point.latLng).toList(),
                    borderStrokeWidth: 1,
                    borderColor: darkModeEnabled ? Colors.white : Colors.black,
                    color: Colors.transparent,
                  ),
                if (showBufferedFieldBoundingBox)
                  Polygon(
                    points: bufferedField
                        .mapBoundingBox((point) => point.latLng)
                        .toList(),
                    borderStrokeWidth: 1,
                    color: Colors.transparent,
                    borderColor: Colors.red,
                  ),
              ],
            ),
            if (showBorderPoints)
              CircleLayer(
                circles: [
                  if (showField) ...[
                    ...field.mapExteriorPoints(
                      (point) => CircleMarker(point: point.latLng, radius: 2),
                    ),
                    ...[
                      for (final ring in field
                        .mapInteriorPoints(
                          (point) =>
                              CircleMarker(point: point.latLng, radius: 2),
                      ))
                        ...ring,
                    ],
                  ],
                  if (showBufferedField) ...[
                    ...bufferedField.mapExteriorPoints(
                      (point) => CircleMarker(point: point.latLng, radius: 2),
                    ),
                    ...[for (final ring in bufferedField
                        .mapInteriorPoints(
                          (point) =>
                              CircleMarker(point: point.latLng, radius: 2),
                        ))
                        ...ring,],
                  ],
                ],
              ),
          ],
        );
      }
    }
    final recordingExteriorRing = ref.watch(fieldExteriorRingProvider);
    final recordingInteriorRings = ref.watch(fieldInteriorRingsProvider);
    if (ref.watch(showPathRecordingMenuProvider) &&
        ref.watch(
          activePathRecordingTargetProvider
              .select((value) => value == PathRecordingTarget.field),
        ) &&
        (recordingInteriorRings != null || recordingExteriorRing != null)) {
      return Stack(
        children: [
          PolygonLayer(
            polygons: [
              if (recordingExteriorRing != null)
                Polygon(
                  points: recordingExteriorRing
                      .map((point) => point.latLng)
                      .toList(),
                  borderStrokeWidth: 1,
                  borderColor: darkModeEnabled ? Colors.white : Colors.black,
                ),
              if (recordingInteriorRings != null)
                ...recordingInteriorRings.map(
                  (ring) => Polygon(
                    points: ring.map((point) => point.latLng).toList(),
                    borderStrokeWidth: 1,
                    borderColor: darkModeEnabled ? Colors.white : Colors.black,
                  ),
                ),
            ],
          ),
        ],
      );
    }
    return const SizedBox.shrink();
  }
}
