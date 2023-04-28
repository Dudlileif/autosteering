import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_center_offset.freezed.dart';
part 'map_center_offset.g.dart';

/// An offset mainly used to keep the map center moved relative to the vehidle.
@freezed
class MapCenterOffset with _$MapCenterOffset {
  const factory MapCenterOffset({
    /// Offset in meters from the center point.
    @Default(0) double x,

    /// Offset in meters from the center point.
    @Default(0) double y,
  }) = _MapCenterOffset;

  factory MapCenterOffset.fromJson(Map<String, Object?> json) =>
      _$MapCenterOffsetFromJson(json);
}
