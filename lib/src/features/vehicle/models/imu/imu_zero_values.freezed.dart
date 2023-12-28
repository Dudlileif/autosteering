// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imu_zero_values.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImuZeroValues _$ImuZeroValuesFromJson(Map<String, dynamic> json) {
  return _ImuZeroValues.fromJson(json);
}

/// @nodoc
mixin _$ImuZeroValues {
  /// The zero (North) value for the bearing.
  num get bearingZero => throw _privateConstructorUsedError;

  /// The zero level for the pitch.
  num get pitchZero => throw _privateConstructorUsedError;

  /// The zero level for the roll.
  num get rollZero => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImuZeroValuesCopyWith<ImuZeroValues> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImuZeroValuesCopyWith<$Res> {
  factory $ImuZeroValuesCopyWith(
          ImuZeroValues value, $Res Function(ImuZeroValues) then) =
      _$ImuZeroValuesCopyWithImpl<$Res, ImuZeroValues>;
  @useResult
  $Res call({num bearingZero, num pitchZero, num rollZero});
}

/// @nodoc
class _$ImuZeroValuesCopyWithImpl<$Res, $Val extends ImuZeroValues>
    implements $ImuZeroValuesCopyWith<$Res> {
  _$ImuZeroValuesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bearingZero = null,
    Object? pitchZero = null,
    Object? rollZero = null,
  }) {
    return _then(_value.copyWith(
      bearingZero: null == bearingZero
          ? _value.bearingZero
          : bearingZero // ignore: cast_nullable_to_non_nullable
              as num,
      pitchZero: null == pitchZero
          ? _value.pitchZero
          : pitchZero // ignore: cast_nullable_to_non_nullable
              as num,
      rollZero: null == rollZero
          ? _value.rollZero
          : rollZero // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImuZeroValuesImplCopyWith<$Res>
    implements $ImuZeroValuesCopyWith<$Res> {
  factory _$$ImuZeroValuesImplCopyWith(
          _$ImuZeroValuesImpl value, $Res Function(_$ImuZeroValuesImpl) then) =
      __$$ImuZeroValuesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({num bearingZero, num pitchZero, num rollZero});
}

/// @nodoc
class __$$ImuZeroValuesImplCopyWithImpl<$Res>
    extends _$ImuZeroValuesCopyWithImpl<$Res, _$ImuZeroValuesImpl>
    implements _$$ImuZeroValuesImplCopyWith<$Res> {
  __$$ImuZeroValuesImplCopyWithImpl(
      _$ImuZeroValuesImpl _value, $Res Function(_$ImuZeroValuesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bearingZero = null,
    Object? pitchZero = null,
    Object? rollZero = null,
  }) {
    return _then(_$ImuZeroValuesImpl(
      bearingZero: null == bearingZero
          ? _value.bearingZero
          : bearingZero // ignore: cast_nullable_to_non_nullable
              as num,
      pitchZero: null == pitchZero
          ? _value.pitchZero
          : pitchZero // ignore: cast_nullable_to_non_nullable
              as num,
      rollZero: null == rollZero
          ? _value.rollZero
          : rollZero // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImuZeroValuesImpl implements _ImuZeroValues {
  const _$ImuZeroValuesImpl(
      {this.bearingZero = 0, this.pitchZero = 0, this.rollZero = 0});

  factory _$ImuZeroValuesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImuZeroValuesImplFromJson(json);

  /// The zero (North) value for the bearing.
  @override
  @JsonKey()
  final num bearingZero;

  /// The zero level for the pitch.
  @override
  @JsonKey()
  final num pitchZero;

  /// The zero level for the roll.
  @override
  @JsonKey()
  final num rollZero;

  @override
  String toString() {
    return 'ImuZeroValues(bearingZero: $bearingZero, pitchZero: $pitchZero, rollZero: $rollZero)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImuZeroValuesImpl &&
            (identical(other.bearingZero, bearingZero) ||
                other.bearingZero == bearingZero) &&
            (identical(other.pitchZero, pitchZero) ||
                other.pitchZero == pitchZero) &&
            (identical(other.rollZero, rollZero) ||
                other.rollZero == rollZero));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bearingZero, pitchZero, rollZero);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImuZeroValuesImplCopyWith<_$ImuZeroValuesImpl> get copyWith =>
      __$$ImuZeroValuesImplCopyWithImpl<_$ImuZeroValuesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImuZeroValuesImplToJson(
      this,
    );
  }
}

abstract class _ImuZeroValues implements ImuZeroValues {
  const factory _ImuZeroValues(
      {final num bearingZero,
      final num pitchZero,
      final num rollZero}) = _$ImuZeroValuesImpl;

  factory _ImuZeroValues.fromJson(Map<String, dynamic> json) =
      _$ImuZeroValuesImpl.fromJson;

  @override

  /// The zero (North) value for the bearing.
  num get bearingZero;
  @override

  /// The zero level for the pitch.
  num get pitchZero;
  @override

  /// The zero level for the roll.
  num get rollZero;
  @override
  @JsonKey(ignore: true)
  _$$ImuZeroValuesImplCopyWith<_$ImuZeroValuesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
