// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_center_offset.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MapCenterOffset {

/// Longitudinal offset in meters from the center point.
 double get x;/// Transverse offset in meters from the center point.
 double get y;
/// Create a copy of MapCenterOffset
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapCenterOffsetCopyWith<MapCenterOffset> get copyWith => _$MapCenterOffsetCopyWithImpl<MapCenterOffset>(this as MapCenterOffset, _$identity);

  /// Serializes this MapCenterOffset to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapCenterOffset&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'MapCenterOffset(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class $MapCenterOffsetCopyWith<$Res>  {
  factory $MapCenterOffsetCopyWith(MapCenterOffset value, $Res Function(MapCenterOffset) _then) = _$MapCenterOffsetCopyWithImpl;
@useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class _$MapCenterOffsetCopyWithImpl<$Res>
    implements $MapCenterOffsetCopyWith<$Res> {
  _$MapCenterOffsetCopyWithImpl(this._self, this._then);

  final MapCenterOffset _self;
  final $Res Function(MapCenterOffset) _then;

/// Create a copy of MapCenterOffset
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? x = null,Object? y = null,}) {
  return _then(_self.copyWith(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MapCenterOffset].
extension MapCenterOffsetPatterns on MapCenterOffset {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MapCenterOffset value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MapCenterOffset() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MapCenterOffset value)  $default,){
final _that = this;
switch (_that) {
case _MapCenterOffset():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MapCenterOffset value)?  $default,){
final _that = this;
switch (_that) {
case _MapCenterOffset() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double x,  double y)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MapCenterOffset() when $default != null:
return $default(_that.x,_that.y);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double x,  double y)  $default,) {final _that = this;
switch (_that) {
case _MapCenterOffset():
return $default(_that.x,_that.y);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double x,  double y)?  $default,) {final _that = this;
switch (_that) {
case _MapCenterOffset() when $default != null:
return $default(_that.x,_that.y);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MapCenterOffset implements MapCenterOffset {
  const _MapCenterOffset({this.x = 0, this.y = 0});
  factory _MapCenterOffset.fromJson(Map<String, dynamic> json) => _$MapCenterOffsetFromJson(json);

/// Longitudinal offset in meters from the center point.
@override@JsonKey() final  double x;
/// Transverse offset in meters from the center point.
@override@JsonKey() final  double y;

/// Create a copy of MapCenterOffset
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapCenterOffsetCopyWith<_MapCenterOffset> get copyWith => __$MapCenterOffsetCopyWithImpl<_MapCenterOffset>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MapCenterOffsetToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapCenterOffset&&(identical(other.x, x) || other.x == x)&&(identical(other.y, y) || other.y == y));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,x,y);

@override
String toString() {
  return 'MapCenterOffset(x: $x, y: $y)';
}


}

/// @nodoc
abstract mixin class _$MapCenterOffsetCopyWith<$Res> implements $MapCenterOffsetCopyWith<$Res> {
  factory _$MapCenterOffsetCopyWith(_MapCenterOffset value, $Res Function(_MapCenterOffset) _then) = __$MapCenterOffsetCopyWithImpl;
@override @useResult
$Res call({
 double x, double y
});




}
/// @nodoc
class __$MapCenterOffsetCopyWithImpl<$Res>
    implements _$MapCenterOffsetCopyWith<$Res> {
  __$MapCenterOffsetCopyWithImpl(this._self, this._then);

  final _MapCenterOffset _self;
  final $Res Function(_MapCenterOffset) _then;

/// Create a copy of MapCenterOffset
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? x = null,Object? y = null,}) {
  return _then(_MapCenterOffset(
x: null == x ? _self.x : x // ignore: cast_nullable_to_non_nullable
as double,y: null == y ? _self.y : y // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
