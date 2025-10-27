// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamepad_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GamepadConfig {

/// The maximum discrete analog value. Typically 2^16-1=65535, 16 bits.
 int get analogMaxValue;/// The maximum values that increases input. Values in distance from 0.
/// The max value is 1. Typically 0.8-0.9 can prevent jitter/drift.
 Map<GamepadAnalogInput, double> get analogDeadZoneMax;/// The minimum values that are required before input
/// is registered. Values in distance from 0.
/// Typically 0.1-0.2 can prevent jitter/drift.
 Map<GamepadAnalogInput, double> get analogDeadZoneMin;
/// Create a copy of GamepadConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamepadConfigCopyWith<GamepadConfig> get copyWith => _$GamepadConfigCopyWithImpl<GamepadConfig>(this as GamepadConfig, _$identity);

  /// Serializes this GamepadConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamepadConfig&&(identical(other.analogMaxValue, analogMaxValue) || other.analogMaxValue == analogMaxValue)&&const DeepCollectionEquality().equals(other.analogDeadZoneMax, analogDeadZoneMax)&&const DeepCollectionEquality().equals(other.analogDeadZoneMin, analogDeadZoneMin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analogMaxValue,const DeepCollectionEquality().hash(analogDeadZoneMax),const DeepCollectionEquality().hash(analogDeadZoneMin));

@override
String toString() {
  return 'GamepadConfig(analogMaxValue: $analogMaxValue, analogDeadZoneMax: $analogDeadZoneMax, analogDeadZoneMin: $analogDeadZoneMin)';
}


}

/// @nodoc
abstract mixin class $GamepadConfigCopyWith<$Res>  {
  factory $GamepadConfigCopyWith(GamepadConfig value, $Res Function(GamepadConfig) _then) = _$GamepadConfigCopyWithImpl;
@useResult
$Res call({
 int analogMaxValue, Map<GamepadAnalogInput, double> analogDeadZoneMax, Map<GamepadAnalogInput, double> analogDeadZoneMin
});




}
/// @nodoc
class _$GamepadConfigCopyWithImpl<$Res>
    implements $GamepadConfigCopyWith<$Res> {
  _$GamepadConfigCopyWithImpl(this._self, this._then);

  final GamepadConfig _self;
  final $Res Function(GamepadConfig) _then;

/// Create a copy of GamepadConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? analogMaxValue = null,Object? analogDeadZoneMax = null,Object? analogDeadZoneMin = null,}) {
  return _then(_self.copyWith(
analogMaxValue: null == analogMaxValue ? _self.analogMaxValue : analogMaxValue // ignore: cast_nullable_to_non_nullable
as int,analogDeadZoneMax: null == analogDeadZoneMax ? _self.analogDeadZoneMax : analogDeadZoneMax // ignore: cast_nullable_to_non_nullable
as Map<GamepadAnalogInput, double>,analogDeadZoneMin: null == analogDeadZoneMin ? _self.analogDeadZoneMin : analogDeadZoneMin // ignore: cast_nullable_to_non_nullable
as Map<GamepadAnalogInput, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [GamepadConfig].
extension GamepadConfigPatterns on GamepadConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GamepadConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GamepadConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GamepadConfig value)  $default,){
final _that = this;
switch (_that) {
case _GamepadConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GamepadConfig value)?  $default,){
final _that = this;
switch (_that) {
case _GamepadConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int analogMaxValue,  Map<GamepadAnalogInput, double> analogDeadZoneMax,  Map<GamepadAnalogInput, double> analogDeadZoneMin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GamepadConfig() when $default != null:
return $default(_that.analogMaxValue,_that.analogDeadZoneMax,_that.analogDeadZoneMin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int analogMaxValue,  Map<GamepadAnalogInput, double> analogDeadZoneMax,  Map<GamepadAnalogInput, double> analogDeadZoneMin)  $default,) {final _that = this;
switch (_that) {
case _GamepadConfig():
return $default(_that.analogMaxValue,_that.analogDeadZoneMax,_that.analogDeadZoneMin);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int analogMaxValue,  Map<GamepadAnalogInput, double> analogDeadZoneMax,  Map<GamepadAnalogInput, double> analogDeadZoneMin)?  $default,) {final _that = this;
switch (_that) {
case _GamepadConfig() when $default != null:
return $default(_that.analogMaxValue,_that.analogDeadZoneMax,_that.analogDeadZoneMin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GamepadConfig extends GamepadConfig {
  const _GamepadConfig({this.analogMaxValue = 65535, final  Map<GamepadAnalogInput, double> analogDeadZoneMax = const {}, final  Map<GamepadAnalogInput, double> analogDeadZoneMin = const {}}): _analogDeadZoneMax = analogDeadZoneMax,_analogDeadZoneMin = analogDeadZoneMin,super._();
  factory _GamepadConfig.fromJson(Map<String, dynamic> json) => _$GamepadConfigFromJson(json);

/// The maximum discrete analog value. Typically 2^16-1=65535, 16 bits.
@override@JsonKey() final  int analogMaxValue;
/// The maximum values that increases input. Values in distance from 0.
/// The max value is 1. Typically 0.8-0.9 can prevent jitter/drift.
 final  Map<GamepadAnalogInput, double> _analogDeadZoneMax;
/// The maximum values that increases input. Values in distance from 0.
/// The max value is 1. Typically 0.8-0.9 can prevent jitter/drift.
@override@JsonKey() Map<GamepadAnalogInput, double> get analogDeadZoneMax {
  if (_analogDeadZoneMax is EqualUnmodifiableMapView) return _analogDeadZoneMax;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_analogDeadZoneMax);
}

/// The minimum values that are required before input
/// is registered. Values in distance from 0.
/// Typically 0.1-0.2 can prevent jitter/drift.
 final  Map<GamepadAnalogInput, double> _analogDeadZoneMin;
/// The minimum values that are required before input
/// is registered. Values in distance from 0.
/// Typically 0.1-0.2 can prevent jitter/drift.
@override@JsonKey() Map<GamepadAnalogInput, double> get analogDeadZoneMin {
  if (_analogDeadZoneMin is EqualUnmodifiableMapView) return _analogDeadZoneMin;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_analogDeadZoneMin);
}


/// Create a copy of GamepadConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GamepadConfigCopyWith<_GamepadConfig> get copyWith => __$GamepadConfigCopyWithImpl<_GamepadConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GamepadConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GamepadConfig&&(identical(other.analogMaxValue, analogMaxValue) || other.analogMaxValue == analogMaxValue)&&const DeepCollectionEquality().equals(other._analogDeadZoneMax, _analogDeadZoneMax)&&const DeepCollectionEquality().equals(other._analogDeadZoneMin, _analogDeadZoneMin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,analogMaxValue,const DeepCollectionEquality().hash(_analogDeadZoneMax),const DeepCollectionEquality().hash(_analogDeadZoneMin));

@override
String toString() {
  return 'GamepadConfig(analogMaxValue: $analogMaxValue, analogDeadZoneMax: $analogDeadZoneMax, analogDeadZoneMin: $analogDeadZoneMin)';
}


}

/// @nodoc
abstract mixin class _$GamepadConfigCopyWith<$Res> implements $GamepadConfigCopyWith<$Res> {
  factory _$GamepadConfigCopyWith(_GamepadConfig value, $Res Function(_GamepadConfig) _then) = __$GamepadConfigCopyWithImpl;
@override @useResult
$Res call({
 int analogMaxValue, Map<GamepadAnalogInput, double> analogDeadZoneMax, Map<GamepadAnalogInput, double> analogDeadZoneMin
});




}
/// @nodoc
class __$GamepadConfigCopyWithImpl<$Res>
    implements _$GamepadConfigCopyWith<$Res> {
  __$GamepadConfigCopyWithImpl(this._self, this._then);

  final _GamepadConfig _self;
  final $Res Function(_GamepadConfig) _then;

/// Create a copy of GamepadConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? analogMaxValue = null,Object? analogDeadZoneMax = null,Object? analogDeadZoneMin = null,}) {
  return _then(_GamepadConfig(
analogMaxValue: null == analogMaxValue ? _self.analogMaxValue : analogMaxValue // ignore: cast_nullable_to_non_nullable
as int,analogDeadZoneMax: null == analogDeadZoneMax ? _self._analogDeadZoneMax : analogDeadZoneMax // ignore: cast_nullable_to_non_nullable
as Map<GamepadAnalogInput, double>,analogDeadZoneMin: null == analogDeadZoneMin ? _self._analogDeadZoneMin : analogDeadZoneMin // ignore: cast_nullable_to_non_nullable
as Map<GamepadAnalogInput, double>,
  ));
}


}

// dart format on
