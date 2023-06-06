import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the vehicle debugging features.
class VehicleDebugLayer extends ConsumerWidget {
  const VehicleDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debugTravelledPath = ref.watch(debugTravelledPathProvider);
    final debugTrajectory = ref.watch(debugTrajectoryProvider);
    final debugSteering = ref.watch(debugSteeringProvider);
    final debugPolygons = ref.watch(debugVehiclePolygonsProvider);

    final vehicle = ref.watch(mainVehicleProvider);
    final travelledPath = ref.watch(debugTravelledPathListProvider);

    return Stack(
      children: [
        if (debugTravelledPath || debugTrajectory || debugSteering)
          PolylineLayer(
            polylineCulling: true,
            polylines: [
              if (debugTravelledPath && travelledPath.isNotEmpty)
                Polyline(
                  points: travelledPath,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  color: Colors.orange,
                ),
              if (debugTrajectory)
                Polyline(
                  points: vehicle.trajectory.coordinates,
                  strokeWidth: 2,
                  color: Colors.red,
                ),
              if (vehicle.turningRadiusCenter != null && debugSteering)
                ...vehicle.steeringDebugLines,
            ],
          ),
        if (debugPolygons)
          PolygonLayer(
            polygonCulling: true,
            polygons: [
              ...vehicle.wheelPolygons,
              ...vehicle.polygons.map(
                (polygon) => polygon.copyWith(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
        if (debugSteering)
          CircleLayer(
            circles: [
              if (debugSteering) ...vehicle.steeringDebugMarkers,
              if (vehicle.currentTurningRadius != null)
                CircleMarker(
                  point: vehicle.turningRadiusCenter!,
                  radius: vehicle.currentTurningRadius!,
                  useRadiusInMeter: true,
                  color: Colors.blue.withOpacity(0.2),
                ),
              if (vehicle is ArticulatedTractor &&
                  vehicle.currentRearTurningRadius != null)
                CircleMarker(
                  point: vehicle.turningRadiusCenter!,
                  radius: vehicle.currentRearTurningRadius!,
                  useRadiusInMeter: true,
                  color: Colors.red.withOpacity(0.2),
                )
            ],
          ),
      ],
    );
  }
}
