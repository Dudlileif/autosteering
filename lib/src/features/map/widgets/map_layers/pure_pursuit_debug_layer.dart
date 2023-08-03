import 'package:agopengps_flutter/src/features/common/utils/position_projection_extensions.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/theme/theme.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for debuggin the pure pursuit functionality.
class PurePursuitDebugLayer extends ConsumerWidget {
  /// A combination layer for debuggin the pure pursuit functionality.
  const PurePursuitDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pursuit = ref.watch(displayPurePursuitProvider);
    final pursuitMode = ref.watch(pursuitModeProvider);
    final lookAheadDistance = ref.watch(effectiveLookAheadDistanceProvider);
    final vehicle = ref.watch(mainVehicleProvider);

    return Stack(
      children: pursuit != null
          ? [
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points: pursuit.path
                        .map((point) => point.position.latLng)
                        .toList(),
                  ),
                  Polyline(
                    points: [
                      vehicle.pursuitAxlePosition.latLng,
                      pursuit.perpendicularIntersect(vehicle).latLng
                    ],
                    color: Colors.white,
                  ),
                  if (pursuitMode == PurePursuitMode.lookAhead) ...[
                    Polyline(
                      color: Colors.black,
                      points: [
                        vehicle.lookAheadStartPosition.latLng,
                        if (pursuit.lookAheadVehicleToLineProjection(
                              vehicle,
                              lookAheadDistance,
                            ) !=
                            null)
                          pursuit
                              .lookAheadVehicleToLineProjection(
                                vehicle,
                                lookAheadDistance,
                              )!
                              .latLng,
                        pursuit
                            .findLookAheadLinePoints(vehicle, lookAheadDistance)
                            .inside
                            .position
                            .latLng,
                        if (pursuit
                                .findLookAheadLinePoints(
                                  vehicle,
                                  lookAheadDistance,
                                )
                                .outside !=
                            null)
                          pursuit
                              .findLookAheadLinePoints(
                                vehicle,
                                lookAheadDistance,
                              )
                              .outside!
                              .position
                              .latLng,
                      ],
                    ),
                    Polyline(
                      points: [
                        vehicle.lookAheadStartPosition.latLng,
                        pursuit
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .best
                            .position
                            .latLng
                      ],
                      color: Colors.pink,
                    ),
                    if (pursuit.lookAheadVehicleToLineProjection(
                          vehicle,
                          lookAheadDistance,
                        ) !=
                        null)
                      Polyline(
                        points: [
                          pursuit
                              .lookAheadVehicleToLineProjection(
                                vehicle,
                                lookAheadDistance,
                              )!
                              .latLng,
                          pursuit
                              .findLookAheadCirclePoints(
                                vehicle,
                                lookAheadDistance,
                              )
                              .best
                              .position
                              .latLng
                        ],
                        color: Colors.pink,
                      ),
                    if (pursuit
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .worst !=
                        null) ...[
                      Polyline(
                        points: [
                          vehicle.lookAheadStartPosition.latLng,
                          pursuit
                              .findLookAheadCirclePoints(
                                vehicle,
                                lookAheadDistance,
                              )
                              .worst!
                              .position
                              .latLng
                        ],
                        color: Colors.blue,
                      ),
                      if (pursuit.lookAheadVehicleToLineProjection(
                            vehicle,
                            lookAheadDistance,
                          ) !=
                          null)
                        Polyline(
                          points: [
                            pursuit
                                .lookAheadVehicleToLineProjection(
                                  vehicle,
                                  lookAheadDistance,
                                )!
                                .latLng,
                            pursuit
                                .findLookAheadCirclePoints(
                                  vehicle,
                                  lookAheadDistance,
                                )
                                .worst!
                                .position
                                .latLng
                          ],
                          color: Colors.blue,
                        )
                    ]
                  ]
                ],
              ),
              CircleLayer(
                circles: [
                  ...pursuit.path.map(
                    (point) => CircleMarker(
                      point: point.position.latLng,
                      radius: 5,
                    ),
                  ),
                  if (pursuitMode == PurePursuitMode.pid) ...[
                    CircleMarker(
                      point: pursuit.currentWayPoint.position.latLng,
                      radius: 3,
                      color: Colors.black,
                    ),
                    CircleMarker(
                      point: pursuit.nextWayPoint(vehicle).position.latLng,
                      radius: 3,
                      color: Colors.white,
                    ),
                  ] else if (pursuitMode == PurePursuitMode.lookAhead) ...[
                    CircleMarker(
                      point: vehicle.lookAheadStartPosition.latLng,
                      radius: lookAheadDistance,
                      useRadiusInMeter: true,
                      color: Colors.pink.withOpacity(0.2),
                    ),
                    if (pursuit.lookAheadVehicleToLineProjection(
                          vehicle,
                          lookAheadDistance,
                        ) !=
                        null)
                      CircleMarker(
                        point: pursuit
                            .lookAheadVehicleToLineProjection(
                              vehicle,
                              lookAheadDistance,
                            )!
                            .latLng,
                        radius: 5,
                        color: Colors.black,
                      ),
                    CircleMarker(
                      point: pursuit
                          .findLookAheadLinePoints(
                            vehicle,
                            lookAheadDistance,
                          )
                          .inside
                          .position
                          .latLng,
                      radius: 3,
                      color: Colors.white,
                    ),
                    if (pursuit
                            .findLookAheadLinePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .outside !=
                        null)
                      CircleMarker(
                        point: pursuit
                            .findLookAheadLinePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .outside!
                            .position
                            .latLng,
                        radius: 3,
                        color: Colors.white,
                      ),
                    CircleMarker(
                      point: pursuit
                          .findLookAheadCirclePoints(
                            vehicle,
                            lookAheadDistance,
                          )
                          .best
                          .position
                          .latLng,
                      radius: 5,
                      color: Colors.pink,
                    ),
                    if (pursuit
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .worst !=
                        null)
                      CircleMarker(
                        point: pursuit
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .worst!
                            .position
                            .latLng,
                        radius: 5,
                        color: Colors.blue,
                      ),
                  ],
                  CircleMarker(
                    point: pursuit.perpendicularIntersect(vehicle).latLng,
                    radius: 5,
                    color: Colors.grey,
                  ),
                ],
              ),
            ]
          : const [],
    );
  }
}

/// A Widget for displaying the distance from the pure pursuit line to the
/// vehicle.
class PurePursuitDebugWidget extends ConsumerWidget {
  /// A Widget for displaying the distance from the pure pursuit line to the
  /// vehicle.
  const PurePursuitDebugWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Card(
        color: theme.cardColor.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer(
            builder: (context, ref, child) {
              return Text(
                (ref.watch(purePursuitPerpendicularDistanceProvider) ?? 0)
                    .toStringAsFixed(3),
                style: theme.menuButtonWithChildrenText,
              );
            },
          ),
        ),
      ),
    );
  }
}
