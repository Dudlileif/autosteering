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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      ),

      // Only the last layer can be user interactive due to using Stack
      // widgets in the previous layers.
      children: [
        if (ref.watch(showOSMLayerProvider)) const OSMLayer(),
        if (ref.watch(showCountryLayersProvider)) const CountryLayers(),
        if (ref.watch(showSentinelLayersProvider)) const SentinelLayers(),
        if (ref.watch(showGridLayerProvider)) const GridLayer(),
        if (ref.watch(showFieldLayerProvider)) const FieldLayer(),
        if (ref.watch(showFinishedPathLayerProvider)) const FinishedPathLayer(),
        const EquipmentWorkedPathsLayer(),
        if (ref.watch(showVehicleDrawingLayerProvider))
          const VehicleDrawerLayer(),
        if (ref.watch(showEquipmentDrawingLayerProvider))
          const EquipmentDrawerLayer(),
        if (ref.watch(showPathRecordingLayerProvider))
          const PathRecordingLayer(),
        if (ref.watch(showVehicleDebugLayerProvider)) const VehicleDebugLayer(),
        if (ref.watch(showEquipmentDebugLayerProvider))
          const EquipmentDebugLayer(),
        if (ref.watch(showPathTrackingLayerProvider)) const PathTrackingLayer(),
        if (ref.watch(showEditablePathLayerProvider)) const EditablePathLayer(),
        if (ref.watch(showDubinsPathDebugLayerProvider))
          const DubinsPathDebugLayer(),
        if (ref.watch(showABTrackingLayerProvider)) const ABTrackingLayer(),
        if (ref.watch(showSelectablePathLayerProvider))
          SelectablePathLayer(
            highlightSelectedPath: ref.watch(
              currentABTrackingTypeProvider
                  .select((value) => value == ABTrackingType.abCurve),
            ),
            showStraightLine: ref.watch(
              currentABTrackingTypeProvider
                  .select((value) => value != ABTrackingType.abCurve),
            ),
          ),
        if (ref.watch(virtualLedBarTestingProvider))
          const VirtualLedBarTestLayer(),
      ],
    );
  }
}
