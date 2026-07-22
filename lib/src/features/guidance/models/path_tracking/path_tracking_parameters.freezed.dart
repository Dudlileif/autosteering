// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'path_tracking_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PathTrackingParameters {

/// Which path tracking mode the vehicle should use.
 PathTrackingMode get mode;/// Parameters for the look ahead distance when using a pure pursuit/look
/// ahead steering mode.
 PurePursuitParameters get purePursuit;/// The Stanley gain coefficients for controlling the steering of this
/// vehicle when using a Stanley path tracking steering mode.
 StanleyParameters get stanley;
/// Create a copy of PathTrackingParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathTrackingParametersCopyWith<PathTrackingParameters> get copyWith => _$PathTrackingParametersCopyWithImpl<PathTrackingParameters>(this as PathTrackingParameters, _$identity);

  /// Serializes this PathTrackingParameters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PathTrackingParameters&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.purePursuit, purePursuit) || other.purePursuit == purePursuit)&&(identical(other.stanley, stanley) || other.stanley == stanley));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,purePursuit,stanley);

@override
String toString() {
  return 'PathTrackingParameters(mode: $mode, purePursuit: $purePursuit, stanley: $stanley)';
}


}

/// @nodoc
abstract mixin class $PathTrackingParametersCopyWith<$Res>  {
  factory $PathTrackingParametersCopyWith(PathTrackingParameters value, $Res Function(PathTrackingParameters) _then) = _$PathTrackingParametersCopyWithImpl;
@useResult
$Res call({
 PathTrackingMode mode, PurePursuitParameters purePursuit, StanleyParameters stanley
});


$PurePursuitParametersCopyWith<$Res> get purePursuit;$StanleyParametersCopyWith<$Res> get stanley;

}
/// @nodoc
class _$PathTrackingParametersCopyWithImpl<$Res>
    implements $PathTrackingParametersCopyWith<$Res> {
  _$PathTrackingParametersCopyWithImpl(this._self, this._then);

  final PathTrackingParameters _self;
  final $Res Function(PathTrackingParameters) _then;

/// Create a copy of PathTrackingParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? purePursuit = null,Object? stanley = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PathTrackingMode,purePursuit: null == purePursuit ? _self.purePursuit : purePursuit // ignore: cast_nullable_to_non_nullable
as PurePursuitParameters,stanley: null == stanley ? _self.stanley : stanley // ignore: cast_nullable_to_non_nullable
as StanleyParameters,
  ));
}
/// Create a copy of PathTrackingParameters
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurePursuitParametersCopyWith<$Res> get purePursuit {
  
  return $PurePursuitParametersCopyWith<$Res>(_self.purePursuit, (value) {
    return _then(_self.copyWith(purePursuit: value));
  });
}/// Create a copy of PathTrackingParameters
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StanleyParametersCopyWith<$Res> get stanley {
  
  return $StanleyParametersCopyWith<$Res>(_self.stanley, (value) {
    return _then(_self.copyWith(stanley: value));
  });
}
}


/// Adds pattern-matching-related methods to [PathTrackingParameters].
extension PathTrackingParametersPatterns on PathTrackingParameters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PathTrackingParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PathTrackingParameters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PathTrackingParameters value)  $default,){
final _that = this;
switch (_that) {
case _PathTrackingParameters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PathTrackingParameters value)?  $default,){
final _that = this;
switch (_that) {
case _PathTrackingParameters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PathTrackingMode mode,  PurePursuitParameters purePursuit,  StanleyParameters stanley)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PathTrackingParameters() when $default != null:
return $default(_that.mode,_that.purePursuit,_that.stanley);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PathTrackingMode mode,  PurePursuitParameters purePursuit,  StanleyParameters stanley)  $default,) {final _that = this;
switch (_that) {
case _PathTrackingParameters():
return $default(_that.mode,_that.purePursuit,_that.stanley);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PathTrackingMode mode,  PurePursuitParameters purePursuit,  StanleyParameters stanley)?  $default,) {final _that = this;
switch (_that) {
case _PathTrackingParameters() when $default != null:
return $default(_that.mode,_that.purePursuit,_that.stanley);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PathTrackingParameters implements PathTrackingParameters {
  const _PathTrackingParameters({this.mode = PathTrackingMode.purePursuit, this.purePursuit = const PurePursuitParameters(), this.stanley = const StanleyParameters()});
  factory _PathTrackingParameters.fromJson(Map<String, dynamic> json) => _$PathTrackingParametersFromJson(json);

/// Which path tracking mode the vehicle should use.
@override@JsonKey() final  PathTrackingMode mode;
/// Parameters for the look ahead distance when using a pure pursuit/look
/// ahead steering mode.
@override@JsonKey() final  PurePursuitParameters purePursuit;
/// The Stanley gain coefficients for controlling the steering of this
/// vehicle when using a Stanley path tracking steering mode.
@override@JsonKey() final  StanleyParameters stanley;

/// Create a copy of PathTrackingParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathTrackingParametersCopyWith<_PathTrackingParameters> get copyWith => __$PathTrackingParametersCopyWithImpl<_PathTrackingParameters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PathTrackingParametersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PathTrackingParameters&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.purePursuit, purePursuit) || other.purePursuit == purePursuit)&&(identical(other.stanley, stanley) || other.stanley == stanley));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,mode,purePursuit,stanley);

@override
String toString() {
  return 'PathTrackingParameters(mode: $mode, purePursuit: $purePursuit, stanley: $stanley)';
}


}

/// @nodoc
abstract mixin class _$PathTrackingParametersCopyWith<$Res> implements $PathTrackingParametersCopyWith<$Res> {
  factory _$PathTrackingParametersCopyWith(_PathTrackingParameters value, $Res Function(_PathTrackingParameters) _then) = __$PathTrackingParametersCopyWithImpl;
@override @useResult
$Res call({
 PathTrackingMode mode, PurePursuitParameters purePursuit, StanleyParameters stanley
});


@override $PurePursuitParametersCopyWith<$Res> get purePursuit;@override $StanleyParametersCopyWith<$Res> get stanley;

}
/// @nodoc
class __$PathTrackingParametersCopyWithImpl<$Res>
    implements _$PathTrackingParametersCopyWith<$Res> {
  __$PathTrackingParametersCopyWithImpl(this._self, this._then);

  final _PathTrackingParameters _self;
  final $Res Function(_PathTrackingParameters) _then;

/// Create a copy of PathTrackingParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? purePursuit = null,Object? stanley = null,}) {
  return _then(_PathTrackingParameters(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PathTrackingMode,purePursuit: null == purePursuit ? _self.purePursuit : purePursuit // ignore: cast_nullable_to_non_nullable
as PurePursuitParameters,stanley: null == stanley ? _self.stanley : stanley // ignore: cast_nullable_to_non_nullable
as StanleyParameters,
  ));
}

/// Create a copy of PathTrackingParameters
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PurePursuitParametersCopyWith<$Res> get purePursuit {
  
  return $PurePursuitParametersCopyWith<$Res>(_self.purePursuit, (value) {
    return _then(_self.copyWith(purePursuit: value));
  });
}/// Create a copy of PathTrackingParameters
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StanleyParametersCopyWith<$Res> get stanley {
  
  return $StanleyParametersCopyWith<$Res>(_self.stanley, (value) {
    return _then(_self.copyWith(stanley: value));
  });
}
}

// dart format on
