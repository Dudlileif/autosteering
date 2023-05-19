import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The main map widget with overlayed widgets (buttons, gauges).
class MapView extends ConsumerWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(mainMapControllerProvider);
    final vehicle = ref.watch(mainVehicleProvider);

    ref
      ..watch(simVehicleDrivingProvider)
      ..watch(zoomTimerControllerProvider);

    final map = FlutterMap(
      key: const Key('Map'),
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

      // Only the last layer can be user interactive due to using Stack
      // widgets in the previous layers.
      children: [
        if (ref.watch(showOSMLayerProvider)) const OSMLayer(),
        if (ref.watch(showCountryLayersProvider)) const CountryLayers(),
        if (ref.watch(showSentinelLayersProvider)) const SentinelLayers(),
        if (ref.watch(showFinishedPathLayerProvider)) const FinishedPathLayer(),
        if (ref.watch(showFinishedPolygonLayerProvider))
          const FinishedPolygonLayer(),
        if (ref.watch(showRecordingPathLayerProvider))
          const RecordingPathLayer(),
        if (ref.watch(showVehicleDebugLayerProvider)) const VehicleDebugLayer(),
        if (ref.watch(showEditablePathLayerProvider)) const EditablePathLayer(),
        if (ref.watch(showDubinsPathDebugLayerProvider))
          const DubinsPathDebugLayer(),
      ],
    );

    return Stack(
      children: [
        switch (ref.watch(mapUse3DPerspectiveProvider)) {
          false => map,
          true => PerspectiveWithOverflow(
              perspectiveAngle: ref.watch(map3DPerspectiveAngleProvider),
              child: map,
            ),
        },
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
          child: VehicleSimScreenControls(),
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

/// An extended surface area that is displayed at an angle. The area will
/// overflow the screen edges further back to fill more of the screen further
/// ahead.
class PerspectiveWithOverflow extends StatelessWidget {
  const PerspectiveWithOverflow({
    required this.child,
    required this.perspectiveAngle,
    super.key,
  });

  final Widget child;
  final double perspectiveAngle;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective narrowing modifier
        ..rotateX(-perspectiveAngle),
      child: FractionallySizedBox(
        heightFactor: 3,
        widthFactor: 1.5,
        child: child,
      ),
    );
  }
}
