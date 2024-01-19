import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/field/providers/providers.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart' hide Polygon;

/// A mini [FlutterMap] for giving better oversight of either the vehicle
/// or the field that's being worked on.
///
/// The field can be locked onto with [miniMapLockToFieldProvider] so that the
/// map's bounds is the field's rotatable bounds.
class MiniMap extends ConsumerWidget {
  /// A mini [FlutterMap] for giving better oversight of either the vehicle
  /// or the field that's being worked on.
  ///
  /// The field can be locked onto with [miniMapLockToFieldProvider] so that the
  /// map's bounds is the field's rotatable bounds.
  const MiniMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.square(
      dimension: ref.watch(miniMapSizeProvider),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(width: 4),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: const Stack(
                children: [
                  _MiniMapView(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: _MiniMapAlwaysNorthButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MiniMapAlwaysNorthButton extends ConsumerWidget {
  const _MiniMapAlwaysNorthButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      isSelected: ref.watch(miniMapAlwaysPointNorthProvider),
      onPressed: ref.read(miniMapAlwaysPointNorthProvider.notifier).toggle,
      icon: Transform.rotate(
        angle: ref.watch(
          mainVehicleProvider.select((value) => -value.bearing.toRadians()),
        ),
        child: const Stack(
          children: [
            Icon(
              Icons.navigation_outlined,
              color: Colors.red,
            ),
            Positioned(
              left: 4,
              top: 4,
              child: Icon(
                Icons.navigation,
                size: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      selectedIcon: const Stack(
        children: [
          Icon(
            Icons.navigation_outlined,
            color: Colors.white,
          ),
          Positioned(
            left: 4,
            top: 4,
            child: Icon(
              Icons.navigation,
              size: 16,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniMapView extends ConsumerWidget {
  const _MiniMapView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapController = ref.watch(miniMapControllerProvider);

    ref.listen(
        mainVehicleProvider.select(
          (value) => (position: value.position, bearing: value.bearing),
        ), (previous, next) {
      if (!ref.watch(miniMapLockToFieldProvider) ||
          ref.watch(activeFieldProvider) == null) {
        mapController.moveAndRotate(
          next.position.latLng,
          mapController.camera.zoom,
          -next.bearing,
        );
      } else {
        mapController.rotate(-next.bearing);
      }
    });
    return FlutterMap(
      key: const Key('Field mini map'),
      
      mapController: mapController,
      options: MapOptions(
        backgroundColor:
            Theme.of(context).scaffoldBackgroundColor.withOpacity(0.65),
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.none,
        ),
        initialCenter: ref.read(
          mainVehicleProvider.select((value) => value.position.latLng),
        ),
        initialRotation: ref.read(
          mainVehicleProvider.select((value) => -value.bearing),
        ),
        initialZoom: 15,
        onMapReady: ref.read(miniMapReadyProvider.notifier).ready,
        onMapEvent: (event) {
          if (event is MapEventScrollWheelZoom) {
            mapController.move(
              event.camera.center,
              event.camera.zoom,
            );
          }

          // Force map to not allow rotation when it should always
          // point north.
          if (ref.watch(miniMapAlwaysPointNorthProvider) &&
              event is MapEventRotate) {
            if (event.camera.rotation != 0) {
              mapController.rotate(0);
            }
          }
        },
      ),
      children: [
        if (ref.watch(showOSMLayerProvider))
          const Opacity(opacity: 0.65, child: OSMLayer()),
        if (ref.watch(showCountryLayersProvider))
          const Opacity(opacity: 0.65, child: CountryLayers()),
        if (ref.watch(showSentinelLayersProvider))
          const Opacity(opacity: 0.65, child: SentinelLayers()),
        const FieldLayer(),
        MarkerLayer(
          markers: [
            Marker(
              point: ref.watch(
                mainVehicleProvider.select((value) => value.position.latLng),
              ),
              child: Transform.rotate(
                angle: ref.watch(
                  mainVehicleProvider
                      .select((value) => value.bearing.toRadians()),
                ),
                child: const Icon(
                  Icons.navigation,
                  color: Colors.white,
                  shadows: [
                    Shadow(offset: Offset(2, 2), blurRadius: 0.5),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
