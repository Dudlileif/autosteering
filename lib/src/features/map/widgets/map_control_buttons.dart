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

import 'dart:math';

import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A selection of widgets to control the map zoom, rotation and position lock.
class MapControlButtons extends StatelessWidget {
  /// A selection of widgets to control the map zoom, rotation and position
  /// lock.
  const MapControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Defer the first frame so that map and vehcile position are initialized.
    WidgetsBinding.instance.deferFirstFrame();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) => FloatingActionButton(
              tooltip: 'Lock map on vehicle',
              backgroundColor:
                  theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
              onPressed: ref.read(centerMapOnVehicleProvider.notifier).invert,
              child: switch (ref.watch(centerMapOnVehicleProvider)) {
                true => const Icon(Icons.my_location, size: 50),
                false => const Icon(Icons.location_searching, size: 50)
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) => FloatingActionButton(
              tooltip: 'Always point map north',
              backgroundColor:
                  theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
              onPressed: ref.read(alwaysPointNorthProvider.notifier).toggle,
              child: Consumer(
                builder: (context, ref, child) {
                  final angle = ref.watch(gaugeBearingProvider) * 2 * pi / 360;
                  final alwaysPointNorth =
                      ref.watch(alwaysPointNorthProvider) &&
                          ref.watch(
                                mainMapControllerProvider.select(
                                  (controller) => controller.camera.rotation,
                                ),
                              ) ==
                              0;

                  const ring = Icon(
                    Icons.location_searching,
                    size: 30,
                  );

                  const navIcon = Icon(
                    Icons.navigation_outlined,
                    size: 20,
                  );

                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: alwaysPointNorth ? 0 : -angle,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Transform.rotate(
                                angle: alwaysPointNorth ? 0 : angle,
                                child: Text(
                                  'N',
                                  style: theme.textTheme.labelSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Transform.rotate(
                                  angle: alwaysPointNorth ? 0 : angle,
                                  child: Text(
                                    'E',
                                    style: theme.textTheme.labelSmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Transform.rotate(
                                angle: alwaysPointNorth ? 0 : angle,
                                child: Text(
                                  'S',
                                  style: theme.textTheme.labelSmall
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Transform.rotate(
                                  angle: alwaysPointNorth ? 0 : angle,
                                  child: Text(
                                    'W',
                                    style: theme.textTheme.labelSmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: alwaysPointNorth ? 0 : -angle,
                        child: ring,
                      ),
                      Transform.rotate(
                        angle: alwaysPointNorth ? angle : 0,
                        child: navIcon,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              return FloatingActionButton(
                tooltip: 'Zoom in',
                backgroundColor:
                    theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
                onPressed: () => ref
                    .read(mainMapControllerProvider.notifier)
                    .zoomInSnap(0.25),
                child: const Icon(
                  Icons.zoom_in,
                  size: 50,
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              return FloatingActionButton(
                tooltip: 'Zoom out',
                backgroundColor:
                    theme.colorScheme.primaryContainer.withValues(alpha: 0.6),
                onPressed: () => ref
                    .read(mainMapControllerProvider.notifier)
                    .zoomOutSnap(0.25),
                child: const Icon(
                  Icons.zoom_out,
                  size: 50,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
