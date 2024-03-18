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
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';

/// A combination layer for debugging a Dubins path between two points.
class DubinsPathDebugLayer extends ConsumerWidget {
  /// A combination layer for debugging a Dubins path between two points.
  const DubinsPathDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dubinsPath = ref.watch(debugDubinsPathProvider);

    if (dubinsPath != null) {
      final pathType = ref.watch(dubinsPathDebugPathTypeProvider) ??
          dubinsPath.bestPathData?.pathType;
      if (pathType != null) {
        if (dubinsPath.isPathTypePossible(pathType)) {
          final showTurningCricles =
              ref.watch(showDubinsPathDebugCirclesProvider);
          final minTurningRadius = ref.watch(
            mainVehicleProvider.select((vehicle) => vehicle.minTurningRadius),
          );
          final wayPoints = dubinsPath
              .dubinsPathPlan(
                pathType,
              )!
              .wayPoints!;

          return Stack(
            children: [
              CircleLayer(
                circles: [
                  if (showTurningCricles) ...[
                    CircleMarker(
                      point: dubinsPath.startRightCircleCenter.latLng,
                      radius: minTurningRadius,
                      useRadiusInMeter: true,
                      color: Colors.pink.withOpacity(0.3),
                    ),
                    CircleMarker(
                      point: dubinsPath.startLeftCircleCenter.latLng,
                      radius: minTurningRadius,
                      useRadiusInMeter: true,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    CircleMarker(
                      point: dubinsPath.endLeftCircleCenter.latLng,
                      radius: minTurningRadius,
                      useRadiusInMeter: true,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    CircleMarker(
                      point: dubinsPath.endRightCircleCenter.latLng,
                      radius: minTurningRadius,
                      useRadiusInMeter: true,
                      color: Colors.pink.withOpacity(0.3),
                    ),
                    if ([DubinsPathType.lrl, DubinsPathType.rlr]
                        .contains(pathType))
                      CircleMarker(
                        point: dubinsPath
                            .pathData(pathType)!
                            .middleCircleCenter!
                            .latLng,
                        radius: minTurningRadius,
                        useRadiusInMeter: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                  ],
                  ...wayPoints.map(
                    (e) => CircleMarker(point: e.position.latLng, radius: 5),
                  ),
                  CircleMarker(
                    point: dubinsPath
                        .pathData(pathType)!
                        .tangentStart
                        .position
                        .latLng,
                    radius: 3,
                    color: Colors.black,
                  ),
                  CircleMarker(
                    point: dubinsPath
                        .pathData(pathType)!
                        .tangentEnd
                        .position
                        .latLng,
                    radius: 3,
                    color: Colors.black,
                  ),
                ],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      dubinsPath.start.position.latLng,
                      dubinsPath.start.position.rhumb
                          .destinationPoint(
                            distance: 2,
                            bearing: dubinsPath.start.bearing,
                          )
                          .latLng,
                    ],
                    color: Colors.blue,
                    strokeWidth: 5,
                  ),
                  Polyline(
                    points: [
                      dubinsPath.end.position.latLng,
                      dubinsPath.end.position.rhumb
                          .destinationPoint(
                            distance: 2,
                            bearing: dubinsPath.end.bearing,
                          )
                          .latLng,
                    ],
                    color: Colors.red,
                    strokeWidth: 5,
                  ),
                  ...wayPoints.map(
                    (e) => Polyline(
                      points: [
                        e.position.latLng,
                        e.position.rhumb
                            .destinationPoint(distance: 0.5, bearing: e.bearing)
                            .latLng,
                      ],
                      strokeWidth: 2,
                    ),
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: dubinsPath.start.position.latLng,
                    child: MovableMapMarker(
                      point: dubinsPath.start.position,
                      onMoved: (position) => ref
                          .read(dubinsPathDebugStartPointProvider.notifier)
                          .update(
                            dubinsPath.start.copyWith(position: position),
                          ),
                      radius: 5,
                      color: Colors.blue,
                    ),
                  ),
                  Marker(
                    point: dubinsPath.end.position.latLng,
                    child: MovableMapMarker(
                      point: dubinsPath.end.position,
                      onMoved: (position) => ref
                          .read(dubinsPathDebugEndPointProvider.notifier)
                          .update(
                            dubinsPath.end.copyWith(position: position),
                          ),
                      radius: 5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      }
    }

    final start = ref.watch(dubinsPathDebugStartPointProvider);
    final end = ref.watch(dubinsPathDebugEndPointProvider);

    return Stack(
      children: [
        MarkerLayer(
          markers: [
            if (start != null)
              Marker(
                point: start.position.latLng,
                child: MovableMapMarker(
                  point: start.position,
                  onMoved: (position) => ref
                      .read(dubinsPathDebugStartPointProvider.notifier)
                      .update(start.copyWith(position: position)),
                  radius: 5,
                  color: Colors.blue,
                ),
              ),
            if (end != null)
              Marker(
                point: end.position.latLng,
                child: MovableMapMarker(
                  point: end.position,
                  onMoved: (position) => ref
                      .read(dubinsPathDebugEndPointProvider.notifier)
                      .update(end.copyWith(position: position)),
                  radius: 5,
                  color: Colors.red,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
