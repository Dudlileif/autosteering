// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stanley_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StanleyParameters _$StanleyParametersFromJson(Map<String, dynamic> json) {
  return _StanleyParameters.fromJson(json);
}

/// @nodoc
mixin _$StanleyParameters {
  /// Proportional cross distance gain coefficient.
  double get crossDistanceGain => throw _privateConstructorUsedError;

  /// The coefficient to ensure numerical stability when velocity is close to
  /// zero.
  double get softeningGain => throw _privateConstructorUsedError;

  /// Proportional coefficient for how much the velocity should alter the
  /// steering angle.
  double get velocityGain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StanleyParametersCopyWith<StanleyParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StanleyParametersCopyWith<$Res> {
  factory $StanleyParametersCopyWith(
          StanleyParameters value, $Res Function(StanleyParameters) then) =
      _$StanleyParametersCopyWithImpl<$Res, StanleyParameters>;
  @useResult
  $Res call(
      {double crossDistanceGain, double softeningGain, double velocityGain});
}

/// @nodoc
class _$StanleyParametersCopyWithImpl<$Res, $Val extends StanleyParameters>
    implements $StanleyParametersCopyWith<$Res> {
  _$StanleyParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crossDistanceGain = null,
    Object? softeningGain = null,
    Object? velocityGain = null,
  }) {
    return _then(_value.copyWith(
      crossDistanceGain: null == crossDistanceGain
          ? _value.crossDistanceGain
          : crossDistanceGain // ignore: cast_nullable_to_non_nullable
              as double,
      softeningGain: null == softeningGain
          ? _value.softeningGain
          : softeningGain // ignore: cast_nullable_to_non_nullable
              as double,
      velocityGain: null == velocityGain
          ? _value.velocityGain
          : velocityGain // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StanleyParametersImplCopyWith<$Res>
    implements $StanleyParametersCopyWith<$Res> {
  factory _$$StanleyParametersImplCopyWith(_$StanleyParametersImpl value,
          $Res Function(_$StanleyParametersImpl) then) =
      __$$StanleyParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double crossDistanceGain, double softeningGain, double velocityGain});
}

/// @nodoc
class __$$StanleyParametersImplCopyWithImpl<$Res>
    extends _$StanleyParametersCopyWithImpl<$Res, _$StanleyParametersImpl>
    implements _$$StanleyParametersImplCopyWith<$Res> {
  __$$StanleyParametersImplCopyWithImpl(_$StanleyParametersImpl _value,
      $Res Function(_$StanleyParametersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crossDistanceGain = null,
    Object? softeningGain = null,
    Object? velocityGain = null,
  }) {
    return _then(_$StanleyParametersImpl(
      crossDistanceGain: null == crossDistanceGain
          ? _value.crossDistanceGain
          : crossDistanceGain // ignore: cast_nullable_to_non_nullable
              as double,
      softeningGain: null == softeningGain
          ? _value.softeningGain
          : softeningGain // ignore: cast_nullable_to_non_nullable
              as double,
      velocityGain: null == velocityGain
          ? _value.velocityGain
          : velocityGain // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StanleyParametersImpl implements _StanleyParameters {
  const _$StanleyParametersImpl(
      {this.crossDistanceGain = 1.5,
      this.softeningGain = 1e-5,
      this.velocityGain = 1.3});

  factory _$StanleyParametersImpl.fromJson(Map<String, dynamic> json) =>
      _$$StanleyParametersImplFromJson(json);

  /// Proportional cross distance gain coefficient.
  @override
  @JsonKey()
  final double crossDistanceGain;

  /// The coefficient to ensure numerical stability when velocity is close to
  /// zero.
  @override
  @JsonKey()
  final double softeningGain;

  /// Proportional coefficient for how much the velocity should alter the
  /// steering angle.
  @override
  @JsonKey()
  final double velocityGain;

  @override
  String toString() {
    return 'StanleyParameters(crossDistanceGain: $crossDistanceGain, softeningGain: $softeningGain, velocityGain: $velocityGain)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StanleyParametersImpl &&
            (identical(other.crossDistanceGain, crossDistanceGain) ||
                other.crossDistanceGain == crossDistanceGain) &&
            (identical(other.softeningGain, softeningGain) ||
                other.softeningGain == softeningGain) &&
            (identical(other.velocityGain, velocityGain) ||
                other.velocityGain == velocityGain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, crossDistanceGain, softeningGain, velocityGain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StanleyParametersImplCopyWith<_$StanleyParametersImpl> get copyWith =>
      __$$StanleyParametersImplCopyWithImpl<_$StanleyParametersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StanleyParametersImplToJson(
      this,
    );
  }
}

abstract class _StanleyParameters implements StanleyParameters {
  const factory _StanleyParameters(
      {final double crossDistanceGain,
      final double softeningGain,
      final double velocityGain}) = _$StanleyParametersImpl;

  factory _StanleyParameters.fromJson(Map<String, dynamic> json) =
      _$StanleyParametersImpl.fromJson;

  @override

  /// Proportional cross distance gain coefficient.
  double get crossDistanceGain;
  @override

  /// The coefficient to ensure numerical stability when velocity is close to
  /// zero.
  double get softeningGain;
  @override

  /// Proportional coefficient for how much the velocity should alter the
  /// steering angle.
  double get velocityGain;
  @override
  @JsonKey(ignore: true)
  _$$StanleyParametersImplCopyWith<_$StanleyParametersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
