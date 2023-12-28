// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'was_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WasConfig _$WasConfigFromJson(Map<String, dynamic> json) {
  return _WasConfig.fromJson(json);
}

/// @nodoc
mixin _$WasConfig {
  bool get useWas => throw _privateConstructorUsedError;
  bool get invertInput => throw _privateConstructorUsedError;
  bool get invertMotorOutput => throw _privateConstructorUsedError;
  int get bits => throw _privateConstructorUsedError;
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  int get center => throw _privateConstructorUsedError;
  int get maxMotorRPM => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WasConfigCopyWith<WasConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasConfigCopyWith<$Res> {
  factory $WasConfigCopyWith(WasConfig value, $Res Function(WasConfig) then) =
      _$WasConfigCopyWithImpl<$Res, WasConfig>;
  @useResult
  $Res call(
      {bool useWas,
      bool invertInput,
      bool invertMotorOutput,
      int bits,
      int min,
      int max,
      int center,
      int maxMotorRPM});
}

/// @nodoc
class _$WasConfigCopyWithImpl<$Res, $Val extends WasConfig>
    implements $WasConfigCopyWith<$Res> {
  _$WasConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useWas = null,
    Object? invertInput = null,
    Object? invertMotorOutput = null,
    Object? bits = null,
    Object? min = null,
    Object? max = null,
    Object? center = null,
    Object? maxMotorRPM = null,
  }) {
    return _then(_value.copyWith(
      useWas: null == useWas
          ? _value.useWas
          : useWas // ignore: cast_nullable_to_non_nullable
              as bool,
      invertInput: null == invertInput
          ? _value.invertInput
          : invertInput // ignore: cast_nullable_to_non_nullable
              as bool,
      invertMotorOutput: null == invertMotorOutput
          ? _value.invertMotorOutput
          : invertMotorOutput // ignore: cast_nullable_to_non_nullable
              as bool,
      bits: null == bits
          ? _value.bits
          : bits // ignore: cast_nullable_to_non_nullable
              as int,
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      center: null == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as int,
      maxMotorRPM: null == maxMotorRPM
          ? _value.maxMotorRPM
          : maxMotorRPM // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WasConfigImplCopyWith<$Res>
    implements $WasConfigCopyWith<$Res> {
  factory _$$WasConfigImplCopyWith(
          _$WasConfigImpl value, $Res Function(_$WasConfigImpl) then) =
      __$$WasConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool useWas,
      bool invertInput,
      bool invertMotorOutput,
      int bits,
      int min,
      int max,
      int center,
      int maxMotorRPM});
}

/// @nodoc
class __$$WasConfigImplCopyWithImpl<$Res>
    extends _$WasConfigCopyWithImpl<$Res, _$WasConfigImpl>
    implements _$$WasConfigImplCopyWith<$Res> {
  __$$WasConfigImplCopyWithImpl(
      _$WasConfigImpl _value, $Res Function(_$WasConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useWas = null,
    Object? invertInput = null,
    Object? invertMotorOutput = null,
    Object? bits = null,
    Object? min = null,
    Object? max = null,
    Object? center = null,
    Object? maxMotorRPM = null,
  }) {
    return _then(_$WasConfigImpl(
      useWas: null == useWas
          ? _value.useWas
          : useWas // ignore: cast_nullable_to_non_nullable
              as bool,
      invertInput: null == invertInput
          ? _value.invertInput
          : invertInput // ignore: cast_nullable_to_non_nullable
              as bool,
      invertMotorOutput: null == invertMotorOutput
          ? _value.invertMotorOutput
          : invertMotorOutput // ignore: cast_nullable_to_non_nullable
              as bool,
      bits: null == bits
          ? _value.bits
          : bits // ignore: cast_nullable_to_non_nullable
              as int,
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: null == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int,
      center: null == center
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as int,
      maxMotorRPM: null == maxMotorRPM
          ? _value.maxMotorRPM
          : maxMotorRPM // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasConfigImpl implements _WasConfig {
  const _$WasConfigImpl(
      {this.useWas = true,
      this.invertInput = false,
      this.invertMotorOutput = false,
      this.bits = 12,
      this.min = 0,
      this.max = 4095,
      this.center = 2047,
      this.maxMotorRPM = 250});

  factory _$WasConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool useWas;
  @override
  @JsonKey()
  final bool invertInput;
  @override
  @JsonKey()
  final bool invertMotorOutput;
  @override
  @JsonKey()
  final int bits;
  @override
  @JsonKey()
  final int min;
  @override
  @JsonKey()
  final int max;
  @override
  @JsonKey()
  final int center;
  @override
  @JsonKey()
  final int maxMotorRPM;

  @override
  String toString() {
    return 'WasConfig(useWas: $useWas, invertInput: $invertInput, invertMotorOutput: $invertMotorOutput, bits: $bits, min: $min, max: $max, center: $center, maxMotorRPM: $maxMotorRPM)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WasConfigImpl &&
            (identical(other.useWas, useWas) || other.useWas == useWas) &&
            (identical(other.invertInput, invertInput) ||
                other.invertInput == invertInput) &&
            (identical(other.invertMotorOutput, invertMotorOutput) ||
                other.invertMotorOutput == invertMotorOutput) &&
            (identical(other.bits, bits) || other.bits == bits) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.center, center) || other.center == center) &&
            (identical(other.maxMotorRPM, maxMotorRPM) ||
                other.maxMotorRPM == maxMotorRPM));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, useWas, invertInput,
      invertMotorOutput, bits, min, max, center, maxMotorRPM);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WasConfigImplCopyWith<_$WasConfigImpl> get copyWith =>
      __$$WasConfigImplCopyWithImpl<_$WasConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WasConfigImplToJson(
      this,
    );
  }
}

abstract class _WasConfig implements WasConfig {
  const factory _WasConfig(
      {final bool useWas,
      final bool invertInput,
      final bool invertMotorOutput,
      final int bits,
      final int min,
      final int max,
      final int center,
      final int maxMotorRPM}) = _$WasConfigImpl;

  factory _WasConfig.fromJson(Map<String, dynamic> json) =
      _$WasConfigImpl.fromJson;

  @override
  bool get useWas;
  @override
  bool get invertInput;
  @override
  bool get invertMotorOutput;
  @override
  int get bits;
  @override
  int get min;
  @override
  int get max;
  @override
  int get center;
  @override
  int get maxMotorRPM;
  @override
  @JsonKey(ignore: true)
  _$$WasConfigImplCopyWith<_$WasConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
