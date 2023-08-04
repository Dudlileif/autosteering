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

    final currentPerpendicularIntersect = abLine
        ?.currentPerpendicularIntersect(
          vehicle.pursuitAxlePosition,
        )
        .latLng;

    final lookAheadLinePoints =
        abLine?.findLookAheadLinePoints(vehicle, lookAheadDistance);

    final lookAheadCirclePoints =
        abLine?.findLookAheadCirclePoints(vehicle, lookAheadDistance);

    final vehicleToLineProjection = abLine
        ?.vehicleToLookAheadLineProjection(
          vehicle,
          lookAheadDistance,
        )
        ?.latLng;

    return Stack(
      children: [
        if (abLine != null)
          PolylineLayer(
            polylines: [
              Polyline(points: [abLine.start.latLng, abLine.end.latLng]),
              if (currentPerpendicularIntersect != null)
                Polyline(
                  points: [
                    vehicle.pursuitAxlePosition.latLng,
                    currentPerpendicularIntersect,
                  ],
                  color: Colors.white,
                ),
              if (autoSteerEnabled && lookAheadLinePoints != null)
                Polyline(
                  color: Colors.black,
                  points: [
                    vehicle.lookAheadStartPosition.latLng,
                    if (vehicleToLineProjection != null)
                      vehicleToLineProjection,
                    lookAheadLinePoints.inside.latLng,
                    if (lookAheadLinePoints.outside != null)
                      lookAheadLinePoints.outside!.latLng,
                  ],
                ),
              if (autoSteerEnabled && lookAheadCirclePoints != null)
                Polyline(
                  points: [
                    vehicle.lookAheadStartPosition.latLng,
                    lookAheadCirclePoints.best.latLng
                  ],
                  color: Colors.green,
                ),
              if (vehicleToLineProjection != null &&
                  autoSteerEnabled &&
                  lookAheadCirclePoints != null)
                Polyline(
                  points: [
                    vehicleToLineProjection,
                    lookAheadCirclePoints.best.latLng
                  ],
                  color: Colors.green,
                ),
              if (lookAheadCirclePoints?.worst != null &&
                  autoSteerEnabled &&
                  lookAheadCirclePoints != null &&
                  lookAheadCirclePoints.worst != null) ...[
                Polyline(
                  points: [
                    vehicle.lookAheadStartPosition.latLng,
                    lookAheadCirclePoints.worst!.latLng
                  ],
                  color: Colors.red,
                ),
                if (vehicleToLineProjection != null && autoSteerEnabled)
                  Polyline(
                    points: [
                      vehicleToLineProjection,
                      lookAheadCirclePoints.worst!.latLng
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
                if (currentPerpendicularIntersect != null)
                  CircleMarker(
                    point: currentPerpendicularIntersect,
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
