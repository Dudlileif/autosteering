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
  bool get invertInput => throw _privateConstructorUsedError;
  int get bits => throw _privateConstructorUsedError;
  int get min => throw _privateConstructorUsedError;
  int get max => throw _privateConstructorUsedError;
  int get center => throw _privateConstructorUsedError;

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
  $Res call({bool invertInput, int bits, int min, int max, int center});
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
    Object? invertInput = null,
    Object? bits = null,
    Object? min = null,
    Object? max = null,
    Object? center = null,
  }) {
    return _then(_value.copyWith(
      invertInput: null == invertInput
          ? _value.invertInput
          : invertInput // ignore: cast_nullable_to_non_nullable
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
  $Res call({bool invertInput, int bits, int min, int max, int center});
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
    Object? invertInput = null,
    Object? bits = null,
    Object? min = null,
    Object? max = null,
    Object? center = null,
  }) {
    return _then(_$WasConfigImpl(
      invertInput: null == invertInput
          ? _value.invertInput
          : invertInput // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasConfigImpl implements _WasConfig {
  const _$WasConfigImpl(
      {this.invertInput = false,
      this.bits = 12,
      this.min = 0,
      this.max = 4095,
      this.center = 2047});

  factory _$WasConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool invertInput;
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
  String toString() {
    return 'WasConfig(invertInput: $invertInput, bits: $bits, min: $min, max: $max, center: $center)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WasConfigImpl &&
            (identical(other.invertInput, invertInput) ||
                other.invertInput == invertInput) &&
            (identical(other.bits, bits) || other.bits == bits) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max) &&
            (identical(other.center, center) || other.center == center));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, invertInput, bits, min, max, center);

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
      {final bool invertInput,
      final int bits,
      final int min,
      final int max,
      final int center}) = _$WasConfigImpl;

  factory _WasConfig.fromJson(Map<String, dynamic> json) =
      _$WasConfigImpl.fromJson;

  @override
  bool get invertInput;
  @override
  int get bits;
  @override
  int get min;
  @override
  int get max;
  @override
  int get center;
  @override
  @JsonKey(ignore: true)
  _$$WasConfigImplCopyWith<_$WasConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
