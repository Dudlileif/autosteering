// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'was_reading.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WasReading {

/// The time of the reading being received.
@DateTimeSerializer() DateTime get receiveTime;/// The discrete value of the sensor reading.
 int get value;
/// Create a copy of WasReading
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WasReadingCopyWith<WasReading> get copyWith => _$WasReadingCopyWithImpl<WasReading>(this as WasReading, _$identity);

  /// Serializes this WasReading to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WasReading&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiveTime,value);

@override
String toString() {
  return 'WasReading(receiveTime: $receiveTime, value: $value)';
}


}

/// @nodoc
abstract mixin class $WasReadingCopyWith<$Res>  {
  factory $WasReadingCopyWith(WasReading value, $Res Function(WasReading) _then) = _$WasReadingCopyWithImpl;
@useResult
$Res call({
@DateTimeSerializer() DateTime receiveTime, int value
});




}
/// @nodoc
class _$WasReadingCopyWithImpl<$Res>
    implements $WasReadingCopyWith<$Res> {
  _$WasReadingCopyWithImpl(this._self, this._then);

  final WasReading _self;
  final $Res Function(WasReading) _then;

/// Create a copy of WasReading
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receiveTime = null,Object? value = null,}) {
  return _then(_self.copyWith(
receiveTime: null == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WasReading implements WasReading {
  const _WasReading({@DateTimeSerializer() required this.receiveTime, this.value = 0});
  factory _WasReading.fromJson(Map<String, dynamic> json) => _$WasReadingFromJson(json);

/// The time of the reading being received.
@override@DateTimeSerializer() final  DateTime receiveTime;
/// The discrete value of the sensor reading.
@override@JsonKey() final  int value;

/// Create a copy of WasReading
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WasReadingCopyWith<_WasReading> get copyWith => __$WasReadingCopyWithImpl<_WasReading>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WasReadingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WasReading&&(identical(other.receiveTime, receiveTime) || other.receiveTime == receiveTime)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,receiveTime,value);

@override
String toString() {
  return 'WasReading(receiveTime: $receiveTime, value: $value)';
}


}

/// @nodoc
abstract mixin class _$WasReadingCopyWith<$Res> implements $WasReadingCopyWith<$Res> {
  factory _$WasReadingCopyWith(_WasReading value, $Res Function(_WasReading) _then) = __$WasReadingCopyWithImpl;
@override @useResult
$Res call({
@DateTimeSerializer() DateTime receiveTime, int value
});




}
/// @nodoc
class __$WasReadingCopyWithImpl<$Res>
    implements _$WasReadingCopyWith<$Res> {
  __$WasReadingCopyWithImpl(this._self, this._then);

  final _WasReading _self;
  final $Res Function(_WasReading) _then;

/// Create a copy of WasReading
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receiveTime = null,Object? value = null,}) {
  return _then(_WasReading(
receiveTime: null == receiveTime ? _self.receiveTime : receiveTime // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
