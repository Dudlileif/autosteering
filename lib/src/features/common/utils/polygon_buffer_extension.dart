import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:maps_toolkit2/maps_toolkit2.dart';

/// An extension to allow for interfacing with different geometry and
/// map tool packages to make insetting and extending [map.Polygon]s easy.
/// It also adds getters for the area of the polygon.
extension PolygonBufferExtension on map.Polygon {
  /// A [jts.Coordinate] conversion of the [points], adds the first point at
  /// the end to complete the loop.
  List<jts.Coordinate> get jtsCoordinates =>
      points.map((point) => point.jtsCoordinate).toList()
        ..add(points.first.jtsCoordinate);

  /// A [jts.Coordinate] conversion of the [holePointsList], adds the first
  /// point at the end to complete the loop.
  List<List<jts.Coordinate>>? get jtsHoleCoordinatesList => holePointsList
      ?.map(
        (hole) => hole.map((point) => point.jtsCoordinate).toList()
          ..add(hole.first.jtsCoordinate),
      )
      .toList();

  /// A [jts.LinearRing] of a general list of [jts.Coordinate]s.
  jts.LinearRing _jtsShell(List<jts.Coordinate> coordinates) =>
      jts.LinearRing.fromSequence(
        jts.CoordinateArraySequenceFactory().create(coordinates),
        jts.GeometryFactory.defaultPrecision(),
      );

  /// A [jts.LinearRing] conversion of the polygon's points.
  jts.LinearRing get jtsShell => _jtsShell(jtsCoordinates);

  /// A list of the [jts.LinearRing] holes of the polygon.
  List<jts.LinearRing>? get jtsHoles =>
      jtsHoleCoordinatesList?.map(_jtsShell).toList();

  /// A [jts.Polygon] convserion of [map.Polygon].
  jts.Polygon get jtsPolygon => jts.Polygon.withPrecisionModelSrid(
        jtsShell,
        jtsHoles ?? [],
        jts.PrecisionModel(),
        4326,
      );

  /// A buffered [jts.Geometry] that has been inset and extended by [distance]
  /// meters. We can then choose which part of the inset or extended geometry
  /// we want to use later.
  jts.Geometry jtsBufferedGeometry(jts.Geometry geometry, double distance) =>
      geometry.buffer(distance);

  /// The buffered [LatLng] points for a geometry that has been inset or
  /// extended by [distance] meters. Insetting requires negative [distance],
  /// extending requires positive [distance].
  List<LatLng> bufferedPoints(jts.Geometry from, double distance) {
    final geometry = jtsBufferedGeometry(from, 2 * distance.abs());
    if (geometry is jts.Polygon) {
      // Get the inner buffer hole ring
      if (distance.isNegative) {
        if (geometry.holes != null) {
          if (geometry.holes!.isNotEmpty) {
            return geometry.holes!.first
                .getCoordinates()
                .map((e) => e.latLng)
                .toList()
              ..removeLast();
          }
        }
      }
      // Skip calculations if distance is 0
      else if (distance == 0) {
        return points;
      }
      // Get the outer buffer shell
      if (geometry.shell != null) {
        return geometry.shell!
            .getCoordinates()
            .map((coordinate) => coordinate.latLng)
            .toList()
          ..removeLast();
      }
    }
    return geometry.getCoordinates().map((e) => e.latLng).toList();
  }

  /// The buffered [LatLng] points for a polygon's holes that has been inset or
  /// extended by [distance] meters. Insetting requires negative [distance],
  /// extending requires positive [distance].
  List<List<LatLng>>? bufferedHolesPoints(double distance) {
    if (holePointsList == null) {
      return null;
    }
    return jtsHoles!.map((hole) => bufferedPoints(hole, distance)).toList();
  }

  /// An inset or extended polygon that has been extended or inset by
  /// [distance] meters. Insetting requires negative [distance], extending
  /// requires positive [distance]. [holeDistance] needs to be set if the
  /// holes also should be inset/extended.
  map.Polygon bufferedPolygon({
    double? distance,
    double? holeDistance,
  }) =>
      copyWith(
        points: distance != null ? bufferedPoints(jtsShell, distance) : points,
        holePointsList: holeDistance != null
            ? bufferedHolesPoints(holeDistance)
            : holePointsList,
      );

  /// Area of the polygon in square meters.
  double get area => SphericalUtil.computeArea(points).toDouble();

  /// Area of the polygon with the area of the holes deducted.
  double get areaWithoutHoles => area - holesArea;

  /// Area of the holes in the polygon.
  double get holesArea =>
      holePointsList?.fold(
        0,
        (previousValue, hole) => previousValue != null
            ? previousValue + SphericalUtil.computeArea(hole).toDouble()
            : SphericalUtil.computeArea(hole).toDouble(),
      ) ??
      0;

  /// Whether this polygon contains the [point];
  bool contains(LatLng point) => jtsPolygon.contains(point.jtsPoint);
}
