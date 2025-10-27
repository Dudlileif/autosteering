// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pure_pursuit_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurePursuitParameters {

/// The minimum value for the look ahead distance,
/// having this set increases the stability at low speeds.
 double get lookAheadMinDistance;/// How many seconds ahead we should multiply the
/// vehicle's velocity with to get the look ahead distance.
/// If the distance is shorter that [lookAheadMinDistance] it will be
/// set to that.
 double get lookAheadSeconds;
/// Create a copy of PurePursuitParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurePursuitParametersCopyWith<PurePursuitParameters> get copyWith => _$PurePursuitParametersCopyWithImpl<PurePursuitParameters>(this as PurePursuitParameters, _$identity);

  /// Serializes this PurePursuitParameters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurePursuitParameters&&(identical(other.lookAheadMinDistance, lookAheadMinDistance) || other.lookAheadMinDistance == lookAheadMinDistance)&&(identical(other.lookAheadSeconds, lookAheadSeconds) || other.lookAheadSeconds == lookAheadSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lookAheadMinDistance,lookAheadSeconds);

@override
String toString() {
  return 'PurePursuitParameters(lookAheadMinDistance: $lookAheadMinDistance, lookAheadSeconds: $lookAheadSeconds)';
}


}

/// @nodoc
abstract mixin class $PurePursuitParametersCopyWith<$Res>  {
  factory $PurePursuitParametersCopyWith(PurePursuitParameters value, $Res Function(PurePursuitParameters) _then) = _$PurePursuitParametersCopyWithImpl;
@useResult
$Res call({
 double lookAheadMinDistance, double lookAheadSeconds
});




}
/// @nodoc
class _$PurePursuitParametersCopyWithImpl<$Res>
    implements $PurePursuitParametersCopyWith<$Res> {
  _$PurePursuitParametersCopyWithImpl(this._self, this._then);

  final PurePursuitParameters _self;
  final $Res Function(PurePursuitParameters) _then;

/// Create a copy of PurePursuitParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lookAheadMinDistance = null,Object? lookAheadSeconds = null,}) {
  return _then(_self.copyWith(
lookAheadMinDistance: null == lookAheadMinDistance ? _self.lookAheadMinDistance : lookAheadMinDistance // ignore: cast_nullable_to_non_nullable
as double,lookAheadSeconds: null == lookAheadSeconds ? _self.lookAheadSeconds : lookAheadSeconds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PurePursuitParameters].
extension PurePursuitParametersPatterns on PurePursuitParameters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurePursuitParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurePursuitParameters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurePursuitParameters value)  $default,){
final _that = this;
switch (_that) {
case _PurePursuitParameters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurePursuitParameters value)?  $default,){
final _that = this;
switch (_that) {
case _PurePursuitParameters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lookAheadMinDistance,  double lookAheadSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurePursuitParameters() when $default != null:
return $default(_that.lookAheadMinDistance,_that.lookAheadSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lookAheadMinDistance,  double lookAheadSeconds)  $default,) {final _that = this;
switch (_that) {
case _PurePursuitParameters():
return $default(_that.lookAheadMinDistance,_that.lookAheadSeconds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lookAheadMinDistance,  double lookAheadSeconds)?  $default,) {final _that = this;
switch (_that) {
case _PurePursuitParameters() when $default != null:
return $default(_that.lookAheadMinDistance,_that.lookAheadSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurePursuitParameters implements PurePursuitParameters {
  const _PurePursuitParameters({this.lookAheadMinDistance = 0.75, this.lookAheadSeconds = 1});
  factory _PurePursuitParameters.fromJson(Map<String, dynamic> json) => _$PurePursuitParametersFromJson(json);

/// The minimum value for the look ahead distance,
/// having this set increases the stability at low speeds.
@override@JsonKey() final  double lookAheadMinDistance;
/// How many seconds ahead we should multiply the
/// vehicle's velocity with to get the look ahead distance.
/// If the distance is shorter that [lookAheadMinDistance] it will be
/// set to that.
@override@JsonKey() final  double lookAheadSeconds;

/// Create a copy of PurePursuitParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurePursuitParametersCopyWith<_PurePursuitParameters> get copyWith => __$PurePursuitParametersCopyWithImpl<_PurePursuitParameters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurePursuitParametersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurePursuitParameters&&(identical(other.lookAheadMinDistance, lookAheadMinDistance) || other.lookAheadMinDistance == lookAheadMinDistance)&&(identical(other.lookAheadSeconds, lookAheadSeconds) || other.lookAheadSeconds == lookAheadSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lookAheadMinDistance,lookAheadSeconds);

@override
String toString() {
  return 'PurePursuitParameters(lookAheadMinDistance: $lookAheadMinDistance, lookAheadSeconds: $lookAheadSeconds)';
}


}

/// @nodoc
abstract mixin class _$PurePursuitParametersCopyWith<$Res> implements $PurePursuitParametersCopyWith<$Res> {
  factory _$PurePursuitParametersCopyWith(_PurePursuitParameters value, $Res Function(_PurePursuitParameters) _then) = __$PurePursuitParametersCopyWithImpl;
@override @useResult
$Res call({
 double lookAheadMinDistance, double lookAheadSeconds
});




}
/// @nodoc
class __$PurePursuitParametersCopyWithImpl<$Res>
    implements _$PurePursuitParametersCopyWith<$Res> {
  __$PurePursuitParametersCopyWithImpl(this._self, this._then);

  final _PurePursuitParameters _self;
  final $Res Function(_PurePursuitParameters) _then;

/// Create a copy of PurePursuitParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lookAheadMinDistance = null,Object? lookAheadSeconds = null,}) {
  return _then(_PurePursuitParameters(
lookAheadMinDistance: null == lookAheadMinDistance ? _self.lookAheadMinDistance : lookAheadMinDistance // ignore: cast_nullable_to_non_nullable
as double,lookAheadSeconds: null == lookAheadSeconds ? _self.lookAheadSeconds : lookAheadSeconds // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
