// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imu_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImuReading _$ImuReadingFromJson(Map<String, dynamic> json) {
  return _ImuReading.fromJson(json);
}

/// @nodoc
mixin _$ImuReading {
  /// The time of the reading being received.
  @DateTimeSerializer()
  DateTime get receiveTime => throw _privateConstructorUsedError;

  /// The IMU input yaw/bearing from startup.
  num get yawFromStartup => throw _privateConstructorUsedError;

  /// The IMU input pitch.
  num get pitch => throw _privateConstructorUsedError;

  /// The IMU input roll.
  num get roll => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImuReadingCopyWith<ImuReading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImuReadingCopyWith<$Res> {
  factory $ImuReadingCopyWith(
          ImuReading value, $Res Function(ImuReading) then) =
      _$ImuReadingCopyWithImpl<$Res, ImuReading>;
  @useResult
  $Res call(
      {@DateTimeSerializer() DateTime receiveTime,
      num yawFromStartup,
      num pitch,
      num roll});
}

/// @nodoc
class _$ImuReadingCopyWithImpl<$Res, $Val extends ImuReading>
    implements $ImuReadingCopyWith<$Res> {
  _$ImuReadingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiveTime = null,
    Object? yawFromStartup = null,
    Object? pitch = null,
    Object? roll = null,
  }) {
    return _then(_value.copyWith(
      receiveTime: null == receiveTime
          ? _value.receiveTime
          : receiveTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yawFromStartup: null == yawFromStartup
          ? _value.yawFromStartup
          : yawFromStartup // ignore: cast_nullable_to_non_nullable
              as num,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as num,
      roll: null == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImuReadingImplCopyWith<$Res>
    implements $ImuReadingCopyWith<$Res> {
  factory _$$ImuReadingImplCopyWith(
          _$ImuReadingImpl value, $Res Function(_$ImuReadingImpl) then) =
      __$$ImuReadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DateTimeSerializer() DateTime receiveTime,
      num yawFromStartup,
      num pitch,
      num roll});
}

/// @nodoc
class __$$ImuReadingImplCopyWithImpl<$Res>
    extends _$ImuReadingCopyWithImpl<$Res, _$ImuReadingImpl>
    implements _$$ImuReadingImplCopyWith<$Res> {
  __$$ImuReadingImplCopyWithImpl(
      _$ImuReadingImpl _value, $Res Function(_$ImuReadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receiveTime = null,
    Object? yawFromStartup = null,
    Object? pitch = null,
    Object? roll = null,
  }) {
    return _then(_$ImuReadingImpl(
      receiveTime: null == receiveTime
          ? _value.receiveTime
          : receiveTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yawFromStartup: null == yawFromStartup
          ? _value.yawFromStartup
          : yawFromStartup // ignore: cast_nullable_to_non_nullable
              as num,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as num,
      roll: null == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImuReadingImpl implements _ImuReading {
  const _$ImuReadingImpl(
      {@DateTimeSerializer() required this.receiveTime,
      this.yawFromStartup = 0,
      this.pitch = 0,
      this.roll = 0});

  factory _$ImuReadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImuReadingImplFromJson(json);

  /// The time of the reading being received.
  @override
  @DateTimeSerializer()
  final DateTime receiveTime;

  /// The IMU input yaw/bearing from startup.
  @override
  @JsonKey()
  final num yawFromStartup;

  /// The IMU input pitch.
  @override
  @JsonKey()
  final num pitch;

  /// The IMU input roll.
  @override
  @JsonKey()
  final num roll;

  @override
  String toString() {
    return 'ImuReading(receiveTime: $receiveTime, yawFromStartup: $yawFromStartup, pitch: $pitch, roll: $roll)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImuReadingImpl &&
            (identical(other.receiveTime, receiveTime) ||
                other.receiveTime == receiveTime) &&
            (identical(other.yawFromStartup, yawFromStartup) ||
                other.yawFromStartup == yawFromStartup) &&
            (identical(other.pitch, pitch) || other.pitch == pitch) &&
            (identical(other.roll, roll) || other.roll == roll));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, receiveTime, yawFromStartup, pitch, roll);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImuReadingImplCopyWith<_$ImuReadingImpl> get copyWith =>
      __$$ImuReadingImplCopyWithImpl<_$ImuReadingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImuReadingImplToJson(
      this,
    );
  }
}

abstract class _ImuReading implements ImuReading {
  const factory _ImuReading(
      {@DateTimeSerializer() required final DateTime receiveTime,
      final num yawFromStartup,
      final num pitch,
      final num roll}) = _$ImuReadingImpl;

  factory _ImuReading.fromJson(Map<String, dynamic> json) =
      _$ImuReadingImpl.fromJson;

  @override

  /// The time of the reading being received.
  @DateTimeSerializer()
  DateTime get receiveTime;
  @override

  /// The IMU input yaw/bearing from startup.
  num get yawFromStartup;
  @override

  /// The IMU input pitch.
  num get pitch;
  @override

  /// The IMU input roll.
  num get roll;
  @override
  @JsonKey(ignore: true)
  _$$ImuReadingImplCopyWith<_$ImuReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
