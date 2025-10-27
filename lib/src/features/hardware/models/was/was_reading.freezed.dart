// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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


/// Adds pattern-matching-related methods to [WasReading].
extension WasReadingPatterns on WasReading {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WasReading value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WasReading() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WasReading value)  $default,){
final _that = this;
switch (_that) {
case _WasReading():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WasReading value)?  $default,){
final _that = this;
switch (_that) {
case _WasReading() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DateTimeSerializer()  DateTime receiveTime,  int value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WasReading() when $default != null:
return $default(_that.receiveTime,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DateTimeSerializer()  DateTime receiveTime,  int value)  $default,) {final _that = this;
switch (_that) {
case _WasReading():
return $default(_that.receiveTime,_that.value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DateTimeSerializer()  DateTime receiveTime,  int value)?  $default,) {final _that = this;
switch (_that) {
case _WasReading() when $default != null:
return $default(_that.receiveTime,_that.value);case _:
  return null;

}
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
