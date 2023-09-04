import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:geobase/geobase.dart';

/// A base class for a field.
class Field with EquatableMixin {
  /// A class for representing a field in the real world.
  ///
  /// The field needs a [name] for identifying purposes.
  Field({
    required this.name,
    required this.polygon,
    required this.boundingBox,
    DateTime? lastUsed,
  }) : lastUsed = lastUsed ?? DateTime.now();

  /// Creates a [Field] from a json map object.
  ///
  /// Expects a json map of this format:
  ///
  ///```
  /// {
  ///   "name": "some name",
  ///   "polygon": "{\"type\":\"Polygon\",\"coordinates\":[[[10, 60], [11, 60], [11, 61], [10, 61]]]
  /// }
  /// ```
  ///
  /// Caution, the "polygon" field stores a *string* of a GeoJson polygon, not
  /// the GeoJson polygon itself.

  factory Field.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String;
    final lastUsed = DateTime.tryParse(json['last_used'] as String);
    final polygon = Polygon.parse(json['polygon'] as String);
    final boundingBox = polygon.exterior != null
        ? GeoBox.from(polygon.exterior!.toGeographicPositions)
        : null;
    return Field(
      name: name,
      polygon: polygon,
      boundingBox: boundingBox,
      lastUsed: lastUsed,
    );
  }

  /// The name of the field.
  final String name;

  /// The polygon that contains the exterior boundary and interior boundaries
  /// if there are any.
  final Polygon polygon;

  /// The bounding box of the field.
  ///
  /// The box has parameters for the min and max for both longitude and
  /// latitude.
  final GeoBox? boundingBox;

  /// The last time this field was used.
  DateTime lastUsed;

  /// A map-ready polygon for the field
  map.Polygon get mapPolygon => map.Polygon(
        points: polygon.exterior != null
            ? polygon.exterior!.toGeographicPositions
                .map((point) => point.latLng)
                .toList()
            : [],
        holePointsList: polygon.interior
            .map(
              (hole) => hole.toGeographicPositions
                  .map((point) => point.latLng)
                  .toList(),
            )
            .toList(),
        borderStrokeWidth: 1,
        isFilled: true,
        color: Colors.yellow.withOpacity(0.25),
      );

  /// Map the [polygon]'s exterior ring points with [map].
  Iterable<T> mapExteriorPoints<T>(
    T Function(Geographic point) map,
  ) =>
      polygon.exterior != null
          ? polygon.exterior!.toGeographicPositions.map((point) => map(point))
          : [];

  /// Map the [polygon]'s interior rings' points with [map].
  Iterable<Iterable<T>> mapInteriorPoints<T>(
    T Function(Geographic point) map,
  ) =>
      polygon.interior.map(
        (interior) => interior.toGeographicPositions.map((point) => map(point)),
      );

  /// Map the [boundingBox] corner points with [map].
  Iterable<T> mapBoundingBox<T>(
    T Function(Geographic point) map,
  ) =>
      boundingBox != null
          ? boundingBox!.corners2D.map((point) => map(point))
          : [];

  /// Map the [polygon]'s exterior ring points and their index with [map].
  Iterable<T> mapIndexedExteriorPoints<T>(
    T Function(int index, Geographic point) map,
  ) =>
      polygon.exterior != null
          ? polygon.exterior!.toGeographicPositions
              .mapIndexed((index, point) => map(index, point))
          : [];

  /// Map the [polygon]'s interior rings' points and their index with [map].
  Iterable<Iterable<T>> mapIndexedInteriorPoints<T>(
    T Function(int index, Geographic point) map,
  ) =>
      polygon.interior.map(
        (interior) => interior.toGeographicPositions
            .mapIndexed((index, point) => map(index, point)),
      );

  /// Map the [boundingBox] corner points and their index with [map].
  Iterable<T> mapIndexedBoundingBox<T>(
    T Function(int index, Geographic point) map,
  ) =>
      boundingBox != null
          ? boundingBox!.corners2D
              .mapIndexed((index, point) => map(index, point))
          : [];

  /// The area of the whole field.
  ///
  /// Unit: square meters
  double get area => polygon.area;

  /// The area of the field with the area of the holes deducted.
  ///
  /// Unit: square meters
  double get areaWithoutHoles => polygon.areaWithoutHoles;

  /// The area of the holes in the field.
  ///
  /// Unit: square meters
  double get holesArea => polygon.holesArea;

  /// Returns a new [Field] based on the this one, but with
  /// parameters/variables altered.
  Field copyWith({
    String? name,
    Polygon? polygon,
    GeoBox? boundingBox,
    DateTime? lastUsed,
  }) =>
      Field(
        name: name ?? this.name,
        polygon: polygon ?? this.polygon,
        boundingBox: boundingBox ?? this.boundingBox,
        lastUsed: lastUsed ?? this.lastUsed,
      );

  /// Properties used for checking for equality.
  @override
  List<Object?> get props => [
        name,
        polygon,
        boundingBox,
        lastUsed,
      ];

  /// Convert the model to a json compatible map.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['name'] = name;
    map['last_used'] = lastUsed.toIso8601String();
    map['polygon'] = polygon.toText();
    return map;
  }
}
