// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamepad_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GamepadConfig _$GamepadConfigFromJson(Map<String, dynamic> json) {
  return _GamepadConfig.fromJson(json);
}

/// @nodoc
mixin _$GamepadConfig {
  /// The maximum discrete analog value. Typically 2^16-1=65535, 16 bits.
  int get analogMaxValue => throw _privateConstructorUsedError;

  /// The maximum values that increases input. Values in distance from 0.
  /// The max value is 1. Typically 0.8-0.9 can prevent jitter/drift.
  Map<GamepadAnalogInput, double> get analogDeadZoneMax =>
      throw _privateConstructorUsedError;

  /// The minimum values that are required before input
  /// is registered. Values in distance from 0.
  /// Typically 0.1-0.2 can prevent jitter/drift.
  Map<GamepadAnalogInput, double> get analogDeadZoneMin =>
      throw _privateConstructorUsedError;

  /// Serializes this GamepadConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GamepadConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GamepadConfigCopyWith<GamepadConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamepadConfigCopyWith<$Res> {
  factory $GamepadConfigCopyWith(
          GamepadConfig value, $Res Function(GamepadConfig) then) =
      _$GamepadConfigCopyWithImpl<$Res, GamepadConfig>;
  @useResult
  $Res call(
      {int analogMaxValue,
      Map<GamepadAnalogInput, double> analogDeadZoneMax,
      Map<GamepadAnalogInput, double> analogDeadZoneMin});
}

/// @nodoc
class _$GamepadConfigCopyWithImpl<$Res, $Val extends GamepadConfig>
    implements $GamepadConfigCopyWith<$Res> {
  _$GamepadConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GamepadConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analogMaxValue = null,
    Object? analogDeadZoneMax = null,
    Object? analogDeadZoneMin = null,
  }) {
    return _then(_value.copyWith(
      analogMaxValue: null == analogMaxValue
          ? _value.analogMaxValue
          : analogMaxValue // ignore: cast_nullable_to_non_nullable
              as int,
      analogDeadZoneMax: null == analogDeadZoneMax
          ? _value.analogDeadZoneMax
          : analogDeadZoneMax // ignore: cast_nullable_to_non_nullable
              as Map<GamepadAnalogInput, double>,
      analogDeadZoneMin: null == analogDeadZoneMin
          ? _value.analogDeadZoneMin
          : analogDeadZoneMin // ignore: cast_nullable_to_non_nullable
              as Map<GamepadAnalogInput, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GamepadConfigImplCopyWith<$Res>
    implements $GamepadConfigCopyWith<$Res> {
  factory _$$GamepadConfigImplCopyWith(
          _$GamepadConfigImpl value, $Res Function(_$GamepadConfigImpl) then) =
      __$$GamepadConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int analogMaxValue,
      Map<GamepadAnalogInput, double> analogDeadZoneMax,
      Map<GamepadAnalogInput, double> analogDeadZoneMin});
}

/// @nodoc
class __$$GamepadConfigImplCopyWithImpl<$Res>
    extends _$GamepadConfigCopyWithImpl<$Res, _$GamepadConfigImpl>
    implements _$$GamepadConfigImplCopyWith<$Res> {
  __$$GamepadConfigImplCopyWithImpl(
      _$GamepadConfigImpl _value, $Res Function(_$GamepadConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of GamepadConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? analogMaxValue = null,
    Object? analogDeadZoneMax = null,
    Object? analogDeadZoneMin = null,
  }) {
    return _then(_$GamepadConfigImpl(
      analogMaxValue: null == analogMaxValue
          ? _value.analogMaxValue
          : analogMaxValue // ignore: cast_nullable_to_non_nullable
              as int,
      analogDeadZoneMax: null == analogDeadZoneMax
          ? _value._analogDeadZoneMax
          : analogDeadZoneMax // ignore: cast_nullable_to_non_nullable
              as Map<GamepadAnalogInput, double>,
      analogDeadZoneMin: null == analogDeadZoneMin
          ? _value._analogDeadZoneMin
          : analogDeadZoneMin // ignore: cast_nullable_to_non_nullable
              as Map<GamepadAnalogInput, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GamepadConfigImpl extends _GamepadConfig {
  const _$GamepadConfigImpl(
      {this.analogMaxValue = 65535,
      final Map<GamepadAnalogInput, double> analogDeadZoneMax = const {},
      final Map<GamepadAnalogInput, double> analogDeadZoneMin = const {}})
      : _analogDeadZoneMax = analogDeadZoneMax,
        _analogDeadZoneMin = analogDeadZoneMin,
        super._();

  factory _$GamepadConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$GamepadConfigImplFromJson(json);

  /// The maximum discrete analog value. Typically 2^16-1=65535, 16 bits.
  @override
  @JsonKey()
  final int analogMaxValue;

  /// The maximum values that increases input. Values in distance from 0.
  /// The max value is 1. Typically 0.8-0.9 can prevent jitter/drift.
  final Map<GamepadAnalogInput, double> _analogDeadZoneMax;

  /// The maximum values that increases input. Values in distance from 0.
  /// The max value is 1. Typically 0.8-0.9 can prevent jitter/drift.
  @override
  @JsonKey()
  Map<GamepadAnalogInput, double> get analogDeadZoneMax {
    if (_analogDeadZoneMax is EqualUnmodifiableMapView)
      return _analogDeadZoneMax;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_analogDeadZoneMax);
  }

  /// The minimum values that are required before input
  /// is registered. Values in distance from 0.
  /// Typically 0.1-0.2 can prevent jitter/drift.
  final Map<GamepadAnalogInput, double> _analogDeadZoneMin;

  /// The minimum values that are required before input
  /// is registered. Values in distance from 0.
  /// Typically 0.1-0.2 can prevent jitter/drift.
  @override
  @JsonKey()
  Map<GamepadAnalogInput, double> get analogDeadZoneMin {
    if (_analogDeadZoneMin is EqualUnmodifiableMapView)
      return _analogDeadZoneMin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_analogDeadZoneMin);
  }

  @override
  String toString() {
    return 'GamepadConfig(analogMaxValue: $analogMaxValue, analogDeadZoneMax: $analogDeadZoneMax, analogDeadZoneMin: $analogDeadZoneMin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GamepadConfigImpl &&
            (identical(other.analogMaxValue, analogMaxValue) ||
                other.analogMaxValue == analogMaxValue) &&
            const DeepCollectionEquality()
                .equals(other._analogDeadZoneMax, _analogDeadZoneMax) &&
            const DeepCollectionEquality()
                .equals(other._analogDeadZoneMin, _analogDeadZoneMin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      analogMaxValue,
      const DeepCollectionEquality().hash(_analogDeadZoneMax),
      const DeepCollectionEquality().hash(_analogDeadZoneMin));

  /// Create a copy of GamepadConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GamepadConfigImplCopyWith<_$GamepadConfigImpl> get copyWith =>
      __$$GamepadConfigImplCopyWithImpl<_$GamepadConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GamepadConfigImplToJson(
      this,
    );
  }
}

abstract class _GamepadConfig extends GamepadConfig {
  const factory _GamepadConfig(
          {final int analogMaxValue,
          final Map<GamepadAnalogInput, double> analogDeadZoneMax,
          final Map<GamepadAnalogInput, double> analogDeadZoneMin}) =
      _$GamepadConfigImpl;
  const _GamepadConfig._() : super._();

  factory _GamepadConfig.fromJson(Map<String, dynamic> json) =
      _$GamepadConfigImpl.fromJson;

  /// The maximum discrete analog value. Typically 2^16-1=65535, 16 bits.
  @override
  int get analogMaxValue;

  /// The maximum values that increases input. Values in distance from 0.
  /// The max value is 1. Typically 0.8-0.9 can prevent jitter/drift.
  @override
  Map<GamepadAnalogInput, double> get analogDeadZoneMax;

  /// The minimum values that are required before input
  /// is registered. Values in distance from 0.
  /// Typically 0.1-0.2 can prevent jitter/drift.
  @override
  Map<GamepadAnalogInput, double> get analogDeadZoneMin;

  /// Create a copy of GamepadConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GamepadConfigImplCopyWith<_$GamepadConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
