// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'led_bar_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LedBarConfig {

/// The amount of green LEDs to the side of the center.
 int get centerCount;/// The amount of yellow LEDs to the left of the center, the i.e. between
/// the green and yellow leds.
 int get intermediateCount;/// The amount of red LEDs furthest to the left.
 int get endCount;/// Whether there is a singular center diode (not used on the virtual bar
/// because of the distance gauge).
 bool get oddCenter;/// The increase in cross track distance that will activate the next
/// led.
 double get distancePerLed;/// If [oddCenter] is false, this will dictate whether the two center-most
/// LEDs will light up when the cross track distance is smaller than
/// [distancePerLed].
 bool get evenCenterSimulateOdd;/// The color of the outermost end LEDs, usually red.
@ColorSerializer() Color get endColor;/// The color of the intermediate LEDs, usually yellow.
@ColorSerializer() Color get intermediateColor;/// The color of the center LEDs, usually green.
@ColorSerializer() Color get centerColor;/// The size of the individual LEDs in their largest state (lit).
 double get ledSize;/// Width of the whole LED bar.
 double get barWidth;/// Whether the bar should be reversed/inverted.
 bool get reverseBar;/// Whether the LEDs should be hidden when not lit/active.
 bool get showInactiveLeds;
/// Create a copy of LedBarConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LedBarConfigCopyWith<LedBarConfig> get copyWith => _$LedBarConfigCopyWithImpl<LedBarConfig>(this as LedBarConfig, _$identity);

  /// Serializes this LedBarConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LedBarConfig&&(identical(other.centerCount, centerCount) || other.centerCount == centerCount)&&(identical(other.intermediateCount, intermediateCount) || other.intermediateCount == intermediateCount)&&(identical(other.endCount, endCount) || other.endCount == endCount)&&(identical(other.oddCenter, oddCenter) || other.oddCenter == oddCenter)&&(identical(other.distancePerLed, distancePerLed) || other.distancePerLed == distancePerLed)&&(identical(other.evenCenterSimulateOdd, evenCenterSimulateOdd) || other.evenCenterSimulateOdd == evenCenterSimulateOdd)&&(identical(other.endColor, endColor) || other.endColor == endColor)&&(identical(other.intermediateColor, intermediateColor) || other.intermediateColor == intermediateColor)&&(identical(other.centerColor, centerColor) || other.centerColor == centerColor)&&(identical(other.ledSize, ledSize) || other.ledSize == ledSize)&&(identical(other.barWidth, barWidth) || other.barWidth == barWidth)&&(identical(other.reverseBar, reverseBar) || other.reverseBar == reverseBar)&&(identical(other.showInactiveLeds, showInactiveLeds) || other.showInactiveLeds == showInactiveLeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,centerCount,intermediateCount,endCount,oddCenter,distancePerLed,evenCenterSimulateOdd,endColor,intermediateColor,centerColor,ledSize,barWidth,reverseBar,showInactiveLeds);

@override
String toString() {
  return 'LedBarConfig(centerCount: $centerCount, intermediateCount: $intermediateCount, endCount: $endCount, oddCenter: $oddCenter, distancePerLed: $distancePerLed, evenCenterSimulateOdd: $evenCenterSimulateOdd, endColor: $endColor, intermediateColor: $intermediateColor, centerColor: $centerColor, ledSize: $ledSize, barWidth: $barWidth, reverseBar: $reverseBar, showInactiveLeds: $showInactiveLeds)';
}


}

/// @nodoc
abstract mixin class $LedBarConfigCopyWith<$Res>  {
  factory $LedBarConfigCopyWith(LedBarConfig value, $Res Function(LedBarConfig) _then) = _$LedBarConfigCopyWithImpl;
@useResult
$Res call({
 int centerCount, int intermediateCount, int endCount, bool oddCenter, double distancePerLed, bool evenCenterSimulateOdd,@ColorSerializer() Color endColor,@ColorSerializer() Color intermediateColor,@ColorSerializer() Color centerColor, double ledSize, double barWidth, bool reverseBar, bool showInactiveLeds
});




}
/// @nodoc
class _$LedBarConfigCopyWithImpl<$Res>
    implements $LedBarConfigCopyWith<$Res> {
  _$LedBarConfigCopyWithImpl(this._self, this._then);

  final LedBarConfig _self;
  final $Res Function(LedBarConfig) _then;

/// Create a copy of LedBarConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? centerCount = null,Object? intermediateCount = null,Object? endCount = null,Object? oddCenter = null,Object? distancePerLed = null,Object? evenCenterSimulateOdd = null,Object? endColor = null,Object? intermediateColor = null,Object? centerColor = null,Object? ledSize = null,Object? barWidth = null,Object? reverseBar = null,Object? showInactiveLeds = null,}) {
  return _then(_self.copyWith(
centerCount: null == centerCount ? _self.centerCount : centerCount // ignore: cast_nullable_to_non_nullable
as int,intermediateCount: null == intermediateCount ? _self.intermediateCount : intermediateCount // ignore: cast_nullable_to_non_nullable
as int,endCount: null == endCount ? _self.endCount : endCount // ignore: cast_nullable_to_non_nullable
as int,oddCenter: null == oddCenter ? _self.oddCenter : oddCenter // ignore: cast_nullable_to_non_nullable
as bool,distancePerLed: null == distancePerLed ? _self.distancePerLed : distancePerLed // ignore: cast_nullable_to_non_nullable
as double,evenCenterSimulateOdd: null == evenCenterSimulateOdd ? _self.evenCenterSimulateOdd : evenCenterSimulateOdd // ignore: cast_nullable_to_non_nullable
as bool,endColor: null == endColor ? _self.endColor : endColor // ignore: cast_nullable_to_non_nullable
as Color,intermediateColor: null == intermediateColor ? _self.intermediateColor : intermediateColor // ignore: cast_nullable_to_non_nullable
as Color,centerColor: null == centerColor ? _self.centerColor : centerColor // ignore: cast_nullable_to_non_nullable
as Color,ledSize: null == ledSize ? _self.ledSize : ledSize // ignore: cast_nullable_to_non_nullable
as double,barWidth: null == barWidth ? _self.barWidth : barWidth // ignore: cast_nullable_to_non_nullable
as double,reverseBar: null == reverseBar ? _self.reverseBar : reverseBar // ignore: cast_nullable_to_non_nullable
as bool,showInactiveLeds: null == showInactiveLeds ? _self.showInactiveLeds : showInactiveLeds // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [LedBarConfig].
extension LedBarConfigPatterns on LedBarConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LedBarConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LedBarConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LedBarConfig value)  $default,){
final _that = this;
switch (_that) {
case _LedBarConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LedBarConfig value)?  $default,){
final _that = this;
switch (_that) {
case _LedBarConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int centerCount,  int intermediateCount,  int endCount,  bool oddCenter,  double distancePerLed,  bool evenCenterSimulateOdd, @ColorSerializer()  Color endColor, @ColorSerializer()  Color intermediateColor, @ColorSerializer()  Color centerColor,  double ledSize,  double barWidth,  bool reverseBar,  bool showInactiveLeds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LedBarConfig() when $default != null:
return $default(_that.centerCount,_that.intermediateCount,_that.endCount,_that.oddCenter,_that.distancePerLed,_that.evenCenterSimulateOdd,_that.endColor,_that.intermediateColor,_that.centerColor,_that.ledSize,_that.barWidth,_that.reverseBar,_that.showInactiveLeds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int centerCount,  int intermediateCount,  int endCount,  bool oddCenter,  double distancePerLed,  bool evenCenterSimulateOdd, @ColorSerializer()  Color endColor, @ColorSerializer()  Color intermediateColor, @ColorSerializer()  Color centerColor,  double ledSize,  double barWidth,  bool reverseBar,  bool showInactiveLeds)  $default,) {final _that = this;
switch (_that) {
case _LedBarConfig():
return $default(_that.centerCount,_that.intermediateCount,_that.endCount,_that.oddCenter,_that.distancePerLed,_that.evenCenterSimulateOdd,_that.endColor,_that.intermediateColor,_that.centerColor,_that.ledSize,_that.barWidth,_that.reverseBar,_that.showInactiveLeds);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int centerCount,  int intermediateCount,  int endCount,  bool oddCenter,  double distancePerLed,  bool evenCenterSimulateOdd, @ColorSerializer()  Color endColor, @ColorSerializer()  Color intermediateColor, @ColorSerializer()  Color centerColor,  double ledSize,  double barWidth,  bool reverseBar,  bool showInactiveLeds)?  $default,) {final _that = this;
switch (_that) {
case _LedBarConfig() when $default != null:
return $default(_that.centerCount,_that.intermediateCount,_that.endCount,_that.oddCenter,_that.distancePerLed,_that.evenCenterSimulateOdd,_that.endColor,_that.intermediateColor,_that.centerColor,_that.ledSize,_that.barWidth,_that.reverseBar,_that.showInactiveLeds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LedBarConfig extends LedBarConfig {
  const _LedBarConfig({this.centerCount = 2, this.intermediateCount = 2, this.endCount = 2, this.oddCenter = false, this.distancePerLed = 0.04, this.evenCenterSimulateOdd = false, @ColorSerializer() this.endColor = Colors.red, @ColorSerializer() this.intermediateColor = Colors.yellow, @ColorSerializer() this.centerColor = Colors.green, this.ledSize = 20, this.barWidth = 800, this.reverseBar = false, this.showInactiveLeds = true}): super._();
  factory _LedBarConfig.fromJson(Map<String, dynamic> json) => _$LedBarConfigFromJson(json);

/// The amount of green LEDs to the side of the center.
@override@JsonKey() final  int centerCount;
/// The amount of yellow LEDs to the left of the center, the i.e. between
/// the green and yellow leds.
@override@JsonKey() final  int intermediateCount;
/// The amount of red LEDs furthest to the left.
@override@JsonKey() final  int endCount;
/// Whether there is a singular center diode (not used on the virtual bar
/// because of the distance gauge).
@override@JsonKey() final  bool oddCenter;
/// The increase in cross track distance that will activate the next
/// led.
@override@JsonKey() final  double distancePerLed;
/// If [oddCenter] is false, this will dictate whether the two center-most
/// LEDs will light up when the cross track distance is smaller than
/// [distancePerLed].
@override@JsonKey() final  bool evenCenterSimulateOdd;
/// The color of the outermost end LEDs, usually red.
@override@JsonKey()@ColorSerializer() final  Color endColor;
/// The color of the intermediate LEDs, usually yellow.
@override@JsonKey()@ColorSerializer() final  Color intermediateColor;
/// The color of the center LEDs, usually green.
@override@JsonKey()@ColorSerializer() final  Color centerColor;
/// The size of the individual LEDs in their largest state (lit).
@override@JsonKey() final  double ledSize;
/// Width of the whole LED bar.
@override@JsonKey() final  double barWidth;
/// Whether the bar should be reversed/inverted.
@override@JsonKey() final  bool reverseBar;
/// Whether the LEDs should be hidden when not lit/active.
@override@JsonKey() final  bool showInactiveLeds;

/// Create a copy of LedBarConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LedBarConfigCopyWith<_LedBarConfig> get copyWith => __$LedBarConfigCopyWithImpl<_LedBarConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LedBarConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LedBarConfig&&(identical(other.centerCount, centerCount) || other.centerCount == centerCount)&&(identical(other.intermediateCount, intermediateCount) || other.intermediateCount == intermediateCount)&&(identical(other.endCount, endCount) || other.endCount == endCount)&&(identical(other.oddCenter, oddCenter) || other.oddCenter == oddCenter)&&(identical(other.distancePerLed, distancePerLed) || other.distancePerLed == distancePerLed)&&(identical(other.evenCenterSimulateOdd, evenCenterSimulateOdd) || other.evenCenterSimulateOdd == evenCenterSimulateOdd)&&(identical(other.endColor, endColor) || other.endColor == endColor)&&(identical(other.intermediateColor, intermediateColor) || other.intermediateColor == intermediateColor)&&(identical(other.centerColor, centerColor) || other.centerColor == centerColor)&&(identical(other.ledSize, ledSize) || other.ledSize == ledSize)&&(identical(other.barWidth, barWidth) || other.barWidth == barWidth)&&(identical(other.reverseBar, reverseBar) || other.reverseBar == reverseBar)&&(identical(other.showInactiveLeds, showInactiveLeds) || other.showInactiveLeds == showInactiveLeds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,centerCount,intermediateCount,endCount,oddCenter,distancePerLed,evenCenterSimulateOdd,endColor,intermediateColor,centerColor,ledSize,barWidth,reverseBar,showInactiveLeds);

@override
String toString() {
  return 'LedBarConfig(centerCount: $centerCount, intermediateCount: $intermediateCount, endCount: $endCount, oddCenter: $oddCenter, distancePerLed: $distancePerLed, evenCenterSimulateOdd: $evenCenterSimulateOdd, endColor: $endColor, intermediateColor: $intermediateColor, centerColor: $centerColor, ledSize: $ledSize, barWidth: $barWidth, reverseBar: $reverseBar, showInactiveLeds: $showInactiveLeds)';
}


}

/// @nodoc
abstract mixin class _$LedBarConfigCopyWith<$Res> implements $LedBarConfigCopyWith<$Res> {
  factory _$LedBarConfigCopyWith(_LedBarConfig value, $Res Function(_LedBarConfig) _then) = __$LedBarConfigCopyWithImpl;
@override @useResult
$Res call({
 int centerCount, int intermediateCount, int endCount, bool oddCenter, double distancePerLed, bool evenCenterSimulateOdd,@ColorSerializer() Color endColor,@ColorSerializer() Color intermediateColor,@ColorSerializer() Color centerColor, double ledSize, double barWidth, bool reverseBar, bool showInactiveLeds
});




}
/// @nodoc
class __$LedBarConfigCopyWithImpl<$Res>
    implements _$LedBarConfigCopyWith<$Res> {
  __$LedBarConfigCopyWithImpl(this._self, this._then);

  final _LedBarConfig _self;
  final $Res Function(_LedBarConfig) _then;

/// Create a copy of LedBarConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? centerCount = null,Object? intermediateCount = null,Object? endCount = null,Object? oddCenter = null,Object? distancePerLed = null,Object? evenCenterSimulateOdd = null,Object? endColor = null,Object? intermediateColor = null,Object? centerColor = null,Object? ledSize = null,Object? barWidth = null,Object? reverseBar = null,Object? showInactiveLeds = null,}) {
  return _then(_LedBarConfig(
centerCount: null == centerCount ? _self.centerCount : centerCount // ignore: cast_nullable_to_non_nullable
as int,intermediateCount: null == intermediateCount ? _self.intermediateCount : intermediateCount // ignore: cast_nullable_to_non_nullable
as int,endCount: null == endCount ? _self.endCount : endCount // ignore: cast_nullable_to_non_nullable
as int,oddCenter: null == oddCenter ? _self.oddCenter : oddCenter // ignore: cast_nullable_to_non_nullable
as bool,distancePerLed: null == distancePerLed ? _self.distancePerLed : distancePerLed // ignore: cast_nullable_to_non_nullable
as double,evenCenterSimulateOdd: null == evenCenterSimulateOdd ? _self.evenCenterSimulateOdd : evenCenterSimulateOdd // ignore: cast_nullable_to_non_nullable
as bool,endColor: null == endColor ? _self.endColor : endColor // ignore: cast_nullable_to_non_nullable
as Color,intermediateColor: null == intermediateColor ? _self.intermediateColor : intermediateColor // ignore: cast_nullable_to_non_nullable
as Color,centerColor: null == centerColor ? _self.centerColor : centerColor // ignore: cast_nullable_to_non_nullable
as Color,ledSize: null == ledSize ? _self.ledSize : ledSize // ignore: cast_nullable_to_non_nullable
as double,barWidth: null == barWidth ? _self.barWidth : barWidth // ignore: cast_nullable_to_non_nullable
as double,reverseBar: null == reverseBar ? _self.reverseBar : reverseBar // ignore: cast_nullable_to_non_nullable
as bool,showInactiveLeds: null == showInactiveLeds ? _self.showInactiveLeds : showInactiveLeds // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
