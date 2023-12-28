import 'dart:convert';
import 'dart:math';

import 'package:autosteering/src/features/common/common.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:geobase/geobase.dart';

/// An extension to allow for interfacing with different geometry and
/// map tool packages to make insetting and extending [Polygon]s easy.
/// It also adds getters for the area of the polygon.
extension PolygonBufferExtension on Polygon {
  /// The buffered [Geographic] points for a geometry that has been inset or
  /// extended by [distance] meters. Insetting requires negative [distance],
  /// extending requires positive [distance].
  PositionSeries bufferedPoints({
    required PositionSeries ring,
    required double distance,
    BufferJoin joinType = BufferJoin.round,
    bool getRawPoints = false,
  }) =>
      PositionSeries.view(
        RingBuffer.bufferCircular(
          ring: ring.toGeographicPositions,
          distance: distance,
          joinType: joinType,
          getRawPoints: getRawPoints,
        ).map((point) => point.values).flattened.toList(),
      );

  /// The buffered [PositionSeries] for a polygon's holes that has been inset or
  /// extended by [distance] meters. Insetting requires negative [distance],
  /// extending requires positive [distance].
  Iterable<PositionSeries> bufferedInterior({
    required double distance,
    BufferJoin joinType = BufferJoin.round,
    bool getRawPoints = false,
  }) =>
      interior.map(
        (hole) => bufferedPoints(
          ring: hole,
          distance: distance,
          joinType: joinType,
          getRawPoints: getRawPoints,
        ),
      );

  /// An inset or extended polygon that has been extended or inset by
  /// [exteriorDistance] meters. Insetting requires negative
  /// [exteriorDistance], extending requires positive [exteriorDistance].
  /// [interiorDistance] needs to be set if the interior holes also should be
  /// inset/extended.
  Polygon bufferedPolygon({
    double? exteriorDistance,
    double? interiorDistance,
    BufferJoin exteriorJoinType = BufferJoin.round,
    BufferJoin interiorJoinType = BufferJoin.round,
    bool getRawPoints = false,
  }) =>
      Polygon([
        if (exteriorDistance != null && exterior != null)
          bufferedPoints(
            ring: exterior!,
            distance: exteriorDistance,
            joinType: exteriorJoinType,
            getRawPoints: getRawPoints,
          )
        else if (exterior != null)
          exterior!,
        if (interiorDistance != null)
          ...bufferedInterior(
            distance: interiorDistance,
            joinType: interiorJoinType,
            getRawPoints: getRawPoints,
          )
        else
          ...interior,
      ]);

  /// A JSON string compatible verison of [bufferedPolygon].
  ///
  /// Primarly used to run the buffer operation in an isolate.
  static String bufferedPolygonFromJson(String json) {
    final data = Map<String, dynamic>.from(jsonDecode(json) as Map);
    final polygon = Polygon.parse(data['polygon'] as String);

    return polygon
        .bufferedPolygon(
          exteriorDistance: (data['exterior_distance'] as num).toDouble(),
          interiorDistance: (data['interior_distance'] as num).toDouble(),
          exteriorJoinType: BufferJoin.values.firstWhere(
            (element) => element.name == (data['exterior_join_type'] as String),
          ),
          interiorJoinType: BufferJoin.values.firstWhere(
            (element) => element.name == (data['interior_join_type'] as String),
          ),
          getRawPoints: data['get_raw_points'] as bool,
        )
        .toString();
  }

  /// Area of the polygon in square meters.
  double get area => exterior != null
      ? computeArea(exterior!.toGeographicPositions).toDouble()
      : 0;

  /// Area of the polygon with the area of the holes deducted.
  double get areaWithoutHoles => area - holesArea;

  /// Area of the holes in the polygon.
  double get holesArea =>
      interior.fold(
        0,
        (previousValue, hole) => previousValue != null
            ? previousValue + computeArea(hole.toGeographicPositions).toDouble()
            : computeArea(hole.toGeographicPositions).toDouble(),
      ) ??
      0;

  /// Whether this polygon contains the [point].
  ///
  /// If [onlyExteriorBounds] is true, then [point] will be regarded as
  /// contained when inside the [exterior] even though it may be within an
  /// [interior] hole of the polygon.
  bool contains(Geographic point, {bool onlyExteriorBounds = false}) {
    if (exterior == null) {
      return false;
    }
    final exteriorContains =
        point.isWithinRing(exterior!.toGeographicPositions);
    return switch (onlyExteriorBounds || interior.isEmpty) {
      true => exteriorContains,
      false => exteriorContains &&
          !interior
              .map((hole) => point.isWithinRing(hole.toGeographicPositions))
              .any((element) => element == true)
    };
  }

  /// Returns the area of a closed path on Earth in square meters.
  ///
  /// [path] A closed path.
  static num computeArea(Iterable<Geographic> path) =>
      computeSignedArea(path).abs();

  /// Returns the signed area of a closed path on Earth in square meters.
  /// The sign of the area may be used to determine the orientation of the path.
  /// "inside" is the surface that does not contain the South Pole.
  ///
  /// [path] A closed path.
  ///
  static num computeSignedArea(Iterable<Geographic> path) =>
      _computeSignedArea(path, 6371000);

  /// Returns the signed area of a closed [path] on a sphere of given [radius].
  /// The computed area uses the same units as the radius squared.
  static num _computeSignedArea(Iterable<Geographic> path, num radius) {
    if (path.length < 3) {
      return 0;
    }

    final prev = path.last;
    var prevTanLat = tan((pi / 2 - prev.lat.toRadians()) / 2);
    var prevLng = prev.lon.toRadians();

    // For each edge, accumulate the signed area of the triangle formed by the
    // North Pole and that edge ("polar triangle").
    final total = path.fold<num>(0.0, (value, point) {
      final tanLat = tan((pi / 2 - point.lat.toRadians()) / 2);
      final lng = point.lon.toRadians();

      value += _polarTriangleArea(tanLat, lng, prevTanLat, prevLng);

      prevTanLat = tanLat;
      prevLng = lng;

      return value;
    });

    return total * (radius * radius);
  }

  /// Returns the signed area of a triangle which has North Pole as a vertex.
  /// Formula derived from "Area of a spherical triangle given two edges and
  /// the included angle" as per "Spherical Trigonometry" by Todhunter, page 71,
  /// section 103, point 2.
  /// See http://books.google.com/books?id=3uBHAAAAIAAJ&pg=PA71
  ///
  /// The arguments named "tan" are tan((pi/2 - latitude)/2).
  static num _polarTriangleArea(num tan1, num lng1, num tan2, num lng2) {
    final deltaLng = lng1 - lng2;
    final t = tan1 * tan2;
    return 2 * atan2(t * sin(deltaLng), 1 + t * cos(deltaLng));
  }

  /// Creates a polygon for use with flutter_map from the [exterior] and
  /// [interior], either which can be disabled with [withExterior] or
  /// [withInteriorHoles].
  map.Polygon mapPolygon({
    bool withExterior = true,
    bool withInteriorHoles = true,
    Color color = const Color(0xFF00FF00),
    double borderStrokeWidth = 0.0,
    Color borderColor = const Color(0xFFFFFF00),
    bool disableHolesBorder = false,
    bool isDotted = false,
    bool isFilled = false,
    StrokeCap strokeCap = StrokeCap.round,
    StrokeJoin strokeJoin = StrokeJoin.round,
    String? label,
    TextStyle labelStyle = const TextStyle(),
    map.PolygonLabelPlacement labelPlacement =
        map.PolygonLabelPlacement.centroid,
    bool rotateLabel = false,
  }) =>
      map.Polygon(
        points: switch (withExterior && exterior != null) {
          true => exterior!.toGeographicPositions.map((e) => e.latLng).toList(),
          false => []
        },
        holePointsList: switch (withInteriorHoles) {
          true => interior
              .map(
                (hole) => hole.toGeographicPositions
                    .map((point) => point.latLng)
                    .toList(),
              )
              .toList(),
          false => []
        },
        color: color,
        borderStrokeWidth: borderStrokeWidth,
        borderColor: borderColor,
        disableHolesBorder: disableHolesBorder,
        isDotted: isDotted,
        isFilled: isFilled,
        strokeCap: strokeCap,
        strokeJoin: strokeJoin,
        label: label,
        labelStyle: labelStyle,
        labelPlacement: labelPlacement,
        rotateLabel: rotateLabel,
      );
}
