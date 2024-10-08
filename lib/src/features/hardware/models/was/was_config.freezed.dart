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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WasConfig _$WasConfigFromJson(Map<String, dynamic> json) {
  return _WasConfig.fromJson(json);
}

/// @nodoc
mixin _$WasConfig {
  bool get useWas => throw _privateConstructorUsedError;
  bool get invertInput => throw _privateConstructorUsedError;
  int get bits => throw _privateConstructorUsedError;

  /// Serializes this WasConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WasConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WasConfigCopyWith<WasConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WasConfigCopyWith<$Res> {
  factory $WasConfigCopyWith(WasConfig value, $Res Function(WasConfig) then) =
      _$WasConfigCopyWithImpl<$Res, WasConfig>;
  @useResult
  $Res call({bool useWas, bool invertInput, int bits});
}

/// @nodoc
class _$WasConfigCopyWithImpl<$Res, $Val extends WasConfig>
    implements $WasConfigCopyWith<$Res> {
  _$WasConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WasConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useWas = null,
    Object? invertInput = null,
    Object? bits = null,
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
      bits: null == bits
          ? _value.bits
          : bits // ignore: cast_nullable_to_non_nullable
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
  $Res call({bool useWas, bool invertInput, int bits});
}

/// @nodoc
class __$$WasConfigImplCopyWithImpl<$Res>
    extends _$WasConfigCopyWithImpl<$Res, _$WasConfigImpl>
    implements _$$WasConfigImplCopyWith<$Res> {
  __$$WasConfigImplCopyWithImpl(
      _$WasConfigImpl _value, $Res Function(_$WasConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of WasConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useWas = null,
    Object? invertInput = null,
    Object? bits = null,
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
      bits: null == bits
          ? _value.bits
          : bits // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WasConfigImpl implements _WasConfig {
  const _$WasConfigImpl(
      {this.useWas = true, this.invertInput = false, this.bits = 12});

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
  final int bits;

  @override
  String toString() {
    return 'WasConfig(useWas: $useWas, invertInput: $invertInput, bits: $bits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WasConfigImpl &&
            (identical(other.useWas, useWas) || other.useWas == useWas) &&
            (identical(other.invertInput, invertInput) ||
                other.invertInput == invertInput) &&
            (identical(other.bits, bits) || other.bits == bits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, useWas, invertInput, bits);

  /// Create a copy of WasConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      final int bits}) = _$WasConfigImpl;

  factory _WasConfig.fromJson(Map<String, dynamic> json) =
      _$WasConfigImpl.fromJson;

  @override
  bool get useWas;
  @override
  bool get invertInput;
  @override
  int get bits;

  /// Create a copy of WasConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WasConfigImplCopyWith<_$WasConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
