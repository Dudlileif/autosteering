import 'package:autosteering/src/features/common/utils/position_projection_extensions.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for debugging the path tracking functionality.
class PathTrackingDebugLayer extends ConsumerWidget {
  /// A combination layer for debugging the path tracking functionality.
  const PathTrackingDebugLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tracking = ref.watch(displayPathTrackingProvider);
    final vehicle = ref.watch(mainVehicleProvider);
    final lookAheadDistance = vehicle.lookAheadDistance;

    return Stack(
      children: tracking != null
          ? [
              PolylineLayer(
                polylineCulling: true,
                polylines: [
                  Polyline(
                    points: tracking.path
                        .map((point) => point.position.latLng)
                        .toList(),
                  ),
                  Polyline(
                    points: [
                      vehicle.pathTrackingPoint.latLng,
                      tracking.perpendicularIntersect(vehicle).latLng,
                    ],
                    color: Colors.white,
                  ),
                  if (tracking is PurePursuitPathTracking) ...[
                    Polyline(
                      color: Colors.black,
                      points: [
                        vehicle.lookAheadStartPosition.latLng,
                        if (tracking.lookAheadVehicleToLineProjection(
                              vehicle,
                              lookAheadDistance,
                            ) !=
                            null)
                          tracking
                              .lookAheadVehicleToLineProjection(
                                vehicle,
                                lookAheadDistance,
                              )!
                              .latLng,
                        tracking
                            .findLookAheadLinePoints(vehicle, lookAheadDistance)
                            .inside
                            .position
                            .latLng,
                        if (tracking
                                .findLookAheadLinePoints(
                                  vehicle,
                                  lookAheadDistance,
                                )
                                .outside !=
                            null)
                          tracking
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
                        tracking
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .best
                            .position
                            .latLng,
                      ],
                      color: Colors.pink,
                    ),
                    if (tracking.lookAheadVehicleToLineProjection(
                          vehicle,
                          lookAheadDistance,
                        ) !=
                        null)
                      Polyline(
                        points: [
                          tracking
                              .lookAheadVehicleToLineProjection(
                                vehicle,
                                lookAheadDistance,
                              )!
                              .latLng,
                          tracking
                              .findLookAheadCirclePoints(
                                vehicle,
                                lookAheadDistance,
                              )
                              .best
                              .position
                              .latLng,
                        ],
                        color: Colors.pink,
                      ),
                    if (tracking
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .worst !=
                        null) ...[
                      Polyline(
                        points: [
                          vehicle.lookAheadStartPosition.latLng,
                          tracking
                              .findLookAheadCirclePoints(
                                vehicle,
                                lookAheadDistance,
                              )
                              .worst!
                              .position
                              .latLng,
                        ],
                        color: Colors.blue,
                      ),
                      if (tracking.lookAheadVehicleToLineProjection(
                            vehicle,
                            lookAheadDistance,
                          ) !=
                          null)
                        Polyline(
                          points: [
                            tracking
                                .lookAheadVehicleToLineProjection(
                                  vehicle,
                                  lookAheadDistance,
                                )!
                                .latLng,
                            tracking
                                .findLookAheadCirclePoints(
                                  vehicle,
                                  lookAheadDistance,
                                )
                                .worst!
                                .position
                                .latLng,
                          ],
                          color: Colors.blue,
                        ),
                    ],
                  ],
                ],
              ),
              CircleLayer(
                circles: [
                  if (tracking.path.length >= 2) ...[
                    CircleMarker(
                      point: tracking.path.first.position.latLng,
                      radius: 5,
                    ),
                    CircleMarker(
                      point: tracking.path.last.position.latLng,
                      radius: 5,
                      color: Colors.red,
                    ),
                  ],
                  if (tracking is PurePursuitPathTracking) ...[
                    CircleMarker(
                      point: vehicle.lookAheadStartPosition.latLng,
                      radius: lookAheadDistance,
                      useRadiusInMeter: true,
                      color: Colors.pink.withOpacity(0.2),
                    ),
                    if (tracking.lookAheadVehicleToLineProjection(
                          vehicle,
                          lookAheadDistance,
                        ) !=
                        null)
                      CircleMarker(
                        point: tracking
                            .lookAheadVehicleToLineProjection(
                              vehicle,
                              lookAheadDistance,
                            )!
                            .latLng,
                        radius: 5,
                        color: Colors.black,
                      ),
                    CircleMarker(
                      point: tracking
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
                    if (tracking
                            .findLookAheadLinePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .outside !=
                        null)
                      CircleMarker(
                        point: tracking
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
                      point: tracking
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
                    if (tracking
                            .findLookAheadCirclePoints(
                              vehicle,
                              lookAheadDistance,
                            )
                            .worst !=
                        null)
                      CircleMarker(
                        point: tracking
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
                    point: tracking.perpendicularIntersect(vehicle).latLng,
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
