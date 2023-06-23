import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A layer for drawing the image/model of the vehicle on the map.
class VehicleDrawerLayer extends ConsumerWidget {
  const VehicleDrawerLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicle = ref.watch(mainVehicleProvider);

    return Stack(
      children: [
        if (vehicle is Tractor) ...[
          OverlayImageLayer(
            overlayImages: [
              RotatedOverlayImage(
                topLeftCorner: vehicle.polygons.first.points.first,
                bottomLeftCorner: vehicle.polygons.first.points.last,
                bottomRightCorner: vehicle.polygons.first.points[2],
                imageProvider: const AssetImage('assets/images/Tractor.png'),
              ),
              RotatedOverlayImage(
                topLeftCorner: vehicle.wheelPoints()[2],
                bottomLeftCorner: vehicle.wheelPoints()[1],
                bottomRightCorner: vehicle.wheelPoints().first,
                imageProvider: const AssetImage('assets/images/FrontWheel.png'),
              ),
              RotatedOverlayImage(
                topLeftCorner: vehicle.wheelPoints(left: false).last,
                bottomLeftCorner: vehicle.wheelPoints(left: false)[0],
                bottomRightCorner: vehicle.wheelPoints(left: false)[1],
                imageProvider: const AssetImage('assets/images/FrontWheel.png'),
              )
            ],
          ),
        ] else if (vehicle is Harvester)
          OverlayImageLayer(
            overlayImages: [
              RotatedOverlayImage(
                topLeftCorner: vehicle.polygons.first.points.first,
                bottomLeftCorner: vehicle.polygons.first.points.last,
                bottomRightCorner: vehicle.polygons.first.points[2],
                imageProvider: const AssetImage('assets/images/Harvester.png'),
              )
            ],
          )
        else if (vehicle is ArticulatedTractor) ...[
          OverlayImageLayer(
            overlayImages: [
              RotatedOverlayImage(
                topLeftCorner: vehicle.pivotPosition
                    .offset(
                      vehicle.trackWidth - 0.7,
                      vehicle.rearAxleAngle + 90,
                    )
                    .offset(0.5, vehicle.rearAxleAngle + 180),
                bottomLeftCorner: vehicle.wheelPoints(rear: true)[1].offset(
                      1,
                      vehicle.rearAxleAngle,
                    ),
                bottomRightCorner:
                    vehicle.wheelPoints(rear: true, left: false)[1].offset(
                          1,
                          vehicle.rearAxleAngle,
                        ),
                imageProvider: const AssetImage(
                  'assets/images/ArticulatedTractorRear.png',
                ),
              ),
              RotatedOverlayImage(
                topLeftCorner: vehicle.wheelPoints()[2].offset(
                      1.25,
                      vehicle.frontAxleAngle,
                    ),
                bottomLeftCorner: vehicle.pivotPosition
                    .offset(
                      vehicle.trackWidth - 0.7,
                      vehicle.frontAxleAngle - 90,
                    )
                    .offset(0.5, vehicle.frontAxleAngle + 180),
                bottomRightCorner: vehicle.pivotPosition
                    .offset(
                      vehicle.trackWidth - 0.7,
                      vehicle.frontAxleAngle + 90,
                    )
                    .offset(0.5, vehicle.frontAxleAngle + 180),
                imageProvider: const AssetImage(
                  'assets/images/ArticulatedTractorFront.png',
                ),
              )
            ],
          ),
        ],
      ],
    );
  }
}
