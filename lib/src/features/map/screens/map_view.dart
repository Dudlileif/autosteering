import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapView extends ConsumerWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mainMapControllerProvider);
    final vehicle = ref.watch(mainVehicleProvider);

    ref
      ..watch(vehicleDrivingProvider)
      ..watch(zoomTimerControllerProvider);

    final map = FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: vehicle.position,
        rotation: -vehicle.heading,
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
      children: [
        if (ref.watch(showOSMLayerProvider)) const OSMLayer(),
        const CountryLayers(),
        const SentinelLayers(),
        const FinishedPathLayer(),
        const FinishedPolygonLayer(),
        const RecordingPathLayer(),
        const EditablePathLayer(),
        const VehicleDebugLayer(),
      ],
    );

    return Stack(
      children: [
        map,
        const Align(
          alignment: Alignment.bottomRight,
          child: MapContributionWidget(),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: MapControlButtons(),
        ),
        const Align(
          alignment: Alignment.bottomRight,
          child: ScreenVehicleControls(),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: BasicVehicleGauges(),
          ),
        ),
      ],
    );
  }
}
