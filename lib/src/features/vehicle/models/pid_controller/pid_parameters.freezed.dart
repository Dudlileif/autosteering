// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pid_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PidParameters _$PidParametersFromJson(Map<String, dynamic> json) {
  return _PidParameters.fromJson(json);
}

/// @nodoc
mixin _$PidParameters {
  /// Proportional gain.
  double get p => throw _privateConstructorUsedError;

  /// Integral gain.
  double get i => throw _privateConstructorUsedError;

  /// Derivative gain.
  double get d => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PidParametersCopyWith<PidParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PidParametersCopyWith<$Res> {
  factory $PidParametersCopyWith(
          PidParameters value, $Res Function(PidParameters) then) =
      _$PidParametersCopyWithImpl<$Res, PidParameters>;
  @useResult
  $Res call({double p, double i, double d});
}

/// @nodoc
class _$PidParametersCopyWithImpl<$Res, $Val extends PidParameters>
    implements $PidParametersCopyWith<$Res> {
  _$PidParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p = null,
    Object? i = null,
    Object? d = null,
  }) {
    return _then(_value.copyWith(
      p: null == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as double,
      i: null == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as double,
      d: null == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PidParametersImplCopyWith<$Res>
    implements $PidParametersCopyWith<$Res> {
  factory _$$PidParametersImplCopyWith(
          _$PidParametersImpl value, $Res Function(_$PidParametersImpl) then) =
      __$$PidParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double p, double i, double d});
}

/// @nodoc
class __$$PidParametersImplCopyWithImpl<$Res>
    extends _$PidParametersCopyWithImpl<$Res, _$PidParametersImpl>
    implements _$$PidParametersImplCopyWith<$Res> {
  __$$PidParametersImplCopyWithImpl(
      _$PidParametersImpl _value, $Res Function(_$PidParametersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? p = null,
    Object? i = null,
    Object? d = null,
  }) {
    return _then(_$PidParametersImpl(
      p: null == p
          ? _value.p
          : p // ignore: cast_nullable_to_non_nullable
              as double,
      i: null == i
          ? _value.i
          : i // ignore: cast_nullable_to_non_nullable
              as double,
      d: null == d
          ? _value.d
          : d // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PidParametersImpl implements _PidParameters {
  const _$PidParametersImpl({this.p = 20, this.i = 0.13, this.d = 0.063});

  factory _$PidParametersImpl.fromJson(Map<String, dynamic> json) =>
      _$$PidParametersImplFromJson(json);

  /// Proportional gain.
  @override
  @JsonKey()
  final double p;

  /// Integral gain.
  @override
  @JsonKey()
  final double i;

  /// Derivative gain.
  @override
  @JsonKey()
  final double d;

  @override
  String toString() {
    return 'PidParameters(p: $p, i: $i, d: $d)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PidParametersImpl &&
            (identical(other.p, p) || other.p == p) &&
            (identical(other.i, i) || other.i == i) &&
            (identical(other.d, d) || other.d == d));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, p, i, d);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PidParametersImplCopyWith<_$PidParametersImpl> get copyWith =>
      __$$PidParametersImplCopyWithImpl<_$PidParametersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PidParametersImplToJson(
      this,
    );
  }
}

abstract class _PidParameters implements PidParameters {
  const factory _PidParameters(
      {final double p, final double i, final double d}) = _$PidParametersImpl;

  factory _PidParameters.fromJson(Map<String, dynamic> json) =
      _$PidParametersImpl.fromJson;

  @override

  /// Proportional gain.
  double get p;
  @override

  /// Integral gain.
  double get i;
  @override

  /// Derivative gain.
  double get d;
  @override
  @JsonKey(ignore: true)
  _$$PidParametersImplCopyWith<_$PidParametersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
