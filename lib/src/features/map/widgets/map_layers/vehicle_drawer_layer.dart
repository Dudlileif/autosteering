import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:autosteering/src/features/vehicle/widgets/painters/wheel_painter.dart';
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

    return Stack(
      children: [
        if (vehicle is AxleSteeredVehicle) ...[
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
          ),
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
          ),
        ] else if (vehicle is ArticulatedTractor) ...[
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
            ),
          ),
        ],
        OverlayImageLayer(
          overlayImages: switch (vehicle) {
            Tractor() => [
                RotatedOverlayImage(
                  topLeftCorner: vehicle.polygons.first.points.first,
                  bottomLeftCorner: vehicle.polygons.first.points.last,
                  bottomRightCorner: vehicle.polygons.first.points[2],
                  imageProvider: const AssetImage(
                    'assets/images/vehicle_types/top_view/Tractor.png',
                  ),
                ),
              ],
            Harvester() => [
                RotatedOverlayImage(
                  topLeftCorner: vehicle.polygons.first.points.first,
                  bottomLeftCorner: vehicle.polygons.first.points.last,
                  bottomRightCorner: vehicle.polygons.first.points[2],
                  imageProvider: const AssetImage(
                    'assets/images/vehicle_types/top_view/Harvester.png',
                  ),
                ),
              ],
            ArticulatedTractor() => [
                RotatedOverlayImage(
                  topLeftCorner: vehicle.pivotPosition.spherical
                      .destinationPoint(
                        distance: vehicle.trackWidth - 0.7,
                        bearing: vehicle.rearAxleAngle + 90,
                      )
                      .spherical
                      .destinationPoint(
                        distance: 0.5,
                        bearing: vehicle.rearAxleAngle + 180,
                      )
                      .latLng,
                  bottomLeftCorner: vehicle
                      .wheelPoints(rear: true)[1]
                      .spherical
                      .destinationPoint(
                        distance: 1,
                        bearing: vehicle.rearAxleAngle,
                      )
                      .latLng,
                  bottomRightCorner: vehicle
                      .wheelPoints(rear: true, left: false)[1]
                      .spherical
                      .destinationPoint(
                        distance: 1,
                        bearing: vehicle.rearAxleAngle,
                      )
                      .latLng,
                  imageProvider: const AssetImage(
                    'assets/images/vehicle_types/top_view/ArticulatedTractorRear.png',
                  ),
                ),
                RotatedOverlayImage(
                  topLeftCorner: vehicle
                      .wheelPoints()[2]
                      .spherical
                      .destinationPoint(
                        distance: 1.25,
                        bearing: vehicle.frontAxleAngle,
                      )
                      .latLng,
                  bottomLeftCorner: vehicle.pivotPosition.spherical
                      .destinationPoint(
                        distance: vehicle.trackWidth - 0.7,
                        bearing: vehicle.frontAxleAngle - 90,
                      )
                      .spherical
                      .destinationPoint(
                        distance: 0.5,
                        bearing: vehicle.frontAxleAngle + 180,
                      )
                      .latLng,
                  bottomRightCorner: vehicle.pivotPosition.spherical
                      .destinationPoint(
                        distance: vehicle.trackWidth - 0.7,
                        bearing: vehicle.frontAxleAngle + 90,
                      )
                      .spherical
                      .destinationPoint(
                        distance: 0.5,
                        bearing: vehicle.frontAxleAngle + 180,
                      )
                      .latLng,
                  imageProvider: const AssetImage(
                    'assets/images/vehicle_types/top_view/ArticulatedTractorFront.png',
                  ),
                ),
              ],
          },
        ),
      ],
    );
  }
}
