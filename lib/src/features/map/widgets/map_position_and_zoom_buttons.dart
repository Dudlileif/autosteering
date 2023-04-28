import 'package:agopengps_flutter/src/features/map/map.dart';
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
          child: Tooltip(
            message: 'Lock map to vehicle',
            child: FloatingActionButton(
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
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Tooltip(
            message: 'Zoom in',
            child: FloatingActionButton(
              onPressed: () =>
                  ref.read(mainMapControllerProvider.notifier).zoomIn(0.25),
              child: const Icon(
                Icons.zoom_in,
                size: 50,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Tooltip(
            message: 'Zoom out',
            child: FloatingActionButton(
              onPressed: () =>
                  ref.read(mainMapControllerProvider.notifier).zoomOut(0.25),
              child: const Icon(
                Icons.zoom_out,
                size: 50,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
