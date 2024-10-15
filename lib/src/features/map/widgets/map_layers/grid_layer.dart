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

import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/map/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geobase/geobase.dart' hide Point;
import 'package:latlong2/latlong.dart';

/// A map layer with grid lines for easier depiction of distance.
class GridLayer extends ConsumerWidget {
  /// A map layer with grid lines for easier depiction of distance.
  const GridLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = MapCamera.of(context);
    final origo =
        // ref.watch(
        //       activeFieldProvider.select((value) => value?.boundingBox?.min),
        //     ) ??
        ref.watch(homePositionProvider).geoPosition;

    final vertical = Grid.verticalLines(origo, camera);
    final horizontal = Grid.horizontalLines(origo, camera);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    if (ref.watch(showGridSizeIndicatorProvider)) {
    ref.read(mapGridSizeProvider.notifier).update(vertical.size);
    }
    return PolylineLayer(
      polylines: [
        ...vertical.lines.map(
          (line) => Polyline(
            points: line,
            color: isDarkMode ? Colors.white : Colors.black,
            strokeWidth: 0.3,
          ),
        ),
        ...horizontal.lines.map(
          (line) => Polyline(
            points: line,
            color: isDarkMode ? Colors.white : Colors.black,
            strokeWidth: 0.3,
          ),
        ),
      ],
    );
  }
}

/// A class for generating grids to show on the map.
class Grid {
  /// Finds a grid size in meters that fits and scales with the [camera] zoom
  /// and size.
  ///
  /// The size is determined by the diagonal distance in meters between two
  /// opposite screen corners. The size will always be 1, 2 or 5 times a power
  /// of 10, but not lower that 10, i.e. 10, 20, 50, 100, 200... etc.
  static double _findGridSize(MapCamera camera) {
    final diagonal =
        camera
        .pointToLatLng(const Point(0, 0))
        .geoPosition
        .spherical
        .distanceTo(
          camera.pointToLatLng(camera.nonRotatedSize).geoPosition,
            );
    final exponent = (log(diagonal) / ln10).ceil().clamp(3, 8);

    final leading = diagonal.truncate() ~/ pow(10, exponent - 1);
    final multiplier = switch (leading) {
      > 5 => 5,
      > 2 => 2,
      _ => 1,
    }
        .toDouble();

    final spacing = multiplier * pow(10, exponent - 2);
    return spacing;
  }

  /// Finds and returns the vertical (north-south) lines which intersects the
  /// [camera]'s [MapCamera.visibleBounds]. The [origo] is the starting point of
  /// the line that all the others are offset from.
  static ({List<List<LatLng>> lines, double size}) verticalLines(
    Geographic origo,
    MapCamera camera,
  ) {
    final geoBox = GeoBox(
      west: camera.visibleBounds.west,
      south: camera.visibleBounds.south,
      east: camera.visibleBounds.east,
      north: camera.visibleBounds.north,
    );

    final eastExtensionPoint =
        origo.spherical.destinationPoint(distance: 100, bearing: 90);

    final origoToCameraBoxMinDistance =
        geoBox.min.spherical.alongTrackDistanceTo(
      start: origo,
      end: eastExtensionPoint,
    );

    final origoToCameraBoxMaxDistance =
        geoBox.max.spherical.alongTrackDistanceTo(
      start: origo,
      end: eastExtensionPoint,
    );

    final spacing = _findGridSize(camera);

    final lines = <List<LatLng>>[];

    var offset = (origoToCameraBoxMinDistance ~/ spacing) * spacing;
    while (offset < origoToCameraBoxMaxDistance) {
      final offsetPoint =
          origo.rhumb.destinationPoint(distance: offset, bearing: 90);
      lines.add([
        offsetPoint.copyWith(y: camera.visibleBounds.south).latLng,
        offsetPoint.copyWith(y: camera.visibleBounds.north).latLng,
      ]);
      offset += spacing;
    }

    return (lines: lines, size: spacing);
  }

  /// Finds and returns the horizontal (east-west) lines which intersects the
  /// [camera]'s [MapCamera.visibleBounds]. The [origo] is the starting point of
  /// the line that all the others are offset from.
  static ({List<List<LatLng>> lines, double size}) horizontalLines(
    Geographic origo,
    MapCamera camera,
  ) {
    final geoBox = GeoBox(
      west: camera.visibleBounds.west,
      south: camera.visibleBounds.south,
      east: camera.visibleBounds.east,
      north: camera.visibleBounds.north,
    );

    final northExtensionPoint =
        origo.spherical.destinationPoint(distance: 100, bearing: 0);

    final origoToCameraBoxMinDistance =
        geoBox.min.spherical.alongTrackDistanceTo(
      start: origo,
      end: northExtensionPoint,
    );

    final origoToCameraBoxMaxDistance =
        geoBox.max.spherical.alongTrackDistanceTo(
      start: origo,
      end: northExtensionPoint,
    );

    final spacing = _findGridSize(camera);

    final lines = <List<LatLng>>[];

    var offset = (origoToCameraBoxMinDistance ~/ spacing) * spacing;
    while (offset < origoToCameraBoxMaxDistance) {
      final offsetPoint =
          origo.rhumb.destinationPoint(distance: offset, bearing: 0);
      lines.add([
        offsetPoint.copyWith(x: camera.visibleBounds.west).latLng,
        offsetPoint.copyWith(x: camera.visibleBounds.east).latLng,
      ]);
      offset += spacing;
    }

    return (lines: lines, size: spacing);
  }
}
