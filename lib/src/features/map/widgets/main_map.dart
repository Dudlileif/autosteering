import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/simulator/simulator.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main map widget used on the primary screen/view in the application.
class MainMap extends ConsumerWidget {
  /// The main map widget used on the primary screen/view in the application.
  const MainMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref
      ..watch(simCoreVehicleDrivingProvider)
      ..watch(zoomTimerControllerProvider);

    return FlutterMap(
      key: const Key('Map'),
      mapController: ref.watch(mainMapControllerProvider),
      options: MapOptions(
        // Initial zoom
        initialZoom: ref.watch(mapZoomProvider),
        minZoom: 4,
        maxZoom: 22,
        interactionOptions: InteractionOptions(
          flags: ref.watch(centerMapOnVehicleProvider)
            ? InteractiveFlag.pinchZoom | InteractiveFlag.doubleTapZoom
              : InteractiveFlag.all,
        ),
        onMapEvent: (event) {
          // Force scrolling zoom events to keep position when the map
          // should be centered on the vehicle. Otherwise it would
          // zoom towards pointer/pinch center.
          if (ref.watch(centerMapOnVehicleProvider)) {
            if (event is MapEventScrollWheelZoom) {
              ref
                  .read(mainMapControllerProvider)
                  .move(event.oldCamera.center, event.camera.zoom);
            } else if (event is MapEventDoubleTapZoom) {
              ref
                  .read(mainMapControllerProvider)
                  .move(event.oldCamera.center, event.camera.zoom + 1);
            }
          }

          // Force map to not allow rotation when it should always point north.
          if (ref.watch(alwaysPointNorthProvider) && event is MapEventRotate) {
            if (event.camera.rotation != 0) {
              ref.read(mainMapControllerProvider).rotate(0);
            }
          }
          ref.read(mapZoomProvider.notifier).update(event.camera.zoom);
        },
        initialCenter: ref.watch(offsetVehiclePositionProvider),
        initialRotation: switch (ref.watch(alwaysPointNorthProvider)) {
          true => 0,
          false => ref.watch(
              mainVehicleProvider.select((value) => value.bearing),
            )
        },

        onMapReady: ref.read(mapReadyProvider.notifier).ready,
        onTap: (tapPosition, point) {
          ref
              .read(allEquipmentsProvider.notifier)
              .handleMapOnTap(point);
        },
        onPointerHover: (event, point) {
          ref
              .read(allEquipmentsProvider.notifier)
              .handleMapOnPointerHover(event, point);
        },
      ),

      // Only the last layer can be user interactive due to using Stack
      // widgets in the previous layers.
      children: [
        if (ref.watch(showOSMLayerProvider)) const OSMLayer(),
        if (ref.watch(showCountryLayersProvider)) const CountryLayers(),
        if (ref.watch(showSentinelLayersProvider)) const SentinelLayers(),
        if (ref.watch(showFieldDebugLayerProvider)) const FieldLayer(),
        if (ref.watch(showFinishedPathLayerProvider)) const FinishedPathLayer(),
        if (ref.watch(showVehicleDrawingLayerProvider))
          const VehicleDrawerLayer(),
        if (ref.watch(showRecordingPathLayerProvider))
          const RecordingPathLayer(),
        if (ref.watch(showVehicleDebugLayerProvider)) const VehicleDebugLayer(),
        if (ref.watch(showEquipmentDebugLayerProvider))
          const EquipmentDebugLayer(),
        if (ref.watch(showPathTrackingDebugLayerProvider))
          const PathTrackingDebugLayer(),
        if (ref.watch(showEditablePathLayerProvider)) const EditablePathLayer(),
        if (ref.watch(showDubinsPathDebugLayerProvider))
          const DubinsPathDebugLayer(),
        if (ref.watch(showABTrackingDebugLayerProvider))
          const ABTrackingDebugLayer(),
        if (ref.watch(virtualLedBarTestingProvider))
          const VirtualLedBarTestLayer(),
      ],
    );
  }
}
