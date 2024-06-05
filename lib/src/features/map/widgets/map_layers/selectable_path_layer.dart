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
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart' hide Polygon;

/// A layer for selecting connected parts of a line string.
class SelectablePathLayer extends ConsumerWidget {
  /// A layer for selecting connected parts of a line string.
  const SelectablePathLayer({
    super.key,
    this.highlightSelectedPath = true,
    this.showStraightLine = false,
  });

  /// Whether the selected path should be highlighted.
  final bool highlightSelectedPath;

  /// Whether the straight line from start to end should be shown.
  final bool showStraightLine;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final start = ref.watch(selectablePathIndexStartProvider);
    final end = ref.watch(selectablePathIndexEndProvider);
    final path = ref.watch(selectablePathPointsProvider) ?? [];
    final selected = ref.watch(selectablePathIndicesProvider) ?? [];

    final segments = <Polyline>[];
    if (path.length >= 2) {
      for (var i = 0; i < path.length; i++) {
        segments.add(
          Polyline(
            points: [
              path.elementAt(i).latLng,
              path.elementAt((i + 1) % path.length).latLng,
            ],
            color: selected.contains(i) &&
                    selected.contains((i + 1) % path.length) &&
                    highlightSelectedPath
                ? Colors.green
                : Colors.black,
            strokeWidth: selected.contains(i) &&
                    selected.contains((i + 1) % path.length) &&
                    highlightSelectedPath
                ? 6
                : 3,
          ),
        );
      }
    }

    return Stack(
      children: [
        if (path.length >= 2) ...[
          PolylineLayer(
            polylines: [
              ...segments,
              if (start != null && end != null && showStraightLine)
                Polyline(
                  points: [
                    path.elementAt(start).latLng,
                    path.elementAt(end).latLng,
                  ],
                  strokeWidth: 6,
                  color: Colors.blue,
                ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: path.elementAt(start ?? 0).latLng,
                child: MovableMapMarker(
                  point: path.elementAt(start ?? 0),
                  radius: 10,
                  color: Colors.green,
                  onMoved: (position) {
                    final distances = path
                        .mapIndexed(
                          (index, point) => (
                            index: index,
                            distance: position.rhumb.distanceTo(point)
                          ),
                        )
                        .sorted((a, b) => a.distance.compareTo(b.distance));
                    ref
                        .read(selectablePathIndexStartProvider.notifier)
                        .update(distances.first.index);
                  },
                ),
              ),
              Marker(
                point: path.elementAt(end ?? 0).latLng,
                child: MovableMapMarker(
                  point: path.elementAt(end ?? 0),
                  radius: 10,
                  color: Colors.red,
                  onMoved: (position) {
                    final distances = path
                        .mapIndexed(
                          (index, point) => (
                            index: index,
                            distance: position.rhumb.distanceTo(point)
                          ),
                        )
                        .sorted((a, b) => a.distance.compareTo(b.distance));
                    ref
                        .read(selectablePathIndexEndProvider.notifier)
                        .update(distances.first.index);
                  },
                ),
              ),
              Marker(
                point: path.elementAt(start ?? 0).latLng,
                alignment: Alignment.centerLeft,
                child: TextWithStroke(
                  'A',
                  strokeWidth: 3.5,
                  style: theme.menuButtonWithChildrenText
                      ?.copyWith(color: Colors.white),
                ),
                rotate: true,
              ),
              Marker(
                point: path.elementAt(end ?? 0).latLng,
                alignment: Alignment.centerLeft,
                child: TextWithStroke(
                  'B',
                  strokeWidth: 3.5,
                  style: theme.menuButtonWithChildrenText
                      ?.copyWith(color: Colors.white),
                ),
                rotate: true,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
