import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
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

    final autoSteerEnabled = ref.watch(autoSteerEnabledProvider);

    final abLine = switch (autoSteerEnabled) {
      true => ref.watch(displayABLineProvider),
      false => ref.watch(aBLineDebugProvider)
    };

    final lookAheadDistance = ref.watch(effectiveLookAheadDistanceProvider);

    final vehicle = ref.watch(mainVehicleProvider);

    return Stack(
      children: [
        if (abLine != null)
          PolylineLayer(
            polylines: [
              Polyline(points: [abLine.start.latLng, abLine.end.latLng]),
              Polyline(
                points: [
                  vehicle.pursuitAxlePosition.latLng,
                  abLine
                      .currentPerpendicularIntersect(
                        vehicle.pursuitAxlePosition,
                      )
                      .latLng,
                ],
                color: Colors.white,
              ),
              if (autoSteerEnabled)
                Polyline(
                  color: Colors.black,
                  points: [
                    vehicle.lookAheadStartPosition.latLng,
                    if (abLine.vehicleToLookAheadLineProjection(
                          vehicle,
                          lookAheadDistance,
                        ) !=
                        null)
                      abLine
                          .vehicleToLookAheadLineProjection(
                            vehicle,
                            lookAheadDistance,
                          )!
                          .latLng,
                    abLine
                        .findLookAheadLinePoints(vehicle, lookAheadDistance)
                        .inside
                        .latLng,
                    if (abLine
                            .findLookAheadLinePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .outside !=
                        null)
                      abLine
                          .findLookAheadLinePoints(
                            vehicle,
                            lookAheadDistance,
                          )
                          .outside!
                          .latLng,
                  ],
                ),
              if (autoSteerEnabled)
                Polyline(
                  points: [
                    vehicle.lookAheadStartPosition.latLng,
                    abLine
                        .findLookAheadCirclePoints(
                          vehicle,
                          lookAheadDistance,
                        )
                        .best
                        .latLng
                  ],
                  color: Colors.green,
                ),
              if (abLine.vehicleToLookAheadLineProjection(
                        vehicle,
                        lookAheadDistance,
                      ) !=
                      null &&
                  autoSteerEnabled)
                Polyline(
                  points: [
                    abLine
                        .vehicleToLookAheadLineProjection(
                          vehicle,
                          lookAheadDistance,
                        )!
                        .latLng,
                    abLine
                        .findLookAheadCirclePoints(
                          vehicle,
                          lookAheadDistance,
                        )
                        .best
                        .latLng
                  ],
                  color: Colors.green,
                ),
              if (abLine
                          .findLookAheadCirclePoints(
                            vehicle,
                            lookAheadDistance,
                          )
                          .worst !=
                      null &&
                  autoSteerEnabled) ...[
                Polyline(
                  points: [
                    vehicle.lookAheadStartPosition.latLng,
                    abLine
                        .findLookAheadCirclePoints(
                          vehicle,
                          lookAheadDistance,
                        )
                        .worst!
                        .latLng
                  ],
                  color: Colors.red,
                ),
                if (abLine.vehicleToLookAheadLineProjection(
                          vehicle,
                          lookAheadDistance,
                        ) !=
                        null &&
                    autoSteerEnabled)
                  Polyline(
                    points: [
                      abLine
                          .vehicleToLookAheadLineProjection(
                            vehicle,
                            lookAheadDistance,
                          )!
                          .latLng,
                      abLine
                          .findLookAheadCirclePoints(
                            vehicle,
                            lookAheadDistance,
                          )
                          .worst!
                          .latLng
                    ],
                    color: Colors.red,
                  )
              ]
            ],
          ),
        if (abLine != null || pointA != null || pointB != null)
          CircleLayer(
            circles: [
              if (pointA != null) CircleMarker(point: pointA.latLng, radius: 5),
              if (pointB != null) CircleMarker(point: pointB.latLng, radius: 5),
              if (abLine != null) ...[
                if (autoSteerEnabled)
                  CircleMarker(
                    point: vehicle.lookAheadStartPosition.latLng,
                    radius: lookAheadDistance,
                    useRadiusInMeter: true,
                    color: Colors.pink.withOpacity(0.2),
                  ),
                CircleMarker(
                  point: abLine
                      .currentPerpendicularIntersect(
                        vehicle.pursuitAxlePosition,
                      )
                      .latLng,
                  radius: 5,
                  color: Colors.red,
                ),
                ...abLine
                    .pointsAhead(
                      point: vehicle.position,
                      heading: vehicle.bearing,
                      num: ref.watch(aBLineDebugNumPointsAheadProvider),
                      stepSize: ref.watch(aBLineDebugStepSizeProvider),
                    )
                    .map(
                      (point) => CircleMarker(
                        point: point.latLng,
                        radius: 3,
                        color: Colors.blue,
                      ),
                    ),
                ...abLine
                    .pointsBehind(
                      point: vehicle.position,
                      heading: vehicle.bearing,
                      num: ref.watch(aBLineDebugNumPointsBehindProvider),
                      stepSize: ref.watch(aBLineDebugStepSizeProvider),
                    )
                    .map(
                      (point) => CircleMarker(
                        point: point.latLng,
                        radius: 3,
                        color: Colors.orange,
                      ),
                    )
              ]
            ],
          ),
      ],
    );
  }
}

/// A widget for controlling the AB-line offset.
class ABLineOffsetDebugControls extends ConsumerWidget {
  /// A widget for controlling the AB-line offset.
  const ABLineOffsetDebugControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final abLine = switch (ref.watch(autoSteerEnabledProvider)) {
      true => ref.watch(displayABLineProvider),
      false => ref.watch(aBLineDebugProvider)
    };

    if (abLine != null) {
      return Align(
        alignment: Alignment.topCenter,
        child: Card(
          color: Theme.of(context).cardColor.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return Text(
                      (ref.watch(abLinePerpendicularDistanceProvider) ?? 0)
                          .toStringAsFixed(3),
                      style: theme.menuButtonWithChildrenText,
                    );
                  },
                ),
                Text(
                  'Offset: ${abLine.currentOffset}',
                  style: theme.menuButtonWithChildrenText,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Consumer(
                      builder: (context, ref, child) => IconButton.filled(
                        onPressed: () {
                          ref.read(aBLineDebugProvider.notifier).moveOffsetLeft(
                                ref.watch(
                                  mainVehicleProvider.select(
                                    (vehicle) => vehicle.pursuitAxlePosition,
                                  ),
                                ),
                                ref.watch(
                                  mainVehicleProvider.select(
                                    (vehicle) => vehicle.bearing,
                                  ),
                                ),
                              );
                          ref
                              .read(simInputProvider.notifier)
                              .send((abLineMoveOffset: -1));
                        },
                        icon: const Icon(Icons.arrow_left),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => FilterChip(
                        label: const Text('AUTO'),
                        selected: abLine.snapToClosestLine,
                        onSelected: (value) {
                          ref
                              .read(aBLineDebugProvider.notifier)
                              .updateSnapToClosestLine(value: value);
                          ref
                              .read(simInputProvider.notifier)
                              .send((abLineSnapping: value));
                        },
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => IconButton.filled(
                        onPressed: () {
                          ref
                              .read(aBLineDebugProvider.notifier)
                              .moveOffsetRight(
                                ref.watch(
                                  mainVehicleProvider.select(
                                    (vehicle) => vehicle.pursuitAxlePosition,
                                  ),
                                ),
                                ref.watch(
                                  mainVehicleProvider.select(
                                    (vehicle) => vehicle.bearing,
                                  ),
                                ),
                              );
                          ref
                              .read(simInputProvider.notifier)
                              .send((abLineMoveOffset: 1));
                        },
                        icon: const Icon(Icons.arrow_right),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
