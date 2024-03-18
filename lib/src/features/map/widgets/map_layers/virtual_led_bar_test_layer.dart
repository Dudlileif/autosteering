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
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';

/// A map layer for showing a line to help visualizing when testing the
/// virtual LED bar.
class VirtualLedBarTestLayer extends ConsumerWidget {
  /// A map layer for showing a line to help visualizing when testing the
  /// virtual LED bar.
  const VirtualLedBarTestLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(virtualLedBarTestingProvider) ||
        !ref.watch(virtualLedBarEnabledProvider)) {
      return const SizedBox.shrink();
    }
    final distance = ref.watch(virtualLedBarPerpendicularDistanceProvider);

    if (distance == null) {
      return const SizedBox.shrink();
    }

    final vehicle = ref.watch(mainVehicleProvider);

    return PolylineLayer(
      polylineCulling: true,
      polylines: [
        Polyline(
          points: [
            vehicle.position.rhumb
                .destinationPoint(distance: 100, bearing: vehicle.bearing)
                .rhumb
                .destinationPoint(
                  distance: distance,
                  bearing: vehicle.bearing - 90,
                )
                .latLng,
            vehicle.position.rhumb
                .destinationPoint(distance: 100, bearing: vehicle.bearing + 180)
                .rhumb
                .destinationPoint(
                  distance: distance,
                  bearing: vehicle.bearing - 90,
                )
                .latLng,
          ],
        ),
      ],
    );
  }
}
