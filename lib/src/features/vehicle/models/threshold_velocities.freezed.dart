// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'threshold_velocities.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ThresholdVelocities {

/// Minimum velocity with autosteering enabled in m/s.
 double get minVelocity;/// Max forward velocity with autosteering enabled in m/s.
 double get maxVelocity;/// Max reversing velocity with autosteering enabled in m/s.
 double get maxReversingVelocity;/// Angular velocity in deg/s.
 double get maxAngularVelocity;
/// Create a copy of ThresholdVelocities
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThresholdVelocitiesCopyWith<ThresholdVelocities> get copyWith => _$ThresholdVelocitiesCopyWithImpl<ThresholdVelocities>(this as ThresholdVelocities, _$identity);

  /// Serializes this ThresholdVelocities to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThresholdVelocities&&(identical(other.minVelocity, minVelocity) || other.minVelocity == minVelocity)&&(identical(other.maxVelocity, maxVelocity) || other.maxVelocity == maxVelocity)&&(identical(other.maxReversingVelocity, maxReversingVelocity) || other.maxReversingVelocity == maxReversingVelocity)&&(identical(other.maxAngularVelocity, maxAngularVelocity) || other.maxAngularVelocity == maxAngularVelocity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minVelocity,maxVelocity,maxReversingVelocity,maxAngularVelocity);

@override
String toString() {
  return 'ThresholdVelocities(minVelocity: $minVelocity, maxVelocity: $maxVelocity, maxReversingVelocity: $maxReversingVelocity, maxAngularVelocity: $maxAngularVelocity)';
}


}

/// @nodoc
abstract mixin class $ThresholdVelocitiesCopyWith<$Res>  {
  factory $ThresholdVelocitiesCopyWith(ThresholdVelocities value, $Res Function(ThresholdVelocities) _then) = _$ThresholdVelocitiesCopyWithImpl;
@useResult
$Res call({
 double minVelocity, double maxVelocity, double maxReversingVelocity, double maxAngularVelocity
});




}
/// @nodoc
class _$ThresholdVelocitiesCopyWithImpl<$Res>
    implements $ThresholdVelocitiesCopyWith<$Res> {
  _$ThresholdVelocitiesCopyWithImpl(this._self, this._then);

  final ThresholdVelocities _self;
  final $Res Function(ThresholdVelocities) _then;

/// Create a copy of ThresholdVelocities
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? minVelocity = null,Object? maxVelocity = null,Object? maxReversingVelocity = null,Object? maxAngularVelocity = null,}) {
  return _then(_self.copyWith(
minVelocity: null == minVelocity ? _self.minVelocity : minVelocity // ignore: cast_nullable_to_non_nullable
as double,maxVelocity: null == maxVelocity ? _self.maxVelocity : maxVelocity // ignore: cast_nullable_to_non_nullable
as double,maxReversingVelocity: null == maxReversingVelocity ? _self.maxReversingVelocity : maxReversingVelocity // ignore: cast_nullable_to_non_nullable
as double,maxAngularVelocity: null == maxAngularVelocity ? _self.maxAngularVelocity : maxAngularVelocity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ThresholdVelocities].
extension ThresholdVelocitiesPatterns on ThresholdVelocities {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThresholdVelocities value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThresholdVelocities() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThresholdVelocities value)  $default,){
final _that = this;
switch (_that) {
case _ThresholdVelocities():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThresholdVelocities value)?  $default,){
final _that = this;
switch (_that) {
case _ThresholdVelocities() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double minVelocity,  double maxVelocity,  double maxReversingVelocity,  double maxAngularVelocity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThresholdVelocities() when $default != null:
return $default(_that.minVelocity,_that.maxVelocity,_that.maxReversingVelocity,_that.maxAngularVelocity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double minVelocity,  double maxVelocity,  double maxReversingVelocity,  double maxAngularVelocity)  $default,) {final _that = this;
switch (_that) {
case _ThresholdVelocities():
return $default(_that.minVelocity,_that.maxVelocity,_that.maxReversingVelocity,_that.maxAngularVelocity);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double minVelocity,  double maxVelocity,  double maxReversingVelocity,  double maxAngularVelocity)?  $default,) {final _that = this;
switch (_that) {
case _ThresholdVelocities() when $default != null:
return $default(_that.minVelocity,_that.maxVelocity,_that.maxReversingVelocity,_that.maxAngularVelocity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThresholdVelocities implements ThresholdVelocities {
  const _ThresholdVelocities({this.minVelocity = 0.05, this.maxVelocity = 5, this.maxReversingVelocity = 0, this.maxAngularVelocity = 30});
  factory _ThresholdVelocities.fromJson(Map<String, dynamic> json) => _$ThresholdVelocitiesFromJson(json);

/// Minimum velocity with autosteering enabled in m/s.
@override@JsonKey() final  double minVelocity;
/// Max forward velocity with autosteering enabled in m/s.
@override@JsonKey() final  double maxVelocity;
/// Max reversing velocity with autosteering enabled in m/s.
@override@JsonKey() final  double maxReversingVelocity;
/// Angular velocity in deg/s.
@override@JsonKey() final  double maxAngularVelocity;

/// Create a copy of ThresholdVelocities
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThresholdVelocitiesCopyWith<_ThresholdVelocities> get copyWith => __$ThresholdVelocitiesCopyWithImpl<_ThresholdVelocities>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThresholdVelocitiesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThresholdVelocities&&(identical(other.minVelocity, minVelocity) || other.minVelocity == minVelocity)&&(identical(other.maxVelocity, maxVelocity) || other.maxVelocity == maxVelocity)&&(identical(other.maxReversingVelocity, maxReversingVelocity) || other.maxReversingVelocity == maxReversingVelocity)&&(identical(other.maxAngularVelocity, maxAngularVelocity) || other.maxAngularVelocity == maxAngularVelocity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minVelocity,maxVelocity,maxReversingVelocity,maxAngularVelocity);

@override
String toString() {
  return 'ThresholdVelocities(minVelocity: $minVelocity, maxVelocity: $maxVelocity, maxReversingVelocity: $maxReversingVelocity, maxAngularVelocity: $maxAngularVelocity)';
}


}

/// @nodoc
abstract mixin class _$ThresholdVelocitiesCopyWith<$Res> implements $ThresholdVelocitiesCopyWith<$Res> {
  factory _$ThresholdVelocitiesCopyWith(_ThresholdVelocities value, $Res Function(_ThresholdVelocities) _then) = __$ThresholdVelocitiesCopyWithImpl;
@override @useResult
$Res call({
 double minVelocity, double maxVelocity, double maxReversingVelocity, double maxAngularVelocity
});




}
/// @nodoc
class __$ThresholdVelocitiesCopyWithImpl<$Res>
    implements _$ThresholdVelocitiesCopyWith<$Res> {
  __$ThresholdVelocitiesCopyWithImpl(this._self, this._then);

  final _ThresholdVelocities _self;
  final $Res Function(_ThresholdVelocities) _then;

/// Create a copy of ThresholdVelocities
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minVelocity = null,Object? maxVelocity = null,Object? maxReversingVelocity = null,Object? maxAngularVelocity = null,}) {
  return _then(_ThresholdVelocities(
minVelocity: null == minVelocity ? _self.minVelocity : minVelocity // ignore: cast_nullable_to_non_nullable
as double,maxVelocity: null == maxVelocity ? _self.maxVelocity : maxVelocity // ignore: cast_nullable_to_non_nullable
as double,maxReversingVelocity: null == maxReversingVelocity ? _self.maxReversingVelocity : maxReversingVelocity // ignore: cast_nullable_to_non_nullable
as double,maxAngularVelocity: null == maxAngularVelocity ? _self.maxAngularVelocity : maxAngularVelocity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
