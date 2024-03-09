// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'motor_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MotorConfig _$MotorConfigFromJson(Map<String, dynamic> json) {
  return _MotorConfig.fromJson(json);
}

/// @nodoc
mixin _$MotorConfig {
  bool get invertOutput => throw _privateConstructorUsedError;
  int get maxRPM => throw _privateConstructorUsedError;
  double get thresholdVelocity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MotorConfigCopyWith<MotorConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotorConfigCopyWith<$Res> {
  factory $MotorConfigCopyWith(
          MotorConfig value, $Res Function(MotorConfig) then) =
      _$MotorConfigCopyWithImpl<$Res, MotorConfig>;
  @useResult
  $Res call({bool invertOutput, int maxRPM, double thresholdVelocity});
}

/// @nodoc
class _$MotorConfigCopyWithImpl<$Res, $Val extends MotorConfig>
    implements $MotorConfigCopyWith<$Res> {
  _$MotorConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invertOutput = null,
    Object? maxRPM = null,
    Object? thresholdVelocity = null,
  }) {
    return _then(_value.copyWith(
      invertOutput: null == invertOutput
          ? _value.invertOutput
          : invertOutput // ignore: cast_nullable_to_non_nullable
              as bool,
      maxRPM: null == maxRPM
          ? _value.maxRPM
          : maxRPM // ignore: cast_nullable_to_non_nullable
              as int,
      thresholdVelocity: null == thresholdVelocity
          ? _value.thresholdVelocity
          : thresholdVelocity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MotorConfigImplCopyWith<$Res>
    implements $MotorConfigCopyWith<$Res> {
  factory _$$MotorConfigImplCopyWith(
          _$MotorConfigImpl value, $Res Function(_$MotorConfigImpl) then) =
      __$$MotorConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool invertOutput, int maxRPM, double thresholdVelocity});
}

/// @nodoc
class __$$MotorConfigImplCopyWithImpl<$Res>
    extends _$MotorConfigCopyWithImpl<$Res, _$MotorConfigImpl>
    implements _$$MotorConfigImplCopyWith<$Res> {
  __$$MotorConfigImplCopyWithImpl(
      _$MotorConfigImpl _value, $Res Function(_$MotorConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invertOutput = null,
    Object? maxRPM = null,
    Object? thresholdVelocity = null,
  }) {
    return _then(_$MotorConfigImpl(
      invertOutput: null == invertOutput
          ? _value.invertOutput
          : invertOutput // ignore: cast_nullable_to_non_nullable
              as bool,
      maxRPM: null == maxRPM
          ? _value.maxRPM
          : maxRPM // ignore: cast_nullable_to_non_nullable
              as int,
      thresholdVelocity: null == thresholdVelocity
          ? _value.thresholdVelocity
          : thresholdVelocity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MotorConfigImpl implements _MotorConfig {
  const _$MotorConfigImpl(
      {this.invertOutput = false,
      this.maxRPM = 200,
      this.thresholdVelocity = 0.05});

  factory _$MotorConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotorConfigImplFromJson(json);

  @override
  @JsonKey()
  final bool invertOutput;
  @override
  @JsonKey()
  final int maxRPM;
  @override
  @JsonKey()
  final double thresholdVelocity;

  @override
  String toString() {
    return 'MotorConfig(invertOutput: $invertOutput, maxRPM: $maxRPM, thresholdVelocity: $thresholdVelocity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotorConfigImpl &&
            (identical(other.invertOutput, invertOutput) ||
                other.invertOutput == invertOutput) &&
            (identical(other.maxRPM, maxRPM) || other.maxRPM == maxRPM) &&
            (identical(other.thresholdVelocity, thresholdVelocity) ||
                other.thresholdVelocity == thresholdVelocity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, invertOutput, maxRPM, thresholdVelocity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MotorConfigImplCopyWith<_$MotorConfigImpl> get copyWith =>
      __$$MotorConfigImplCopyWithImpl<_$MotorConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotorConfigImplToJson(
      this,
    );
  }
}

abstract class _MotorConfig implements MotorConfig {
  const factory _MotorConfig(
      {final bool invertOutput,
      final int maxRPM,
      final double thresholdVelocity}) = _$MotorConfigImpl;

  factory _MotorConfig.fromJson(Map<String, dynamic> json) =
      _$MotorConfigImpl.fromJson;

  @override
  bool get invertOutput;
  @override
  int get maxRPM;
  @override
  double get thresholdVelocity;
  @override
  @JsonKey(ignore: true)
  _$$MotorConfigImplCopyWith<_$MotorConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
