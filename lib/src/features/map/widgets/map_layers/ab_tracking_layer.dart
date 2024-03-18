import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the [ABTracking] feature.
class ABTrackingLayer extends ConsumerWidget {
  /// A combination layer for the [ABTracking] feature.
  const ABTrackingLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const pointTextStyle = TextStyle(color: Colors.white);

    ref
      .watch(configuredABTrackingProvider);

    final abTracking = ref.watch(displayABTrackingProvider);

    final pointA = abTracking?.start ?? ref.watch(aBPointAProvider);

    final pointB = abTracking?.end ?? ref.watch(aBPointBProvider);

    final autoSteerEnabled = ref.watch(
      activeAutosteeringStateProvider
          .select((value) => value != AutosteeringState.disabled),
    );

    final vehicle = ref.watch(mainVehicleProvider);

    final currentPerpendicularIntersect =
        abTracking?.currentPerpendicularIntersect(vehicle).latLng;

    final showAllLines = ref.watch(aBTrackingShowAllLinesProvider);

    return Stack(
      children: [
        if (abTracking != null)
          PolylineLayer(
            polylines: [
              if (abTracking.boundary == null)
                Polyline(
                points:
                    abTracking.baseLine.map((e) => e.position.latLng).toList(),
              ),
              Polyline(
                points: abTracking.currentLine
                    .map((e) => e.position.latLng)
                    .toList(),
                strokeWidth: 2,
              ),
              if (abTracking.limitMode == ABLimitMode.unlimited &&
                  abTracking is ABLine)
                Polyline(
                  points: [
                    ...abTracking
                        .pointsAhead(vehicle, stepSize: 100, count: 5)
                        .map((e) => e.position.latLng),
                    ...abTracking
                        .pointsBehind(vehicle, stepSize: 100, count: 5)
                        .map((e) => e.position.latLng),
                  ],
                  strokeWidth: 2,
                ),
              if (abTracking.limitMode != ABLimitMode.unlimited &&
                  abTracking.nextLine != null)
                Polyline(
                  points: abTracking.nextLine!
                      .map((e) => e.position.latLng)
                      .toList(),
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
              if (showAllLines)
                ...abTracking.lines.values.map(
                  (line) => Polyline(
                    points: line.map((e) => e.position.latLng).toList(),
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        if (abTracking != null || pointA != null || pointB != null)
          CircleLayer(
            circles: [
              if (abTracking != null) ...[
                CircleMarker(
                  point: abTracking.currentStart.position.latLng,
                  radius: 5,
                ),
                CircleMarker(
                  point: abTracking.currentEnd.position.latLng,
                  radius: 5,
                ),
                if (abTracking.nextStart != null)
                  CircleMarker(
                    point: abTracking.nextStart!.position.latLng,
                    radius: 5,
                    color: Colors.blue,
                  ),
                if (abTracking.nextEnd != null)
                  CircleMarker(
                    point: abTracking.nextEnd!.position.latLng,
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
                  else if (abTracking.currentPathTracking
                      is PurePursuitPathTracking)
                    CircleMarker(
                      point: (abTracking.currentPathTracking!
                              as PurePursuitPathTracking)
                          .findLookAheadCirclePoints(vehicle)
                          .best
                          .position
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
                      count: ref.watch(aBDebugNumPointsAheadProvider),
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
                      count: ref.watch(aBDebugNumPointsBehindProvider),
                      stepSize: ref.watch(aBDebugStepSizeProvider),
                    )
                    .map(
                      (point) => CircleMarker(
                        point: point.position.latLng,
                        radius: 3,
                        color: Colors.orange,
                      ),
                    ),
              ] else if (pointA != null || pointB != null) ...[
                if (pointA != null)
                  CircleMarker(point: pointA.position.latLng, radius: 5),
                if (pointB != null)
                  CircleMarker(point: pointB.position.latLng, radius: 5),
              ],
            ],
          ),
        MarkerLayer(
          markers: [
            if (abTracking != null) ...[
              if (abTracking.boundary == null) ...[
                Marker(
                point: abTracking.start.position.latLng,
                child: const TextWithStroke(
                  'A',
                  style: pointTextStyle,
                  strokeWidth: 4,
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              Marker(
                point: abTracking.end.position.latLng,
                child: const TextWithStroke(
                  'B',
                  style: pointTextStyle,
                  strokeWidth: 4,
                ),
                rotate: true,
                width: 50,
                height: 50,
                ),
              ],
              Marker(
                point: abTracking.currentStart.position.latLng,
                child: TextWithStroke(
                  'A${abTracking.currentOffset}',
                  style: pointTextStyle,
                  strokeWidth: 4,
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              Marker(
                point: abTracking.currentEnd.position.latLng,
                child: TextWithStroke(
                  'B${abTracking.currentOffset}',
                  style: pointTextStyle,
                  strokeWidth: 4,
                ),
                rotate: true,
                width: 50,
                height: 50,
              ),
              if (abTracking.limitMode != ABLimitMode.unlimited) ...[
                if (abTracking.nextStart != null)
                  Marker(
                    point: abTracking.nextStart!.position.latLng,
                    child: TextWithStroke(
                      'A${abTracking.nextOffset}',
                      style: pointTextStyle,
                      strokeWidth: 4,
                    ),
                    rotate: true,
                    width: 50,
                    height: 50,
                  ),
                if (abTracking.nextEnd != null)
                  Marker(
                    point: abTracking.nextEnd!.position.latLng,
                    child: TextWithStroke(
                      'B${abTracking.nextOffset}',
                      style: pointTextStyle,
                      strokeWidth: 4,
                    ),
                    rotate: true,
                    width: 50,
                    height: 50,
                  ),
              ],
            ] else if (pointA != null || pointB != null) ...[
              if (pointA != null)
                Marker(
                  point: pointA.position.latLng,
                  child: const TextWithStroke(
                    'A',
                    style: pointTextStyle,
                    strokeWidth: 4,
                  ),
                  rotate: true,
                  width: 50,
                  height: 50,
                ),
              if (pointB != null)
                Marker(
                  point: pointB.position.latLng,
                  child: const TextWithStroke(
                    'B',
                    style: pointTextStyle,
                    strokeWidth: 4,
                  ),
                  rotate: true,
                  width: 50,
                  height: 50,
                ),
            ],
          ],
        ),
      ],
    );
  }
}
