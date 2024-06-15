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
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A map layer for drawing equipment on the map.
class EquipmentDrawerLayer extends ConsumerWidget {
  /// A map layer for drawing equipment on the map.
  const EquipmentDrawerLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipments = ref.watch(
      allEquipmentsProvider.select(
        (value) => value.values.where((element) => element.hitchParent != null),
      ),
    );

    return PolygonLayer(
      polygons: [
        for (final equipment in equipments
          .map((e) => e.mapPolygons)
          .nonNulls)
          ...equipment,
      ],
    );
  }
}

/// A map layer for debugging equipment.
class EquipmentDebugLayer extends ConsumerWidget {
  /// A map layer for debugging equipment.
  const EquipmentDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debugTurning = ref.watch(debugEquipmentTurningProvider);
    final debugTrajectory = ref.watch(debugEquipmentTrajectoryProvider);
    final debugTravelledPath = ref.watch(debugEquipmentTravelledPathProvider);
    final debugHitches = ref.watch(debugEquipmentHitchesProvider);
    final debugSections = ref.watch(debugEquipmentSectionsProvider);
    final trajectorySeconds =
        ref.watch(debugEquipmentTrajectorySecondsProvider);
    final trajectoryMinLength =
        ref.watch(debugEquipmentTrajectoryMinLengthProvider);


    final equipments = ref.watch(
      allEquipmentsProvider.select(
        (value) => value.values.where((element) => element.hitchParent != null),
      ),
    );
    final darkTheme = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        if (debugTrajectory || debugTravelledPath)
          PolylineLayer(
            polylines: [
              if (debugTravelledPath)
                ...equipments.map(
                  (equipment) => Polyline(
                    points: ref.watch(
                      debugEquipmentTravelledPathListProvider
                          .select((value) => value[equipment.uuid] ?? []),
                    ),
                  ),
                ),
              if (debugTrajectory) ...[
                ...equipments.map(
                  (e) => Polyline(
                    points: e
                        .trajectory(
                          seconds: trajectorySeconds,
                          minLength: trajectoryMinLength,
                        )
                        .chain
                        .toGeographicPositions
                        .map((e) => e.latLng)
                        .toList(),
                    strokeWidth: 2,
                    color: Colors.orange,
                  ),
                ),
                ...[
                  for (final equipment in equipments.map((equipment) {
                  if (equipment.sections.isEmpty) {
                    return <Polyline>[];
                  }
                  final leftMost = equipment
                      .sectionEdgeTrajectories(
                        0,
                        seconds: trajectorySeconds,
                        minLength: trajectoryMinLength,
                      )
                      .left;
                  final rightMost = equipment
                      .sectionEdgeTrajectories(
                        equipment.sections.length - 1,
                        seconds: trajectorySeconds,
                        minLength: trajectoryMinLength,
                      )
                      .right;
                  return <Polyline>[
                    Polyline(
                      points: leftMost.chain.toGeographicPositions
                          .map((e) => e.latLng)
                          .toList(),
                      strokeWidth: 2,
                      color: Colors.red,
                    ),
                    Polyline(
                      points: rightMost.chain.toGeographicPositions
                          .map((e) => e.latLng)
                          .toList(),
                      strokeWidth: 2,
                      color: Colors.red,
                    ),
                  ];
                  }))
                    ...equipment,
                ],
              ],
            ],
          ),
        if (debugTurning || debugHitches || debugSections)
          CircleLayer(
            circles: [
              if (debugTurning)
                ...equipments
                    .where(
                      (element) =>
                          element.turningRadiusCenter != null &&
                          element.currentTurningRadius != null,
                    )
                    .map(
                      (equipment) => CircleMarker(
                        point: equipment.turningRadiusCenter!.latLng,
                        radius: equipment.currentTurningRadius!,
                        color: darkTheme
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.1),
                        useRadiusInMeter: true,
                      ),
                    ),
              if (debugHitches)
                ...[
                ...equipments.map(
                  (equipment) => CircleMarker(
                    point: equipment.position.latLng,
                    radius: 5,
                    color: Colors.white,
                  ),
                ),
                for (final equipment in equipments
                    .map(
                      (equipment) => equipment.hitchPoints.mapIndexed(
                        (index, hitch) => CircleMarker(
                          point: hitch.latLng,
                          radius: 5,
                          color: [Colors.red, Colors.green, Colors.blue][index],
                        ),
                  ),
                ))
                  ...equipment,
              ],
              if (debugTurning)
              ...equipments.map(
                (equipment) => CircleMarker(
                  point: equipment.workingCenter.latLng,
                  radius: 5,
                  color: Colors.yellow,
                ),
              ),
              if (debugSections)
                ...[
                for (final equipment in equipments
                    .map(
                      (equipment) => equipment.sections.map(
                        (section) => CircleMarker(
                          point: equipment.sectionCenter(section.index).latLng,
                          radius: 4,
                          color: Colors.orange,
                        ),
                      ),
                ))
                  ...equipment,
              ],
            ],
          ),
      ],
    );
  }
}
