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
        onLongPress: (tapPosition, point) {
          ref.read(homePositionProvider.notifier).update(point);
          ref
              .read(simVehicleInputProvider.notifier)
              .send(vehicle.copyWith(position: point, heading: 0));
          ref.invalidate(currentCountryProvider);
        },
        onMapReady: ref.read(mapReadyProvider.notifier).ready,
      ),
      children: [
        if (ref.watch(showOSMLayerProvider)) const OSMLayer(),
        if (ref.watch(selectedCountryLayersProvider).isNotEmpty)
          const CountryLayers(),
        if (ref.watch(selectedSentinelLayersProvider).isNotEmpty)
          const SentinelLayers(),
        PolygonLayer(
          polygonCulling: true,
          polygons: [
            ...vehicle.wheelPolygons,
            ...vehicle.polygons,
          ],
        ),
        if (ref.watch(debugAckermannProvider) && vehicle is AxleSteeredVehicle)
          CircleLayer(
            circles: [
              CircleMarker(
                point: vehicle.position,
                radius: 10,
              ),
              CircleMarker(
                point: vehicle.solidAxlePosition,
                radius: 10,
                color: Colors.red,
              ),
              CircleMarker(
                point: vehicle.steeringAxlePosition,
                radius: 10,
                color: Colors.blue,
              )
            ],
          ),
        if (ref.watch(debugAtriculatedProvider) &&
            vehicle is ArticulatedTractor)
          CircleLayer(
            circles: [
              CircleMarker(
                point: vehicle.position,
                radius: 10,
              ),
              CircleMarker(
                point: vehicle.rearAxlePosition,
                radius: 10,
                color: Colors.red,
              ),
              CircleMarker(
                point: vehicle.frontAxlePosition,
                radius: 10,
                color: Colors.blue,
              ),
              CircleMarker(
                point: vehicle.pivotPosition,
                radius: 10,
                color: Colors.black,
              )
            ],
          ),
        PolylineLayer(
          polylineCulling: true,
          polylines: [
            if (ref.watch(debugTravelledPathProvider) &&
                ref.watch(debugTravelledPathListProvider).isNotEmpty)
              Polyline(
                points: ref.watch(debugTravelledPathListProvider),
                strokeWidth: 3,
                strokeCap: StrokeCap.butt,
                gradientColors: [
                  Colors.red.withOpacity(0.4),
                  Colors.green.withOpacity(0.4)
                ],
              ),
            if (ref.watch(debugTrajectoryProvider))
              Polyline(
                points: vehicle.trajectory.coordinates,
                strokeWidth: 5,
                color: Colors.red,
              ),
            if (vehicle.turningRadiusCenter != null &&
                ref.watch(debugAckermannProvider) &&
                vehicle is AxleSteeredVehicle) ...[
              Polyline(
                points: [
                  vehicle.solidAxlePosition,
                  vehicle.turningRadiusCenter!,
                ],
                color: Colors.red,
              ),
              Polyline(
                points: [
                  vehicle.steeringAxlePosition,
                  vehicle.turningRadiusCenter!,
                ],
                color: Colors.blue,
              ),
              Polyline(
                points: [
                  vehicle.position,
                  vehicle.turningRadiusCenter!,
                ],
                color: Colors.green,
              ),
            ],
            if (vehicle.turningRadiusCenter != null &&
                ref.watch(debugAtriculatedProvider) &&
                vehicle is ArticulatedTractor) ...[
              Polyline(
                points: [
                  vehicle.rearAxlePosition,
                  vehicle.turningRadiusCenter!,
                ],
                color: Colors.red,
              ),
              Polyline(
                points: [
                  vehicle.frontAxlePosition,
                  vehicle.turningRadiusCenter!,
                ],
                color: Colors.blue,
              ),
              Polyline(
                points: [
                  vehicle.position,
                  vehicle.turningRadiusCenter!,
                ],
                color: Colors.green,
              ),
              Polyline(
                points: [
                  vehicle.pivotPosition,
                  vehicle.turningRadiusCenter!,
                ],
                color: Colors.black,
              ),
            ],
          ],
        ),
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
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Card(
              color: Theme.of(context).cardColor.withOpacity(0.5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => ref
                          ..invalidate(vehicleTravelledDistanceProvider)
                          ..invalidate(debugTravelledPathListProvider),
                        icon: const Icon(Icons.clear),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Travelled distance: ${ref.watch(vehicleTravelledDistanceProvider).toStringAsFixed(1)} m',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(Icons.speed),
                        ),
                        Text(
                          '${ref.watch(vehicleVelocityProvider).toStringAsFixed(1)} m/s',
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Heading: ${ref.watch(vehicleHeadingProvider).toStringAsFixed(1)} deg',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
