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

    final vehicle = ref.watch(mainVehicleProvider);

    final currentPerpendicularIntersect =
        abLine?.currentPerpendicularIntersect(vehicle).latLng;

    final lookAheadLinePoints = abLine?.findLookAheadLinePoints(
      vehicle,
    );

    final lookAheadCirclePoints = abLine?.findLookAheadCirclePoints(
      vehicle,
    );

    final vehicleToLineProjection = abLine
        ?.vehicleToLookAheadLineProjection(
          vehicle,
        )
        ?.latLng;

    return Stack(
      children: [
        if (abLine != null)
          PolylineLayer(
            polylines: [
              Polyline(points: [abLine.start.latLng, abLine.end.latLng]),
              Polyline(
                points: [
                  abLine.currentStart.latLng,
                  abLine.currentEnd.latLng,
                ],
              ),
              if (abLine.limitMode != ABLimitMode.unlimited)
                Polyline(
                  points: [
                    abLine.nextStart.latLng,
                    abLine.nextEnd.latLng,
                  ],
                  color: Colors.blue,
                ),
              if (abLine.upcomingTurn != null)
                Polyline(
                  points: abLine.upcomingTurn!.path
                      .map((e) => e.position.latLng)
                      .toList(),
                  color: Colors.blue,
                ),
              if (abLine.activeTurn != null)
                Polyline(
                  points: abLine.activeTurn!.path
                      .map((e) => e.position.latLng)
                      .toList(),
                  color: Colors.blue,
                ),
              if (currentPerpendicularIntersect != null)
                Polyline(
                  points: [
                    vehicle.lookAheadStartPosition.latLng,
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
                    lookAheadCirclePoints.best.latLng,
                  ],
                  color: Colors.green,
                ),
              if (vehicleToLineProjection != null &&
                  autoSteerEnabled &&
                  lookAheadCirclePoints != null)
                Polyline(
                  points: [
                    vehicleToLineProjection,
                    lookAheadCirclePoints.best.latLng,
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
                    lookAheadCirclePoints.worst!.latLng,
                  ],
                  color: Colors.red,
                ),
                if (vehicleToLineProjection != null && autoSteerEnabled)
                  Polyline(
                    points: [
                      vehicleToLineProjection,
                      lookAheadCirclePoints.worst!.latLng,
                    ],
                    color: Colors.red,
                  ),
              ],
              if (abLine.activeTurn != null)
                ...abLine.activeTurn!.path.map(
                  (point) => Polyline(
                    points: [
                      point.position.latLng,
                      point.moveSpherical(distance: 0.4).position.latLng,
                    ],
                  ),
                ),
            ],
          ),
        if (abLine != null || pointA != null || pointB != null)
          CircleLayer(
            circles: [
              if (pointA != null) CircleMarker(point: pointA.latLng, radius: 5),
              if (pointB != null) CircleMarker(point: pointB.latLng, radius: 5),
              if (abLine != null) ...[
                CircleMarker(
                  point: abLine.currentStart.latLng,
                  radius: 5,
                ),
                CircleMarker(
                  point: abLine.currentEnd.latLng,
                  radius: 5,
                ),
                CircleMarker(
                  point: abLine.nextStart.latLng,
                  radius: 5,
                  color: Colors.blue,
                ),
                CircleMarker(
                  point: abLine.nextEnd.latLng,
                  radius: 5,
                  color: Colors.blue,
                ),
                if (autoSteerEnabled &&
                    vehicle.pathTrackingMode == PathTrackingMode.purePursuit)
                  CircleMarker(
                    point: vehicle.lookAheadStartPosition.latLng,
                    radius: vehicle.lookAheadDistance,
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
                      vehicle,
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
                      vehicle,
                      num: ref.watch(aBLineDebugNumPointsBehindProvider),
                      stepSize: ref.watch(aBLineDebugStepSizeProvider),
                    )
                    .map(
                      (point) => CircleMarker(
                        point: point.latLng,
                        radius: 3,
                        color: Colors.orange,
                      ),
                    ),
                if (abLine.activeTurn is PurePursuitPathTracking)
                  CircleMarker(
                    point: (abLine.activeTurn! as PurePursuitPathTracking)
                        .findLookAheadCirclePoints(
                          vehicle,
                          vehicle.lookAheadDistance,
                        )
                        .best
                        .position
                        .latLng,
                    radius: 5,
                    color: Colors.pink,
                  ),
              ],
            ],
          ),
        MarkerLayer(
          markers: [
            if (abLine != null) ...[
              Marker(
                point: abLine.start.latLng,
                builder: (context) => const Text(
                  'A',
                  style: TextStyle(color: Colors.white),
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              Marker(
                point: abLine.end.latLng,
                builder: (context) => const Text(
                  'B',
                  style: TextStyle(color: Colors.white),
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              Marker(
                point: abLine.currentStart.latLng,
                builder: (context) => Text(
                  'A${abLine.currentOffset}',
                  style: const TextStyle(color: Colors.white),
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              Marker(
                point: abLine.currentEnd.latLng,
                builder: (context) => Text(
                  'B${abLine.currentOffset}',
                  style: const TextStyle(color: Colors.white),
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              if (abLine.limitMode != ABLimitMode.unlimited) ...[
                Marker(
                  point: abLine.nextStart.latLng,
                  builder: (context) => Text(
                    'A${abLine.nextOffset}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  rotate: true,
                  width: 50,
                  height: 50,
                ),
                Marker(
                  point: abLine.nextEnd.latLng,
                  builder: (context) => Text(
                    'B${abLine.nextOffset}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  rotate: true,
                  width: 50,
                  height: 50,
                ),
              ],
            ],
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
                                  mainVehicleProvider,
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
                                  mainVehicleProvider,
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
                Consumer(
                  builder: (context, ref, child) => IconButton.filled(
                    onPressed: () {
                      ref
                          .read(simInputProvider.notifier)
                          .send((abToggleTurnDirection: true));
                    },
                    icon: const Icon(Icons.compare_arrows),
                  ),
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
