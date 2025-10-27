// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'was_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WasConfig {

 bool get useWas; bool get invertInput; int get bits;
/// Create a copy of WasConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WasConfigCopyWith<WasConfig> get copyWith => _$WasConfigCopyWithImpl<WasConfig>(this as WasConfig, _$identity);

  /// Serializes this WasConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WasConfig&&(identical(other.useWas, useWas) || other.useWas == useWas)&&(identical(other.invertInput, invertInput) || other.invertInput == invertInput)&&(identical(other.bits, bits) || other.bits == bits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,useWas,invertInput,bits);

@override
String toString() {
  return 'WasConfig(useWas: $useWas, invertInput: $invertInput, bits: $bits)';
}


}

/// @nodoc
abstract mixin class $WasConfigCopyWith<$Res>  {
  factory $WasConfigCopyWith(WasConfig value, $Res Function(WasConfig) _then) = _$WasConfigCopyWithImpl;
@useResult
$Res call({
 bool useWas, bool invertInput, int bits
});




}
/// @nodoc
class _$WasConfigCopyWithImpl<$Res>
    implements $WasConfigCopyWith<$Res> {
  _$WasConfigCopyWithImpl(this._self, this._then);

  final WasConfig _self;
  final $Res Function(WasConfig) _then;

/// Create a copy of WasConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? useWas = null,Object? invertInput = null,Object? bits = null,}) {
  return _then(_self.copyWith(
useWas: null == useWas ? _self.useWas : useWas // ignore: cast_nullable_to_non_nullable
as bool,invertInput: null == invertInput ? _self.invertInput : invertInput // ignore: cast_nullable_to_non_nullable
as bool,bits: null == bits ? _self.bits : bits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WasConfig].
extension WasConfigPatterns on WasConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WasConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WasConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WasConfig value)  $default,){
final _that = this;
switch (_that) {
case _WasConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WasConfig value)?  $default,){
final _that = this;
switch (_that) {
case _WasConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool useWas,  bool invertInput,  int bits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WasConfig() when $default != null:
return $default(_that.useWas,_that.invertInput,_that.bits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool useWas,  bool invertInput,  int bits)  $default,) {final _that = this;
switch (_that) {
case _WasConfig():
return $default(_that.useWas,_that.invertInput,_that.bits);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool useWas,  bool invertInput,  int bits)?  $default,) {final _that = this;
switch (_that) {
case _WasConfig() when $default != null:
return $default(_that.useWas,_that.invertInput,_that.bits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WasConfig implements WasConfig {
  const _WasConfig({this.useWas = true, this.invertInput = false, this.bits = 12});
  factory _WasConfig.fromJson(Map<String, dynamic> json) => _$WasConfigFromJson(json);

@override@JsonKey() final  bool useWas;
@override@JsonKey() final  bool invertInput;
@override@JsonKey() final  int bits;

/// Create a copy of WasConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WasConfigCopyWith<_WasConfig> get copyWith => __$WasConfigCopyWithImpl<_WasConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WasConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WasConfig&&(identical(other.useWas, useWas) || other.useWas == useWas)&&(identical(other.invertInput, invertInput) || other.invertInput == invertInput)&&(identical(other.bits, bits) || other.bits == bits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,useWas,invertInput,bits);

@override
String toString() {
  return 'WasConfig(useWas: $useWas, invertInput: $invertInput, bits: $bits)';
}


}

/// @nodoc
abstract mixin class _$WasConfigCopyWith<$Res> implements $WasConfigCopyWith<$Res> {
  factory _$WasConfigCopyWith(_WasConfig value, $Res Function(_WasConfig) _then) = __$WasConfigCopyWithImpl;
@override @useResult
$Res call({
 bool useWas, bool invertInput, int bits
});




}
/// @nodoc
class __$WasConfigCopyWithImpl<$Res>
    implements _$WasConfigCopyWith<$Res> {
  __$WasConfigCopyWithImpl(this._self, this._then);

  final _WasConfig _self;
  final $Res Function(_WasConfig) _then;

/// Create a copy of WasConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? useWas = null,Object? invertInput = null,Object? bits = null,}) {
  return _then(_WasConfig(
useWas: null == useWas ? _self.useWas : useWas // ignore: cast_nullable_to_non_nullable
as bool,invertInput: null == invertInput ? _self.invertInput : invertInput // ignore: cast_nullable_to_non_nullable
as bool,bits: null == bits ? _self.bits : bits // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
