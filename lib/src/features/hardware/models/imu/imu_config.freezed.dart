// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imu_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImuConfig {

/// Whether the vehicle should take into account pitch and roll when
/// representing its position.
 bool get usePitchAndRoll;/// Whether the pich and roll axes should be swapped.
 bool get swapPitchAndRoll;/// The zero values for the different axes of the IMU.
 ImuZeroValues get zeroValues;/// Whether the vehicle's bearing should be the one from the IMU.
 bool get useYaw;/// Whether the bearing axis should be inverted.
 bool get invertYaw;/// Whether the pitch axis should be inverted.
 bool get invertPitch;/// Whether the roll axis should be inverted.
 bool get invertRoll;/// A multiplier for how much the pitch reading should be amplified/reduced.
 double get pitchGain;/// A multiplier for how much the roll reading should be amplified/reduced.
///
/// If [asymmetricRollGainLeft] is not null, then this becomes the
/// asymmectric roll gain for when the right side is lower than the left.
 double get rollGain;/// A multiplier for how much the roll reading should be amplified/reduced
/// when the left side is lower than the right.
 double? get asymmetricRollGainLeft;/// How many milliseconds we should delay the readings to match the GNSS fix
/// time.
 int get delayReadings;/// Whether to only use readings that are synced with a GNSS reading.
 bool get useOnlyGnssSyncedReadings;
/// Create a copy of ImuConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImuConfigCopyWith<ImuConfig> get copyWith => _$ImuConfigCopyWithImpl<ImuConfig>(this as ImuConfig, _$identity);

  /// Serializes this ImuConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImuConfig&&(identical(other.usePitchAndRoll, usePitchAndRoll) || other.usePitchAndRoll == usePitchAndRoll)&&(identical(other.swapPitchAndRoll, swapPitchAndRoll) || other.swapPitchAndRoll == swapPitchAndRoll)&&(identical(other.zeroValues, zeroValues) || other.zeroValues == zeroValues)&&(identical(other.useYaw, useYaw) || other.useYaw == useYaw)&&(identical(other.invertYaw, invertYaw) || other.invertYaw == invertYaw)&&(identical(other.invertPitch, invertPitch) || other.invertPitch == invertPitch)&&(identical(other.invertRoll, invertRoll) || other.invertRoll == invertRoll)&&(identical(other.pitchGain, pitchGain) || other.pitchGain == pitchGain)&&(identical(other.rollGain, rollGain) || other.rollGain == rollGain)&&(identical(other.asymmetricRollGainLeft, asymmetricRollGainLeft) || other.asymmetricRollGainLeft == asymmetricRollGainLeft)&&(identical(other.delayReadings, delayReadings) || other.delayReadings == delayReadings)&&(identical(other.useOnlyGnssSyncedReadings, useOnlyGnssSyncedReadings) || other.useOnlyGnssSyncedReadings == useOnlyGnssSyncedReadings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usePitchAndRoll,swapPitchAndRoll,zeroValues,useYaw,invertYaw,invertPitch,invertRoll,pitchGain,rollGain,asymmetricRollGainLeft,delayReadings,useOnlyGnssSyncedReadings);

@override
String toString() {
  return 'ImuConfig(usePitchAndRoll: $usePitchAndRoll, swapPitchAndRoll: $swapPitchAndRoll, zeroValues: $zeroValues, useYaw: $useYaw, invertYaw: $invertYaw, invertPitch: $invertPitch, invertRoll: $invertRoll, pitchGain: $pitchGain, rollGain: $rollGain, asymmetricRollGainLeft: $asymmetricRollGainLeft, delayReadings: $delayReadings, useOnlyGnssSyncedReadings: $useOnlyGnssSyncedReadings)';
}


}

/// @nodoc
abstract mixin class $ImuConfigCopyWith<$Res>  {
  factory $ImuConfigCopyWith(ImuConfig value, $Res Function(ImuConfig) _then) = _$ImuConfigCopyWithImpl;
@useResult
$Res call({
 bool usePitchAndRoll, bool swapPitchAndRoll, ImuZeroValues zeroValues, bool useYaw, bool invertYaw, bool invertPitch, bool invertRoll, double pitchGain, double rollGain, double? asymmetricRollGainLeft, int delayReadings, bool useOnlyGnssSyncedReadings
});


$ImuZeroValuesCopyWith<$Res> get zeroValues;

}
/// @nodoc
class _$ImuConfigCopyWithImpl<$Res>
    implements $ImuConfigCopyWith<$Res> {
  _$ImuConfigCopyWithImpl(this._self, this._then);

  final ImuConfig _self;
  final $Res Function(ImuConfig) _then;

/// Create a copy of ImuConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? usePitchAndRoll = null,Object? swapPitchAndRoll = null,Object? zeroValues = null,Object? useYaw = null,Object? invertYaw = null,Object? invertPitch = null,Object? invertRoll = null,Object? pitchGain = null,Object? rollGain = null,Object? asymmetricRollGainLeft = freezed,Object? delayReadings = null,Object? useOnlyGnssSyncedReadings = null,}) {
  return _then(_self.copyWith(
usePitchAndRoll: null == usePitchAndRoll ? _self.usePitchAndRoll : usePitchAndRoll // ignore: cast_nullable_to_non_nullable
as bool,swapPitchAndRoll: null == swapPitchAndRoll ? _self.swapPitchAndRoll : swapPitchAndRoll // ignore: cast_nullable_to_non_nullable
as bool,zeroValues: null == zeroValues ? _self.zeroValues : zeroValues // ignore: cast_nullable_to_non_nullable
as ImuZeroValues,useYaw: null == useYaw ? _self.useYaw : useYaw // ignore: cast_nullable_to_non_nullable
as bool,invertYaw: null == invertYaw ? _self.invertYaw : invertYaw // ignore: cast_nullable_to_non_nullable
as bool,invertPitch: null == invertPitch ? _self.invertPitch : invertPitch // ignore: cast_nullable_to_non_nullable
as bool,invertRoll: null == invertRoll ? _self.invertRoll : invertRoll // ignore: cast_nullable_to_non_nullable
as bool,pitchGain: null == pitchGain ? _self.pitchGain : pitchGain // ignore: cast_nullable_to_non_nullable
as double,rollGain: null == rollGain ? _self.rollGain : rollGain // ignore: cast_nullable_to_non_nullable
as double,asymmetricRollGainLeft: freezed == asymmetricRollGainLeft ? _self.asymmetricRollGainLeft : asymmetricRollGainLeft // ignore: cast_nullable_to_non_nullable
as double?,delayReadings: null == delayReadings ? _self.delayReadings : delayReadings // ignore: cast_nullable_to_non_nullable
as int,useOnlyGnssSyncedReadings: null == useOnlyGnssSyncedReadings ? _self.useOnlyGnssSyncedReadings : useOnlyGnssSyncedReadings // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ImuConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImuZeroValuesCopyWith<$Res> get zeroValues {
  
  return $ImuZeroValuesCopyWith<$Res>(_self.zeroValues, (value) {
    return _then(_self.copyWith(zeroValues: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _ImuConfig implements ImuConfig {
  const _ImuConfig({this.usePitchAndRoll = true, this.swapPitchAndRoll = false, this.zeroValues = const ImuZeroValues(), this.useYaw = false, this.invertYaw = false, this.invertPitch = false, this.invertRoll = false, this.pitchGain = 1, this.rollGain = 1, this.asymmetricRollGainLeft = null, this.delayReadings = 30, this.useOnlyGnssSyncedReadings = true});
  factory _ImuConfig.fromJson(Map<String, dynamic> json) => _$ImuConfigFromJson(json);

/// Whether the vehicle should take into account pitch and roll when
/// representing its position.
@override@JsonKey() final  bool usePitchAndRoll;
/// Whether the pich and roll axes should be swapped.
@override@JsonKey() final  bool swapPitchAndRoll;
/// The zero values for the different axes of the IMU.
@override@JsonKey() final  ImuZeroValues zeroValues;
/// Whether the vehicle's bearing should be the one from the IMU.
@override@JsonKey() final  bool useYaw;
/// Whether the bearing axis should be inverted.
@override@JsonKey() final  bool invertYaw;
/// Whether the pitch axis should be inverted.
@override@JsonKey() final  bool invertPitch;
/// Whether the roll axis should be inverted.
@override@JsonKey() final  bool invertRoll;
/// A multiplier for how much the pitch reading should be amplified/reduced.
@override@JsonKey() final  double pitchGain;
/// A multiplier for how much the roll reading should be amplified/reduced.
///
/// If [asymmetricRollGainLeft] is not null, then this becomes the
/// asymmectric roll gain for when the right side is lower than the left.
@override@JsonKey() final  double rollGain;
/// A multiplier for how much the roll reading should be amplified/reduced
/// when the left side is lower than the right.
@override@JsonKey() final  double? asymmetricRollGainLeft;
/// How many milliseconds we should delay the readings to match the GNSS fix
/// time.
@override@JsonKey() final  int delayReadings;
/// Whether to only use readings that are synced with a GNSS reading.
@override@JsonKey() final  bool useOnlyGnssSyncedReadings;

/// Create a copy of ImuConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImuConfigCopyWith<_ImuConfig> get copyWith => __$ImuConfigCopyWithImpl<_ImuConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImuConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImuConfig&&(identical(other.usePitchAndRoll, usePitchAndRoll) || other.usePitchAndRoll == usePitchAndRoll)&&(identical(other.swapPitchAndRoll, swapPitchAndRoll) || other.swapPitchAndRoll == swapPitchAndRoll)&&(identical(other.zeroValues, zeroValues) || other.zeroValues == zeroValues)&&(identical(other.useYaw, useYaw) || other.useYaw == useYaw)&&(identical(other.invertYaw, invertYaw) || other.invertYaw == invertYaw)&&(identical(other.invertPitch, invertPitch) || other.invertPitch == invertPitch)&&(identical(other.invertRoll, invertRoll) || other.invertRoll == invertRoll)&&(identical(other.pitchGain, pitchGain) || other.pitchGain == pitchGain)&&(identical(other.rollGain, rollGain) || other.rollGain == rollGain)&&(identical(other.asymmetricRollGainLeft, asymmetricRollGainLeft) || other.asymmetricRollGainLeft == asymmetricRollGainLeft)&&(identical(other.delayReadings, delayReadings) || other.delayReadings == delayReadings)&&(identical(other.useOnlyGnssSyncedReadings, useOnlyGnssSyncedReadings) || other.useOnlyGnssSyncedReadings == useOnlyGnssSyncedReadings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,usePitchAndRoll,swapPitchAndRoll,zeroValues,useYaw,invertYaw,invertPitch,invertRoll,pitchGain,rollGain,asymmetricRollGainLeft,delayReadings,useOnlyGnssSyncedReadings);

@override
String toString() {
  return 'ImuConfig(usePitchAndRoll: $usePitchAndRoll, swapPitchAndRoll: $swapPitchAndRoll, zeroValues: $zeroValues, useYaw: $useYaw, invertYaw: $invertYaw, invertPitch: $invertPitch, invertRoll: $invertRoll, pitchGain: $pitchGain, rollGain: $rollGain, asymmetricRollGainLeft: $asymmetricRollGainLeft, delayReadings: $delayReadings, useOnlyGnssSyncedReadings: $useOnlyGnssSyncedReadings)';
}


}

/// @nodoc
abstract mixin class _$ImuConfigCopyWith<$Res> implements $ImuConfigCopyWith<$Res> {
  factory _$ImuConfigCopyWith(_ImuConfig value, $Res Function(_ImuConfig) _then) = __$ImuConfigCopyWithImpl;
@override @useResult
$Res call({
 bool usePitchAndRoll, bool swapPitchAndRoll, ImuZeroValues zeroValues, bool useYaw, bool invertYaw, bool invertPitch, bool invertRoll, double pitchGain, double rollGain, double? asymmetricRollGainLeft, int delayReadings, bool useOnlyGnssSyncedReadings
});


@override $ImuZeroValuesCopyWith<$Res> get zeroValues;

}
/// @nodoc
class __$ImuConfigCopyWithImpl<$Res>
    implements _$ImuConfigCopyWith<$Res> {
  __$ImuConfigCopyWithImpl(this._self, this._then);

  final _ImuConfig _self;
  final $Res Function(_ImuConfig) _then;

/// Create a copy of ImuConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? usePitchAndRoll = null,Object? swapPitchAndRoll = null,Object? zeroValues = null,Object? useYaw = null,Object? invertYaw = null,Object? invertPitch = null,Object? invertRoll = null,Object? pitchGain = null,Object? rollGain = null,Object? asymmetricRollGainLeft = freezed,Object? delayReadings = null,Object? useOnlyGnssSyncedReadings = null,}) {
  return _then(_ImuConfig(
usePitchAndRoll: null == usePitchAndRoll ? _self.usePitchAndRoll : usePitchAndRoll // ignore: cast_nullable_to_non_nullable
as bool,swapPitchAndRoll: null == swapPitchAndRoll ? _self.swapPitchAndRoll : swapPitchAndRoll // ignore: cast_nullable_to_non_nullable
as bool,zeroValues: null == zeroValues ? _self.zeroValues : zeroValues // ignore: cast_nullable_to_non_nullable
as ImuZeroValues,useYaw: null == useYaw ? _self.useYaw : useYaw // ignore: cast_nullable_to_non_nullable
as bool,invertYaw: null == invertYaw ? _self.invertYaw : invertYaw // ignore: cast_nullable_to_non_nullable
as bool,invertPitch: null == invertPitch ? _self.invertPitch : invertPitch // ignore: cast_nullable_to_non_nullable
as bool,invertRoll: null == invertRoll ? _self.invertRoll : invertRoll // ignore: cast_nullable_to_non_nullable
as bool,pitchGain: null == pitchGain ? _self.pitchGain : pitchGain // ignore: cast_nullable_to_non_nullable
as double,rollGain: null == rollGain ? _self.rollGain : rollGain // ignore: cast_nullable_to_non_nullable
as double,asymmetricRollGainLeft: freezed == asymmetricRollGainLeft ? _self.asymmetricRollGainLeft : asymmetricRollGainLeft // ignore: cast_nullable_to_non_nullable
as double?,delayReadings: null == delayReadings ? _self.delayReadings : delayReadings // ignore: cast_nullable_to_non_nullable
as int,useOnlyGnssSyncedReadings: null == useOnlyGnssSyncedReadings ? _self.useOnlyGnssSyncedReadings : useOnlyGnssSyncedReadings // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ImuConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImuZeroValuesCopyWith<$Res> get zeroValues {
  
  return $ImuZeroValuesCopyWith<$Res>(_self.zeroValues, (value) {
    return _then(_self.copyWith(zeroValues: value));
  });
}
}

// dart format on
