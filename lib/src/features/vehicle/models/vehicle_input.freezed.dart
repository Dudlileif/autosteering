// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VehicleInput _$VehicleInputFromJson(Map<String, dynamic> json) {
  return _VehicleInput.fromJson(json);
}

/// @nodoc
mixin _$VehicleInput {
  /// The position of the vehicle.
  LatLng? get position => throw _privateConstructorUsedError;

  /// The velocity of the vehicle.
  double? get velocity => throw _privateConstructorUsedError;

  /// The steering angle of the vehicle.
  double? get steeringAngle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleInputCopyWith<VehicleInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleInputCopyWith<$Res> {
  factory $VehicleInputCopyWith(
          VehicleInput value, $Res Function(VehicleInput) then) =
      _$VehicleInputCopyWithImpl<$Res, VehicleInput>;
  @useResult
  $Res call({LatLng? position, double? velocity, double? steeringAngle});
}

/// @nodoc
class _$VehicleInputCopyWithImpl<$Res, $Val extends VehicleInput>
    implements $VehicleInputCopyWith<$Res> {
  _$VehicleInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = freezed,
    Object? velocity = freezed,
    Object? steeringAngle = freezed,
  }) {
    return _then(_value.copyWith(
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      velocity: freezed == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as double?,
      steeringAngle: freezed == steeringAngle
          ? _value.steeringAngle
          : steeringAngle // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VehicleInputCopyWith<$Res>
    implements $VehicleInputCopyWith<$Res> {
  factory _$$_VehicleInputCopyWith(
          _$_VehicleInput value, $Res Function(_$_VehicleInput) then) =
      __$$_VehicleInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LatLng? position, double? velocity, double? steeringAngle});
}

/// @nodoc
class __$$_VehicleInputCopyWithImpl<$Res>
    extends _$VehicleInputCopyWithImpl<$Res, _$_VehicleInput>
    implements _$$_VehicleInputCopyWith<$Res> {
  __$$_VehicleInputCopyWithImpl(
      _$_VehicleInput _value, $Res Function(_$_VehicleInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = freezed,
    Object? velocity = freezed,
    Object? steeringAngle = freezed,
  }) {
    return _then(_$_VehicleInput(
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      velocity: freezed == velocity
          ? _value.velocity
          : velocity // ignore: cast_nullable_to_non_nullable
              as double?,
      steeringAngle: freezed == steeringAngle
          ? _value.steeringAngle
          : steeringAngle // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VehicleInput implements _VehicleInput {
  const _$_VehicleInput({this.position, this.velocity, this.steeringAngle});

  factory _$_VehicleInput.fromJson(Map<String, dynamic> json) =>
      _$$_VehicleInputFromJson(json);

  /// The position of the vehicle.
  @override
  final LatLng? position;

  /// The velocity of the vehicle.
  @override
  final double? velocity;

  /// The steering angle of the vehicle.
  @override
  final double? steeringAngle;

  @override
  String toString() {
    return 'VehicleInput(position: $position, velocity: $velocity, steeringAngle: $steeringAngle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VehicleInput &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.velocity, velocity) ||
                other.velocity == velocity) &&
            (identical(other.steeringAngle, steeringAngle) ||
                other.steeringAngle == steeringAngle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, position, velocity, steeringAngle);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VehicleInputCopyWith<_$_VehicleInput> get copyWith =>
      __$$_VehicleInputCopyWithImpl<_$_VehicleInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VehicleInputToJson(
      this,
    );
  }
}

abstract class _VehicleInput implements VehicleInput {
  const factory _VehicleInput(
      {final LatLng? position,
      final double? velocity,
      final double? steeringAngle}) = _$_VehicleInput;

  factory _VehicleInput.fromJson(Map<String, dynamic> json) =
      _$_VehicleInput.fromJson;

  @override

  /// The position of the vehicle.
  LatLng? get position;
  @override

  /// The velocity of the vehicle.
  double? get velocity;
  @override

  /// The steering angle of the vehicle.
  double? get steeringAngle;
  @override
  @JsonKey(ignore: true)
  _$$_VehicleInputCopyWith<_$_VehicleInput> get copyWith =>
      throw _privateConstructorUsedError;
}
