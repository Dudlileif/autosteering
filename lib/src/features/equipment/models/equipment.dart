import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// A class for equipment used for working on the fields.
class Equipment extends Hitchable with EquatableMixin {
  /// A class for equipment used for working on the fields.
  ///
  /// The required [hitchType] specifies how this equipment connects to a
  /// parent.
  ///
  /// The number of [segments] must correspond with the length of
  /// [segmentWidths].
  ///
  /// The [length] refers to the length of the working area, and the
  /// [drawbarLength] how long the drawbar(s) is/are. The working area starts
  /// after the drawbar.
  ///
  /// To add child hitches to the equipment, set the distance from the hitch
  /// point to the corresponding [hitchToChildFrontFixedHitchLength],
  /// [hitchToChildRearFixedHitchLength], [hitchToChildRearTowbarHitchLength]
  /// depending on which hitch(es) you wan't to add.
  ///
  /// The [bearing] and [position] parameters generally doesn't need to be
  /// set, as the equipment usually doesn't spawn/show initially without a
  /// parent to inherit position and bearing from.
  Equipment({
    required this.hitchType,
    super.hitchParent,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
    this.segments = 4,
    this.segmentWidths = const [3, 3, 3, 3],
    this.length = 2,
    this.drawbarLength = 1,
    this.hitchToChildFrontFixedHitchLength,
    this.hitchToChildRearFixedHitchLength,
    this.hitchToChildRearTowbarHitchLength,
    double bearing = 0,
    LatLng position = const LatLng(0, 0),
  })  : assert(
          segmentWidths.length == segments,
          'The number of segment widths must match the number of segments.',
        ),
        activeSegments = List.generate(segments, (index) => false),
        _position = position,
        _bearing = hitchParent?.bearing ?? bearing;

  /// Which type of hitch point this equipment has.
  HitchType hitchType;

  /// The number of segments the equipment working area is made of.
  int segments;

  /// The width of each of the segments.
  List<double> segmentWidths;

  /// A list for showing which segements are activated.
  List<bool> activeSegments;

  /// The total length of the equipment, from the front hitch point to the
  /// rear of the equipment.
  double length;

  /// The length from the front hitch point to the start of the main equipment
  /// working area/segments.
  double drawbarLength;

  /// The length from the hitch point to the child fixed hitch at the front,
  /// if there is one.
  double? hitchToChildFrontFixedHitchLength;

  /// The length from the primary hitch point to the child fixed hitch at the
  /// rear, if there is one.
  double? hitchToChildRearFixedHitchLength;

  /// The length from the primary hitch point to the child rear towbar hitch at
  /// the rear, if there is one.
  double? hitchToChildRearTowbarHitchLength;

  /// The position of the equipment, used to specifically set the [position].
  LatLng _position = const LatLng(0, 0);

  /// The velocity of the equipment, used to specifically set the [velocity].
  double _velocity = 0;

  /// The bearing of the equipment, used to specifically set the [bearing].
  double _bearing = 0;

  /// The position of the hitch point of the equipment, will use the parent's
  /// hitch point if connected.
  ///
  /// All geometry calculations for this equipment is based on this point.
  @override
  LatLng get position => parentHitchPoint ?? _position;

  /// Manually update the position of the equipment to [value].
  @override
  set position(LatLng value) => _position = value;

  /// The velocity of the equipment, will use the parent's velocity if the
  /// connection is fixed, otherwise the explicitly set [_velocity].
  @override
  double get velocity {
    if (hitchParent != null && parentHitch != Hitch.rearTowbar) {
      return hitchParent!.velocity;
    }
    return _velocity;
  }

  /// Manually update the velocity of the equipment to [value].
  @override
  set velocity(double value) => _velocity = value;

  /// The bearing/bearing of the equipment, will use the parent's bearing if
  /// connection is fixed, otherwise the explicitly set [_bearing].
  @override
  double get bearing {
    if (hitchParent != null && parentHitch != Hitch.rearTowbar) {
      return switch (hitchParent! is ArticulatedTractor) {
        true => parentHitch == Hitch.frontFixed
            ? (hitchParent! as ArticulatedTractor).frontAxleAngle
            : (hitchParent! as ArticulatedTractor).rearAxleAngle + 180,
        false => hitchParent!.bearing,
      };
    }
    return _bearing;
  }

  /// Manually update the bearing of the equipment to [value].
  @override
  set bearing(double value) => _bearing = value;

  /// The total width of the equipment. Found by summing the [segmentWidths].
  double get width => segmentWidths.sum;

  /// Run the given [function] on this and all of its children recursively.
  ///
  ///  Mainly used to update a Map of equipments in a provider.
  void runFunctionRecursively(void Function(Equipment equipment) function) {
    function(this);
    for (final element in hitchChildren.whereType<Equipment>()) {
      function(element);
      element.runFunctionRecursively(function);
    }
  }

  /// Activate the given [segment].
  void activateSegment(int segment) => activeSegments[segment] = true;

  /// Deactivate the given [segment].
  void deActivateSegment(int segment) => activeSegments[segment] = false;

  /// Toggle the given [segment].
  void toggleSegment(int segment) =>
      activeSegments[segment] = !activeSegments[segment];

  /// Activate the given [segments].
  void activateSegments(List<int> segmentsToActivate) {
    for (final segment in segmentsToActivate) {
      activeSegments[segment] = true;
    }
  }

  /// Deactivate the given [segments].
  void deactivateSegments(List<int> segmentsToDeactivate) {
    for (final segment in segmentsToDeactivate) {
      activeSegments[segment] = false;
    }
  }

  /// Toggle the given [segments].
  void toggleSegments(List<int> segmentsToToggle) {
    for (final segment in segmentsToToggle) {
      activeSegments[segment] = !activeSegments[segment];
    }
  }

  /// Activate all of the [segments].
  void activateAll() =>
      activeSegments = List.generate(segments, (index) => true);

  /// Deactivate all of the [segments].
  void deactivateAll() =>
      activeSegments = List.generate(segments, (index) => false);

  /// Toggle all of the [segments].
  void toggleAll() => activeSegments = activeSegments.map((e) => !e).toList();

  /// The hitch connection position where this equipment is attached to the
  /// [hitchParent], if it's connected.
  LatLng? get parentHitchPoint => switch (parentHitch != null) {
        true => switch (parentHitch!) {
            Hitch.frontFixed => hitchParent!.hitchFrontFixedPoint,
            Hitch.rearFixed => hitchParent!.hitchRearFixedPoint,
            Hitch.rearTowbar => hitchParent!.hitchRearTowbarPoint,
          },
        false => null,
      };

  /// The position of the front fixed child hitch on this equipment, if there is
  /// one.
  @override
  LatLng? get hitchFrontFixedPoint =>
      switch (hitchToChildFrontFixedHitchLength != null) {
        true => position.offset(hitchToChildFrontFixedHitchLength!, bearing),
        false => null
      };

  /// The position of the rear fixed child hitch on this equipment, if there is
  /// one.
  @override
  LatLng? get hitchRearFixedPoint =>
      switch (hitchToChildRearFixedHitchLength != null) {
        true =>
          position.offset(hitchToChildRearFixedHitchLength!, bearing + 180),
        false => null
      };

  /// The position of the rear towbar child hitch on this equipment, if there is
  /// one.
  @override
  LatLng? get hitchRearTowbarPoint =>
      switch (hitchToChildRearTowbarHitchLength != null) {
        true =>
          position.offset(hitchToChildRearTowbarHitchLength!, bearing + 180),
        false => null
      };

  /// Update the [bearing] and [velocity] of the equipment when using connected
  /// to parent with a towbar.
  void updateTowbar() {
    if (hitchParent != null && parentHitch == Hitch.rearTowbar) {
      final hitchAngle = jts.Angle.angleBetweenOriented(
        workingCenter.jtsCoordinate,
        position.jtsCoordinate,
        hitchParent!.position.jtsCoordinate,
      );

      final bearingChange = hitchParent!.velocity /
          (drawbarLength + length / 2) *
          sin(hitchAngle);

      // Only change bearing if we're moving.
      if (hitchParent!.velocity.abs() > 0) {
        bearing = normalizeBearing(_bearing + bearingChange);
      }
      _velocity = hitchParent!.velocity * -cos(hitchAngle);
    }
  }

  /// Update the children connected to this. Also checks and updates this
  /// equipment if it's connected to parent with a towbar.
  @override
  void updateChildren() {
    updateTowbar();
    super.updateChildren();
  }

  /// The working area center of this equipment.
  LatLng get workingCenter => position.offset(
        drawbarLength + length / 2,
        switch (parentHitch) {
          Hitch.frontFixed => bearing,
          Hitch.rearFixed => bearing + 180,
          Hitch.rearTowbar => bearing + 180,
          null => bearing,
        },
      );

  /// The position of the end of the drawbar, i.e. furthest away from the
  /// parent.
  LatLng get drawbarEnd => switch (parentHitch) {
        Hitch.frontFixed => position.offset(drawbarLength, bearing),
        Hitch.rearFixed => position.offset(drawbarLength, bearing + 180),
        Hitch.rearTowbar => position.offset(drawbarLength, bearing + 180),
        null => position.offset(drawbarLength, bearing),
      };

  /// The corner points for the given [segment].
  List<LatLng> segmentPoints(int segment) {
    // The starting point of this equipment.
    final equipmentStart = parentHitch == Hitch.frontFixed
        ? drawbarEnd.offset(length, bearing)
        : drawbarEnd;

    // The width of the preceding segments.
    final widthBefore = segmentWidths.getRange(0, segment).sum;

    final segmentFrontLeft =
        equipmentStart.offset(width / 2 - widthBefore, bearing - 90);

    final segmentRearLeft = segmentFrontLeft.offset(length, bearing + 180);

    final segmentRearRight =
        segmentRearLeft.offset(segmentWidths[segment], bearing + 90);

    final segmentFrontRight = segmentRearRight.offset(length, bearing);

    return [
      segmentFrontLeft,
      segmentRearLeft,
      segmentRearRight,
      segmentFrontRight
    ];
  }

  /// The center point of the given [segment].
  LatLng segmentCenter(int segment) {
    final points = segmentPoints(segment);
    return LatLngBounds.fromPoints(points).center;
  }

  /// The polygon for the given [segment].
  Polygon segmentPolygon(int segment) {
    final points = segmentPoints(segment);
    final active = activeSegments[segment];

    return Polygon(
      borderStrokeWidth: 2,
      isFilled: active,
      borderColor: switch (active) {
        true => Colors.greenAccent,
        false => Colors.grey,
      },
      color: switch (active) {
        true => Colors.green.withOpacity(0.8),
        false => Colors.grey.withOpacity(0.4),
      },
      points: points,
    );
  }

  /// An iterable of all the segments' polygons.
  Iterable<Polygon> get segmentPolygons =>
      List.generate(segments, segmentPolygon, growable: false).whereNotNull();

  /// A list of the polygon(s) for the drawbar(s).
  List<Polygon> get drawbarPolygons => switch (hitchType) {
        HitchType.towbar => [
            Polygon(
              borderStrokeWidth: 3,
              isFilled: true,
              color: Colors.grey.shade800,
              borderColor: Colors.black,
              points: [
                position.offset(0.05, bearing - 90),
                drawbarEnd.offset(0.05, bearing - 90),
                drawbarEnd.offset(0.05, bearing + 90),
                position.offset(0.05, bearing + 90),
              ],
            )
          ],
        HitchType.fixed => [
            // Left hitch bar
            Polygon(
              borderStrokeWidth: 3,
              isFilled: true,
              color: Colors.grey.shade800,
              borderColor: Colors.black,
              points: [
                position.offset(0.35, bearing - 90),
                drawbarEnd.offset(0.35, bearing - 90),
                drawbarEnd.offset(0.3, bearing - 90),
                position.offset(0.3, bearing - 90),
              ],
            ),
            // Right hitch bar
            Polygon(
              borderStrokeWidth: 3,
              isFilled: true,
              color: Colors.grey.shade800,
              borderColor: Colors.black,
              points: [
                position.offset(0.35, bearing + 90),
                drawbarEnd.offset(0.35, bearing + 90),
                drawbarEnd.offset(0.3, bearing + 90),
                position.offset(0.3, bearing + 90),
              ],
            )
          ]
      };

  /// A list of all the polygons for the equipment, i.e. [drawbarPolygons] and
  /// all the [segmentPolygon]s.
  List<Polygon> get polygons {
    return [
      ...drawbarPolygons,
      ...List.generate(segments, segmentPolygon, growable: false)
          .whereNotNull(),
    ];
  }

  /// Properties used to check for equality.
  @override
  List<Object?> get props => [
        uuid,
        hitchType,
        segments,
        segmentWidths,
        length,
        drawbarLength,
        position,
        bearing,
        velocity,
        hitchToChildFrontFixedHitchLength,
        hitchToChildRearFixedHitchLength,
        hitchToChildRearTowbarHitchLength,
      ];

  /// Returns a new [Equipment] based on this one, but with
  /// parameters/variables altered.
  @override
  Equipment copyWith({
    String? name,
    HitchType? hitchType,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    int? segments,
    List<double>? segmentWidths,
    double? length,
    double? drawbarLength,
    double? bearing,
    LatLng? position,
    double? hitchToChildFrontFixedHitchLength,
    double? hitchToChildRearFixedHitchLength,
    double? hitchToChildRearTowbarHitchLength,
  }) =>
      Equipment(
        name: name ?? this.name,
        hitchType: hitchType ?? this.hitchType,
        hitchParent: hitchParent ?? this.hitchParent,
        hitchRearFixedChild: hitchRearFixedChild ?? this.hitchRearFixedChild,
        hitchRearTowbarChild: hitchRearTowbarChild ?? this.hitchRearTowbarChild,
        segments: segments ?? this.segments,
        segmentWidths: segmentWidths ?? this.segmentWidths,
        length: length ?? this.length,
        drawbarLength: drawbarLength ?? this.drawbarLength,
        position: position ?? this.position,
        bearing: bearing ?? this.bearing,
        hitchToChildFrontFixedHitchLength: hitchToChildFrontFixedHitchLength ??
            this.hitchToChildFrontFixedHitchLength,
        hitchToChildRearFixedHitchLength: hitchToChildRearFixedHitchLength ??
            this.hitchToChildRearFixedHitchLength,
        hitchToChildRearTowbarHitchLength: hitchToChildRearTowbarHitchLength ??
            this.hitchToChildRearTowbarHitchLength,
      );
}
