import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main map widget used on the primary screen/view in the application.
class MainMap extends ConsumerWidget {
  const MainMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mainMapControllerProvider);

    ref
      ..watch(simVehicleDrivingProvider)
      ..watch(zoomTimerControllerProvider);

    return FlutterMap(
      key: const Key('Map'),
      mapController: mapController,
      options: MapOptions(
        zoom: 19,
        minZoom: 4,
        maxZoom: 22,
        interactiveFlags: ref.watch(centerMapOnVehicleProvider)
            ? InteractiveFlag.none
            : InteractiveFlag.all,
        onMapEvent: (event) {
          // Force scrolling zoom events to keep position when the map
          // should be centered on the vehicle. Otherwise it would
          // zoom towards pointer/pinch center.
          if (ref.watch(centerMapOnVehicleProvider) &&
              event is MapEventScrollWheelZoom) {
            ref
                .read(mainMapControllerProvider)
                .move(event.center, event.targetZoom);
          }
          // Force map to not allow rotation when it should always point north.
          if (ref.watch(alwaysPointNorthProvider) && event is MapEventRotate) {
            if (event.targetRotation != 0) {
              ref.read(mainMapControllerProvider).rotate(0);
            }
          }
        },
        onMapReady: ref.read(mapReadyProvider.notifier).ready,
      ),

      // Only the last layer can be user interactive due to using Stack
      // widgets in the previous layers.
      children: [
        if (ref.watch(showOSMLayerProvider)) const OSMLayer(),
        if (ref.watch(showCountryLayersProvider)) const CountryLayers(),
        if (ref.watch(showSentinelLayersProvider)) const SentinelLayers(),
        if (ref.watch(showFieldDebugLayerProvider)) const FieldLayer(),
        if (ref.watch(showFinishedPathLayerProvider)) const FinishedPathLayer(),
        if (ref.watch(showFinishedPolygonLayerProvider))
          const FinishedPolygonLayer(),
        if (ref.watch(showVehicleDrawingLayerProvider))
          const VehicleDrawerLayer(),
        if (ref.watch(showRecordingPathLayerProvider))
          const RecordingPathLayer(),
        if (ref.watch(showVehicleDebugLayerProvider)) const VehicleDebugLayer(),
        if (ref.watch(showPurePursuitDebugLayerProvider))
          const PurePursuitDebugLayer(),
        if (ref.watch(showEditablePathLayerProvider)) const EditablePathLayer(),
        if (ref.watch(showDubinsPathDebugLayerProvider))
          const DubinsPathDebugLayer(),
      ],
    );
  }
}
