import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for debugging the AB-line feature.
class ABLineDebugLayer extends ConsumerWidget {
  /// A combination layer for debugging the AB-line feature.
  const ABLineDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pointA = ref.watch(aBLinePointAProvider);
    final pointB = ref.watch(aBLinePointBProvider);

    final abLine = ref.watch(aBLineDebugProvider);

    return Stack(
      children: [
        if (abLine != null)
          PolylineLayer(
            polylines: [
              Polyline(points: [abLine.start, abLine.end]),
              Polyline(
                points: [
                  ref.watch(
                    mainVehicleProvider.select((vehicle) => vehicle.position),
                  ),
                  abLine
                      .closestPerpendicularIntersect(
                        ref.watch(
                          mainVehicleProvider
                              .select((vehicle) => vehicle.position),
                        ),
                      )
                      .latLng,
                ],
                color: Colors.red,
              )
            ],
          ),
        if (abLine != null || pointA != null || pointB != null)
          CircleLayer(
            circles: [
              if (pointA != null) CircleMarker(point: pointA, radius: 5),
              if (pointB != null) CircleMarker(point: pointB, radius: 5),
              if (abLine != null) ...[
                ...abLine
                    .pointsAheadOf(
                      point: ref.watch(
                        mainVehicleProvider
                            .select((vehicle) => vehicle.position),
                      ),
                      heading: ref.watch(
                        mainVehicleProvider
                            .select((vehicle) => vehicle.bearing),
                      ),
                      num: ref.watch(aBLineDebugNumPointsAheadProvider),
                      stepSize: ref.watch(aBLineDebugStepSizeProvider),
                    )
                    .map(
                      (point) => CircleMarker(point: point, radius: 3),
                    ),
                ...abLine
                    .pointsBehind(
                      point: ref.watch(
                        mainVehicleProvider
                            .select((vehicle) => vehicle.position),
                      ),
                      heading: ref.watch(
                        mainVehicleProvider
                            .select((vehicle) => vehicle.bearing),
                      ),
                      num: ref.watch(aBLineDebugNumPointsBehindProvider),
                      stepSize: ref.watch(aBLineDebugStepSizeProvider),
                    )
                    .map(
                      (point) => CircleMarker(point: point, radius: 3),
                    )
              ]
            ],
          ),
        if (abLine != null)
          Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Consumer(
                  builder: (context, ref, child) {
                    return Text(
                      abLine
                          .distanceToClosestLine(
                            ref.watch(
                              mainVehicleProvider
                                  .select((vehicle) => vehicle.position),
                            ),
                          )
                          .toStringAsFixed(3),
                    );
                  },
                ),
              ),
            ),
          )
      ],
    );
  }
}
