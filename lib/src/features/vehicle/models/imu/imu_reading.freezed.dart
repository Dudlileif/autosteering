// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImuReading _$ImuReadingFromJson(Map<String, dynamic> json) {
  return _ImuReading.fromJson(json);
}

/// @nodoc
mixin _$ImuReading {
  /// The time of the reading being received.
  @DateTimeSerializer()
  DateTime get receiveTime => throw _privateConstructorUsedError;

  /// The IMU input yaw/bearing from startup.
  num get yaw => throw _privateConstructorUsedError;

  /// The IMU input pitch.
  num get pitch => throw _privateConstructorUsedError;

  /// The IMU input roll.
  num get roll => throw _privateConstructorUsedError;

  /// The IMU input acceleration in the X-axis (lateral).
  num get accelerationX => throw _privateConstructorUsedError;

  /// The IMU input acceleration in the Y-axis (longitudinal).
  num get accelerationY => throw _privateConstructorUsedError;

  /// The IMU input acceleration in the Z-axis (vertical).
  num get accelerationZ => throw _privateConstructorUsedError;

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
      num yaw,
      num pitch,
      num roll,
      num accelerationX,
      num accelerationY,
      num accelerationZ});
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
    Object? yaw = null,
    Object? pitch = null,
    Object? roll = null,
    Object? accelerationX = null,
    Object? accelerationY = null,
    Object? accelerationZ = null,
  }) {
    return _then(_value.copyWith(
      receiveTime: null == receiveTime
          ? _value.receiveTime
          : receiveTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yaw: null == yaw
          ? _value.yaw
          : yaw // ignore: cast_nullable_to_non_nullable
              as num,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as num,
      roll: null == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as num,
      accelerationX: null == accelerationX
          ? _value.accelerationX
          : accelerationX // ignore: cast_nullable_to_non_nullable
              as num,
      accelerationY: null == accelerationY
          ? _value.accelerationY
          : accelerationY // ignore: cast_nullable_to_non_nullable
              as num,
      accelerationZ: null == accelerationZ
          ? _value.accelerationZ
          : accelerationZ // ignore: cast_nullable_to_non_nullable
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
      num yaw,
      num pitch,
      num roll,
      num accelerationX,
      num accelerationY,
      num accelerationZ});
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
    Object? yaw = null,
    Object? pitch = null,
    Object? roll = null,
    Object? accelerationX = null,
    Object? accelerationY = null,
    Object? accelerationZ = null,
  }) {
    return _then(_$ImuReadingImpl(
      receiveTime: null == receiveTime
          ? _value.receiveTime
          : receiveTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yaw: null == yaw
          ? _value.yaw
          : yaw // ignore: cast_nullable_to_non_nullable
              as num,
      pitch: null == pitch
          ? _value.pitch
          : pitch // ignore: cast_nullable_to_non_nullable
              as num,
      roll: null == roll
          ? _value.roll
          : roll // ignore: cast_nullable_to_non_nullable
              as num,
      accelerationX: null == accelerationX
          ? _value.accelerationX
          : accelerationX // ignore: cast_nullable_to_non_nullable
              as num,
      accelerationY: null == accelerationY
          ? _value.accelerationY
          : accelerationY // ignore: cast_nullable_to_non_nullable
              as num,
      accelerationZ: null == accelerationZ
          ? _value.accelerationZ
          : accelerationZ // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImuReadingImpl implements _ImuReading {
  const _$ImuReadingImpl(
      {@DateTimeSerializer() required this.receiveTime,
      this.yaw = 0,
      this.pitch = 0,
      this.roll = 0,
      this.accelerationX = 0,
      this.accelerationY = 0,
      this.accelerationZ = 0});

  factory _$ImuReadingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImuReadingImplFromJson(json);

  /// The time of the reading being received.
  @override
  @DateTimeSerializer()
  final DateTime receiveTime;

  /// The IMU input yaw/bearing from startup.
  @override
  @JsonKey()
  final num yaw;

  /// The IMU input pitch.
  @override
  @JsonKey()
  final num pitch;

  /// The IMU input roll.
  @override
  @JsonKey()
  final num roll;

  /// The IMU input acceleration in the X-axis (lateral).
  @override
  @JsonKey()
  final num accelerationX;

  /// The IMU input acceleration in the Y-axis (longitudinal).
  @override
  @JsonKey()
  final num accelerationY;

  /// The IMU input acceleration in the Z-axis (vertical).
  @override
  @JsonKey()
  final num accelerationZ;

  @override
  String toString() {
    return 'ImuReading(receiveTime: $receiveTime, yaw: $yaw, pitch: $pitch, roll: $roll, accelerationX: $accelerationX, accelerationY: $accelerationY, accelerationZ: $accelerationZ)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImuReadingImpl &&
            (identical(other.receiveTime, receiveTime) ||
                other.receiveTime == receiveTime) &&
            (identical(other.yaw, yaw) || other.yaw == yaw) &&
            (identical(other.pitch, pitch) || other.pitch == pitch) &&
            (identical(other.roll, roll) || other.roll == roll) &&
            (identical(other.accelerationX, accelerationX) ||
                other.accelerationX == accelerationX) &&
            (identical(other.accelerationY, accelerationY) ||
                other.accelerationY == accelerationY) &&
            (identical(other.accelerationZ, accelerationZ) ||
                other.accelerationZ == accelerationZ));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, receiveTime, yaw, pitch, roll,
      accelerationX, accelerationY, accelerationZ);

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
      final num yaw,
      final num pitch,
      final num roll,
      final num accelerationX,
      final num accelerationY,
      final num accelerationZ}) = _$ImuReadingImpl;

  factory _ImuReading.fromJson(Map<String, dynamic> json) =
      _$ImuReadingImpl.fromJson;

  @override

  /// The time of the reading being received.
  @DateTimeSerializer()
  DateTime get receiveTime;
  @override

  /// The IMU input yaw/bearing from startup.
  num get yaw;
  @override

  /// The IMU input pitch.
  num get pitch;
  @override

  /// The IMU input roll.
  num get roll;
  @override

  /// The IMU input acceleration in the X-axis (lateral).
  num get accelerationX;
  @override

  /// The IMU input acceleration in the Y-axis (longitudinal).
  num get accelerationY;
  @override

  /// The IMU input acceleration in the Z-axis (vertical).
  num get accelerationZ;
  @override
  @JsonKey(ignore: true)
  _$$ImuReadingImplCopyWith<_$ImuReadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
