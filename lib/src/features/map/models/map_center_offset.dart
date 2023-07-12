import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_center_offset.freezed.dart';
part 'map_center_offset.g.dart';

/// An offset mainly used to keep the map center moved relative to the vehicle.
@freezed
class MapCenterOffset with _$MapCenterOffset {
  /// An offset mainly used to keep the map center moved relative to the
  /// vehicle.
  ///
  /// [x] is the longitudinal offset in meters from the center point.
  /// [y] is the transverse offset in meters from the center point.

  const factory MapCenterOffset({
    /// Longitudinal offset in meters from the center point.
    @Default(0) double x,

    /// Transverse offset in meters from the center point.
    @Default(0) double y,
  }) = _MapCenterOffset;

  /// Creates a [MapCenterOffset] from a [json] object.
  factory MapCenterOffset.fromJson(Map<String, Object?> json) =>
      _$MapCenterOffsetFromJson(json);
}
