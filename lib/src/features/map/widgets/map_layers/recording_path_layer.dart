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
class RecordingPathLayer extends ConsumerWidget {
  /// A combination layer for the currently recording points and the
  /// lines between.
  const RecordingPathLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final points = ref.watch(pathRecordingListProvider);
    final vehiclePosition =
        ref.watch(mainVehicleProvider.select((vehicle) => vehicle.position));

    return Stack(
      children: points.isNotEmpty
          ? [
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points: [
                      ...points.map((point) => point.position.latLng),
                      vehiclePosition.latLng,
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
                ],
              ),
            ]
          : const [],
    );
  }
}
