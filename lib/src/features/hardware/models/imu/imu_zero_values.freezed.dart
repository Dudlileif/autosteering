// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imu_zero_values.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImuZeroValues {

/// The zero (North) value for the bearing.
 num get bearingZero;/// The zero level for the pitch.
 num get pitchZero;/// The zero level for the roll.
 num get rollZero;
/// Create a copy of ImuZeroValues
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImuZeroValuesCopyWith<ImuZeroValues> get copyWith => _$ImuZeroValuesCopyWithImpl<ImuZeroValues>(this as ImuZeroValues, _$identity);

  /// Serializes this ImuZeroValues to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImuZeroValues&&(identical(other.bearingZero, bearingZero) || other.bearingZero == bearingZero)&&(identical(other.pitchZero, pitchZero) || other.pitchZero == pitchZero)&&(identical(other.rollZero, rollZero) || other.rollZero == rollZero));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bearingZero,pitchZero,rollZero);

@override
String toString() {
  return 'ImuZeroValues(bearingZero: $bearingZero, pitchZero: $pitchZero, rollZero: $rollZero)';
}


}

/// @nodoc
abstract mixin class $ImuZeroValuesCopyWith<$Res>  {
  factory $ImuZeroValuesCopyWith(ImuZeroValues value, $Res Function(ImuZeroValues) _then) = _$ImuZeroValuesCopyWithImpl;
@useResult
$Res call({
 num bearingZero, num pitchZero, num rollZero
});




}
/// @nodoc
class _$ImuZeroValuesCopyWithImpl<$Res>
    implements $ImuZeroValuesCopyWith<$Res> {
  _$ImuZeroValuesCopyWithImpl(this._self, this._then);

  final ImuZeroValues _self;
  final $Res Function(ImuZeroValues) _then;

/// Create a copy of ImuZeroValues
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? bearingZero = null,Object? pitchZero = null,Object? rollZero = null,}) {
  return _then(_self.copyWith(
bearingZero: null == bearingZero ? _self.bearingZero : bearingZero // ignore: cast_nullable_to_non_nullable
as num,pitchZero: null == pitchZero ? _self.pitchZero : pitchZero // ignore: cast_nullable_to_non_nullable
as num,rollZero: null == rollZero ? _self.rollZero : rollZero // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ImuZeroValues implements ImuZeroValues {
  const _ImuZeroValues({this.bearingZero = 0, this.pitchZero = 0, this.rollZero = 0});
  factory _ImuZeroValues.fromJson(Map<String, dynamic> json) => _$ImuZeroValuesFromJson(json);

/// The zero (North) value for the bearing.
@override@JsonKey() final  num bearingZero;
/// The zero level for the pitch.
@override@JsonKey() final  num pitchZero;
/// The zero level for the roll.
@override@JsonKey() final  num rollZero;

/// Create a copy of ImuZeroValues
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImuZeroValuesCopyWith<_ImuZeroValues> get copyWith => __$ImuZeroValuesCopyWithImpl<_ImuZeroValues>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImuZeroValuesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImuZeroValues&&(identical(other.bearingZero, bearingZero) || other.bearingZero == bearingZero)&&(identical(other.pitchZero, pitchZero) || other.pitchZero == pitchZero)&&(identical(other.rollZero, rollZero) || other.rollZero == rollZero));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,bearingZero,pitchZero,rollZero);

@override
String toString() {
  return 'ImuZeroValues(bearingZero: $bearingZero, pitchZero: $pitchZero, rollZero: $rollZero)';
}


}

/// @nodoc
abstract mixin class _$ImuZeroValuesCopyWith<$Res> implements $ImuZeroValuesCopyWith<$Res> {
  factory _$ImuZeroValuesCopyWith(_ImuZeroValues value, $Res Function(_ImuZeroValues) _then) = __$ImuZeroValuesCopyWithImpl;
@override @useResult
$Res call({
 num bearingZero, num pitchZero, num rollZero
});




}
/// @nodoc
class __$ImuZeroValuesCopyWithImpl<$Res>
    implements _$ImuZeroValuesCopyWith<$Res> {
  __$ImuZeroValuesCopyWithImpl(this._self, this._then);

  final _ImuZeroValues _self;
  final $Res Function(_ImuZeroValues) _then;

/// Create a copy of ImuZeroValues
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? bearingZero = null,Object? pitchZero = null,Object? rollZero = null,}) {
  return _then(_ImuZeroValues(
bearingZero: null == bearingZero ? _self.bearingZero : bearingZero // ignore: cast_nullable_to_non_nullable
as num,pitchZero: null == pitchZero ? _self.pitchZero : pitchZero // ignore: cast_nullable_to_non_nullable
as num,rollZero: null == rollZero ? _self.rollZero : rollZero // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
