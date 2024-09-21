// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'led_bar_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LedBarConfig _$LedBarConfigFromJson(Map<String, dynamic> json) {
  return _LedBarConfig.fromJson(json);
}

/// @nodoc
mixin _$LedBarConfig {
  /// The amount of green LEDs to the side of the center.
  int get centerCount => throw _privateConstructorUsedError;

  /// The amount of yellow LEDs to the left of the center, the i.e. between
  /// the green and yellow leds.
  int get intermediateCount => throw _privateConstructorUsedError;

  /// The amount of red LEDs furthest to the left.
  int get endCount => throw _privateConstructorUsedError;

  /// Whether there is a singular center diode (not used on the virtual bar
  /// because of the distance gauge).
  bool get oddCenter => throw _privateConstructorUsedError;

  /// The increase in cross track distance that will activate the next
  /// led.
  double get distancePerLed => throw _privateConstructorUsedError;

  /// If [oddCenter] is false, this will dictate whether the two center-most
  /// LEDs will light up when the cross track distance is smaller than
  /// [distancePerLed].
  bool get evenCenterSimulateOdd => throw _privateConstructorUsedError;

  /// The color of the outermost end LEDs, usually red.
  @ColorSerializer()
  Color get endColor => throw _privateConstructorUsedError;

  /// The color of the intermediate LEDs, usually yellow.
  @ColorSerializer()
  Color get intermediateColor => throw _privateConstructorUsedError;

  /// The color of the center LEDs, usually green.
  @ColorSerializer()
  Color get centerColor => throw _privateConstructorUsedError;

  /// The size of the individual LEDs in their largest state (lit).
  double get ledSize => throw _privateConstructorUsedError;

  /// Width of the whole LED bar.
  double get barWidth => throw _privateConstructorUsedError;

  /// Whether the bar should be reversed/inverted.
  bool get reverseBar => throw _privateConstructorUsedError;

  /// Whether the LEDs should be hidden when not lit/active.
  bool get showInactiveLeds => throw _privateConstructorUsedError;

  /// Serializes this LedBarConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LedBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LedBarConfigCopyWith<LedBarConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedBarConfigCopyWith<$Res> {
  factory $LedBarConfigCopyWith(
          LedBarConfig value, $Res Function(LedBarConfig) then) =
      _$LedBarConfigCopyWithImpl<$Res, LedBarConfig>;
  @useResult
  $Res call(
      {int centerCount,
      int intermediateCount,
      int endCount,
      bool oddCenter,
      double distancePerLed,
      bool evenCenterSimulateOdd,
      @ColorSerializer() Color endColor,
      @ColorSerializer() Color intermediateColor,
      @ColorSerializer() Color centerColor,
      double ledSize,
      double barWidth,
      bool reverseBar,
      bool showInactiveLeds});
}

/// @nodoc
class _$LedBarConfigCopyWithImpl<$Res, $Val extends LedBarConfig>
    implements $LedBarConfigCopyWith<$Res> {
  _$LedBarConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LedBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? centerCount = null,
    Object? intermediateCount = null,
    Object? endCount = null,
    Object? oddCenter = null,
    Object? distancePerLed = null,
    Object? evenCenterSimulateOdd = null,
    Object? endColor = null,
    Object? intermediateColor = null,
    Object? centerColor = null,
    Object? ledSize = null,
    Object? barWidth = null,
    Object? reverseBar = null,
    Object? showInactiveLeds = null,
  }) {
    return _then(_value.copyWith(
      centerCount: null == centerCount
          ? _value.centerCount
          : centerCount // ignore: cast_nullable_to_non_nullable
              as int,
      intermediateCount: null == intermediateCount
          ? _value.intermediateCount
          : intermediateCount // ignore: cast_nullable_to_non_nullable
              as int,
      endCount: null == endCount
          ? _value.endCount
          : endCount // ignore: cast_nullable_to_non_nullable
              as int,
      oddCenter: null == oddCenter
          ? _value.oddCenter
          : oddCenter // ignore: cast_nullable_to_non_nullable
              as bool,
      distancePerLed: null == distancePerLed
          ? _value.distancePerLed
          : distancePerLed // ignore: cast_nullable_to_non_nullable
              as double,
      evenCenterSimulateOdd: null == evenCenterSimulateOdd
          ? _value.evenCenterSimulateOdd
          : evenCenterSimulateOdd // ignore: cast_nullable_to_non_nullable
              as bool,
      endColor: null == endColor
          ? _value.endColor
          : endColor // ignore: cast_nullable_to_non_nullable
              as Color,
      intermediateColor: null == intermediateColor
          ? _value.intermediateColor
          : intermediateColor // ignore: cast_nullable_to_non_nullable
              as Color,
      centerColor: null == centerColor
          ? _value.centerColor
          : centerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      ledSize: null == ledSize
          ? _value.ledSize
          : ledSize // ignore: cast_nullable_to_non_nullable
              as double,
      barWidth: null == barWidth
          ? _value.barWidth
          : barWidth // ignore: cast_nullable_to_non_nullable
              as double,
      reverseBar: null == reverseBar
          ? _value.reverseBar
          : reverseBar // ignore: cast_nullable_to_non_nullable
              as bool,
      showInactiveLeds: null == showInactiveLeds
          ? _value.showInactiveLeds
          : showInactiveLeds // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LedBarConfigImplCopyWith<$Res>
    implements $LedBarConfigCopyWith<$Res> {
  factory _$$LedBarConfigImplCopyWith(
          _$LedBarConfigImpl value, $Res Function(_$LedBarConfigImpl) then) =
      __$$LedBarConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int centerCount,
      int intermediateCount,
      int endCount,
      bool oddCenter,
      double distancePerLed,
      bool evenCenterSimulateOdd,
      @ColorSerializer() Color endColor,
      @ColorSerializer() Color intermediateColor,
      @ColorSerializer() Color centerColor,
      double ledSize,
      double barWidth,
      bool reverseBar,
      bool showInactiveLeds});
}

/// @nodoc
class __$$LedBarConfigImplCopyWithImpl<$Res>
    extends _$LedBarConfigCopyWithImpl<$Res, _$LedBarConfigImpl>
    implements _$$LedBarConfigImplCopyWith<$Res> {
  __$$LedBarConfigImplCopyWithImpl(
      _$LedBarConfigImpl _value, $Res Function(_$LedBarConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? centerCount = null,
    Object? intermediateCount = null,
    Object? endCount = null,
    Object? oddCenter = null,
    Object? distancePerLed = null,
    Object? evenCenterSimulateOdd = null,
    Object? endColor = null,
    Object? intermediateColor = null,
    Object? centerColor = null,
    Object? ledSize = null,
    Object? barWidth = null,
    Object? reverseBar = null,
    Object? showInactiveLeds = null,
  }) {
    return _then(_$LedBarConfigImpl(
      centerCount: null == centerCount
          ? _value.centerCount
          : centerCount // ignore: cast_nullable_to_non_nullable
              as int,
      intermediateCount: null == intermediateCount
          ? _value.intermediateCount
          : intermediateCount // ignore: cast_nullable_to_non_nullable
              as int,
      endCount: null == endCount
          ? _value.endCount
          : endCount // ignore: cast_nullable_to_non_nullable
              as int,
      oddCenter: null == oddCenter
          ? _value.oddCenter
          : oddCenter // ignore: cast_nullable_to_non_nullable
              as bool,
      distancePerLed: null == distancePerLed
          ? _value.distancePerLed
          : distancePerLed // ignore: cast_nullable_to_non_nullable
              as double,
      evenCenterSimulateOdd: null == evenCenterSimulateOdd
          ? _value.evenCenterSimulateOdd
          : evenCenterSimulateOdd // ignore: cast_nullable_to_non_nullable
              as bool,
      endColor: null == endColor
          ? _value.endColor
          : endColor // ignore: cast_nullable_to_non_nullable
              as Color,
      intermediateColor: null == intermediateColor
          ? _value.intermediateColor
          : intermediateColor // ignore: cast_nullable_to_non_nullable
              as Color,
      centerColor: null == centerColor
          ? _value.centerColor
          : centerColor // ignore: cast_nullable_to_non_nullable
              as Color,
      ledSize: null == ledSize
          ? _value.ledSize
          : ledSize // ignore: cast_nullable_to_non_nullable
              as double,
      barWidth: null == barWidth
          ? _value.barWidth
          : barWidth // ignore: cast_nullable_to_non_nullable
              as double,
      reverseBar: null == reverseBar
          ? _value.reverseBar
          : reverseBar // ignore: cast_nullable_to_non_nullable
              as bool,
      showInactiveLeds: null == showInactiveLeds
          ? _value.showInactiveLeds
          : showInactiveLeds // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedBarConfigImpl extends _LedBarConfig {
  const _$LedBarConfigImpl(
      {this.centerCount = 2,
      this.intermediateCount = 2,
      this.endCount = 2,
      this.oddCenter = false,
      this.distancePerLed = 0.04,
      this.evenCenterSimulateOdd = false,
      @ColorSerializer() this.endColor = Colors.red,
      @ColorSerializer() this.intermediateColor = Colors.yellow,
      @ColorSerializer() this.centerColor = Colors.green,
      this.ledSize = 20,
      this.barWidth = 800,
      this.reverseBar = false,
      this.showInactiveLeds = true})
      : super._();

  factory _$LedBarConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedBarConfigImplFromJson(json);

  /// The amount of green LEDs to the side of the center.
  @override
  @JsonKey()
  final int centerCount;

  /// The amount of yellow LEDs to the left of the center, the i.e. between
  /// the green and yellow leds.
  @override
  @JsonKey()
  final int intermediateCount;

  /// The amount of red LEDs furthest to the left.
  @override
  @JsonKey()
  final int endCount;

  /// Whether there is a singular center diode (not used on the virtual bar
  /// because of the distance gauge).
  @override
  @JsonKey()
  final bool oddCenter;

  /// The increase in cross track distance that will activate the next
  /// led.
  @override
  @JsonKey()
  final double distancePerLed;

  /// If [oddCenter] is false, this will dictate whether the two center-most
  /// LEDs will light up when the cross track distance is smaller than
  /// [distancePerLed].
  @override
  @JsonKey()
  final bool evenCenterSimulateOdd;

  /// The color of the outermost end LEDs, usually red.
  @override
  @JsonKey()
  @ColorSerializer()
  final Color endColor;

  /// The color of the intermediate LEDs, usually yellow.
  @override
  @JsonKey()
  @ColorSerializer()
  final Color intermediateColor;

  /// The color of the center LEDs, usually green.
  @override
  @JsonKey()
  @ColorSerializer()
  final Color centerColor;

  /// The size of the individual LEDs in their largest state (lit).
  @override
  @JsonKey()
  final double ledSize;

  /// Width of the whole LED bar.
  @override
  @JsonKey()
  final double barWidth;

  /// Whether the bar should be reversed/inverted.
  @override
  @JsonKey()
  final bool reverseBar;

  /// Whether the LEDs should be hidden when not lit/active.
  @override
  @JsonKey()
  final bool showInactiveLeds;

  @override
  String toString() {
    return 'LedBarConfig(centerCount: $centerCount, intermediateCount: $intermediateCount, endCount: $endCount, oddCenter: $oddCenter, distancePerLed: $distancePerLed, evenCenterSimulateOdd: $evenCenterSimulateOdd, endColor: $endColor, intermediateColor: $intermediateColor, centerColor: $centerColor, ledSize: $ledSize, barWidth: $barWidth, reverseBar: $reverseBar, showInactiveLeds: $showInactiveLeds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedBarConfigImpl &&
            (identical(other.centerCount, centerCount) ||
                other.centerCount == centerCount) &&
            (identical(other.intermediateCount, intermediateCount) ||
                other.intermediateCount == intermediateCount) &&
            (identical(other.endCount, endCount) ||
                other.endCount == endCount) &&
            (identical(other.oddCenter, oddCenter) ||
                other.oddCenter == oddCenter) &&
            (identical(other.distancePerLed, distancePerLed) ||
                other.distancePerLed == distancePerLed) &&
            (identical(other.evenCenterSimulateOdd, evenCenterSimulateOdd) ||
                other.evenCenterSimulateOdd == evenCenterSimulateOdd) &&
            (identical(other.endColor, endColor) ||
                other.endColor == endColor) &&
            (identical(other.intermediateColor, intermediateColor) ||
                other.intermediateColor == intermediateColor) &&
            (identical(other.centerColor, centerColor) ||
                other.centerColor == centerColor) &&
            (identical(other.ledSize, ledSize) || other.ledSize == ledSize) &&
            (identical(other.barWidth, barWidth) ||
                other.barWidth == barWidth) &&
            (identical(other.reverseBar, reverseBar) ||
                other.reverseBar == reverseBar) &&
            (identical(other.showInactiveLeds, showInactiveLeds) ||
                other.showInactiveLeds == showInactiveLeds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      centerCount,
      intermediateCount,
      endCount,
      oddCenter,
      distancePerLed,
      evenCenterSimulateOdd,
      endColor,
      intermediateColor,
      centerColor,
      ledSize,
      barWidth,
      reverseBar,
      showInactiveLeds);

  /// Create a copy of LedBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LedBarConfigImplCopyWith<_$LedBarConfigImpl> get copyWith =>
      __$$LedBarConfigImplCopyWithImpl<_$LedBarConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LedBarConfigImplToJson(
      this,
    );
  }
}

abstract class _LedBarConfig extends LedBarConfig {
  const factory _LedBarConfig(
      {final int centerCount,
      final int intermediateCount,
      final int endCount,
      final bool oddCenter,
      final double distancePerLed,
      final bool evenCenterSimulateOdd,
      @ColorSerializer() final Color endColor,
      @ColorSerializer() final Color intermediateColor,
      @ColorSerializer() final Color centerColor,
      final double ledSize,
      final double barWidth,
      final bool reverseBar,
      final bool showInactiveLeds}) = _$LedBarConfigImpl;
  const _LedBarConfig._() : super._();

  factory _LedBarConfig.fromJson(Map<String, dynamic> json) =
      _$LedBarConfigImpl.fromJson;

  /// The amount of green LEDs to the side of the center.
  @override
  int get centerCount;

  /// The amount of yellow LEDs to the left of the center, the i.e. between
  /// the green and yellow leds.
  @override
  int get intermediateCount;

  /// The amount of red LEDs furthest to the left.
  @override
  int get endCount;

  /// Whether there is a singular center diode (not used on the virtual bar
  /// because of the distance gauge).
  @override
  bool get oddCenter;

  /// The increase in cross track distance that will activate the next
  /// led.
  @override
  double get distancePerLed;

  /// If [oddCenter] is false, this will dictate whether the two center-most
  /// LEDs will light up when the cross track distance is smaller than
  /// [distancePerLed].
  @override
  bool get evenCenterSimulateOdd;

  /// The color of the outermost end LEDs, usually red.
  @override
  @ColorSerializer()
  Color get endColor;

  /// The color of the intermediate LEDs, usually yellow.
  @override
  @ColorSerializer()
  Color get intermediateColor;

  /// The color of the center LEDs, usually green.
  @override
  @ColorSerializer()
  Color get centerColor;

  /// The size of the individual LEDs in their largest state (lit).
  @override
  double get ledSize;

  /// Width of the whole LED bar.
  @override
  double get barWidth;

  /// Whether the bar should be reversed/inverted.
  @override
  bool get reverseBar;

  /// Whether the LEDs should be hidden when not lit/active.
  @override
  bool get showInactiveLeds;

  /// Create a copy of LedBarConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LedBarConfigImplCopyWith<_$LedBarConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
