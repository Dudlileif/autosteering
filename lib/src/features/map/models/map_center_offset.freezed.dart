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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapCenterOffset _$MapCenterOffsetFromJson(Map<String, dynamic> json) {
  return _MapCenterOffset.fromJson(json);
}

/// @nodoc
mixin _$MapCenterOffset {
  /// Longitudinal offset in meters from the center point.
  double get x => throw _privateConstructorUsedError;

  /// Transverse offset in meters from the center point.
  double get y => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_MapCenterOffsetCopyWith<$Res>
    implements $MapCenterOffsetCopyWith<$Res> {
  factory _$$_MapCenterOffsetCopyWith(
          _$_MapCenterOffset value, $Res Function(_$_MapCenterOffset) then) =
      __$$_MapCenterOffsetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class __$$_MapCenterOffsetCopyWithImpl<$Res>
    extends _$MapCenterOffsetCopyWithImpl<$Res, _$_MapCenterOffset>
    implements _$$_MapCenterOffsetCopyWith<$Res> {
  __$$_MapCenterOffsetCopyWithImpl(
      _$_MapCenterOffset _value, $Res Function(_$_MapCenterOffset) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$_MapCenterOffset(
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
class _$_MapCenterOffset implements _MapCenterOffset {
  const _$_MapCenterOffset({this.x = 0, this.y = 0});

  factory _$_MapCenterOffset.fromJson(Map<String, dynamic> json) =>
      _$$_MapCenterOffsetFromJson(json);

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapCenterOffset &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapCenterOffsetCopyWith<_$_MapCenterOffset> get copyWith =>
      __$$_MapCenterOffsetCopyWithImpl<_$_MapCenterOffset>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapCenterOffsetToJson(
      this,
    );
  }
}

abstract class _MapCenterOffset implements MapCenterOffset {
  const factory _MapCenterOffset({final double x, final double y}) =
      _$_MapCenterOffset;

  factory _MapCenterOffset.fromJson(Map<String, dynamic> json) =
      _$_MapCenterOffset.fromJson;

  @override

  /// Longitudinal offset in meters from the center point.
  double get x;
  @override

  /// Transverse offset in meters from the center point.
  double get y;
  @override
  @JsonKey(ignore: true)
  _$$_MapCenterOffsetCopyWith<_$_MapCenterOffset> get copyWith =>
      throw _privateConstructorUsedError;
}
