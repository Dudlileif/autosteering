import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// A base class for a field.
class Field extends Equatable {
  const Field({
    required this.name,
    this.border = const [],
    this.holes,
  });

  /// Creates a [Field] from a json map object.
  ///
  /// Expects a json map of this format:
  ///```
  /// {
  ///   "name": "some name",
  ///   "border": [
  ///     {
  ///       "coordinates": [
  ///         10.0,
  ///         60.0
  ///       ]
  ///     },
  ///     {
  ///       "coordinates": [
  ///         11.0,
  ///         61.0
  ///       ]
  ///     },
  ///     ...
  ///   ],
  /// "holes": [
  ///     [
  ///       {
  ///         "coordinates": [
  ///           10.0,
  ///           60.0
  ///         ]
  ///       },
  ///       {
  ///         "coordinates": [
  ///           11.0,
  ///           61.0
  ///         ]
  ///       },
  ///       ...
  ///     ]
  ///   ]
  /// }
  /// ```
  Field.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        border = json['border'] != null
            ? List<Map<String, dynamic>>.from(json['border'] as List)
                .map(LatLng.fromJson)
                .toList()
            : [],
        holes = json['holes'] != null
            ? List<List<dynamic>>.from(json['holes'] as List)
                .map(
                  (hole) => List<Map<String, dynamic>>.from(hole)
                      .map(LatLng.fromJson)
                      .toList(),
                )
                .toList()
            : null;

  /// The name of the field.
  final String name;

  /// The border of the field.
  final List<LatLng> border;

  /// A list of borders for holes in the field.
  final List<List<LatLng>>? holes;

  /// A map-ready polygon for the field
  Polygon get polygon => Polygon(
        points: border,
        holePointsList: holes,
        borderStrokeWidth: 1,
        isFilled: true,
        color: Colors.yellow.withOpacity(0.25),
      );

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
    List<LatLng>? border,
    List<List<LatLng>>? holes,
  }) =>
      Field(
        name: name ?? this.name,
        border: border ?? this.border,
        holes: holes ?? this.holes,
      );

  /// Properties used for checking for equality.
  @override
  List<Object?> get props => [
        name,
        border,
        holes,
      ];

  /// Convert the model to a json compatible map.
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    map['name'] = name;
    map['border'] = border;
    map['holes'] = holes;

    return map;
  }
}
