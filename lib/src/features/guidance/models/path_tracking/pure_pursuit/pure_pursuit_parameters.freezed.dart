// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pure_pursuit_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurePursuitParameters _$PurePursuitParametersFromJson(
    Map<String, dynamic> json) {
  return _PurePursuitParameters.fromJson(json);
}

/// @nodoc
mixin _$PurePursuitParameters {
  /// The minimum value for the look ahead distance,
  /// having this set increases the stability at low speeds.
  double get lookAheadMinDistance => throw _privateConstructorUsedError;

  /// How many seconds ahead we should multiply the
  /// vehicle's velocity with to get the look ahead distance.
  /// If the distance is shorter that [lookAheadMinDistance] it will be
  /// set to that.
  double get lookAheadSeconds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurePursuitParametersCopyWith<PurePursuitParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurePursuitParametersCopyWith<$Res> {
  factory $PurePursuitParametersCopyWith(PurePursuitParameters value,
          $Res Function(PurePursuitParameters) then) =
      _$PurePursuitParametersCopyWithImpl<$Res, PurePursuitParameters>;
  @useResult
  $Res call({double lookAheadMinDistance, double lookAheadSeconds});
}

/// @nodoc
class _$PurePursuitParametersCopyWithImpl<$Res,
        $Val extends PurePursuitParameters>
    implements $PurePursuitParametersCopyWith<$Res> {
  _$PurePursuitParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookAheadMinDistance = null,
    Object? lookAheadSeconds = null,
  }) {
    return _then(_value.copyWith(
      lookAheadMinDistance: null == lookAheadMinDistance
          ? _value.lookAheadMinDistance
          : lookAheadMinDistance // ignore: cast_nullable_to_non_nullable
              as double,
      lookAheadSeconds: null == lookAheadSeconds
          ? _value.lookAheadSeconds
          : lookAheadSeconds // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurePursuitParametersImplCopyWith<$Res>
    implements $PurePursuitParametersCopyWith<$Res> {
  factory _$$PurePursuitParametersImplCopyWith(
          _$PurePursuitParametersImpl value,
          $Res Function(_$PurePursuitParametersImpl) then) =
      __$$PurePursuitParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lookAheadMinDistance, double lookAheadSeconds});
}

/// @nodoc
class __$$PurePursuitParametersImplCopyWithImpl<$Res>
    extends _$PurePursuitParametersCopyWithImpl<$Res,
        _$PurePursuitParametersImpl>
    implements _$$PurePursuitParametersImplCopyWith<$Res> {
  __$$PurePursuitParametersImplCopyWithImpl(_$PurePursuitParametersImpl _value,
      $Res Function(_$PurePursuitParametersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lookAheadMinDistance = null,
    Object? lookAheadSeconds = null,
  }) {
    return _then(_$PurePursuitParametersImpl(
      lookAheadMinDistance: null == lookAheadMinDistance
          ? _value.lookAheadMinDistance
          : lookAheadMinDistance // ignore: cast_nullable_to_non_nullable
              as double,
      lookAheadSeconds: null == lookAheadSeconds
          ? _value.lookAheadSeconds
          : lookAheadSeconds // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurePursuitParametersImpl implements _PurePursuitParameters {
  const _$PurePursuitParametersImpl(
      {this.lookAheadMinDistance = 0.75, this.lookAheadSeconds = 1});

  factory _$PurePursuitParametersImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurePursuitParametersImplFromJson(json);

  /// The minimum value for the look ahead distance,
  /// having this set increases the stability at low speeds.
  @override
  @JsonKey()
  final double lookAheadMinDistance;

  /// How many seconds ahead we should multiply the
  /// vehicle's velocity with to get the look ahead distance.
  /// If the distance is shorter that [lookAheadMinDistance] it will be
  /// set to that.
  @override
  @JsonKey()
  final double lookAheadSeconds;

  @override
  String toString() {
    return 'PurePursuitParameters(lookAheadMinDistance: $lookAheadMinDistance, lookAheadSeconds: $lookAheadSeconds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurePursuitParametersImpl &&
            (identical(other.lookAheadMinDistance, lookAheadMinDistance) ||
                other.lookAheadMinDistance == lookAheadMinDistance) &&
            (identical(other.lookAheadSeconds, lookAheadSeconds) ||
                other.lookAheadSeconds == lookAheadSeconds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lookAheadMinDistance, lookAheadSeconds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PurePursuitParametersImplCopyWith<_$PurePursuitParametersImpl>
      get copyWith => __$$PurePursuitParametersImplCopyWithImpl<
          _$PurePursuitParametersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurePursuitParametersImplToJson(
      this,
    );
  }
}

abstract class _PurePursuitParameters implements PurePursuitParameters {
  const factory _PurePursuitParameters(
      {final double lookAheadMinDistance,
      final double lookAheadSeconds}) = _$PurePursuitParametersImpl;

  factory _PurePursuitParameters.fromJson(Map<String, dynamic> json) =
      _$PurePursuitParametersImpl.fromJson;

  @override

  /// The minimum value for the look ahead distance,
  /// having this set increases the stability at low speeds.
  double get lookAheadMinDistance;
  @override

  /// How many seconds ahead we should multiply the
  /// vehicle's velocity with to get the look ahead distance.
  /// If the distance is shorter that [lookAheadMinDistance] it will be
  /// set to that.
  double get lookAheadSeconds;
  @override
  @JsonKey(ignore: true)
  _$$PurePursuitParametersImplCopyWith<_$PurePursuitParametersImpl>
      get copyWith => throw _privateConstructorUsedError;
}
