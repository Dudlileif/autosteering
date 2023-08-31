import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
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

    return OverlayImageLayer(
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
            RotatedOverlayImage(
              topLeftCorner: vehicle.wheelPoints()[2].latLng,
              bottomLeftCorner: vehicle.wheelPoints()[1].latLng,
              bottomRightCorner: vehicle.wheelPoints().first.latLng,
              imageProvider:
                  const AssetImage('assets/images/wheels/FrontWheel.png'),
            ),
            RotatedOverlayImage(
              topLeftCorner: vehicle.wheelPoints(left: false).last.latLng,
              bottomLeftCorner: vehicle.wheelPoints(left: false)[0].latLng,
              bottomRightCorner: vehicle.wheelPoints(left: false)[1].latLng,
              imageProvider:
                  const AssetImage('assets/images/wheels/FrontWheel.png'),
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
            RotatedOverlayImage(
              topLeftCorner: vehicle.wheelPoints()[2].latLng,
              bottomLeftCorner: vehicle.wheelPoints()[1].latLng,
              bottomRightCorner: vehicle.wheelPoints().first.latLng,
              imageProvider:
                  const AssetImage('assets/images/wheels/FrontWheel.png'),
            ),
            RotatedOverlayImage(
              topLeftCorner: vehicle.wheelPoints(left: false).last.latLng,
              bottomLeftCorner: vehicle.wheelPoints(left: false)[0].latLng,
              bottomRightCorner: vehicle.wheelPoints(left: false)[1].latLng,
              imageProvider:
                  const AssetImage('assets/images/wheels/FrontWheel.png'),
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
    );
  }
}
