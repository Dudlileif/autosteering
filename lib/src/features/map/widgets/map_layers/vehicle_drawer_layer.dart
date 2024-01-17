import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';

/// A layer for drawing the image/model of the vehicle on the map.
class VehicleDrawerLayer extends ConsumerWidget {
  /// A layer for drawing the image/model of the vehicle on the map.
  const VehicleDrawerLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(mainVehicleProvider);
    final centerMapOnVehicle = ref.watch(centerMapOnVehicleProvider);

    return Stack(
      children: [
        if (vehicle is AxleSteeredVehicle) ...[
          if (vehicle is Harvester) ...[
            WheelPainter(
              innerPosition:
                  vehicle.steeringAxlePosition.spherical.destinationPoint(
                distance:
                    vehicle.trackWidth / 2 - vehicle.steeringAxleWheelWidth / 2,
                bearing: vehicle.bearing - 90,
              ),
              vehicleBearing: vehicle.bearing,
              steeringAngle: vehicle.leftSteeringWheelAngle,
              width: vehicle.steeringAxleWheelWidth,
              diameter: vehicle.steeringAxleWheelDiameter,
              rotation: vehicle.wheelsRolledDistance /
                  (vehicle.steeringAxleWheelDiameter * pi) %
                  1,
              centerMapOnVehicle: centerMapOnVehicle,
            ),
            WheelPainter(
              innerPosition:
                  vehicle.steeringAxlePosition.spherical.destinationPoint(
                distance:
                    vehicle.trackWidth / 2 - vehicle.steeringAxleWheelWidth / 2,
                bearing: vehicle.bearing + 90,
              ),
              vehicleBearing: vehicle.bearing,
              steeringAngle: vehicle.rightSteeringWheelAngle,
              width: vehicle.steeringAxleWheelWidth,
              diameter: vehicle.steeringAxleWheelDiameter,
              rotation: vehicle.wheelsRolledDistance /
                  (vehicle.steeringAxleWheelDiameter * pi) %
                  1,
              isRightWheel: true,
              centerMapOnVehicle: centerMapOnVehicle,
            ),
          ],
          WheelPainter(
            innerPosition: vehicle.solidAxlePosition.spherical.destinationPoint(
              distance:
                  vehicle.trackWidth / 2 - vehicle.solidAxleWheelWidth / 2,
              bearing: vehicle.bearing - 90,
            ),
            vehicleBearing: vehicle.bearing,
            width: vehicle.solidAxleWheelWidth,
            rotation: vehicle.wheelsRolledDistance /
                (vehicle.solidAxleWheelDiameter * pi) %
                1,
            diameter: vehicle.solidAxleWheelDiameter,
            centerMapOnVehicle: centerMapOnVehicle,
          ),
          WheelPainter(
            innerPosition: vehicle.solidAxlePosition.spherical.destinationPoint(
              distance:
                  vehicle.trackWidth / 2 - vehicle.solidAxleWheelWidth / 2,
              bearing: vehicle.bearing + 90,
            ),
            vehicleBearing: vehicle.bearing,
            width: vehicle.solidAxleWheelWidth,
            diameter: vehicle.solidAxleWheelDiameter,
            rotation: vehicle.wheelsRolledDistance /
                (vehicle.solidAxleWheelDiameter * pi) %
                1,
            isRightWheel: true,
            centerMapOnVehicle: centerMapOnVehicle,
          ),
        ] else if (vehicle is ArticulatedTractor)
          Stack(
            children: [
          ...List.generate(
            vehicle.numWheels,
            (index) => WheelPainter(
              innerPosition:
                  vehicle.frontAxlePosition.spherical.destinationPoint(
                distance: vehicle.trackWidth / 2 -
                    vehicle.wheelWidth / 2 +
                    index * (vehicle.wheelWidth + vehicle.wheelSpacing),
                bearing: vehicle.frontAxleAngle - 90,
              ),
              vehicleBearing: vehicle.frontAxleAngle,
              width: vehicle.wheelWidth,
              diameter: vehicle.wheelDiameter,
              rotation: vehicle.wheelsRolledDistance /
                  (vehicle.wheelDiameter * pi) %
                  1,
                  centerMapOnVehicle: centerMapOnVehicle,
                  vehicleIsArticulated: true,
            ),
          ),
          ...List.generate(
            vehicle.numWheels,
            (index) => WheelPainter(
              innerPosition:
                  vehicle.frontAxlePosition.spherical.destinationPoint(
                distance: vehicle.trackWidth / 2 -
                    vehicle.wheelWidth / 2 +
                    index * (vehicle.wheelWidth + vehicle.wheelSpacing),
                bearing: vehicle.frontAxleAngle + 90,
              ),
              vehicleBearing: vehicle.frontAxleAngle,
              width: vehicle.wheelWidth,
              diameter: vehicle.wheelDiameter,
              rotation: vehicle.wheelsRolledDistance /
                  (vehicle.wheelDiameter * pi) %
                  1,
              isRightWheel: true,
                  centerMapOnVehicle: centerMapOnVehicle,
                  vehicleIsArticulated: true,
            ),
          ),
          ...List.generate(
            vehicle.numWheels,
            (index) => WheelPainter(
              innerPosition:
                  vehicle.rearAxlePosition.spherical.destinationPoint(
                distance: vehicle.trackWidth / 2 -
                    vehicle.wheelWidth / 2 +
                    index * (vehicle.wheelWidth + vehicle.wheelSpacing),
                bearing: vehicle.rearAxleAngle - 90 + 180,
              ),
              vehicleBearing: vehicle.rearAxleAngle + 180,
              width: vehicle.wheelWidth,
              diameter: vehicle.wheelDiameter,
              rotation: vehicle.wheelsRolledDistance /
                  (vehicle.wheelDiameter * pi) %
                  1,
                  centerMapOnVehicle: centerMapOnVehicle,
                  vehicleIsArticulated: true,
            ),
          ),
          ...List.generate(
            vehicle.numWheels,
            (index) => WheelPainter(
              innerPosition:
                  vehicle.rearAxlePosition.spherical.destinationPoint(
                distance: vehicle.trackWidth / 2 -
                    vehicle.wheelWidth / 2 +
                    index * (vehicle.wheelWidth + vehicle.wheelSpacing),
                bearing: vehicle.rearAxleAngle + 90 + 180,
              ),
              vehicleBearing: vehicle.rearAxleAngle + 180,
              width: vehicle.wheelWidth,
              diameter: vehicle.wheelDiameter,
              rotation: vehicle.wheelsRolledDistance /
                  (vehicle.wheelDiameter * pi) %
                  1,
              isRightWheel: true,
                  centerMapOnVehicle: centerMapOnVehicle,
                  vehicleIsArticulated: true,
            ),
              ),
            ],
          ),
        MapVehicleTopDownPainter(
          vehicle: vehicle,
          colors: ref.watch(manufacturerProvider),
        ),
        if (vehicle is Tractor) ...[
          WheelPainter(
            innerPosition:
                vehicle.steeringAxlePosition.spherical.destinationPoint(
              distance:
                  vehicle.trackWidth / 2 - vehicle.steeringAxleWheelWidth / 2,
              bearing: vehicle.bearing - 90,
            ),
            vehicleBearing: vehicle.bearing,
            steeringAngle: vehicle.leftSteeringWheelAngle,
            width: vehicle.steeringAxleWheelWidth,
            diameter: vehicle.steeringAxleWheelDiameter,
            rotation: vehicle.wheelsRolledDistance /
                (vehicle.steeringAxleWheelDiameter * pi) %
                1,
            centerMapOnVehicle: centerMapOnVehicle,
          ),
          WheelPainter(
            innerPosition:
                vehicle.steeringAxlePosition.spherical.destinationPoint(
              distance:
                  vehicle.trackWidth / 2 - vehicle.steeringAxleWheelWidth / 2,
              bearing: vehicle.bearing + 90,
            ),
            vehicleBearing: vehicle.bearing,
            steeringAngle: vehicle.rightSteeringWheelAngle,
            width: vehicle.steeringAxleWheelWidth,
            diameter: vehicle.steeringAxleWheelDiameter,
            rotation: vehicle.wheelsRolledDistance /
                (vehicle.steeringAxleWheelDiameter * pi) %
                1,
            isRightWheel: true,
            centerMapOnVehicle: centerMapOnVehicle,
          ),
        ],
        CircleLayer(
          circles: [
            CircleMarker(
              point: vehicle.correctedAntennaPosition.latLng,
              radius: 0.1,
              useRadiusInMeter: true,
              color: Colors.white,
              borderStrokeWidth: 0.03,
              borderColor: Colors.black,
            ),
          ],
        ),
      ],
    );
  }
}
