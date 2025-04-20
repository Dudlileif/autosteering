// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manufacturer_schemes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManufacturerColors {

/// The name of the manufacturer.
 String get name;/// The primary color for the color scheme.
@ColorSerializer() Color get primary;/// The tertiary color for the color scheme.
@ColorSerializerNullable() Color? get tertiary;/// The color of the branding line for the manufacturer.
@ColorSerializerNullable() Color? get brandingLine;/// The color of the cab frame for the manufacturer.
@ColorSerializerNullable() Color? get cabFrame;/// The color of the main frame for the manufacturer.
@ColorSerializerNullable() Color? get frame;/// The color of the wheel rims for the manufacturer.
@ColorSerializerNullable() Color? get rims;/// The color of the roof for the manufacturer.
@ColorSerializerNullable() Color? get roof;
/// Create a copy of ManufacturerColors
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManufacturerColorsCopyWith<ManufacturerColors> get copyWith => _$ManufacturerColorsCopyWithImpl<ManufacturerColors>(this as ManufacturerColors, _$identity);

  /// Serializes this ManufacturerColors to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManufacturerColors&&(identical(other.name, name) || other.name == name)&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.brandingLine, brandingLine) || other.brandingLine == brandingLine)&&(identical(other.cabFrame, cabFrame) || other.cabFrame == cabFrame)&&(identical(other.frame, frame) || other.frame == frame)&&(identical(other.rims, rims) || other.rims == rims)&&(identical(other.roof, roof) || other.roof == roof));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,primary,tertiary,brandingLine,cabFrame,frame,rims,roof);

@override
String toString() {
  return 'ManufacturerColors(name: $name, primary: $primary, tertiary: $tertiary, brandingLine: $brandingLine, cabFrame: $cabFrame, frame: $frame, rims: $rims, roof: $roof)';
}


}

/// @nodoc
abstract mixin class $ManufacturerColorsCopyWith<$Res>  {
  factory $ManufacturerColorsCopyWith(ManufacturerColors value, $Res Function(ManufacturerColors) _then) = _$ManufacturerColorsCopyWithImpl;
@useResult
$Res call({
 String name,@ColorSerializer() Color primary,@ColorSerializerNullable() Color? tertiary,@ColorSerializerNullable() Color? brandingLine,@ColorSerializerNullable() Color? cabFrame,@ColorSerializerNullable() Color? frame,@ColorSerializerNullable() Color? rims,@ColorSerializerNullable() Color? roof
});




}
/// @nodoc
class _$ManufacturerColorsCopyWithImpl<$Res>
    implements $ManufacturerColorsCopyWith<$Res> {
  _$ManufacturerColorsCopyWithImpl(this._self, this._then);

  final ManufacturerColors _self;
  final $Res Function(ManufacturerColors) _then;

/// Create a copy of ManufacturerColors
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? primary = null,Object? tertiary = freezed,Object? brandingLine = freezed,Object? cabFrame = freezed,Object? frame = freezed,Object? rims = freezed,Object? roof = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,tertiary: freezed == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as Color?,brandingLine: freezed == brandingLine ? _self.brandingLine : brandingLine // ignore: cast_nullable_to_non_nullable
as Color?,cabFrame: freezed == cabFrame ? _self.cabFrame : cabFrame // ignore: cast_nullable_to_non_nullable
as Color?,frame: freezed == frame ? _self.frame : frame // ignore: cast_nullable_to_non_nullable
as Color?,rims: freezed == rims ? _self.rims : rims // ignore: cast_nullable_to_non_nullable
as Color?,roof: freezed == roof ? _self.roof : roof // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ManufacturerColors implements ManufacturerColors {
  const _ManufacturerColors({required this.name, @ColorSerializer() required this.primary, @ColorSerializerNullable() this.tertiary, @ColorSerializerNullable() this.brandingLine, @ColorSerializerNullable() this.cabFrame, @ColorSerializerNullable() this.frame, @ColorSerializerNullable() this.rims, @ColorSerializerNullable() this.roof});
  factory _ManufacturerColors.fromJson(Map<String, dynamic> json) => _$ManufacturerColorsFromJson(json);

/// The name of the manufacturer.
@override final  String name;
/// The primary color for the color scheme.
@override@ColorSerializer() final  Color primary;
/// The tertiary color for the color scheme.
@override@ColorSerializerNullable() final  Color? tertiary;
/// The color of the branding line for the manufacturer.
@override@ColorSerializerNullable() final  Color? brandingLine;
/// The color of the cab frame for the manufacturer.
@override@ColorSerializerNullable() final  Color? cabFrame;
/// The color of the main frame for the manufacturer.
@override@ColorSerializerNullable() final  Color? frame;
/// The color of the wheel rims for the manufacturer.
@override@ColorSerializerNullable() final  Color? rims;
/// The color of the roof for the manufacturer.
@override@ColorSerializerNullable() final  Color? roof;

/// Create a copy of ManufacturerColors
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManufacturerColorsCopyWith<_ManufacturerColors> get copyWith => __$ManufacturerColorsCopyWithImpl<_ManufacturerColors>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManufacturerColorsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManufacturerColors&&(identical(other.name, name) || other.name == name)&&(identical(other.primary, primary) || other.primary == primary)&&(identical(other.tertiary, tertiary) || other.tertiary == tertiary)&&(identical(other.brandingLine, brandingLine) || other.brandingLine == brandingLine)&&(identical(other.cabFrame, cabFrame) || other.cabFrame == cabFrame)&&(identical(other.frame, frame) || other.frame == frame)&&(identical(other.rims, rims) || other.rims == rims)&&(identical(other.roof, roof) || other.roof == roof));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,primary,tertiary,brandingLine,cabFrame,frame,rims,roof);

@override
String toString() {
  return 'ManufacturerColors(name: $name, primary: $primary, tertiary: $tertiary, brandingLine: $brandingLine, cabFrame: $cabFrame, frame: $frame, rims: $rims, roof: $roof)';
}


}

/// @nodoc
abstract mixin class _$ManufacturerColorsCopyWith<$Res> implements $ManufacturerColorsCopyWith<$Res> {
  factory _$ManufacturerColorsCopyWith(_ManufacturerColors value, $Res Function(_ManufacturerColors) _then) = __$ManufacturerColorsCopyWithImpl;
@override @useResult
$Res call({
 String name,@ColorSerializer() Color primary,@ColorSerializerNullable() Color? tertiary,@ColorSerializerNullable() Color? brandingLine,@ColorSerializerNullable() Color? cabFrame,@ColorSerializerNullable() Color? frame,@ColorSerializerNullable() Color? rims,@ColorSerializerNullable() Color? roof
});




}
/// @nodoc
class __$ManufacturerColorsCopyWithImpl<$Res>
    implements _$ManufacturerColorsCopyWith<$Res> {
  __$ManufacturerColorsCopyWithImpl(this._self, this._then);

  final _ManufacturerColors _self;
  final $Res Function(_ManufacturerColors) _then;

/// Create a copy of ManufacturerColors
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? primary = null,Object? tertiary = freezed,Object? brandingLine = freezed,Object? cabFrame = freezed,Object? frame = freezed,Object? rims = freezed,Object? roof = freezed,}) {
  return _then(_ManufacturerColors(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,primary: null == primary ? _self.primary : primary // ignore: cast_nullable_to_non_nullable
as Color,tertiary: freezed == tertiary ? _self.tertiary : tertiary // ignore: cast_nullable_to_non_nullable
as Color?,brandingLine: freezed == brandingLine ? _self.brandingLine : brandingLine // ignore: cast_nullable_to_non_nullable
as Color?,cabFrame: freezed == cabFrame ? _self.cabFrame : cabFrame // ignore: cast_nullable_to_non_nullable
as Color?,frame: freezed == frame ? _self.frame : frame // ignore: cast_nullable_to_non_nullable
as Color?,rims: freezed == rims ? _self.rims : rims // ignore: cast_nullable_to_non_nullable
as Color?,roof: freezed == roof ? _self.roof : roof // ignore: cast_nullable_to_non_nullable
as Color?,
  ));
}


}

// dart format on
