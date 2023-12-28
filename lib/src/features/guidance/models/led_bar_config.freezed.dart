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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LedBarConfig _$LedBarConfigFromJson(Map<String, dynamic> json) {
  return _LedBarConfig.fromJson(json);
}

/// @nodoc
mixin _$LedBarConfig {
  /// The amount of red LEDs furthest to the left.
  int get leftEndCount => throw _privateConstructorUsedError;

  /// The amount of yellow LEDs to the left of the center.
  int get leftIntermediateCount => throw _privateConstructorUsedError;

  /// The amount of center green LEDs, odd number is prefered to have
  /// one in actual center.
  int get centerCount =>
      throw _privateConstructorUsedError; // The amount of yellow LEDs to the right of the center.
  int get rightIntermediateCount => throw _privateConstructorUsedError;

  /// The amount of red LEDs furthest to the right.
  int get rightEndCount => throw _privateConstructorUsedError;

  /// The increase in cross track distance that will activate the next
  /// led.
  double get distancePerLed => throw _privateConstructorUsedError;

  /// If the [centerCount] is even, this will dictate whether the
  /// two center-most LEDs will light up when the cross track distance
  /// is smaller than [distancePerLed].
  bool get evenCenterSimulateOdd => throw _privateConstructorUsedError;

  /// The color of the outermost end LEDs, usually red.
  /// Format: 0xAARRGGBB
  int get endColor => throw _privateConstructorUsedError;

  /// The color of the intermediate LEDs, usually yellow.
  /// Format: 0xAARRGGBB
  int get intermediateColor => throw _privateConstructorUsedError;

  /// The color of the center LEDs, usually green.
  /// Format: 0xAARRGGBB
  int get centerColor => throw _privateConstructorUsedError;

  /// The size of the individual LEDs in their largest state (lit).
  double get ledSize => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      {int leftEndCount,
      int leftIntermediateCount,
      int centerCount,
      int rightIntermediateCount,
      int rightEndCount,
      double distancePerLed,
      bool evenCenterSimulateOdd,
      int endColor,
      int intermediateColor,
      int centerColor,
      double ledSize});
}

/// @nodoc
class _$LedBarConfigCopyWithImpl<$Res, $Val extends LedBarConfig>
    implements $LedBarConfigCopyWith<$Res> {
  _$LedBarConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftEndCount = null,
    Object? leftIntermediateCount = null,
    Object? centerCount = null,
    Object? rightIntermediateCount = null,
    Object? rightEndCount = null,
    Object? distancePerLed = null,
    Object? evenCenterSimulateOdd = null,
    Object? endColor = null,
    Object? intermediateColor = null,
    Object? centerColor = null,
    Object? ledSize = null,
  }) {
    return _then(_value.copyWith(
      leftEndCount: null == leftEndCount
          ? _value.leftEndCount
          : leftEndCount // ignore: cast_nullable_to_non_nullable
              as int,
      leftIntermediateCount: null == leftIntermediateCount
          ? _value.leftIntermediateCount
          : leftIntermediateCount // ignore: cast_nullable_to_non_nullable
              as int,
      centerCount: null == centerCount
          ? _value.centerCount
          : centerCount // ignore: cast_nullable_to_non_nullable
              as int,
      rightIntermediateCount: null == rightIntermediateCount
          ? _value.rightIntermediateCount
          : rightIntermediateCount // ignore: cast_nullable_to_non_nullable
              as int,
      rightEndCount: null == rightEndCount
          ? _value.rightEndCount
          : rightEndCount // ignore: cast_nullable_to_non_nullable
              as int,
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
              as int,
      intermediateColor: null == intermediateColor
          ? _value.intermediateColor
          : intermediateColor // ignore: cast_nullable_to_non_nullable
              as int,
      centerColor: null == centerColor
          ? _value.centerColor
          : centerColor // ignore: cast_nullable_to_non_nullable
              as int,
      ledSize: null == ledSize
          ? _value.ledSize
          : ledSize // ignore: cast_nullable_to_non_nullable
              as double,
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
      {int leftEndCount,
      int leftIntermediateCount,
      int centerCount,
      int rightIntermediateCount,
      int rightEndCount,
      double distancePerLed,
      bool evenCenterSimulateOdd,
      int endColor,
      int intermediateColor,
      int centerColor,
      double ledSize});
}

/// @nodoc
class __$$LedBarConfigImplCopyWithImpl<$Res>
    extends _$LedBarConfigCopyWithImpl<$Res, _$LedBarConfigImpl>
    implements _$$LedBarConfigImplCopyWith<$Res> {
  __$$LedBarConfigImplCopyWithImpl(
      _$LedBarConfigImpl _value, $Res Function(_$LedBarConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? leftEndCount = null,
    Object? leftIntermediateCount = null,
    Object? centerCount = null,
    Object? rightIntermediateCount = null,
    Object? rightEndCount = null,
    Object? distancePerLed = null,
    Object? evenCenterSimulateOdd = null,
    Object? endColor = null,
    Object? intermediateColor = null,
    Object? centerColor = null,
    Object? ledSize = null,
  }) {
    return _then(_$LedBarConfigImpl(
      leftEndCount: null == leftEndCount
          ? _value.leftEndCount
          : leftEndCount // ignore: cast_nullable_to_non_nullable
              as int,
      leftIntermediateCount: null == leftIntermediateCount
          ? _value.leftIntermediateCount
          : leftIntermediateCount // ignore: cast_nullable_to_non_nullable
              as int,
      centerCount: null == centerCount
          ? _value.centerCount
          : centerCount // ignore: cast_nullable_to_non_nullable
              as int,
      rightIntermediateCount: null == rightIntermediateCount
          ? _value.rightIntermediateCount
          : rightIntermediateCount // ignore: cast_nullable_to_non_nullable
              as int,
      rightEndCount: null == rightEndCount
          ? _value.rightEndCount
          : rightEndCount // ignore: cast_nullable_to_non_nullable
              as int,
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
              as int,
      intermediateColor: null == intermediateColor
          ? _value.intermediateColor
          : intermediateColor // ignore: cast_nullable_to_non_nullable
              as int,
      centerColor: null == centerColor
          ? _value.centerColor
          : centerColor // ignore: cast_nullable_to_non_nullable
              as int,
      ledSize: null == ledSize
          ? _value.ledSize
          : ledSize // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedBarConfigImpl extends _LedBarConfig {
  const _$LedBarConfigImpl(
      {this.leftEndCount = 2,
      this.leftIntermediateCount = 2,
      this.centerCount = 3,
      this.rightIntermediateCount = 2,
      this.rightEndCount = 2,
      this.distancePerLed = 0.04,
      this.evenCenterSimulateOdd = false,
      this.endColor = 0xFFFF0000,
      this.intermediateColor = 0xFFFFEF3B,
      this.centerColor = 0xFF00FF00,
      this.ledSize = 32})
      : super._();

  factory _$LedBarConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedBarConfigImplFromJson(json);

  /// The amount of red LEDs furthest to the left.
  @override
  @JsonKey()
  final int leftEndCount;

  /// The amount of yellow LEDs to the left of the center.
  @override
  @JsonKey()
  final int leftIntermediateCount;

  /// The amount of center green LEDs, odd number is prefered to have
  /// one in actual center.
  @override
  @JsonKey()
  final int centerCount;
// The amount of yellow LEDs to the right of the center.
  @override
  @JsonKey()
  final int rightIntermediateCount;

  /// The amount of red LEDs furthest to the right.
  @override
  @JsonKey()
  final int rightEndCount;

  /// The increase in cross track distance that will activate the next
  /// led.
  @override
  @JsonKey()
  final double distancePerLed;

  /// If the [centerCount] is even, this will dictate whether the
  /// two center-most LEDs will light up when the cross track distance
  /// is smaller than [distancePerLed].
  @override
  @JsonKey()
  final bool evenCenterSimulateOdd;

  /// The color of the outermost end LEDs, usually red.
  /// Format: 0xAARRGGBB
  @override
  @JsonKey()
  final int endColor;

  /// The color of the intermediate LEDs, usually yellow.
  /// Format: 0xAARRGGBB
  @override
  @JsonKey()
  final int intermediateColor;

  /// The color of the center LEDs, usually green.
  /// Format: 0xAARRGGBB
  @override
  @JsonKey()
  final int centerColor;

  /// The size of the individual LEDs in their largest state (lit).
  @override
  @JsonKey()
  final double ledSize;

  @override
  String toString() {
    return 'LedBarConfig(leftEndCount: $leftEndCount, leftIntermediateCount: $leftIntermediateCount, centerCount: $centerCount, rightIntermediateCount: $rightIntermediateCount, rightEndCount: $rightEndCount, distancePerLed: $distancePerLed, evenCenterSimulateOdd: $evenCenterSimulateOdd, endColor: $endColor, intermediateColor: $intermediateColor, centerColor: $centerColor, ledSize: $ledSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedBarConfigImpl &&
            (identical(other.leftEndCount, leftEndCount) ||
                other.leftEndCount == leftEndCount) &&
            (identical(other.leftIntermediateCount, leftIntermediateCount) ||
                other.leftIntermediateCount == leftIntermediateCount) &&
            (identical(other.centerCount, centerCount) ||
                other.centerCount == centerCount) &&
            (identical(other.rightIntermediateCount, rightIntermediateCount) ||
                other.rightIntermediateCount == rightIntermediateCount) &&
            (identical(other.rightEndCount, rightEndCount) ||
                other.rightEndCount == rightEndCount) &&
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
            (identical(other.ledSize, ledSize) || other.ledSize == ledSize));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      leftEndCount,
      leftIntermediateCount,
      centerCount,
      rightIntermediateCount,
      rightEndCount,
      distancePerLed,
      evenCenterSimulateOdd,
      endColor,
      intermediateColor,
      centerColor,
      ledSize);

  @JsonKey(ignore: true)
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
      {final int leftEndCount,
      final int leftIntermediateCount,
      final int centerCount,
      final int rightIntermediateCount,
      final int rightEndCount,
      final double distancePerLed,
      final bool evenCenterSimulateOdd,
      final int endColor,
      final int intermediateColor,
      final int centerColor,
      final double ledSize}) = _$LedBarConfigImpl;
  const _LedBarConfig._() : super._();

  factory _LedBarConfig.fromJson(Map<String, dynamic> json) =
      _$LedBarConfigImpl.fromJson;

  @override

  /// The amount of red LEDs furthest to the left.
  int get leftEndCount;
  @override

  /// The amount of yellow LEDs to the left of the center.
  int get leftIntermediateCount;
  @override

  /// The amount of center green LEDs, odd number is prefered to have
  /// one in actual center.
  int get centerCount;
  @override // The amount of yellow LEDs to the right of the center.
  int get rightIntermediateCount;
  @override

  /// The amount of red LEDs furthest to the right.
  int get rightEndCount;
  @override

  /// The increase in cross track distance that will activate the next
  /// led.
  double get distancePerLed;
  @override

  /// If the [centerCount] is even, this will dictate whether the
  /// two center-most LEDs will light up when the cross track distance
  /// is smaller than [distancePerLed].
  bool get evenCenterSimulateOdd;
  @override

  /// The color of the outermost end LEDs, usually red.
  /// Format: 0xAARRGGBB
  int get endColor;
  @override

  /// The color of the intermediate LEDs, usually yellow.
  /// Format: 0xAARRGGBB
  int get intermediateColor;
  @override

  /// The color of the center LEDs, usually green.
  /// Format: 0xAARRGGBB
  int get centerColor;
  @override

  /// The size of the individual LEDs in their largest state (lit).
  double get ledSize;
  @override
  @JsonKey(ignore: true)
  _$$LedBarConfigImplCopyWith<_$LedBarConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
