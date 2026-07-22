// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_thresholds.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VehicleThresholds {

/// Minimum velocity with autosteering enabled in m/s.
 double get minVelocity;/// Max forward velocity with autosteering enabled in m/s.
 double get maxVelocity;/// Max reversing velocity with autosteering enabled in m/s.
 double get maxReversingVelocity;/// Angular velocity in deg/s.
 double get maxAngularVelocity;
/// Create a copy of VehicleThresholds
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleThresholdsCopyWith<VehicleThresholds> get copyWith => _$VehicleThresholdsCopyWithImpl<VehicleThresholds>(this as VehicleThresholds, _$identity);

  /// Serializes this VehicleThresholds to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleThresholds&&(identical(other.minVelocity, minVelocity) || other.minVelocity == minVelocity)&&(identical(other.maxVelocity, maxVelocity) || other.maxVelocity == maxVelocity)&&(identical(other.maxReversingVelocity, maxReversingVelocity) || other.maxReversingVelocity == maxReversingVelocity)&&(identical(other.maxAngularVelocity, maxAngularVelocity) || other.maxAngularVelocity == maxAngularVelocity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minVelocity,maxVelocity,maxReversingVelocity,maxAngularVelocity);

@override
String toString() {
  return 'VehicleThresholds(minVelocity: $minVelocity, maxVelocity: $maxVelocity, maxReversingVelocity: $maxReversingVelocity, maxAngularVelocity: $maxAngularVelocity)';
}


}

/// @nodoc
abstract mixin class $VehicleThresholdsCopyWith<$Res>  {
  factory $VehicleThresholdsCopyWith(VehicleThresholds value, $Res Function(VehicleThresholds) _then) = _$VehicleThresholdsCopyWithImpl;
@useResult
$Res call({
 double minVelocity, double maxVelocity, double maxReversingVelocity, double maxAngularVelocity
});




}
/// @nodoc
class _$VehicleThresholdsCopyWithImpl<$Res>
    implements $VehicleThresholdsCopyWith<$Res> {
  _$VehicleThresholdsCopyWithImpl(this._self, this._then);

  final VehicleThresholds _self;
  final $Res Function(VehicleThresholds) _then;

/// Create a copy of VehicleThresholds
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


/// Adds pattern-matching-related methods to [VehicleThresholds].
extension VehicleThresholdsPatterns on VehicleThresholds {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleThresholds value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleThresholds() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleThresholds value)  $default,){
final _that = this;
switch (_that) {
case _VehicleThresholds():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleThresholds value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleThresholds() when $default != null:
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
case _VehicleThresholds() when $default != null:
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
case _VehicleThresholds():
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
case _VehicleThresholds() when $default != null:
return $default(_that.minVelocity,_that.maxVelocity,_that.maxReversingVelocity,_that.maxAngularVelocity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VehicleThresholds implements VehicleThresholds {
  const _VehicleThresholds({this.minVelocity = 0.05, this.maxVelocity = 5, this.maxReversingVelocity = 0, this.maxAngularVelocity = 30});
  factory _VehicleThresholds.fromJson(Map<String, dynamic> json) => _$VehicleThresholdsFromJson(json);

/// Minimum velocity with autosteering enabled in m/s.
@override@JsonKey() final  double minVelocity;
/// Max forward velocity with autosteering enabled in m/s.
@override@JsonKey() final  double maxVelocity;
/// Max reversing velocity with autosteering enabled in m/s.
@override@JsonKey() final  double maxReversingVelocity;
/// Angular velocity in deg/s.
@override@JsonKey() final  double maxAngularVelocity;

/// Create a copy of VehicleThresholds
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleThresholdsCopyWith<_VehicleThresholds> get copyWith => __$VehicleThresholdsCopyWithImpl<_VehicleThresholds>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VehicleThresholdsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleThresholds&&(identical(other.minVelocity, minVelocity) || other.minVelocity == minVelocity)&&(identical(other.maxVelocity, maxVelocity) || other.maxVelocity == maxVelocity)&&(identical(other.maxReversingVelocity, maxReversingVelocity) || other.maxReversingVelocity == maxReversingVelocity)&&(identical(other.maxAngularVelocity, maxAngularVelocity) || other.maxAngularVelocity == maxAngularVelocity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,minVelocity,maxVelocity,maxReversingVelocity,maxAngularVelocity);

@override
String toString() {
  return 'VehicleThresholds(minVelocity: $minVelocity, maxVelocity: $maxVelocity, maxReversingVelocity: $maxReversingVelocity, maxAngularVelocity: $maxAngularVelocity)';
}


}

/// @nodoc
abstract mixin class _$VehicleThresholdsCopyWith<$Res> implements $VehicleThresholdsCopyWith<$Res> {
  factory _$VehicleThresholdsCopyWith(_VehicleThresholds value, $Res Function(_VehicleThresholds) _then) = __$VehicleThresholdsCopyWithImpl;
@override @useResult
$Res call({
 double minVelocity, double maxVelocity, double maxReversingVelocity, double maxAngularVelocity
});




}
/// @nodoc
class __$VehicleThresholdsCopyWithImpl<$Res>
    implements _$VehicleThresholdsCopyWith<$Res> {
  __$VehicleThresholdsCopyWithImpl(this._self, this._then);

  final _VehicleThresholds _self;
  final $Res Function(_VehicleThresholds) _then;

/// Create a copy of VehicleThresholds
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? minVelocity = null,Object? maxVelocity = null,Object? maxReversingVelocity = null,Object? maxAngularVelocity = null,}) {
  return _then(_VehicleThresholds(
minVelocity: null == minVelocity ? _self.minVelocity : minVelocity // ignore: cast_nullable_to_non_nullable
as double,maxVelocity: null == maxVelocity ? _self.maxVelocity : maxVelocity // ignore: cast_nullable_to_non_nullable
as double,maxReversingVelocity: null == maxReversingVelocity ? _self.maxReversingVelocity : maxReversingVelocity // ignore: cast_nullable_to_non_nullable
as double,maxAngularVelocity: null == maxAngularVelocity ? _self.maxAngularVelocity : maxAngularVelocity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
