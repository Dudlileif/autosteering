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

import 'package:autosteering/src/features/common/utils/position_projection_extensions.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the currently recording points and the
/// lines between.
class PathRecordingLayer extends ConsumerWidget {
  /// A combination layer for the currently recording points and the
  /// lines between.
  const PathRecordingLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(pathRecordingListProvider);
    final settings = ref.watch(activePathRecordingSettingsProvider);
    var vehicleWayPoint =
        ref.watch(mainVehicleProvider.select((vehicle) => vehicle.wayPoint));
    if (settings.longitudinalOffset.abs() > 0) {
      vehicleWayPoint =
          vehicleWayPoint.moveRhumb(distance: settings.longitudinalOffset);
    }
    if (settings.lateralOffset.abs() > 0) {
      vehicleWayPoint = vehicleWayPoint.moveRhumb(
        distance: settings.lateralOffset,
        angleFromBearing: 90,
      );
    }
    return Stack(
      children: [
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points: [
                      ...points.map((point) => point.position.latLng),
                      vehicleWayPoint.position.latLng,
                    ],
                  ),
                ],
              ),
              CircleLayer(
                circles: [
                  if (points.isNotEmpty)
                    ...points.map(
                      (point) => CircleMarker(
                        point: point.position.latLng,
                        radius: 5,
                      ),
                    ),
            CircleMarker(
              point: vehicleWayPoint.position.latLng,
              radius: 5,
              color: Colors.blue,
            ),
                ],
              ),
      ],
    );
  }
}
