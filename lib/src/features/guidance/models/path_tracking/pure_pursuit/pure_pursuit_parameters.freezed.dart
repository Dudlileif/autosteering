// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
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
