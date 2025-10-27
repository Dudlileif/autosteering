// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pid_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PidParameters {

/// Proportional gain.
 double get p;/// Integral gain.
 double get i;/// Derivative gain.
 double get d;
/// Create a copy of PidParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PidParametersCopyWith<PidParameters> get copyWith => _$PidParametersCopyWithImpl<PidParameters>(this as PidParameters, _$identity);

  /// Serializes this PidParameters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PidParameters&&(identical(other.p, p) || other.p == p)&&(identical(other.i, i) || other.i == i)&&(identical(other.d, d) || other.d == d));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,p,i,d);

@override
String toString() {
  return 'PidParameters(p: $p, i: $i, d: $d)';
}


}

/// @nodoc
abstract mixin class $PidParametersCopyWith<$Res>  {
  factory $PidParametersCopyWith(PidParameters value, $Res Function(PidParameters) _then) = _$PidParametersCopyWithImpl;
@useResult
$Res call({
 double p, double i, double d
});




}
/// @nodoc
class _$PidParametersCopyWithImpl<$Res>
    implements $PidParametersCopyWith<$Res> {
  _$PidParametersCopyWithImpl(this._self, this._then);

  final PidParameters _self;
  final $Res Function(PidParameters) _then;

/// Create a copy of PidParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? p = null,Object? i = null,Object? d = null,}) {
  return _then(_self.copyWith(
p: null == p ? _self.p : p // ignore: cast_nullable_to_non_nullable
as double,i: null == i ? _self.i : i // ignore: cast_nullable_to_non_nullable
as double,d: null == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PidParameters].
extension PidParametersPatterns on PidParameters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PidParameters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PidParameters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PidParameters value)  $default,){
final _that = this;
switch (_that) {
case _PidParameters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PidParameters value)?  $default,){
final _that = this;
switch (_that) {
case _PidParameters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double p,  double i,  double d)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PidParameters() when $default != null:
return $default(_that.p,_that.i,_that.d);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double p,  double i,  double d)  $default,) {final _that = this;
switch (_that) {
case _PidParameters():
return $default(_that.p,_that.i,_that.d);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double p,  double i,  double d)?  $default,) {final _that = this;
switch (_that) {
case _PidParameters() when $default != null:
return $default(_that.p,_that.i,_that.d);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PidParameters implements PidParameters {
  const _PidParameters({this.p = 20, this.i = 0.130, this.d = 0.063});
  factory _PidParameters.fromJson(Map<String, dynamic> json) => _$PidParametersFromJson(json);

/// Proportional gain.
@override@JsonKey() final  double p;
/// Integral gain.
@override@JsonKey() final  double i;
/// Derivative gain.
@override@JsonKey() final  double d;

/// Create a copy of PidParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PidParametersCopyWith<_PidParameters> get copyWith => __$PidParametersCopyWithImpl<_PidParameters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PidParametersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PidParameters&&(identical(other.p, p) || other.p == p)&&(identical(other.i, i) || other.i == i)&&(identical(other.d, d) || other.d == d));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,p,i,d);

@override
String toString() {
  return 'PidParameters(p: $p, i: $i, d: $d)';
}


}

/// @nodoc
abstract mixin class _$PidParametersCopyWith<$Res> implements $PidParametersCopyWith<$Res> {
  factory _$PidParametersCopyWith(_PidParameters value, $Res Function(_PidParameters) _then) = __$PidParametersCopyWithImpl;
@override @useResult
$Res call({
 double p, double i, double d
});




}
/// @nodoc
class __$PidParametersCopyWithImpl<$Res>
    implements _$PidParametersCopyWith<$Res> {
  __$PidParametersCopyWithImpl(this._self, this._then);

  final _PidParameters _self;
  final $Res Function(_PidParameters) _then;

/// Create a copy of PidParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? p = null,Object? i = null,Object? d = null,}) {
  return _then(_PidParameters(
p: null == p ? _self.p : p // ignore: cast_nullable_to_non_nullable
as double,i: null == i ? _self.i : i // ignore: cast_nullable_to_non_nullable
as double,d: null == d ? _self.d : d // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
