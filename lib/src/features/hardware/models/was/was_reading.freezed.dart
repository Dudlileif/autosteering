// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'was_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WasReading _$WasReadingFromJson(Map<String, dynamic> json) {
  return _WasReading.fromJson(json);
}

/// @nodoc
mixin _$WasReading {
  /// The time of the reading being received.
  @DateTimeSerializer()
  DateTime get receiveTime => throw _privateConstructorUsedError;

  /// The discrete value of the sensor reading.
  int get value => throw _privateConstructorUsedError;

  /// Serializes this WasReading to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WasReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WasReadingCopyWith<WasReading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasReadingCopyWith<$Res> {
  factory $WasReadingCopyWith(
          WasReading value, $Res Function(WasReading) then) =
      _$WasReadingCopyWithImpl<$Res, WasReading>;
  @useResult
  $Res call({@DateTimeSerializer() DateTime receiveTime, int value});
}

/// @nodoc
class _$WasReadingCopyWithImpl<$Res, $Val extends WasReading>
    implements $WasReadingCopyWith<$Res> {
  _$WasReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WasReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiveTime = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      receiveTime: null == receiveTime
          ? _value.receiveTime
          : receiveTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WasReadingImplCopyWith<$Res>
    implements $WasReadingCopyWith<$Res> {
  factory _$$WasReadingImplCopyWith(
          _$WasReadingImpl value, $Res Function(_$WasReadingImpl) then) =
      __$$WasReadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@DateTimeSerializer() DateTime receiveTime, int value});
}

/// @nodoc
class __$$WasReadingImplCopyWithImpl<$Res>
    extends _$WasReadingCopyWithImpl<$Res, _$WasReadingImpl>
    implements _$$WasReadingImplCopyWith<$Res> {
  __$$WasReadingImplCopyWithImpl(
      _$WasReadingImpl _value, $Res Function(_$WasReadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of WasReading
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiveTime = null,
    Object? value = null,
  }) {
    return _then(_$WasReadingImpl(
      receiveTime: null == receiveTime
          ? _value.receiveTime
          : receiveTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasReadingImpl implements _WasReading {
  const _$WasReadingImpl(
      {@DateTimeSerializer() required this.receiveTime, this.value = 0});

  factory _$WasReadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasReadingImplFromJson(json);

  /// The time of the reading being received.
  @override
  @DateTimeSerializer()
  final DateTime receiveTime;

  /// The discrete value of the sensor reading.
  @override
  @JsonKey()
  final int value;

  @override
  String toString() {
    return 'WasReading(receiveTime: $receiveTime, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WasReadingImpl &&
            (identical(other.receiveTime, receiveTime) ||
                other.receiveTime == receiveTime) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, receiveTime, value);

  /// Create a copy of WasReading
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WasReadingImplCopyWith<_$WasReadingImpl> get copyWith =>
      __$$WasReadingImplCopyWithImpl<_$WasReadingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WasReadingImplToJson(
      this,
    );
  }
}

abstract class _WasReading implements WasReading {
  const factory _WasReading(
      {@DateTimeSerializer() required final DateTime receiveTime,
      final int value}) = _$WasReadingImpl;

  factory _WasReading.fromJson(Map<String, dynamic> json) =
      _$WasReadingImpl.fromJson;

  /// The time of the reading being received.
  @override
  @DateTimeSerializer()
  DateTime get receiveTime;

  /// The discrete value of the sensor reading.
  @override
  int get value;

  /// Create a copy of WasReading
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WasReadingImplCopyWith<_$WasReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
