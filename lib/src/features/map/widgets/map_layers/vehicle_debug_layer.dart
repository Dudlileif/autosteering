import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VehicleDebugLayer extends ConsumerWidget {
  const VehicleDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debugTravelledPath = ref.watch(debugTravelledPathProvider);
    final debugTrajectory = ref.watch(debugTrajectoryProvider);
    final debugSteering = ref.watch(debugSteeringProvider);

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
                  strokeWidth: 3,
                  strokeCap: StrokeCap.butt,
                  gradientColors: [
                    Colors.red.withOpacity(0.4),
                    Colors.green.withOpacity(0.4)
                  ],
                ),
              if (debugTrajectory)
                Polyline(
                  points: vehicle.trajectory.coordinates,
                  strokeWidth: 5,
                  color: Colors.red,
                ),
              if (vehicle.turningRadiusCenter != null && debugSteering)
                ...vehicle.steeringDebugLines,
            ],
          ),
        PolygonLayer(
          polygonCulling: true,
          polygons: [
            ...vehicle.wheelPolygons,
            ...vehicle.polygons,
          ],
        ),
        if (debugSteering)
          CircleLayer(
            circles: [
              if (debugSteering) ...vehicle.steeringDebugMarkers,
            ],
          ),
      ],
    );
  }
}
