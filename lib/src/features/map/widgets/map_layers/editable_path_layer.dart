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
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/map/map.dart';
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
                          alwaysVisible: Device.isMobile,
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
                        onDoubleTap: () => ref
                            .read(finishedPathRecordingListProvider.notifier)
                            .remove(index),
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
