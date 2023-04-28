// import 'package:agopengps_flutter/src/features/gamepad/gamepad.dart';

import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

class MapView extends ConsumerStatefulWidget {
  const MapView({super.key});

  @override
  ConsumerState<MapView> createState() => _MapViewState();
}

class _MapViewState extends ConsumerState<MapView> {
  final points = <LatLng>[];

  @override
  Widget build(BuildContext context) {
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
          // should be centered on the vehicle.
          if (ref.watch(centerMapOnVehicleProvider) &&
              event is MapEventScrollWheelZoom) {
            ref
                .read(mainMapControllerProvider)
                .move(event.center, event.targetZoom);
          }
        },
        onTap: (tapPosition, point) {
          ScaffoldMessenger.maybeOf(context)
              ?.showSnackBar(SnackBar(content: Text('${point.toJson()}')));
          setState(() => points.add(point));
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
        if (ref.watch(useOSMLayerProvider)) const OSMLayer(),
        const CountryLayers(),
        const SentinelLayers(),
        PolygonLayer(
          polygonCulling: true,
          polygons: [
            // vehicle.polygon,
            vehicle.rightFrontWheelPolygon,
            vehicle.leftFrontWheelPolygon,
          ],
        ),
        OverlayImageLayer(
          overlayImages: [
            RotatedOverlayImage(
              imageProvider: Image.asset(
                'assets/images/TractorMassey.png',
              ).image,
              topLeftCorner: vehicle.points[0],
              bottomLeftCorner: vehicle.points[3],
              bottomRightCorner: vehicle.points[2],
            ),
          ],
        ),
        PolylineLayer(
          polylineCulling: true,
          polylines: [
            Polyline(
              points: vehicle.trajectory.coordinates,
              strokeWidth: 5,
              color: Colors.blue,
            ),
            Polyline(
              points: points,
              strokeWidth: 10,
            )
          ],
        )
      ],
    );

    return Stack(
      children: [
        map,
        const Align(
          alignment: Alignment.topRight,
          child: MapPositionAndZoomButtons(),
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
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    onPressed: () => setState(points.clear),
                    child: const Icon(Icons.clear),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Distance: ${test()} m'),
                        // Text('Speed: ${(speed * 3.6).toStringAsFixed(1)} km/h')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  double test() {
    final path = Path()..addAll(points);
    return path.distance;
  }
}
