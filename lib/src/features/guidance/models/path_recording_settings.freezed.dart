// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_recording_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PathRecordingSettings {

/// Minimum distance between points in meters.
 double get minDistance;/// Maximum distance between points in meters.
 double get maxDistance;/// Maximum difference between the previous [WayPoint.bearing] and the
/// vehicle's current bearing.
 double get maxBearingDifference;/// Offset distance in meters in the bearing+90° direction from the
/// vehicle's position.
 double get lateralOffset;/// Offset distance in meters in the bearing direction from the
/// vehicle's position.
 double get longitudinalOffset;
/// Create a copy of PathRecordingSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathRecordingSettingsCopyWith<PathRecordingSettings> get copyWith => _$PathRecordingSettingsCopyWithImpl<PathRecordingSettings>(this as PathRecordingSettings, _$identity);

  /// Serializes this PathRecordingSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathRecordingSettings&&(identical(other.minDistance, minDistance) || other.minDistance == minDistance)&&(identical(other.maxDistance, maxDistance) || other.maxDistance == maxDistance)&&(identical(other.maxBearingDifference, maxBearingDifference) || other.maxBearingDifference == maxBearingDifference)&&(identical(other.lateralOffset, lateralOffset) || other.lateralOffset == lateralOffset)&&(identical(other.longitudinalOffset, longitudinalOffset) || other.longitudinalOffset == longitudinalOffset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minDistance,maxDistance,maxBearingDifference,lateralOffset,longitudinalOffset);

@override
String toString() {
  return 'PathRecordingSettings(minDistance: $minDistance, maxDistance: $maxDistance, maxBearingDifference: $maxBearingDifference, lateralOffset: $lateralOffset, longitudinalOffset: $longitudinalOffset)';
}


}

/// @nodoc
abstract mixin class $PathRecordingSettingsCopyWith<$Res>  {
  factory $PathRecordingSettingsCopyWith(PathRecordingSettings value, $Res Function(PathRecordingSettings) _then) = _$PathRecordingSettingsCopyWithImpl;
@useResult
$Res call({
 double minDistance, double maxDistance, double maxBearingDifference, double lateralOffset, double longitudinalOffset
});




}
/// @nodoc
class _$PathRecordingSettingsCopyWithImpl<$Res>
    implements $PathRecordingSettingsCopyWith<$Res> {
  _$PathRecordingSettingsCopyWithImpl(this._self, this._then);

  final PathRecordingSettings _self;
  final $Res Function(PathRecordingSettings) _then;

/// Create a copy of PathRecordingSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minDistance = null,Object? maxDistance = null,Object? maxBearingDifference = null,Object? lateralOffset = null,Object? longitudinalOffset = null,}) {
  return _then(_self.copyWith(
minDistance: null == minDistance ? _self.minDistance : minDistance // ignore: cast_nullable_to_non_nullable
as double,maxDistance: null == maxDistance ? _self.maxDistance : maxDistance // ignore: cast_nullable_to_non_nullable
as double,maxBearingDifference: null == maxBearingDifference ? _self.maxBearingDifference : maxBearingDifference // ignore: cast_nullable_to_non_nullable
as double,lateralOffset: null == lateralOffset ? _self.lateralOffset : lateralOffset // ignore: cast_nullable_to_non_nullable
as double,longitudinalOffset: null == longitudinalOffset ? _self.longitudinalOffset : longitudinalOffset // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PathRecordingSettings].
extension PathRecordingSettingsPatterns on PathRecordingSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathRecordingSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathRecordingSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathRecordingSettings value)  $default,){
final _that = this;
switch (_that) {
case _PathRecordingSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathRecordingSettings value)?  $default,){
final _that = this;
switch (_that) {
case _PathRecordingSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minDistance,  double maxDistance,  double maxBearingDifference,  double lateralOffset,  double longitudinalOffset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathRecordingSettings() when $default != null:
return $default(_that.minDistance,_that.maxDistance,_that.maxBearingDifference,_that.lateralOffset,_that.longitudinalOffset);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minDistance,  double maxDistance,  double maxBearingDifference,  double lateralOffset,  double longitudinalOffset)  $default,) {final _that = this;
switch (_that) {
case _PathRecordingSettings():
return $default(_that.minDistance,_that.maxDistance,_that.maxBearingDifference,_that.lateralOffset,_that.longitudinalOffset);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minDistance,  double maxDistance,  double maxBearingDifference,  double lateralOffset,  double longitudinalOffset)?  $default,) {final _that = this;
switch (_that) {
case _PathRecordingSettings() when $default != null:
return $default(_that.minDistance,_that.maxDistance,_that.maxBearingDifference,_that.lateralOffset,_that.longitudinalOffset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PathRecordingSettings implements PathRecordingSettings {
  const _PathRecordingSettings({this.minDistance = 1, this.maxDistance = 20, this.maxBearingDifference = 1, this.lateralOffset = 0, this.longitudinalOffset = 0});
  factory _PathRecordingSettings.fromJson(Map<String, dynamic> json) => _$PathRecordingSettingsFromJson(json);

/// Minimum distance between points in meters.
@override@JsonKey() final  double minDistance;
/// Maximum distance between points in meters.
@override@JsonKey() final  double maxDistance;
/// Maximum difference between the previous [WayPoint.bearing] and the
/// vehicle's current bearing.
@override@JsonKey() final  double maxBearingDifference;
/// Offset distance in meters in the bearing+90° direction from the
/// vehicle's position.
@override@JsonKey() final  double lateralOffset;
/// Offset distance in meters in the bearing direction from the
/// vehicle's position.
@override@JsonKey() final  double longitudinalOffset;

/// Create a copy of PathRecordingSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathRecordingSettingsCopyWith<_PathRecordingSettings> get copyWith => __$PathRecordingSettingsCopyWithImpl<_PathRecordingSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PathRecordingSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathRecordingSettings&&(identical(other.minDistance, minDistance) || other.minDistance == minDistance)&&(identical(other.maxDistance, maxDistance) || other.maxDistance == maxDistance)&&(identical(other.maxBearingDifference, maxBearingDifference) || other.maxBearingDifference == maxBearingDifference)&&(identical(other.lateralOffset, lateralOffset) || other.lateralOffset == lateralOffset)&&(identical(other.longitudinalOffset, longitudinalOffset) || other.longitudinalOffset == longitudinalOffset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minDistance,maxDistance,maxBearingDifference,lateralOffset,longitudinalOffset);

@override
String toString() {
  return 'PathRecordingSettings(minDistance: $minDistance, maxDistance: $maxDistance, maxBearingDifference: $maxBearingDifference, lateralOffset: $lateralOffset, longitudinalOffset: $longitudinalOffset)';
}


}

/// @nodoc
abstract mixin class _$PathRecordingSettingsCopyWith<$Res> implements $PathRecordingSettingsCopyWith<$Res> {
  factory _$PathRecordingSettingsCopyWith(_PathRecordingSettings value, $Res Function(_PathRecordingSettings) _then) = __$PathRecordingSettingsCopyWithImpl;
@override @useResult
$Res call({
 double minDistance, double maxDistance, double maxBearingDifference, double lateralOffset, double longitudinalOffset
});




}
/// @nodoc
class __$PathRecordingSettingsCopyWithImpl<$Res>
    implements _$PathRecordingSettingsCopyWith<$Res> {
  __$PathRecordingSettingsCopyWithImpl(this._self, this._then);

  final _PathRecordingSettings _self;
  final $Res Function(_PathRecordingSettings) _then;

/// Create a copy of PathRecordingSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minDistance = null,Object? maxDistance = null,Object? maxBearingDifference = null,Object? lateralOffset = null,Object? longitudinalOffset = null,}) {
  return _then(_PathRecordingSettings(
minDistance: null == minDistance ? _self.minDistance : minDistance // ignore: cast_nullable_to_non_nullable
as double,maxDistance: null == maxDistance ? _self.maxDistance : maxDistance // ignore: cast_nullable_to_non_nullable
as double,maxBearingDifference: null == maxBearingDifference ? _self.maxBearingDifference : maxBearingDifference // ignore: cast_nullable_to_non_nullable
as double,lateralOffset: null == lateralOffset ? _self.lateralOffset : lateralOffset // ignore: cast_nullable_to_non_nullable
as double,longitudinalOffset: null == longitudinalOffset ? _self.longitudinalOffset : longitudinalOffset // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
