import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// A class for creating equipments for attaching to vehicles.
class Equipment extends Hitchable with EquatableMixin {
  const Equipment({
    required this.hitchType,
    super.hitchParent,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    this.segments = 1,
    this.segmentWidths = const [3],
    this.length = 2,
    this.drawbarLength = 0.5,
    this.hitchRearFixedLength,
    this.hitchRearTowbarLength,
  }) : assert(
          segmentWidths.length == segments,
          'The number of segment widths must match the number of segments.',
        );

  /// Which type of hitch point this equipment has.
  final HitchType hitchType;

  /// The number of segments the equipment is made of.
  final int segments;

  /// The width of each of the segments.
  final List<double> segmentWidths;

  /// The total length of the equipment, from the front hitch point to the
  /// rear of the equipment.
  final double length;

  /// The length from the front hitch point to the start of the main equipment
  /// working area/segments.
  final double drawbarLength;

  /// The length from the front hitch point to the rear fixed hitch point of the
  /// equipment, if there is one.
  final double? hitchRearFixedLength;

  /// The length from the front hitch point to the rear towbar hitch point of
  /// the equipment, if there is one.
  final double? hitchRearTowbarLength;

  /// The total width of the equipment. Found by summing the [segmentWidths].
  double get width => segmentWidths.sum;

  /// The hitch connection position where this equipment is attached to the
  /// [hitchParent].
  LatLng? get parentHitchPosition => switch (hitchParent != null) {
        true => switch (hitchType) {
            HitchType.fixed => switch (
                  hitchParent!.hitchRearFixedChild == this) {
                // This equipment is mounted on the rear.
                true => hitchParent!.hitchRearFixedPosition,

                // This equipment is mounted on the front.
                false => hitchParent!.hitchFrontFixedPosition,
              },
            HitchType.towbar => hitchParent!.hitchRearTowbarPosition,
          },
        false => null,
      };

  /// The equipment can't have children in both directions, so we disregard
  /// having stacked/chained equipment at the front.
  @override
  LatLng? get hitchFrontFixedPosition => null;

  @override
  // TODO: implement hitchRearFixedPosition, find the correct bearing
  LatLng? get hitchRearFixedPosition => switch (hitchParent != null) {
        true => switch (hitchType) {
            HitchType.fixed => hitchRearFixedLength != null &&
                    hitchParent!.hitchRearFixedPosition != null
                ? hitchParent!.hitchRearFixedPosition!
                    .offset(hitchRearFixedLength!, 0)
                : null,
            HitchType.towbar => hitchRearFixedLength != null &&
                    hitchParent!.hitchRearTowbarPosition != null
                ? hitchParent!.hitchRearTowbarPosition!
                    .offset(hitchRearFixedLength!, 0)
                : null,
          },
        false => null
      };

  @override
  // TODO: implement hitchRearTowbarPosition, find the correct bearing
  LatLng? get hitchRearTowbarPosition => switch (hitchParent != null) {
        true => switch (hitchType) {
            HitchType.fixed => hitchRearTowbarLength != null &&
                    hitchParent!.hitchRearFixedPosition != null
                ? hitchParent!.hitchRearFixedPosition!
                    .offset(hitchRearTowbarLength!, 0)
                : null,
            HitchType.towbar => hitchRearTowbarLength != null &&
                    hitchParent!.hitchRearTowbarPosition != null
                ? hitchParent!.hitchRearTowbarPosition!
                    .offset(hitchRearTowbarLength!, 0)
                : null,
          },
        false => null
      };

  List<Polygon>? get polygons {
    if (parentHitchPosition != null) {
      final heading = switch (hitchParent is Vehicle) {
        true => (hitchParent! as Vehicle).heading,
        false => 0,
      };

      return [
        Polygon(
          borderStrokeWidth: 1,
          isFilled: true,
          points: [
            parentHitchPosition!,
            parentHitchPosition!.offset(drawbarLength, heading + 180),
            parentHitchPosition!
                .offset(drawbarLength, heading + 180)
                .offset(width / 2, heading + 90),
            parentHitchPosition!
                .offset(drawbarLength, heading + 180)
                .offset(width / 2, heading + 90)
                .offset(length - drawbarLength, heading + 180),
            parentHitchPosition!
                .offset(drawbarLength, heading + 180)
                .offset(width / 2, heading - 90)
                .offset(length - drawbarLength, heading + 180),
            parentHitchPosition!
                .offset(drawbarLength, heading + 180)
                .offset(width / 2, heading - 90),
            parentHitchPosition!.offset(drawbarLength, heading + 180),
            parentHitchPosition!,
          ],
        )
      ];
    }
    return null;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        hitchType,
        segments,
        segmentWidths,
        length,
        drawbarLength,
        hitchRearFixedLength,
        hitchRearTowbarLength,
      ];

  // TODO: implement copyWith
  @override
  Equipment copyWith({
    HitchType? hitchType,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    int? segments,
    List<double>? segmentWidths,
    double? length,
    double? drawbarLength,
    double? hitchRearFixedLength,
    double? hitchRearTowbarLength,
  }) =>
      Equipment(
        hitchType: hitchType ?? this.hitchType,
        hitchParent: hitchParent ?? this.hitchParent,
        hitchRearFixedChild: hitchRearFixedChild ?? this.hitchRearFixedChild,
        hitchRearTowbarChild: hitchRearTowbarChild ?? this.hitchRearTowbarChild,
        segments: segments ?? this.segments,
        segmentWidths: segmentWidths ?? this.segmentWidths,
        length: length ?? this.length,
        drawbarLength: drawbarLength ?? this.drawbarLength,
        hitchRearFixedLength: hitchRearFixedLength ?? this.hitchRearFixedLength,
        hitchRearTowbarLength:
            hitchRearTowbarLength ?? this.hitchRearTowbarLength,
      );
}
