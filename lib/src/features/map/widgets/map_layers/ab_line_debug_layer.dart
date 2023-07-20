import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
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
                      .offsetPerpendicularIntersect(
                        abLine.currentOffset,
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
    final abLine = ref.watch(aBLineDebugProvider);

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
                      abLine
                          .signedPerpendicularDistanceToOffsetLine(
                            offset: abLine.currentOffset,
                            point: ref.watch(
                              mainVehicleProvider
                                  .select((vehicle) => vehicle.position),
                            ),
                            heading: ref.watch(
                              mainVehicleProvider
                                  .select((vehicle) => vehicle.bearing),
                            ),
                          )
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
                        onPressed: () => ref
                            .read(aBLineDebugProvider.notifier)
                            .moveOffsetLeft(
                              ref.watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.bearing,
                                ),
                              ),
                            ),
                        icon: const Icon(Icons.arrow_left),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => FilterChip(
                        label: const Text('AUTO'),
                        selected: abLine.snapToClosestLine,
                        onSelected: (value) => ref
                            .read(aBLineDebugProvider.notifier)
                            .updateSnapToClosestLine(value: value),
                      ),
                    ),
                    Consumer(
                      builder: (context, ref, child) => IconButton.filled(
                        onPressed: () => ref
                            .read(aBLineDebugProvider.notifier)
                            .moveOffsetRight(
                              ref.watch(
                                mainVehicleProvider.select(
                                  (vehicle) => vehicle.bearing,
                                ),
                              ),
                            ),
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
