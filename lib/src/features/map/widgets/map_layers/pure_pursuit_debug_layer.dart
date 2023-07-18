import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
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
    final lookAheadDistance = ref.watch(lookAheadDistanceProvider);
    final vehicle = ref.watch(mainVehicleProvider);

    return Stack(
      children: pursuit != null
          ? [
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points:
                        pursuit.path.map((point) => point.position).toList(),
                  ),
                  Polyline(
                    points: [
                      vehicle.pursuitAxlePosition,
                      pursuit.perpendicularIntersect(vehicle)
                    ],
                    color: Colors.white,
                  ),
                  if (pursuitMode == PurePursuitMode.lookAhead) ...[
                    Polyline(
                      color: Colors.black,
                      points: [
                        vehicle.lookAheadStartPosition,
                        if (pursuit.lookAheadVehicleToLineProjection(
                              vehicle,
                              lookAheadDistance,
                            ) !=
                            null)
                          pursuit.lookAheadVehicleToLineProjection(
                            vehicle,
                            lookAheadDistance,
                          )!,
                        pursuit
                            .findLookAheadLinePoints(vehicle, lookAheadDistance)
                            .$1
                            .position,
                        if (pursuit
                                .findLookAheadLinePoints(
                                  vehicle,
                                  lookAheadDistance,
                                )
                                .$2 !=
                            null)
                          pursuit
                              .findLookAheadLinePoints(
                                vehicle,
                                lookAheadDistance,
                              )
                              .$2!
                              .position,
                      ],
                    ),
                    Polyline(
                      points: [
                        vehicle.lookAheadStartPosition,
                        pursuit
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .$1
                            .position
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
                          pursuit.lookAheadVehicleToLineProjection(
                            vehicle,
                            lookAheadDistance,
                          )!,
                          pursuit
                              .findLookAheadCirclePoints(
                                vehicle,
                                lookAheadDistance,
                              )
                              .$1
                              .position
                        ],
                        color: Colors.pink,
                      ),
                    if (pursuit
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .$2 !=
                        null) ...[
                      Polyline(
                        points: [
                          vehicle.lookAheadStartPosition,
                          pursuit
                              .findLookAheadCirclePoints(
                                vehicle,
                                lookAheadDistance,
                              )
                              .$2!
                              .position
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
                            pursuit.lookAheadVehicleToLineProjection(
                              vehicle,
                              lookAheadDistance,
                            )!,
                            pursuit
                                .findLookAheadCirclePoints(
                                  vehicle,
                                  lookAheadDistance,
                                )
                                .$2!
                                .position
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
                      point: point.position,
                      radius: 5,
                    ),
                  ),
                  if (pursuitMode == PurePursuitMode.pid) ...[
                    CircleMarker(
                      point: pursuit.currentWayPoint.position,
                      radius: 3,
                      color: Colors.black,
                    ),
                    CircleMarker(
                      point: pursuit.nextWayPoint(vehicle).position,
                      radius: 3,
                      color: Colors.white,
                    ),
                  ] else if (pursuitMode == PurePursuitMode.lookAhead) ...[
                    CircleMarker(
                      point: vehicle.lookAheadStartPosition,
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
                        point: pursuit.lookAheadVehicleToLineProjection(
                          vehicle,
                          lookAheadDistance,
                        )!,
                        radius: 5,
                        color: Colors.black,
                      ),
                    CircleMarker(
                      point: pursuit
                          .findLookAheadLinePoints(
                            vehicle,
                            lookAheadDistance,
                          )
                          .$1
                          .position,
                      radius: 3,
                      color: Colors.white,
                    ),
                    if (pursuit
                            .findLookAheadLinePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .$2 !=
                        null)
                      CircleMarker(
                        point: pursuit
                            .findLookAheadLinePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .$2!
                            .position,
                        radius: 3,
                        color: Colors.white,
                      ),
                    CircleMarker(
                      point: pursuit
                          .findLookAheadCirclePoints(
                            vehicle,
                            lookAheadDistance,
                          )
                          .$1
                          .position,
                      radius: 5,
                      color: Colors.pink,
                    ),
                    if (pursuit
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .$2 !=
                        null)
                      CircleMarker(
                        point: pursuit
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .$2!
                            .position,
                        radius: 5,
                        color: Colors.blue,
                      ),
                  ],
                  CircleMarker(
                    point: pursuit.perpendicularIntersect(vehicle),
                    radius: 5,
                    color: Colors.grey,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Consumer(
                      builder: (context, ref, child) {
                        return Text(
                          pursuit
                              .perpendicularDistance(vehicle)
                              .toStringAsFixed(3),
                        );
                      },
                    ),
                  ),
                ),
              )
            ]
          : const [],
    );
  }
}
