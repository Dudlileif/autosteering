import 'dart:math';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapPositionAndZoomButtons extends ConsumerStatefulWidget {
  const MapPositionAndZoomButtons({
    super.key,
  });

  @override
  ConsumerState<MapPositionAndZoomButtons> createState() =>
      _MapPositionAndZoomButtonsState();
}

class _MapPositionAndZoomButtonsState
    extends ConsumerState<MapPositionAndZoomButtons> {
  @override
  Widget build(BuildContext context) {
    // Defer the first frame so that map and vehcile position are initialized.
    WidgetsBinding.instance.deferFirstFrame();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            tooltip: 'Lock map on vehicle',
            backgroundColor:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
            onPressed: ref.read(centerMapOnVehicleProvider.notifier).invert,
            child: Builder(
              builder: (context) {
                if (ref.watch(centerMapOnVehicleProvider)) {
                  // &&  canComparePositions) {
                  if (ref.watch(mainMapControllerProvider).center ==
                      ref.watch(offsetVehiclePositionProvider)) {
                    return const Icon(Icons.my_location, size: 50);
                  }
                }

                return const Icon(Icons.location_searching, size: 50);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            tooltip: 'Always point map north',
            backgroundColor:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
            onPressed: ref.read(alwaysPointNorthProvider.notifier).toggle,
            child: Builder(
              builder: (context) {
                final angle = ref.watch(vehicleHeadingProvider) * 2 * pi / 360;

                final alwaysPointNorth = ref.watch(alwaysPointNorthProvider) &&
                    ref.watch(mainMapControllerProvider).rotation == 0;

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
                      angle: alwaysPointNorth ? 0 : angle,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Transform.rotate(
                              angle: alwaysPointNorth ? 0 : -angle,
                              child: Text(
                                'N',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Transform.rotate(
                                angle: alwaysPointNorth ? 0 : -angle,
                                child: Text(
                                  'E',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Transform.rotate(
                              angle: alwaysPointNorth ? 0 : -angle,
                              child: Text(
                                'S',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Transform.rotate(
                              angle: alwaysPointNorth ? 0 : -angle,
                              child: Text(
                                'W',
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.rotate(
                      angle: alwaysPointNorth ? 0 : angle,
                      child: ring,
                    ),
                    Transform.rotate(
                      angle: alwaysPointNorth ? angle : 0,
                      child: navIcon,
                    )
                  ],
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            tooltip: 'Zoom in',
            backgroundColor:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
            onPressed: () =>
                ref.read(mainMapControllerProvider.notifier).zoomIn(0.25),
            child: const Icon(
              Icons.zoom_in,
              size: 50,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: FloatingActionButton(
            tooltip: 'Zoom out',
            backgroundColor:
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
            onPressed: () =>
                ref.read(mainMapControllerProvider.notifier).zoomOut(0.25),
            child: const Icon(
              Icons.zoom_out,
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
