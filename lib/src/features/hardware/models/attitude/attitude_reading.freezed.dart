// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attitude_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AttitudeReading _$AttitudeReadingFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'gnss':
          return GnssAttitudeReading.fromJson(
            json
          );
                case 'imu':
          return ImuReading.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'AttitudeReading',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$AttitudeReading {

/// The time of the reading being received.
@DateTimeSerializer() DateTime get receiveTime;/// The yaw/heading value.
 double? get yaw;/// The pitch value.
 double? get pitch;/// The roll value
 double? get roll;
/// Create a copy of AttitudeReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttitudeReadingCopyWith<AttitudeReading> get copyWith => _$AttitudeReadingCopyWithImpl<AttitudeReading>(this as AttitudeReading, _$identity);

  /// Serializes this AttitudeReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttitudeReading&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.yaw, yaw) || other.yaw == yaw)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.roll, roll) || other.roll == roll));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiveTime,yaw,pitch,roll);

@override
String toString() {
  return 'AttitudeReading(receiveTime: $receiveTime, yaw: $yaw, pitch: $pitch, roll: $roll)';
}


}

/// @nodoc
abstract mixin class $AttitudeReadingCopyWith<$Res>  {
  factory $AttitudeReadingCopyWith(AttitudeReading value, $Res Function(AttitudeReading) _then) = _$AttitudeReadingCopyWithImpl;
@useResult
$Res call({
@DateTimeSerializer() DateTime receiveTime, double yaw, double pitch, double roll
});




}
/// @nodoc
class _$AttitudeReadingCopyWithImpl<$Res>
    implements $AttitudeReadingCopyWith<$Res> {
  _$AttitudeReadingCopyWithImpl(this._self, this._then);

  final AttitudeReading _self;
  final $Res Function(AttitudeReading) _then;

/// Create a copy of AttitudeReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiveTime = null,Object? yaw = null,Object? pitch = null,Object? roll = null,}) {
  return _then(_self.copyWith(
receiveTime: null == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as DateTime,yaw: null == yaw ? _self.yaw! : yaw // ignore: cast_nullable_to_non_nullable
as double,pitch: null == pitch ? _self.pitch! : pitch // ignore: cast_nullable_to_non_nullable
as double,roll: null == roll ? _self.roll! : roll // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AttitudeReading].
extension AttitudeReadingPatterns on AttitudeReading {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GnssAttitudeReading value)?  gnss,TResult Function( ImuReading value)?  imu,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GnssAttitudeReading() when gnss != null:
return gnss(_that);case ImuReading() when imu != null:
return imu(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GnssAttitudeReading value)  gnss,required TResult Function( ImuReading value)  imu,}){
final _that = this;
switch (_that) {
case GnssAttitudeReading():
return gnss(_that);case ImuReading():
return imu(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GnssAttitudeReading value)?  gnss,TResult? Function( ImuReading value)?  imu,}){
final _that = this;
switch (_that) {
case GnssAttitudeReading() when gnss != null:
return gnss(_that);case ImuReading() when imu != null:
return imu(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@DateTimeSerializer()  DateTime receiveTime,  double? yaw,  double? pitch,  double? roll)?  gnss,TResult Function(@DateTimeSerializer()  DateTime receiveTime,  double yaw,  double pitch,  double roll,  double accelerationX,  double accelerationY,  double accelerationZ)?  imu,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GnssAttitudeReading() when gnss != null:
return gnss(_that.receiveTime,_that.yaw,_that.pitch,_that.roll);case ImuReading() when imu != null:
return imu(_that.receiveTime,_that.yaw,_that.pitch,_that.roll,_that.accelerationX,_that.accelerationY,_that.accelerationZ);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@DateTimeSerializer()  DateTime receiveTime,  double? yaw,  double? pitch,  double? roll)  gnss,required TResult Function(@DateTimeSerializer()  DateTime receiveTime,  double yaw,  double pitch,  double roll,  double accelerationX,  double accelerationY,  double accelerationZ)  imu,}) {final _that = this;
switch (_that) {
case GnssAttitudeReading():
return gnss(_that.receiveTime,_that.yaw,_that.pitch,_that.roll);case ImuReading():
return imu(_that.receiveTime,_that.yaw,_that.pitch,_that.roll,_that.accelerationX,_that.accelerationY,_that.accelerationZ);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@DateTimeSerializer()  DateTime receiveTime,  double? yaw,  double? pitch,  double? roll)?  gnss,TResult? Function(@DateTimeSerializer()  DateTime receiveTime,  double yaw,  double pitch,  double roll,  double accelerationX,  double accelerationY,  double accelerationZ)?  imu,}) {final _that = this;
switch (_that) {
case GnssAttitudeReading() when gnss != null:
return gnss(_that.receiveTime,_that.yaw,_that.pitch,_that.roll);case ImuReading() when imu != null:
return imu(_that.receiveTime,_that.yaw,_that.pitch,_that.roll,_that.accelerationX,_that.accelerationY,_that.accelerationZ);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class GnssAttitudeReading implements AttitudeReading {
  const GnssAttitudeReading({@DateTimeSerializer() required this.receiveTime, this.yaw = null, this.pitch = null, this.roll = null, final  String? $type}): $type = $type ?? 'gnss';
  factory GnssAttitudeReading.fromJson(Map<String, dynamic> json) => _$GnssAttitudeReadingFromJson(json);

/// The time of the reading being received.
@override@DateTimeSerializer() final  DateTime receiveTime;
/// The yaw/heading value.
@override@JsonKey() final  double? yaw;
/// The pitch value.
@override@JsonKey() final  double? pitch;
/// The roll value
@override@JsonKey() final  double? roll;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AttitudeReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GnssAttitudeReadingCopyWith<GnssAttitudeReading> get copyWith => _$GnssAttitudeReadingCopyWithImpl<GnssAttitudeReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GnssAttitudeReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GnssAttitudeReading&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.yaw, yaw) || other.yaw == yaw)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.roll, roll) || other.roll == roll));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiveTime,yaw,pitch,roll);

@override
String toString() {
  return 'AttitudeReading.gnss(receiveTime: $receiveTime, yaw: $yaw, pitch: $pitch, roll: $roll)';
}


}

/// @nodoc
abstract mixin class $GnssAttitudeReadingCopyWith<$Res> implements $AttitudeReadingCopyWith<$Res> {
  factory $GnssAttitudeReadingCopyWith(GnssAttitudeReading value, $Res Function(GnssAttitudeReading) _then) = _$GnssAttitudeReadingCopyWithImpl;
@override @useResult
$Res call({
@DateTimeSerializer() DateTime receiveTime, double? yaw, double? pitch, double? roll
});




}
/// @nodoc
class _$GnssAttitudeReadingCopyWithImpl<$Res>
    implements $GnssAttitudeReadingCopyWith<$Res> {
  _$GnssAttitudeReadingCopyWithImpl(this._self, this._then);

  final GnssAttitudeReading _self;
  final $Res Function(GnssAttitudeReading) _then;

/// Create a copy of AttitudeReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiveTime = null,Object? yaw = freezed,Object? pitch = freezed,Object? roll = freezed,}) {
  return _then(GnssAttitudeReading(
receiveTime: null == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as DateTime,yaw: freezed == yaw ? _self.yaw : yaw // ignore: cast_nullable_to_non_nullable
as double?,pitch: freezed == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as double?,roll: freezed == roll ? _self.roll : roll // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ImuReading implements AttitudeReading {
  const ImuReading({@DateTimeSerializer() required this.receiveTime, this.yaw = 0, this.pitch = 0, this.roll = 0, this.accelerationX = 0, this.accelerationY = 0, this.accelerationZ = 0, final  String? $type}): $type = $type ?? 'imu';
  factory ImuReading.fromJson(Map<String, dynamic> json) => _$ImuReadingFromJson(json);

/// The time of the reading being received.
@override@DateTimeSerializer() final  DateTime receiveTime;
/// The IMU input yaw/bearing from startup.
@override@JsonKey() final  double yaw;
/// The IMU input pitch.
@override@JsonKey() final  double pitch;
/// The IMU input roll.
@override@JsonKey() final  double roll;
/// The IMU input acceleration in the X-axis (lateral).
@JsonKey() final  double accelerationX;
/// The IMU input acceleration in the Y-axis (longitudinal).
@JsonKey() final  double accelerationY;
/// The IMU input acceleration in the Z-axis (vertical).
@JsonKey() final  double accelerationZ;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of AttitudeReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImuReadingCopyWith<ImuReading> get copyWith => _$ImuReadingCopyWithImpl<ImuReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImuReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImuReading&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.yaw, yaw) || other.yaw == yaw)&&(identical(other.pitch, pitch) || other.pitch == pitch)&&(identical(other.roll, roll) || other.roll == roll)&&(identical(other.accelerationX, accelerationX) || other.accelerationX == accelerationX)&&(identical(other.accelerationY, accelerationY) || other.accelerationY == accelerationY)&&(identical(other.accelerationZ, accelerationZ) || other.accelerationZ == accelerationZ));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiveTime,yaw,pitch,roll,accelerationX,accelerationY,accelerationZ);

@override
String toString() {
  return 'AttitudeReading.imu(receiveTime: $receiveTime, yaw: $yaw, pitch: $pitch, roll: $roll, accelerationX: $accelerationX, accelerationY: $accelerationY, accelerationZ: $accelerationZ)';
}


}

/// @nodoc
abstract mixin class $ImuReadingCopyWith<$Res> implements $AttitudeReadingCopyWith<$Res> {
  factory $ImuReadingCopyWith(ImuReading value, $Res Function(ImuReading) _then) = _$ImuReadingCopyWithImpl;
@override @useResult
$Res call({
@DateTimeSerializer() DateTime receiveTime, double yaw, double pitch, double roll, double accelerationX, double accelerationY, double accelerationZ
});




}
/// @nodoc
class _$ImuReadingCopyWithImpl<$Res>
    implements $ImuReadingCopyWith<$Res> {
  _$ImuReadingCopyWithImpl(this._self, this._then);

  final ImuReading _self;
  final $Res Function(ImuReading) _then;

/// Create a copy of AttitudeReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiveTime = null,Object? yaw = null,Object? pitch = null,Object? roll = null,Object? accelerationX = null,Object? accelerationY = null,Object? accelerationZ = null,}) {
  return _then(ImuReading(
receiveTime: null == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as DateTime,yaw: null == yaw ? _self.yaw : yaw // ignore: cast_nullable_to_non_nullable
as double,pitch: null == pitch ? _self.pitch : pitch // ignore: cast_nullable_to_non_nullable
as double,roll: null == roll ? _self.roll : roll // ignore: cast_nullable_to_non_nullable
as double,accelerationX: null == accelerationX ? _self.accelerationX : accelerationX // ignore: cast_nullable_to_non_nullable
as double,accelerationY: null == accelerationY ? _self.accelerationY : accelerationY // ignore: cast_nullable_to_non_nullable
as double,accelerationZ: null == accelerationZ ? _self.accelerationZ : accelerationZ // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
