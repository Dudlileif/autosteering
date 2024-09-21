// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_center_offset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MapCenterOffset _$MapCenterOffsetFromJson(Map<String, dynamic> json) {
  return _MapCenterOffset.fromJson(json);
}

/// @nodoc
mixin _$MapCenterOffset {
  /// Longitudinal offset in meters from the center point.
  double get x => throw _privateConstructorUsedError;

  /// Transverse offset in meters from the center point.
  double get y => throw _privateConstructorUsedError;

  /// Serializes this MapCenterOffset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MapCenterOffset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MapCenterOffsetCopyWith<MapCenterOffset> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapCenterOffsetCopyWith<$Res> {
  factory $MapCenterOffsetCopyWith(
          MapCenterOffset value, $Res Function(MapCenterOffset) then) =
      _$MapCenterOffsetCopyWithImpl<$Res, MapCenterOffset>;
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class _$MapCenterOffsetCopyWithImpl<$Res, $Val extends MapCenterOffset>
    implements $MapCenterOffsetCopyWith<$Res> {
  _$MapCenterOffsetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MapCenterOffset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapCenterOffsetImplCopyWith<$Res>
    implements $MapCenterOffsetCopyWith<$Res> {
  factory _$$MapCenterOffsetImplCopyWith(_$MapCenterOffsetImpl value,
          $Res Function(_$MapCenterOffsetImpl) then) =
      __$$MapCenterOffsetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class __$$MapCenterOffsetImplCopyWithImpl<$Res>
    extends _$MapCenterOffsetCopyWithImpl<$Res, _$MapCenterOffsetImpl>
    implements _$$MapCenterOffsetImplCopyWith<$Res> {
  __$$MapCenterOffsetImplCopyWithImpl(
      _$MapCenterOffsetImpl _value, $Res Function(_$MapCenterOffsetImpl) _then)
      : super(_value, _then);

  /// Create a copy of MapCenterOffset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$MapCenterOffsetImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MapCenterOffsetImpl implements _MapCenterOffset {
  const _$MapCenterOffsetImpl({this.x = 0, this.y = 0});

  factory _$MapCenterOffsetImpl.fromJson(Map<String, dynamic> json) =>
      _$$MapCenterOffsetImplFromJson(json);

  /// Longitudinal offset in meters from the center point.
  @override
  @JsonKey()
  final double x;

  /// Transverse offset in meters from the center point.
  @override
  @JsonKey()
  final double y;

  @override
  String toString() {
    return 'MapCenterOffset(x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapCenterOffsetImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  /// Create a copy of MapCenterOffset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MapCenterOffsetImplCopyWith<_$MapCenterOffsetImpl> get copyWith =>
      __$$MapCenterOffsetImplCopyWithImpl<_$MapCenterOffsetImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MapCenterOffsetImplToJson(
      this,
    );
  }
}

abstract class _MapCenterOffset implements MapCenterOffset {
  const factory _MapCenterOffset({final double x, final double y}) =
      _$MapCenterOffsetImpl;

  factory _MapCenterOffset.fromJson(Map<String, dynamic> json) =
      _$MapCenterOffsetImpl.fromJson;

  /// Longitudinal offset in meters from the center point.
  @override
  double get x;

  /// Transverse offset in meters from the center point.
  @override
  double get y;

  /// Create a copy of MapCenterOffset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MapCenterOffsetImplCopyWith<_$MapCenterOffsetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
