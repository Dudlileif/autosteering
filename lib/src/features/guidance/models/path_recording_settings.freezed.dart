// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_recording_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PathRecordingSettings _$PathRecordingSettingsFromJson(
    Map<String, dynamic> json) {
  return _PathRecordingSettings.fromJson(json);
}

/// @nodoc
mixin _$PathRecordingSettings {
  /// Minimum distance between points in meters.
  double get minDistance => throw _privateConstructorUsedError;

  /// Maximum distance between points in meters.
  double get maxDistance => throw _privateConstructorUsedError;

  /// Maximum difference between the previous [WayPoint.bearing] and the
  /// vehicle's current bearing.
  double get maxBearingDifference => throw _privateConstructorUsedError;

  /// Offset distance in meters in the bearing+90° direction from the
  /// vehicle's position.
  double get lateralOffset => throw _privateConstructorUsedError;

  /// Offset distance in meters in the bearing direction from the
  /// vehicle's position.
  double get longitudinalOffset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PathRecordingSettingsCopyWith<PathRecordingSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PathRecordingSettingsCopyWith<$Res> {
  factory $PathRecordingSettingsCopyWith(PathRecordingSettings value,
          $Res Function(PathRecordingSettings) then) =
      _$PathRecordingSettingsCopyWithImpl<$Res, PathRecordingSettings>;
  @useResult
  $Res call(
      {double minDistance,
      double maxDistance,
      double maxBearingDifference,
      double lateralOffset,
      double longitudinalOffset});
}

/// @nodoc
class _$PathRecordingSettingsCopyWithImpl<$Res,
        $Val extends PathRecordingSettings>
    implements $PathRecordingSettingsCopyWith<$Res> {
  _$PathRecordingSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minDistance = null,
    Object? maxDistance = null,
    Object? maxBearingDifference = null,
    Object? lateralOffset = null,
    Object? longitudinalOffset = null,
  }) {
    return _then(_value.copyWith(
      minDistance: null == minDistance
          ? _value.minDistance
          : minDistance // ignore: cast_nullable_to_non_nullable
              as double,
      maxDistance: null == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double,
      maxBearingDifference: null == maxBearingDifference
          ? _value.maxBearingDifference
          : maxBearingDifference // ignore: cast_nullable_to_non_nullable
              as double,
      lateralOffset: null == lateralOffset
          ? _value.lateralOffset
          : lateralOffset // ignore: cast_nullable_to_non_nullable
              as double,
      longitudinalOffset: null == longitudinalOffset
          ? _value.longitudinalOffset
          : longitudinalOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PathRecordingSettingsImplCopyWith<$Res>
    implements $PathRecordingSettingsCopyWith<$Res> {
  factory _$$PathRecordingSettingsImplCopyWith(
          _$PathRecordingSettingsImpl value,
          $Res Function(_$PathRecordingSettingsImpl) then) =
      __$$PathRecordingSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double minDistance,
      double maxDistance,
      double maxBearingDifference,
      double lateralOffset,
      double longitudinalOffset});
}

/// @nodoc
class __$$PathRecordingSettingsImplCopyWithImpl<$Res>
    extends _$PathRecordingSettingsCopyWithImpl<$Res,
        _$PathRecordingSettingsImpl>
    implements _$$PathRecordingSettingsImplCopyWith<$Res> {
  __$$PathRecordingSettingsImplCopyWithImpl(_$PathRecordingSettingsImpl _value,
      $Res Function(_$PathRecordingSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minDistance = null,
    Object? maxDistance = null,
    Object? maxBearingDifference = null,
    Object? lateralOffset = null,
    Object? longitudinalOffset = null,
  }) {
    return _then(_$PathRecordingSettingsImpl(
      minDistance: null == minDistance
          ? _value.minDistance
          : minDistance // ignore: cast_nullable_to_non_nullable
              as double,
      maxDistance: null == maxDistance
          ? _value.maxDistance
          : maxDistance // ignore: cast_nullable_to_non_nullable
              as double,
      maxBearingDifference: null == maxBearingDifference
          ? _value.maxBearingDifference
          : maxBearingDifference // ignore: cast_nullable_to_non_nullable
              as double,
      lateralOffset: null == lateralOffset
          ? _value.lateralOffset
          : lateralOffset // ignore: cast_nullable_to_non_nullable
              as double,
      longitudinalOffset: null == longitudinalOffset
          ? _value.longitudinalOffset
          : longitudinalOffset // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PathRecordingSettingsImpl implements _PathRecordingSettings {
  const _$PathRecordingSettingsImpl(
      {this.minDistance = 1,
      this.maxDistance = 20,
      this.maxBearingDifference = 1,
      this.lateralOffset = 0,
      this.longitudinalOffset = 0});

  factory _$PathRecordingSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PathRecordingSettingsImplFromJson(json);

  /// Minimum distance between points in meters.
  @override
  @JsonKey()
  final double minDistance;

  /// Maximum distance between points in meters.
  @override
  @JsonKey()
  final double maxDistance;

  /// Maximum difference between the previous [WayPoint.bearing] and the
  /// vehicle's current bearing.
  @override
  @JsonKey()
  final double maxBearingDifference;

  /// Offset distance in meters in the bearing+90° direction from the
  /// vehicle's position.
  @override
  @JsonKey()
  final double lateralOffset;

  /// Offset distance in meters in the bearing direction from the
  /// vehicle's position.
  @override
  @JsonKey()
  final double longitudinalOffset;

  @override
  String toString() {
    return 'PathRecordingSettings(minDistance: $minDistance, maxDistance: $maxDistance, maxBearingDifference: $maxBearingDifference, lateralOffset: $lateralOffset, longitudinalOffset: $longitudinalOffset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PathRecordingSettingsImpl &&
            (identical(other.minDistance, minDistance) ||
                other.minDistance == minDistance) &&
            (identical(other.maxDistance, maxDistance) ||
                other.maxDistance == maxDistance) &&
            (identical(other.maxBearingDifference, maxBearingDifference) ||
                other.maxBearingDifference == maxBearingDifference) &&
            (identical(other.lateralOffset, lateralOffset) ||
                other.lateralOffset == lateralOffset) &&
            (identical(other.longitudinalOffset, longitudinalOffset) ||
                other.longitudinalOffset == longitudinalOffset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minDistance, maxDistance,
      maxBearingDifference, lateralOffset, longitudinalOffset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PathRecordingSettingsImplCopyWith<_$PathRecordingSettingsImpl>
      get copyWith => __$$PathRecordingSettingsImplCopyWithImpl<
          _$PathRecordingSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PathRecordingSettingsImplToJson(
      this,
    );
  }
}

abstract class _PathRecordingSettings implements PathRecordingSettings {
  const factory _PathRecordingSettings(
      {final double minDistance,
      final double maxDistance,
      final double maxBearingDifference,
      final double lateralOffset,
      final double longitudinalOffset}) = _$PathRecordingSettingsImpl;

  factory _PathRecordingSettings.fromJson(Map<String, dynamic> json) =
      _$PathRecordingSettingsImpl.fromJson;

  @override

  /// Minimum distance between points in meters.
  double get minDistance;
  @override

  /// Maximum distance between points in meters.
  double get maxDistance;
  @override

  /// Maximum difference between the previous [WayPoint.bearing] and the
  /// vehicle's current bearing.
  double get maxBearingDifference;
  @override

  /// Offset distance in meters in the bearing+90° direction from the
  /// vehicle's position.
  double get lateralOffset;
  @override

  /// Offset distance in meters in the bearing direction from the
  /// vehicle's position.
  double get longitudinalOffset;
  @override
  @JsonKey(ignore: true)
  _$$PathRecordingSettingsImplCopyWith<_$PathRecordingSettingsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
