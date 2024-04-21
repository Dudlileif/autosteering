// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/guidance/guidance.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A combination layer for the [PathTracking] functionality.
class PathTrackingLayer extends ConsumerWidget {
  /// A combination layer for the [PathTracking] functionality.
  const PathTrackingLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(configuredPathTrackingProvider);
    final tracking = ref.watch(displayPathTrackingProvider);
    final vehicle = ref.watch(mainVehicleProvider);
    final lookAheadDistance = vehicle.lookAheadDistance;
    final debug = ref.watch(debugPathTrackingProvider);
    final theme = Theme.of(context);
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
                  if (tracking is PurePursuitPathTracking &&
                      debug) ...[
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
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                    ),
                    if (tracking.lookAheadVehicleToLineProjection(
                          vehicle,
                          lookAheadDistance,
                        ) !=
                        null)
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
                    if (debug) ...[
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
                  ],
                  CircleMarker(
                    point: tracking.perpendicularIntersect(vehicle).latLng,
                    radius: 5,
                    color: Colors.red,
                  ),
                ],
              ),
              if (debug)
                MarkerLayer(
                  markers: tracking.path
                      .mapIndexed(
                        (index, e) => Marker(
                          rotate: true,
                          point: e.position.latLng,
                          child: TextWithStroke(
                            '$index',
                            strokeWidth: 3,
                            style: theme.menuButtonWithChildrenText
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                      .toList(),
                ),
            ]
          : const [],
    );
  }
}
