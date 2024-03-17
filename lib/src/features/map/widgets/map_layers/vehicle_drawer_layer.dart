import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

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
                  vehicle.steeringAxlePosition.rhumb.destinationPoint(
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
                  vehicle.steeringAxlePosition.rhumb.destinationPoint(
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
            innerPosition: vehicle.solidAxlePosition.rhumb.destinationPoint(
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
            innerPosition: vehicle.solidAxlePosition.rhumb.destinationPoint(
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
                      vehicle.frontAxlePosition.rhumb.destinationPoint(
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
                      vehicle.frontAxlePosition.rhumb.destinationPoint(
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
                      vehicle.rearAxlePosition.rhumb.destinationPoint(
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
                      vehicle.rearAxlePosition.rhumb.destinationPoint(
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
        ),
        if (vehicle is Tractor) ...[
          WheelPainter(
            innerPosition:
                vehicle.steeringAxlePosition.rhumb.destinationPoint(
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
                vehicle.steeringAxlePosition.rhumb.destinationPoint(
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

/// A dynamic vehicle painter for drawing a top-down view of a [Vehicle] in
/// the correct position and rotation on the [FlutterMap].
///
/// The method of rotating if copied from [RotatedOverlayImage] from
/// [FlutterMap], except that [MapCamera.latLngToScreenPoint] is used to get
/// the bounds points.
class MapVehicleTopDownPainter extends StatelessWidget {
  /// A dynamic vehicle painter for drawing a top-down view of a [Vehicle] in
  /// the correct position and rotation on the [FlutterMap].
  const MapVehicleTopDownPainter({
    required this.vehicle,
    super.key,
  });

  /// The vehicle to draw.
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);

    if (vehicle is! Tractor) {
      return const SizedBox.shrink();
    }

    final points = (vehicle as AxleSteeredVehicle).points;

    final pxTopLeft = camera.latLngToScreenPoint(points.first.latLng);
    final pxTopRight = camera.latLngToScreenPoint(points[1].latLng);
    final pxBottomRight = camera.latLngToScreenPoint(points[2].latLng);
    final pxBottomLeft = camera.latLngToScreenPoint(points[3].latLng);

    /// update/enlarge bounds so the new corner points fit within
    final bounds = Bounds<double>(pxTopLeft, pxBottomRight)
        .extend(pxTopRight)
        .extend(pxBottomLeft);

    final vectorX = (pxTopRight - pxTopLeft) / bounds.size.x;
    final vectorY = (pxBottomLeft - pxTopLeft) / bounds.size.y;
    final offset = pxTopLeft.subtract(bounds.topLeft);

    final a = vectorX.x;
    final b = vectorX.y;
    final c = vectorY.x;
    final d = vectorY.y;
    final tx = offset.x;
    final ty = offset.y;

    final axleLeftPosition = (vehicle as AxleSteeredVehicle)
        .steeringAxlePosition
        .rhumb
        .destinationPoint(
          distance: vehicle.width / 2,
          bearing: vehicle.bearing - 90,
        );
    final steeringAxleOffset =
        axleLeftPosition.rhumb.distanceTo(points.first) / vehicle.length;
    final steeringAxleWidth = vehicle.trackWidth / vehicle.width;

    return Positioned(
      left: bounds.topLeft.x,
      top: bounds.topLeft.y,
      width: bounds.size.x,
      height: bounds.size.y,
      child: Transform(
        transform: Matrix4(a, b, 0, 0, c, d, 0, 0, 0, 0, 1, 0, tx, ty, 0, 1),
        filterQuality: FilterQuality.low,
        child: VehicleTopDownPainter(
          type: switch (vehicle.runtimeType) {
            Tractor => 'Tractor',
            Harvester => 'Harvester',
            ArticulatedTractor => 'ArticulatedTractor',
            _ => 'Tractor',
          },
          colors: vehicle.manufacturerColors,
          stretch: true,
          steeringAxleOffset: steeringAxleOffset,
          steeringAxleWidth: steeringAxleWidth,
        ),
      ),
    );
  }
}
