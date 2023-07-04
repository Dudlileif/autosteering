import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for debugging a Dubins path between two points.
class DubinsPathDebugLayer extends ConsumerWidget {
  const DubinsPathDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dubinsPath = ref.watch(debugDubinsPathProvider);

    if (dubinsPath != null) {
      final pathType = ref.watch(dubinsPathDebugPathTypeProvider) ??
          dubinsPath.bestPathData?.pathType;
      if (pathType != null) {
        if (dubinsPath.isPathTypePossible(pathType)) {
          final showTurningCricles =
              ref.watch(showDubinsPathDebugCirclesProvider);
          final minTurningRadius = ref.watch(
            mainVehicleProvider.select((vehicle) => vehicle.minTurningRadius),
          );
          final wayPoints = dubinsPath
              .dubinsPathPlan(
                pathType,
              )!
              .wayPoints!;

          return Stack(
            children: [
              CircleLayer(
                circles: [
                  if (showTurningCricles) ...[
                    CircleMarker(
                      point: dubinsPath.startRightCircleCenter,
                      radius: minTurningRadius,
                      useRadiusInMeter: true,
                      color: Colors.pink.withOpacity(0.3),
                    ),
                    CircleMarker(
                      point: dubinsPath.startLeftCircleCenter,
                      radius: minTurningRadius,
                      useRadiusInMeter: true,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    CircleMarker(
                      point: dubinsPath.endLeftCircleCenter,
                      radius: minTurningRadius,
                      useRadiusInMeter: true,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    CircleMarker(
                      point: dubinsPath.endRightCircleCenter,
                      radius: minTurningRadius,
                      useRadiusInMeter: true,
                      color: Colors.pink.withOpacity(0.3),
                    ),
                    if ([DubinsPathType.lrl, DubinsPathType.rlr]
                        .contains(pathType))
                      CircleMarker(
                        point:
                            dubinsPath.pathData(pathType)!.middleCircleCenter!,
                        radius: minTurningRadius,
                        useRadiusInMeter: true,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                  ],
                  ...wayPoints
                      .map((e) => CircleMarker(point: e.position, radius: 5)),
                  CircleMarker(
                    point: dubinsPath.pathData(pathType)!.tangentStart.position,
                    radius: 3,
                    color: Colors.black,
                  ),
                  CircleMarker(
                    point: dubinsPath.pathData(pathType)!.tangentEnd.position,
                    radius: 3,
                    color: Colors.black,
                  ),
                ],
              ),
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: [
                      dubinsPath.start.position,
                      dubinsPath.start.position.offset(
                        2,
                        dubinsPath.start.heading,
                      )
                    ],
                    color: Colors.blue,
                    strokeWidth: 5,
                  ),
                  Polyline(
                    points: [
                      dubinsPath.end.position,
                      dubinsPath.end.position.offset(
                        2,
                        dubinsPath.end.heading,
                      )
                    ],
                    color: Colors.red,
                    strokeWidth: 5,
                  ),
                  ...wayPoints.map(
                    (e) => Polyline(
                      points: [e.position, e.position.offset(0.5, e.heading)],
                      strokeWidth: 2,
                    ),
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: dubinsPath.start.position,
                    builder: (context) => MovableMapMarker(
                      point: dubinsPath.start.position,
                      onMoved: (position) => ref
                          .read(dubinsPathDebugStartPointProvider.notifier)
                          .update(
                            dubinsPath.start.copyWith(position: position),
                          ),
                      radius: 5,
                      color: Colors.blue,
                    ),
                  ),
                  Marker(
                    point: dubinsPath.end.position,
                    builder: (context) => MovableMapMarker(
                      point: dubinsPath.end.position,
                      onMoved: (position) => ref
                          .read(dubinsPathDebugEndPointProvider.notifier)
                          .update(dubinsPath.end.copyWith(position: position)),
                      radius: 5,
                      color: Colors.red,
                    ),
                  ),
                ],
              )
            ],
          );
        }
      }
    }

    final start = ref.watch(dubinsPathDebugStartPointProvider);
    final end = ref.watch(dubinsPathDebugEndPointProvider);

    return Stack(
      children: [
        MarkerLayer(
          markers: [
            if (start != null)
              Marker(
                point: start.position,
                builder: (context) => MovableMapMarker(
                  point: start.position,
                  onMoved: (position) => ref
                      .read(dubinsPathDebugStartPointProvider.notifier)
                      .update(start.copyWith(position: position)),
                  radius: 5,
                  color: Colors.blue,
                ),
              ),
            if (end != null)
              Marker(
                point: end.position,
                builder: (context) => MovableMapMarker(
                  point: end.position,
                  onMoved: (position) => ref
                      .read(dubinsPathDebugEndPointProvider.notifier)
                      .update(end.copyWith(position: position)),
                  radius: 5,
                  color: Colors.red,
                ),
              ),
          ],
        )
      ],
    );
  }
}
