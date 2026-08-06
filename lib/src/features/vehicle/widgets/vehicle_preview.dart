// Copyright (C) 2026 Gaute Hagen
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

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/gnss/gnss.dart'
    show GnssAntennaConfig;
import 'package:autosteering/src/features/map/map.dart'
    show MapVehicleTopDownPainter;
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart' hide Polygon;

/// A map preview of the currently configured vehicle.
class VehiclePreview extends ConsumerStatefulWidget {
  /// A map preview of the currently configured vehicle.
  VehiclePreview({
    required Vehicle vehicle,
    super.key,
  }) : vehicle = vehicle.copyWith(
         antennaPosition: const Geographic(lat: 0, lon: 0),
         bearing: 0,
       );

  /// The vehicle for preview.
  final Vehicle vehicle;

  @override
  ConsumerState<VehiclePreview> createState() => _VehiclePreviewState();
}

class _VehiclePreviewState extends ConsumerState<VehiclePreview> {
  final mapController = MapController();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    final vehicle = widget.vehicle;

    final bounds = vehicle.polygons.isNotEmpty
        ? LatLngBounds.fromPoints(
            [
              vehicle.polygons
                  .map(
                    (p) => [p.boundingBox.northWest, p.boundingBox.southEast],
                  )
                  .flattenedToList,
              vehicle.connectors.map((c) => c.position(vehicle).latLng),
              vehicle.wheelPolygons.map((p) => p.points).flattened,
            ].flattenedToList,
          )
        : LatLngBounds(
            const Geographic(
              lat: 0,
              lon: 0,
            ).spherical.destinationPoint(distance: 3, bearing: 45).latLng,
            const Geographic(
              lat: 0,
              lon: 0,
            ).spherical.destinationPoint(distance: 3, bearing: 225).latLng,
          );

    final configuratorIndex = ref.watch(vehicleConfiguratorIndexProvider);

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        backgroundColor: Colors.transparent,
        initialCameraFit: .bounds(bounds: bounds, padding: const .all(16)),
        interactionOptions: const InteractionOptions(
          flags:
              InteractiveFlag.pinchZoom |
              InteractiveFlag.doubleTapZoom |
              InteractiveFlag.scrollWheelZoom |
              InteractiveFlag.drag,
        ),
      ),
      children: [
        if (vehicle is AxleSteeredVehicle) ...[
          if (vehicle is Harvester) ...[
            WheelPainter(
              innerPosition: vehicle.steeringAxlePosition.rhumb
                  .destinationPoint(
                    distance:
                        vehicle.geometry.trackWidth / 2 -
                        vehicle.geometry.steeringAxleWheelWidth / 2,
                    bearing: vehicle.bearing - 90,
                  ),
              vehicleBearing: vehicle.bearing,
              steeringAngle: vehicle.leftSteeringWheelAngle,
              width: vehicle.geometry.steeringAxleWheelWidth,
              diameter: vehicle.geometry.steeringAxleWheelDiameter,
              numWheels: vehicle.geometry.numWheels,
              wheelSpacing: vehicle.geometry.wheelSpacing,
            ),
            WheelPainter(
              innerPosition: vehicle.steeringAxlePosition.rhumb
                  .destinationPoint(
                    distance:
                        vehicle.geometry.trackWidth / 2 -
                        vehicle.geometry.steeringAxleWheelWidth / 2,
                    bearing: vehicle.bearing + 90,
                  ),
              vehicleBearing: vehicle.bearing,
              steeringAngle: vehicle.rightSteeringWheelAngle,
              width: vehicle.geometry.steeringAxleWheelWidth,
              diameter: vehicle.geometry.steeringAxleWheelDiameter,
              isRightWheel: true,
              numWheels: vehicle.geometry.numWheels,
              wheelSpacing: vehicle.geometry.wheelSpacing,
            ),
          ],
          WheelPainter(
            innerPosition: vehicle.solidAxlePosition.rhumb.destinationPoint(
              distance:
                  vehicle.geometry.trackWidth / 2 -
                  vehicle.geometry.solidAxleWheelWidth / 2,
              bearing: vehicle.bearing - 90,
            ),
            vehicleBearing: vehicle.bearing,
            width: vehicle.geometry.solidAxleWheelWidth,
            diameter: vehicle.geometry.solidAxleWheelDiameter,
            numWheels: vehicle.geometry.numWheels,
            wheelSpacing: vehicle.geometry.wheelSpacing,
          ),
          WheelPainter(
            innerPosition: vehicle.solidAxlePosition.rhumb.destinationPoint(
              distance:
                  vehicle.geometry.trackWidth / 2 -
                  vehicle.geometry.solidAxleWheelWidth / 2,
              bearing: vehicle.bearing + 90,
            ),
            vehicleBearing: vehicle.bearing,
            width: vehicle.geometry.solidAxleWheelWidth,
            diameter: vehicle.geometry.solidAxleWheelDiameter,
            isRightWheel: true,
            numWheels: vehicle.geometry.numWheels,
            wheelSpacing: vehicle.geometry.wheelSpacing,
          ),
        ] else if (vehicle is ArticulatedTractor)
          Stack(
            children: [
              WheelPainter(
                innerPosition: vehicle.frontAxlePosition.rhumb.destinationPoint(
                  distance:
                      vehicle.geometry.trackWidth / 2 -
                      vehicle.geometry.wheelWidth / 2,
                  bearing: vehicle.frontAxleAngle - 90,
                ),
                vehicleBearing: vehicle.frontAxleAngle,
                width: vehicle.geometry.wheelWidth,
                diameter: vehicle.geometry.wheelDiameter,
                vehicleIsArticulated: true,
                numWheels: vehicle.geometry.numWheels,
                wheelSpacing: vehicle.geometry.wheelSpacing,
              ),
              WheelPainter(
                innerPosition: vehicle.frontAxlePosition.rhumb.destinationPoint(
                  distance:
                      vehicle.geometry.trackWidth / 2 -
                      vehicle.geometry.wheelWidth / 2,
                  bearing: vehicle.frontAxleAngle + 90,
                ),
                vehicleBearing: vehicle.frontAxleAngle,
                width: vehicle.geometry.wheelWidth,
                diameter: vehicle.geometry.wheelDiameter,
                isRightWheel: true,
                vehicleIsArticulated: true,
                numWheels: vehicle.geometry.numWheels,
                wheelSpacing: vehicle.geometry.wheelSpacing,
              ),
              WheelPainter(
                innerPosition: vehicle.rearAxlePosition.rhumb.destinationPoint(
                  distance:
                      vehicle.geometry.trackWidth / 2 -
                      vehicle.geometry.wheelWidth / 2,
                  bearing: vehicle.rearAxleAngle - 90 + 180,
                ),
                vehicleBearing: vehicle.rearAxleAngle + 180,
                width: vehicle.geometry.wheelWidth,
                diameter: vehicle.geometry.wheelDiameter,
                vehicleIsArticulated: true,
                numWheels: vehicle.geometry.numWheels,
                wheelSpacing: vehicle.geometry.wheelSpacing,
              ),
              WheelPainter(
                innerPosition: vehicle.rearAxlePosition.rhumb.destinationPoint(
                  distance:
                      vehicle.geometry.trackWidth / 2 -
                      vehicle.geometry.wheelWidth / 2,
                  bearing: vehicle.rearAxleAngle + 90 + 180,
                ),
                vehicleBearing: vehicle.rearAxleAngle + 180,
                width: vehicle.geometry.wheelWidth,
                diameter: vehicle.geometry.wheelDiameter,
                isRightWheel: true,
                vehicleIsArticulated: true,
                numWheels: vehicle.geometry.numWheels,
                wheelSpacing: vehicle.geometry.wheelSpacing,
              ),
            ],
          ),
        MapVehicleTopDownPainter(vehicle: vehicle),
        if (vehicle is Tractor) ...[
          WheelPainter(
            innerPosition: vehicle.steeringAxlePosition.rhumb.destinationPoint(
              distance:
                  vehicle.geometry.trackWidth / 2 -
                  vehicle.geometry.steeringAxleWheelWidth / 2,
              bearing: vehicle.bearing - 90,
            ),
            vehicleBearing: vehicle.bearing,
            steeringAngle: vehicle.leftSteeringWheelAngle,
            width: vehicle.geometry.steeringAxleWheelWidth,
            diameter: vehicle.geometry.steeringAxleWheelDiameter,
            numWheels: vehicle.geometry.numWheels,
            wheelSpacing: vehicle.geometry.wheelSpacing,
          ),
          WheelPainter(
            innerPosition: vehicle.steeringAxlePosition.rhumb.destinationPoint(
              distance:
                  vehicle.geometry.trackWidth / 2 -
                  vehicle.geometry.steeringAxleWheelWidth / 2,
              bearing: vehicle.bearing + 90,
            ),
            vehicleBearing: vehicle.bearing,
            steeringAngle: vehicle.rightSteeringWheelAngle,
            width: vehicle.geometry.steeringAxleWheelWidth,
            diameter: vehicle.geometry.steeringAxleWheelDiameter,
            isRightWheel: true,
            numWheels: vehicle.geometry.numWheels,
            wheelSpacing: vehicle.geometry.wheelSpacing,
          ),
        ],
        MarkerLayer(
          markers: [
            Marker(
              point: switch (vehicle) {
                AxleSteeredVehicle(:final solidAxlePosition) =>
                  solidAxlePosition.latLng,
                ArticulatedTractor(:final pivotPosition) =>
                  pivotPosition.latLng,
              },
              alignment: .center,
              child: Material(
                type: .circle,
                elevation: 2,
                color: Colors.redAccent.shade700,
                child: Center(
                  child: Text(
                    'Ref',
                    textAlign: .center,
                    style: textTheme.labelSmall?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            if (configuratorIndex == 2) ...[
              Marker(
                point: vehicle.antennaPosition.latLng,
                rotate: true,
                child: const Material(
                  type: .circle,
                  elevation: 4,
                  color: Colors.yellowAccent,
                  child: Icon(
                    Icons.settings_input_antenna,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              if (vehicle.gnssAntennaConfig case GnssAntennaConfig(
                :final useDualHeading,
                :final useDualRoll,
              ) when useDualHeading || useDualRoll)
                Marker(
                  point: vehicle.secondaryAntennaPosition!.latLng,
                  child: const Material(
                    type: .circle,
                    elevation: 4,
                    color: Colors.purpleAccent,
                    child: Icon(
                      Icons.settings_input_antenna,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
            if (configuratorIndex == 5)
              ...vehicle.connectors.mapIndexed(
                (index, connector) => Marker(
                  point: connector.position(vehicle).latLng,
                  alignment: .center,
                  child: Material(
                    type: .circle,
                    elevation: 4,
                    color: switch (connector.type) {
                      .fixed => Colors.blueAccent,
                      .drawbar => Colors.orangeAccent,
                    },
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        textAlign: .center,
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Align(
          alignment: .topLeft,
          child: Padding(
            padding: const .only(left: 8),
            child: IconButton(
              onPressed: () => mapController.fitCamera(
                .bounds(bounds: bounds, padding: const .all(16)),
              ),
              icon: const Icon(Icons.fit_screen),
            ),
          ),
        ),
      ],
    );
  }
}
