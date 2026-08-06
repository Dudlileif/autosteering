// Copyright (C) 2026 Gaute Hagen
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
import 'package:autosteering/src/features/equipment/equipment.dart';
import 'package:autosteering/src/features/implement/implement.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart';

/// A map preview of the currently configured implement.
class ImplementPreview extends ConsumerStatefulWidget {
  /// A map preview of the currently configured implement.
  ImplementPreview({
    required Equipment implement,
    this.activeSections = const {},
    super.key,
  }) : implement = implement.copyWith(
         position: const Geographic(lat: 0, lon: 0),
         bearing: 0,
       );

  /// The implement for preview.
  final Equipment implement;

  /// Which sections are activated.
  final Set<int> activeSections;

  @override
  ConsumerState<ImplementPreview> createState() => _ImplementPreviewState();
}

class _ImplementPreviewState extends ConsumerState<ImplementPreview> {
  final mapController = MapController();

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.brightnessOf(context);
    final textTheme = TextTheme.of(context);
    final colorScheme = ColorScheme.of(context);

    final implement = widget.implement;

    final bounds = implement.mapPolygons.isNotEmpty
        ? LatLngBounds.fromPoints(
            [
              implement.mapPolygons
                  .map(
                    (p) => [p.boundingBox.northWest, p.boundingBox.southEast],
                  )
                  .flattenedToList,
              implement.connectors.map((c) => c.position(implement).latLng),
            ].flattenedToList,
          )
        : LatLngBounds(
            const Geographic(
              lat: 0,
              lon: 0,
            ).spherical.destinationPoint(distance: 3, bearing: 45).latLng,
            const Geographic(
              lat: 0,
              lon: 0,
            ).spherical.destinationPoint(distance: 3, bearing: 225).latLng,
          );

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        backgroundColor: Colors.transparent,
        initialCameraFit: .bounds(bounds: bounds, padding: const .all(8)),
        interactionOptions: const InteractionOptions(
          flags:
              InteractiveFlag.pinchZoom |
              InteractiveFlag.doubleTapZoom |
              InteractiveFlag.scrollWheelZoom |
              InteractiveFlag.drag,
        ),
      ),
      children: [
        PolygonLayer(
          polygons: [
            ...widget.activeSections
                .map(
                  (index) => implement
                      .implementPreviewWorkingAreaMapPolygon(index)
                      ?.copyWith(
                        color:
                            (implement.sections[index].workedPathColor ??
                                    colorScheme.primary)
                                .withValues(alpha: 0.4),
                      ),
                )
                .nonNulls,
            ...implement.drawbarMapPolygons,
            ...implement.sectionWorkingMapPolygons.whereIndexed(
              (index, _) => !widget.activeSections.contains(index),
            ),
            ...widget.activeSections
                .map(
                  (index) => implement
                      .sectionWorkingMapPolygon(index)
                      ?.copyWith(
                        color: (implement.sections[index].color ?? Colors.green)
                            .withValues(alpha: 0.8),
                        borderStrokeWidth: 3,
                        borderColor: switch (brightness) {
                          .light => Colors.black,
                          .dark => Colors.white,
                        },
                      ),
                )
                .nonNulls,
          ],
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: implement.position.latLng,
              alignment: .center,
              child: Material(
                type: .circle,
                elevation: 2,
                color: Colors.redAccent.shade700,
                child: Center(
                  child: Text(
                    'Ref',
                    textAlign: .center,
                    style: textTheme.labelSmall?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
            if (ref.watch(
              implementConfiguratorIndexProvider.select((i) => i == 0),
            ))
              ...implement.connectors.mapIndexed(
                (index, connector) => Marker(
                  point: connector.position(implement).latLng,
                  alignment: .center,
                  child: Stack(
                    alignment: .center,
                    children: [
                      Align(
                        alignment: .topCenter,
                        child: ClipRect(
                          child: Align(
                            alignment: .topCenter,
                            heightFactor: 0.5,
                            child: Material(
                              type: .circle,
                              elevation: 4,
                              color: switch (connector.type) {
                                .fixed => Colors.blueAccent,
                                .drawbar => Colors.orangeAccent,
                              },
                              child: const SizedBox.square(
                                dimension: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: .bottomCenter,
                        child: ClipRect(
                          child: Align(
                            alignment: .bottomCenter,
                            heightFactor: 0.5,
                            child: Material(
                              elevation: 4,
                              type: .circle,
                              color: switch (connector.relation) {
                                .parent => Colors.redAccent,
                                .child => Colors.greenAccent,
                              },
                              child: const SizedBox.square(
                                dimension: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextWithStroke(
                        '${index + 1}',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                        strokeWidth: 3.5,
                      ),
                    ],
                  ),
                ),
              ),
            ...widget.activeSections.map(
              (index) => Marker(
                alignment: .center,
                point: implement.sectionCenter(index).latLng,
                child: Material(
                  type: .circle,
                  elevation: 1,
                  color: Colors.lightGreenAccent.shade700,
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      textAlign: .center,
                      style: textTheme.labelSmall?.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: .topLeft,
          child: Padding(
            padding: const .only(left: 8),
            child: IconButton(
              onPressed: () => mapController.fitCamera(
                .bounds(bounds: bounds, padding: const .all(8)),
              ),
              icon: const Icon(Icons.fit_screen),
            ),
          ),
        ),
      ],
    );
  }
}
