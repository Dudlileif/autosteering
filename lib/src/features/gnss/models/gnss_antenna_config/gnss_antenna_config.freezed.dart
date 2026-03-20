// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gnss_antenna_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GnssAntennaConfig {

/// Longitudinal offset in meters from the main node of the vehicle,
/// positive means in front of the node, and negative behind.
 double get longitudinalOffset;/// Lateral offset in meters from the main node of the vehicle. Positive
/// value means to the right of the node and negative value means to the
/// left of the node.
 double get lateralOffset;/// Antenna height in meters from the ground.
 double get height;/// Whether a secondary antenna is available and to be used for heading.
 bool get useDualHeading;/// Whether a secondary antenna is available and to be used for roll.
 bool get useDualRoll;/// The distance in meters between the main antenna and the secondary
/// antenna.
 double get dualBaseline;/// The angle in degrees from the main antenna to the secondary antenna,
/// where 0° means that the secondary antenna is straight ahead of the main
/// antenna.
///
/// Typically this value should be 90° when the main antenna is on the left
/// side of the vehicle and the secondary antenna on the right side of the
/// vehicle.
 double get dualRelativeAngle;/// The gain to apply when using the dual antennas for roll.
 double get dualRollGain;/// Configuration strings for configuring the GNSS receiver on startup.
 List<String>? get receiverConfigs;
/// Create a copy of GnssAntennaConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GnssAntennaConfigCopyWith<GnssAntennaConfig> get copyWith => _$GnssAntennaConfigCopyWithImpl<GnssAntennaConfig>(this as GnssAntennaConfig, _$identity);

  /// Serializes this GnssAntennaConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GnssAntennaConfig&&(identical(other.longitudinalOffset, longitudinalOffset) || other.longitudinalOffset == longitudinalOffset)&&(identical(other.lateralOffset, lateralOffset) || other.lateralOffset == lateralOffset)&&(identical(other.height, height) || other.height == height)&&(identical(other.useDualHeading, useDualHeading) || other.useDualHeading == useDualHeading)&&(identical(other.useDualRoll, useDualRoll) || other.useDualRoll == useDualRoll)&&(identical(other.dualBaseline, dualBaseline) || other.dualBaseline == dualBaseline)&&(identical(other.dualRelativeAngle, dualRelativeAngle) || other.dualRelativeAngle == dualRelativeAngle)&&(identical(other.dualRollGain, dualRollGain) || other.dualRollGain == dualRollGain)&&const DeepCollectionEquality().equals(other.receiverConfigs, receiverConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,longitudinalOffset,lateralOffset,height,useDualHeading,useDualRoll,dualBaseline,dualRelativeAngle,dualRollGain,const DeepCollectionEquality().hash(receiverConfigs));

@override
String toString() {
  return 'GnssAntennaConfig(longitudinalOffset: $longitudinalOffset, lateralOffset: $lateralOffset, height: $height, useDualHeading: $useDualHeading, useDualRoll: $useDualRoll, dualBaseline: $dualBaseline, dualRelativeAngle: $dualRelativeAngle, dualRollGain: $dualRollGain, receiverConfigs: $receiverConfigs)';
}


}

/// @nodoc
abstract mixin class $GnssAntennaConfigCopyWith<$Res>  {
  factory $GnssAntennaConfigCopyWith(GnssAntennaConfig value, $Res Function(GnssAntennaConfig) _then) = _$GnssAntennaConfigCopyWithImpl;
@useResult
$Res call({
 double longitudinalOffset, double lateralOffset, double height, bool useDualHeading, bool useDualRoll, double dualBaseline, double dualRelativeAngle, double dualRollGain, List<String>? receiverConfigs
});




}
/// @nodoc
class _$GnssAntennaConfigCopyWithImpl<$Res>
    implements $GnssAntennaConfigCopyWith<$Res> {
  _$GnssAntennaConfigCopyWithImpl(this._self, this._then);

  final GnssAntennaConfig _self;
  final $Res Function(GnssAntennaConfig) _then;

/// Create a copy of GnssAntennaConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? longitudinalOffset = null,Object? lateralOffset = null,Object? height = null,Object? useDualHeading = null,Object? useDualRoll = null,Object? dualBaseline = null,Object? dualRelativeAngle = null,Object? dualRollGain = null,Object? receiverConfigs = freezed,}) {
  return _then(_self.copyWith(
longitudinalOffset: null == longitudinalOffset ? _self.longitudinalOffset : longitudinalOffset // ignore: cast_nullable_to_non_nullable
as double,lateralOffset: null == lateralOffset ? _self.lateralOffset : lateralOffset // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,useDualHeading: null == useDualHeading ? _self.useDualHeading : useDualHeading // ignore: cast_nullable_to_non_nullable
as bool,useDualRoll: null == useDualRoll ? _self.useDualRoll : useDualRoll // ignore: cast_nullable_to_non_nullable
as bool,dualBaseline: null == dualBaseline ? _self.dualBaseline : dualBaseline // ignore: cast_nullable_to_non_nullable
as double,dualRelativeAngle: null == dualRelativeAngle ? _self.dualRelativeAngle : dualRelativeAngle // ignore: cast_nullable_to_non_nullable
as double,dualRollGain: null == dualRollGain ? _self.dualRollGain : dualRollGain // ignore: cast_nullable_to_non_nullable
as double,receiverConfigs: freezed == receiverConfigs ? _self.receiverConfigs : receiverConfigs // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GnssAntennaConfig].
extension GnssAntennaConfigPatterns on GnssAntennaConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GnssAntennaConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GnssAntennaConfig() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GnssAntennaConfig value)  $default,){
final _that = this;
switch (_that) {
case _GnssAntennaConfig():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GnssAntennaConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GnssAntennaConfig() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double longitudinalOffset,  double lateralOffset,  double height,  bool useDualHeading,  bool useDualRoll,  double dualBaseline,  double dualRelativeAngle,  double dualRollGain,  List<String>? receiverConfigs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GnssAntennaConfig() when $default != null:
return $default(_that.longitudinalOffset,_that.lateralOffset,_that.height,_that.useDualHeading,_that.useDualRoll,_that.dualBaseline,_that.dualRelativeAngle,_that.dualRollGain,_that.receiverConfigs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double longitudinalOffset,  double lateralOffset,  double height,  bool useDualHeading,  bool useDualRoll,  double dualBaseline,  double dualRelativeAngle,  double dualRollGain,  List<String>? receiverConfigs)  $default,) {final _that = this;
switch (_that) {
case _GnssAntennaConfig():
return $default(_that.longitudinalOffset,_that.lateralOffset,_that.height,_that.useDualHeading,_that.useDualRoll,_that.dualBaseline,_that.dualRelativeAngle,_that.dualRollGain,_that.receiverConfigs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double longitudinalOffset,  double lateralOffset,  double height,  bool useDualHeading,  bool useDualRoll,  double dualBaseline,  double dualRelativeAngle,  double dualRollGain,  List<String>? receiverConfigs)?  $default,) {final _that = this;
switch (_that) {
case _GnssAntennaConfig() when $default != null:
return $default(_that.longitudinalOffset,_that.lateralOffset,_that.height,_that.useDualHeading,_that.useDualRoll,_that.dualBaseline,_that.dualRelativeAngle,_that.dualRollGain,_that.receiverConfigs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GnssAntennaConfig implements GnssAntennaConfig {
  const _GnssAntennaConfig({this.longitudinalOffset = 0, this.lateralOffset = 0, this.height = 2.8, this.useDualHeading = false, this.useDualRoll = false, this.dualBaseline = 1, this.dualRelativeAngle = 90, this.dualRollGain = 1, final  List<String>? receiverConfigs = null}): _receiverConfigs = receiverConfigs;
  factory _GnssAntennaConfig.fromJson(Map<String, dynamic> json) => _$GnssAntennaConfigFromJson(json);

/// Longitudinal offset in meters from the main node of the vehicle,
/// positive means in front of the node, and negative behind.
@override@JsonKey() final  double longitudinalOffset;
/// Lateral offset in meters from the main node of the vehicle. Positive
/// value means to the right of the node and negative value means to the
/// left of the node.
@override@JsonKey() final  double lateralOffset;
/// Antenna height in meters from the ground.
@override@JsonKey() final  double height;
/// Whether a secondary antenna is available and to be used for heading.
@override@JsonKey() final  bool useDualHeading;
/// Whether a secondary antenna is available and to be used for roll.
@override@JsonKey() final  bool useDualRoll;
/// The distance in meters between the main antenna and the secondary
/// antenna.
@override@JsonKey() final  double dualBaseline;
/// The angle in degrees from the main antenna to the secondary antenna,
/// where 0° means that the secondary antenna is straight ahead of the main
/// antenna.
///
/// Typically this value should be 90° when the main antenna is on the left
/// side of the vehicle and the secondary antenna on the right side of the
/// vehicle.
@override@JsonKey() final  double dualRelativeAngle;
/// The gain to apply when using the dual antennas for roll.
@override@JsonKey() final  double dualRollGain;
/// Configuration strings for configuring the GNSS receiver on startup.
 final  List<String>? _receiverConfigs;
/// Configuration strings for configuring the GNSS receiver on startup.
@override@JsonKey() List<String>? get receiverConfigs {
  final value = _receiverConfigs;
  if (value == null) return null;
  if (_receiverConfigs is EqualUnmodifiableListView) return _receiverConfigs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GnssAntennaConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GnssAntennaConfigCopyWith<_GnssAntennaConfig> get copyWith => __$GnssAntennaConfigCopyWithImpl<_GnssAntennaConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GnssAntennaConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GnssAntennaConfig&&(identical(other.longitudinalOffset, longitudinalOffset) || other.longitudinalOffset == longitudinalOffset)&&(identical(other.lateralOffset, lateralOffset) || other.lateralOffset == lateralOffset)&&(identical(other.height, height) || other.height == height)&&(identical(other.useDualHeading, useDualHeading) || other.useDualHeading == useDualHeading)&&(identical(other.useDualRoll, useDualRoll) || other.useDualRoll == useDualRoll)&&(identical(other.dualBaseline, dualBaseline) || other.dualBaseline == dualBaseline)&&(identical(other.dualRelativeAngle, dualRelativeAngle) || other.dualRelativeAngle == dualRelativeAngle)&&(identical(other.dualRollGain, dualRollGain) || other.dualRollGain == dualRollGain)&&const DeepCollectionEquality().equals(other._receiverConfigs, _receiverConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,longitudinalOffset,lateralOffset,height,useDualHeading,useDualRoll,dualBaseline,dualRelativeAngle,dualRollGain,const DeepCollectionEquality().hash(_receiverConfigs));

@override
String toString() {
  return 'GnssAntennaConfig(longitudinalOffset: $longitudinalOffset, lateralOffset: $lateralOffset, height: $height, useDualHeading: $useDualHeading, useDualRoll: $useDualRoll, dualBaseline: $dualBaseline, dualRelativeAngle: $dualRelativeAngle, dualRollGain: $dualRollGain, receiverConfigs: $receiverConfigs)';
}


}

/// @nodoc
abstract mixin class _$GnssAntennaConfigCopyWith<$Res> implements $GnssAntennaConfigCopyWith<$Res> {
  factory _$GnssAntennaConfigCopyWith(_GnssAntennaConfig value, $Res Function(_GnssAntennaConfig) _then) = __$GnssAntennaConfigCopyWithImpl;
@override @useResult
$Res call({
 double longitudinalOffset, double lateralOffset, double height, bool useDualHeading, bool useDualRoll, double dualBaseline, double dualRelativeAngle, double dualRollGain, List<String>? receiverConfigs
});




}
/// @nodoc
class __$GnssAntennaConfigCopyWithImpl<$Res>
    implements _$GnssAntennaConfigCopyWith<$Res> {
  __$GnssAntennaConfigCopyWithImpl(this._self, this._then);

  final _GnssAntennaConfig _self;
  final $Res Function(_GnssAntennaConfig) _then;

/// Create a copy of GnssAntennaConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? longitudinalOffset = null,Object? lateralOffset = null,Object? height = null,Object? useDualHeading = null,Object? useDualRoll = null,Object? dualBaseline = null,Object? dualRelativeAngle = null,Object? dualRollGain = null,Object? receiverConfigs = freezed,}) {
  return _then(_GnssAntennaConfig(
longitudinalOffset: null == longitudinalOffset ? _self.longitudinalOffset : longitudinalOffset // ignore: cast_nullable_to_non_nullable
as double,lateralOffset: null == lateralOffset ? _self.lateralOffset : lateralOffset // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,useDualHeading: null == useDualHeading ? _self.useDualHeading : useDualHeading // ignore: cast_nullable_to_non_nullable
as bool,useDualRoll: null == useDualRoll ? _self.useDualRoll : useDualRoll // ignore: cast_nullable_to_non_nullable
as bool,dualBaseline: null == dualBaseline ? _self.dualBaseline : dualBaseline // ignore: cast_nullable_to_non_nullable
as double,dualRelativeAngle: null == dualRelativeAngle ? _self.dualRelativeAngle : dualRelativeAngle // ignore: cast_nullable_to_non_nullable
as double,dualRollGain: null == dualRollGain ? _self.dualRollGain : dualRollGain // ignore: cast_nullable_to_non_nullable
as double,receiverConfigs: freezed == receiverConfigs ? _self._receiverConfigs : receiverConfigs // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
