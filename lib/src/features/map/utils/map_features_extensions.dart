import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

extension PolygonCopyWith on Polygon {
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

extension PolylineCopyWith on Polyline {
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
