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

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// An extension to allow for using [copyWith] on [Polygon].
extension PolygonCopyWith on Polygon {
  /// Returns a [Polygon] with altered parameters.
  Polygon copyWith({
    List<LatLng>? points,
    List<List<LatLng>>? holePointsList,
    Color? color,
    double? borderStrokeWidth,
    Color? borderColor,
    bool? disableHolesBorder,
    bool? isDotted,
    bool? isFilled,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    String? label,
    TextStyle? labelStyle,
    PolygonLabelPlacement? labelPlacement,
    bool? rotateLabel,
  }) =>
      Polygon(
        points: points ?? this.points,
        holePointsList: holePointsList ?? this.holePointsList,
        color: color ?? this.color,
        borderStrokeWidth: borderStrokeWidth ?? this.borderStrokeWidth,
        borderColor: borderColor ?? this.borderColor,
        disableHolesBorder: disableHolesBorder ?? this.disableHolesBorder,
        isDotted: isDotted ?? this.isDotted,
        isFilled: isFilled ?? this.isFilled,
        strokeCap: strokeCap ?? this.strokeCap,
        strokeJoin: strokeJoin ?? this.strokeJoin,
        label: label ?? this.label,
        labelStyle: labelStyle ?? this.labelStyle,
        labelPlacement: labelPlacement ?? this.labelPlacement,
        rotateLabel: rotateLabel ?? this.rotateLabel,
      );
}

/// An extension to allow for using [copyWith] on [Polyline].
extension PolylineCopyWith on Polyline {
  /// Returns a [Polyline] with altered parameters.
  Polyline copyWith({
    List<LatLng>? points,
    double? strokeWidth,
    Color? color,
    double? borderStrokeWidth,
    Color? borderColor,
    List<Color>? gradientColors,
    List<double>? colorsStop,
    bool? isDotted,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    bool? useStrokeWidthInMeter,
  }) =>
      Polyline(
        points: points ?? this.points,
        strokeWidth: strokeWidth ?? this.strokeWidth,
        color: color ?? this.color,
        borderStrokeWidth: borderStrokeWidth ?? this.borderStrokeWidth,
        borderColor: borderColor ?? this.borderColor,
        gradientColors: gradientColors ?? this.gradientColors,
        colorsStop: colorsStop ?? this.colorsStop,
        isDotted: isDotted ?? this.isDotted,
        strokeCap: strokeCap ?? this.strokeCap,
        strokeJoin: strokeJoin ?? this.strokeJoin,
        useStrokeWidthInMeter:
            useStrokeWidthInMeter ?? this.useStrokeWidthInMeter,
      );
}
