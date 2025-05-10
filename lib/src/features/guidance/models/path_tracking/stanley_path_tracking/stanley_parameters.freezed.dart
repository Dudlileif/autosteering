// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stanley_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StanleyParameters {

/// Proportional cross distance gain coefficient.
 double get crossDistanceGain;/// Coefficient to ensure numerical stability when velocity is close to
/// zero.
 double get softeningGain;/// Proportional coefficient for how much the velocity should alter the
/// steering angle.
 double get velocityGain;
/// Create a copy of StanleyParameters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StanleyParametersCopyWith<StanleyParameters> get copyWith => _$StanleyParametersCopyWithImpl<StanleyParameters>(this as StanleyParameters, _$identity);

  /// Serializes this StanleyParameters to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StanleyParameters&&(identical(other.crossDistanceGain, crossDistanceGain) || other.crossDistanceGain == crossDistanceGain)&&(identical(other.softeningGain, softeningGain) || other.softeningGain == softeningGain)&&(identical(other.velocityGain, velocityGain) || other.velocityGain == velocityGain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,crossDistanceGain,softeningGain,velocityGain);

@override
String toString() {
  return 'StanleyParameters(crossDistanceGain: $crossDistanceGain, softeningGain: $softeningGain, velocityGain: $velocityGain)';
}


}

/// @nodoc
abstract mixin class $StanleyParametersCopyWith<$Res>  {
  factory $StanleyParametersCopyWith(StanleyParameters value, $Res Function(StanleyParameters) _then) = _$StanleyParametersCopyWithImpl;
@useResult
$Res call({
 double crossDistanceGain, double softeningGain, double velocityGain
});




}
/// @nodoc
class _$StanleyParametersCopyWithImpl<$Res>
    implements $StanleyParametersCopyWith<$Res> {
  _$StanleyParametersCopyWithImpl(this._self, this._then);

  final StanleyParameters _self;
  final $Res Function(StanleyParameters) _then;

/// Create a copy of StanleyParameters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? crossDistanceGain = null,Object? softeningGain = null,Object? velocityGain = null,}) {
  return _then(_self.copyWith(
crossDistanceGain: null == crossDistanceGain ? _self.crossDistanceGain : crossDistanceGain // ignore: cast_nullable_to_non_nullable
as double,softeningGain: null == softeningGain ? _self.softeningGain : softeningGain // ignore: cast_nullable_to_non_nullable
as double,velocityGain: null == velocityGain ? _self.velocityGain : velocityGain // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _StanleyParameters implements StanleyParameters {
  const _StanleyParameters({this.crossDistanceGain = 1.5, this.softeningGain = 1e-5, this.velocityGain = 1.3});
  factory _StanleyParameters.fromJson(Map<String, dynamic> json) => _$StanleyParametersFromJson(json);

/// Proportional cross distance gain coefficient.
@override@JsonKey() final  double crossDistanceGain;
/// Coefficient to ensure numerical stability when velocity is close to
/// zero.
@override@JsonKey() final  double softeningGain;
/// Proportional coefficient for how much the velocity should alter the
/// steering angle.
@override@JsonKey() final  double velocityGain;

/// Create a copy of StanleyParameters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StanleyParametersCopyWith<_StanleyParameters> get copyWith => __$StanleyParametersCopyWithImpl<_StanleyParameters>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StanleyParametersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StanleyParameters&&(identical(other.crossDistanceGain, crossDistanceGain) || other.crossDistanceGain == crossDistanceGain)&&(identical(other.softeningGain, softeningGain) || other.softeningGain == softeningGain)&&(identical(other.velocityGain, velocityGain) || other.velocityGain == velocityGain));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,crossDistanceGain,softeningGain,velocityGain);

@override
String toString() {
  return 'StanleyParameters(crossDistanceGain: $crossDistanceGain, softeningGain: $softeningGain, velocityGain: $velocityGain)';
}


}

/// @nodoc
abstract mixin class _$StanleyParametersCopyWith<$Res> implements $StanleyParametersCopyWith<$Res> {
  factory _$StanleyParametersCopyWith(_StanleyParameters value, $Res Function(_StanleyParameters) _then) = __$StanleyParametersCopyWithImpl;
@override @useResult
$Res call({
 double crossDistanceGain, double softeningGain, double velocityGain
});




}
/// @nodoc
class __$StanleyParametersCopyWithImpl<$Res>
    implements _$StanleyParametersCopyWith<$Res> {
  __$StanleyParametersCopyWithImpl(this._self, this._then);

  final _StanleyParameters _self;
  final $Res Function(_StanleyParameters) _then;

/// Create a copy of StanleyParameters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? crossDistanceGain = null,Object? softeningGain = null,Object? velocityGain = null,}) {
  return _then(_StanleyParameters(
crossDistanceGain: null == crossDistanceGain ? _self.crossDistanceGain : crossDistanceGain // ignore: cast_nullable_to_non_nullable
as double,softeningGain: null == softeningGain ? _self.softeningGain : softeningGain // ignore: cast_nullable_to_non_nullable
as double,velocityGain: null == velocityGain ? _self.velocityGain : velocityGain // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
