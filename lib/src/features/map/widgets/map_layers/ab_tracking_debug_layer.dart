import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/simulator/simulator.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for debugging the AB-line feature.
class ABTrackingDebugLayer extends ConsumerWidget {
  /// A combination layer for debugging the AB-line feature.
  const ABTrackingDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abTracking = ref.watch(displayABTrackingProvider);

    final pointA = abTracking?.start ?? ref.watch(aBPointAProvider);

    final pointB = abTracking?.end ?? ref.watch(aBPointBProvider);

    final autoSteerEnabled = ref.watch(autoSteerEnabledProvider);

    final vehicle = ref.watch(mainVehicleProvider);

    final currentPerpendicularIntersect =
        abTracking?.currentPerpendicularIntersect(vehicle).latLng;

    return Stack(
      children: [
        if (abTracking != null)
          PolylineLayer(
            polylines: [
              Polyline(
                points: [
                  if (abTracking is ABLine) ...[
                    abTracking.start.position.latLng,
                    abTracking.end.position.latLng,
                  ] else if (abTracking is ABCurve)
                    ...abTracking.baseCurve.map((e) => e.position.latLng),
                ],
              ),
              Polyline(
                points: [
                  if (abTracking is ABLine) ...[
                    abTracking.currentStart.position.latLng,
                    abTracking.currentEnd.position.latLng,
                  ] else if (abTracking is ABCurve)
                    ...abTracking.currentPathTracking.path
                        .map((e) => e.position.latLng),
                ],
              ),
              if (abTracking.limitMode != ABLimitMode.unlimited)
                Polyline(
                  points: [
                    if (abTracking is ABLine) ...[
                      abTracking.nextStart.position.latLng,
                      abTracking.nextEnd.position.latLng,
                    ] else if (abTracking is ABCurve)
                      ...abTracking.nextPathTracking.path
                          .map((e) => e.position.latLng),
                  ],
                  color: Colors.blue,
                ),
              if (abTracking.upcomingTurn != null)
                Polyline(
                  points: abTracking.upcomingTurn!.path
                      .map((e) => e.position.latLng)
                      .toList(),
                  color: Colors.blue,
                ),
              if (abTracking.activeTurn != null)
                Polyline(
                  points: abTracking.activeTurn!.path
                      .map((e) => e.position.latLng)
                      .toList(),
                  color: Colors.green,
                ),
              if (currentPerpendicularIntersect != null)
                Polyline(
                  points: [
                    vehicle.pathTrackingPoint.latLng,
                    currentPerpendicularIntersect,
                  ],
                  color: Colors.white,
                ),
            ],
          ),
        if (abTracking != null || pointA != null || pointB != null)
          CircleLayer(
            circles: [
              if (pointA != null)
                CircleMarker(point: pointA.position.latLng, radius: 5),
              if (pointB != null)
                CircleMarker(point: pointB.position.latLng, radius: 5),
              if (abTracking != null) ...[
                CircleMarker(
                  point: abTracking.currentStart.position.latLng,
                  radius: 5,
                ),
                CircleMarker(
                  point: abTracking.currentEnd.position.latLng,
                  radius: 5,
                ),
                CircleMarker(
                  point: abTracking.nextStart.position.latLng,
                  radius: 5,
                  color: Colors.blue,
                ),
                CircleMarker(
                  point: abTracking.nextEnd.position.latLng,
                  radius: 5,
                  color: Colors.blue,
                ),
                if (autoSteerEnabled &&
                    vehicle.pathTrackingMode ==
                        PathTrackingMode.purePursuit) ...[
                  CircleMarker(
                    point: vehicle.lookAheadStartPosition.latLng,
                    radius: vehicle.lookAheadDistance,
                    useRadiusInMeter: true,
                    color: Colors.pink.withOpacity(0.1),
                  ),
                  if (abTracking.activeTurn != null &&
                      abTracking.activeTurn is PurePursuitPathTracking)
                    CircleMarker(
                      point: (abTracking.activeTurn! as PurePursuitPathTracking)
                          .findLookAheadCirclePoints(vehicle)
                          .best
                          .position
                          .latLng,
                      radius: 5,
                      color: Colors.pink,
                    )
                  else
                    CircleMarker(
                      point: abTracking
                          .findLookAheadCirclePoints(vehicle)
                          .best
                          .latLng,
                      radius: 5,
                      color: Colors.pink,
                    ),
                ],
                if (currentPerpendicularIntersect != null)
                  CircleMarker(
                    point: currentPerpendicularIntersect,
                    radius: 5,
                    color: Colors.red,
                  ),
                ...abTracking
                    .pointsAhead(
                      vehicle,
                      num: ref.watch(aBDebugNumPointsAheadProvider),
                      stepSize: ref.watch(aBDebugStepSizeProvider),
                    )
                    .map(
                      (point) => CircleMarker(
                        point: point.position.latLng,
                        radius: 3,
                        color: Colors.blue,
                      ),
                    ),
                ...abTracking
                    .pointsBehind(
                      vehicle,
                      num: ref.watch(aBDebugNumPointsBehindProvider),
                      stepSize: ref.watch(aBDebugStepSizeProvider),
                    )
                    .map(
                      (point) => CircleMarker(
                        point: point.position.latLng,
                        radius: 3,
                        color: Colors.orange,
                      ),
                    ),
              ],
            ],
          ),
        MarkerLayer(
          markers: [
            if (abTracking != null) ...[
              Marker(
                point: abTracking.start.position.latLng,
                builder: (context) => const Text(
                  'A',
                  style: TextStyle(color: Colors.white),
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              Marker(
                point: abTracking.end.position.latLng,
                builder: (context) => const Text(
                  'B',
                  style: TextStyle(color: Colors.white),
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              Marker(
                point: abTracking.currentStart.position.latLng,
                builder: (context) => Text(
                  'A${abTracking.currentOffset}',
                  style: const TextStyle(color: Colors.white),
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              Marker(
                point: abTracking.currentEnd.position.latLng,
                builder: (context) => Text(
                  'B${abTracking.currentOffset}',
                  style: const TextStyle(color: Colors.white),
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              if (abTracking.limitMode != ABLimitMode.unlimited) ...[
                Marker(
                  point: abTracking.nextStart.position.latLng,
                  builder: (context) => Text(
                    'A${abTracking.nextOffset}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  rotate: true,
                  width: 50,
                  height: 50,
                ),
                Marker(
                  point: abTracking.nextEnd.position.latLng,
                  builder: (context) => Text(
                    'B${abTracking.nextOffset}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  rotate: true,
                  width: 50,
                  height: 50,
                ),
              ],
              if (abTracking is ABCurve)
                ...abTracking.currentPathTracking.path.mapIndexed(
                  (index, e) => Marker(
                    point: e.position.latLng,
                    builder: (context) => Text('$index'),
                    rotate: true,
                  ),
                ),
              if (abTracking is ABCurve)
                ...abTracking.nextPathTracking.path.mapIndexed(
                  (index, e) => Marker(
                    point: e.position.latLng,
                    builder: (context) => Text(
                      '$index',
                    ),
                    rotate: true,
                  ),
                ),
            ],
          ],
        ),
      ],
    );
  }
}

/// A widget for controlling the AB-line offset.
class ABTrackingOffsetDebugControls extends ConsumerWidget {
  /// A widget for controlling the AB-line offset.
  const ABTrackingOffsetDebugControls({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(activeABConfigProvider);

    final abTracking = ref.watch(displayABTrackingProvider);
    if (abTracking != null) {
      final theme = Theme.of(context);

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
                  builder: (context, ref, child) => Text(
                    (ref.watch(abTrackingPerpendicularDistanceProvider) ?? 0)
                        .toStringAsFixed(3),
                    style: theme.menuButtonWithChildrenText,
                  ),
                ),
                Text(
                  'Offset: ${abTracking.currentOffset}',
                  style: theme.menuButtonWithChildrenText,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Consumer(
                      builder: (context, ref, child) => IconButton.filled(
                        onPressed: () => ref
                            .read(simInputProvider.notifier)
                            .send((abMoveOffset: -1)),
                        icon: const Icon(Icons.arrow_left),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => FilterChip(
                        label: const Text('AUTO'),
                        selected: abTracking.snapToClosestLine,
                        onSelected: (value) => ref
                            .read(aBSnapToClosestLineProvider.notifier)
                            .update(value: value),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => IconButton.filled(
                        onPressed: () => ref
                            .read(simInputProvider.notifier)
                            .send((abMoveOffset: 1)),
                        icon: const Icon(Icons.arrow_right),
                      ),
                    ),
                  ],
                ),
                Consumer(
                  builder: (context, ref, child) => IconButton.filled(
                    onPressed:
                        ref.read(aBOffsetOppositeTurnProvider.notifier).toggle,
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