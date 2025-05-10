// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imu_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImuReading {

/// The time of the reading being received.
@DateTimeSerializer() DateTime get receiveTime;/// The IMU input yaw/bearing from startup.
 num get yaw;/// The IMU input pitch.
 num get pitch;/// The IMU input roll.
 num get roll;/// The IMU input acceleration in the X-axis (lateral).
 num get accelerationX;/// The IMU input acceleration in the Y-axis (longitudinal).
 num get accelerationY;/// The IMU input acceleration in the Z-axis (vertical).
 num get accelerationZ;
/// Create a copy of ImuReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImuReadingCopyWith<ImuReading> get copyWith => _$ImuReadingCopyWithImpl<ImuReading>(this as ImuReading, _$identity);

  /// Serializes this ImuReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImuReading&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.yaw, yaw) || other.yaw == yaw)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.roll, roll) || other.roll == roll)&&(identical(other.accelerationX, accelerationX) || other.accelerationX == accelerationX)&&(identical(other.accelerationY, accelerationY) || other.accelerationY == accelerationY)&&(identical(other.accelerationZ, accelerationZ) || other.accelerationZ == accelerationZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiveTime,yaw,pitch,roll,accelerationX,accelerationY,accelerationZ);

@override
String toString() {
  return 'ImuReading(receiveTime: $receiveTime, yaw: $yaw, pitch: $pitch, roll: $roll, accelerationX: $accelerationX, accelerationY: $accelerationY, accelerationZ: $accelerationZ)';
}


}

/// @nodoc
abstract mixin class $ImuReadingCopyWith<$Res>  {
  factory $ImuReadingCopyWith(ImuReading value, $Res Function(ImuReading) _then) = _$ImuReadingCopyWithImpl;
@useResult
$Res call({
@DateTimeSerializer() DateTime receiveTime, num yaw, num pitch, num roll, num accelerationX, num accelerationY, num accelerationZ
});




}
/// @nodoc
class _$ImuReadingCopyWithImpl<$Res>
    implements $ImuReadingCopyWith<$Res> {
  _$ImuReadingCopyWithImpl(this._self, this._then);

  final ImuReading _self;
  final $Res Function(ImuReading) _then;

/// Create a copy of ImuReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiveTime = null,Object? yaw = null,Object? pitch = null,Object? roll = null,Object? accelerationX = null,Object? accelerationY = null,Object? accelerationZ = null,}) {
  return _then(_self.copyWith(
receiveTime: null == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as DateTime,yaw: null == yaw ? _self.yaw : yaw // ignore: cast_nullable_to_non_nullable
as num,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as num,roll: null == roll ? _self.roll : roll // ignore: cast_nullable_to_non_nullable
as num,accelerationX: null == accelerationX ? _self.accelerationX : accelerationX // ignore: cast_nullable_to_non_nullable
as num,accelerationY: null == accelerationY ? _self.accelerationY : accelerationY // ignore: cast_nullable_to_non_nullable
as num,accelerationZ: null == accelerationZ ? _self.accelerationZ : accelerationZ // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ImuReading implements ImuReading {
  const _ImuReading({@DateTimeSerializer() required this.receiveTime, this.yaw = 0, this.pitch = 0, this.roll = 0, this.accelerationX = 0, this.accelerationY = 0, this.accelerationZ = 0});
  factory _ImuReading.fromJson(Map<String, dynamic> json) => _$ImuReadingFromJson(json);

/// The time of the reading being received.
@override@DateTimeSerializer() final  DateTime receiveTime;
/// The IMU input yaw/bearing from startup.
@override@JsonKey() final  num yaw;
/// The IMU input pitch.
@override@JsonKey() final  num pitch;
/// The IMU input roll.
@override@JsonKey() final  num roll;
/// The IMU input acceleration in the X-axis (lateral).
@override@JsonKey() final  num accelerationX;
/// The IMU input acceleration in the Y-axis (longitudinal).
@override@JsonKey() final  num accelerationY;
/// The IMU input acceleration in the Z-axis (vertical).
@override@JsonKey() final  num accelerationZ;

/// Create a copy of ImuReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImuReadingCopyWith<_ImuReading> get copyWith => __$ImuReadingCopyWithImpl<_ImuReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImuReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImuReading&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.yaw, yaw) || other.yaw == yaw)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.roll, roll) || other.roll == roll)&&(identical(other.accelerationX, accelerationX) || other.accelerationX == accelerationX)&&(identical(other.accelerationY, accelerationY) || other.accelerationY == accelerationY)&&(identical(other.accelerationZ, accelerationZ) || other.accelerationZ == accelerationZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiveTime,yaw,pitch,roll,accelerationX,accelerationY,accelerationZ);

@override
String toString() {
  return 'ImuReading(receiveTime: $receiveTime, yaw: $yaw, pitch: $pitch, roll: $roll, accelerationX: $accelerationX, accelerationY: $accelerationY, accelerationZ: $accelerationZ)';
}


}

/// @nodoc
abstract mixin class _$ImuReadingCopyWith<$Res> implements $ImuReadingCopyWith<$Res> {
  factory _$ImuReadingCopyWith(_ImuReading value, $Res Function(_ImuReading) _then) = __$ImuReadingCopyWithImpl;
@override @useResult
$Res call({
@DateTimeSerializer() DateTime receiveTime, num yaw, num pitch, num roll, num accelerationX, num accelerationY, num accelerationZ
});




}
/// @nodoc
class __$ImuReadingCopyWithImpl<$Res>
    implements _$ImuReadingCopyWith<$Res> {
  __$ImuReadingCopyWithImpl(this._self, this._then);

  final _ImuReading _self;
  final $Res Function(_ImuReading) _then;

/// Create a copy of ImuReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiveTime = null,Object? yaw = null,Object? pitch = null,Object? roll = null,Object? accelerationX = null,Object? accelerationY = null,Object? accelerationZ = null,}) {
  return _then(_ImuReading(
receiveTime: null == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as DateTime,yaw: null == yaw ? _self.yaw : yaw // ignore: cast_nullable_to_non_nullable
as num,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as num,roll: null == roll ? _self.roll : roll // ignore: cast_nullable_to_non_nullable
as num,accelerationX: null == accelerationX ? _self.accelerationX : accelerationX // ignore: cast_nullable_to_non_nullable
as num,accelerationY: null == accelerationY ? _self.accelerationY : accelerationY // ignore: cast_nullable_to_non_nullable
as num,accelerationZ: null == accelerationZ ? _self.accelerationZ : accelerationZ // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
