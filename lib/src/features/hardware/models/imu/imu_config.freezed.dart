// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'imu_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ImuConfig _$ImuConfigFromJson(Map<String, dynamic> json) {
  return _ImuConfig.fromJson(json);
}

/// @nodoc
mixin _$ImuConfig {
  /// Whether the vehicle should take into account pitch and roll when
  /// representing its position.
  bool get usePitchAndRoll => throw _privateConstructorUsedError;

  /// Whether the pich and roll axes should be swapped.
  bool get swapPitchAndRoll => throw _privateConstructorUsedError;

  /// The zero values for the different axes of the IMU.
  ImuZeroValues get zeroValues => throw _privateConstructorUsedError;

  /// Whether the vehicle's bearing should be the one from the IMU.
  bool get useYaw => throw _privateConstructorUsedError;

  /// Whether the bearing axis should be inverted.
  bool get invertYaw => throw _privateConstructorUsedError;

  /// Whether the pitch axis should be inverted.
  bool get invertPitch => throw _privateConstructorUsedError;

  /// Whether the roll axis should be inverted.
  bool get invertRoll => throw _privateConstructorUsedError;

  /// A multiplier for how much the pitch reading should be amplified/reduced.
  double get pitchGain => throw _privateConstructorUsedError;

  /// A multiplier for how much the pitch reading should be amplified/reduced.
  double get rollGain => throw _privateConstructorUsedError;

  /// How many milliseconds we should delay the readings to match the GNSS fix
  /// time.
  int get delayReadings => throw _privateConstructorUsedError;

  /// Whether to only use readings that are synced with a GNSS reading.
  bool get useOnlyGnssSyncedReadings => throw _privateConstructorUsedError;

  /// Serializes this ImuConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImuConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImuConfigCopyWith<ImuConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImuConfigCopyWith<$Res> {
  factory $ImuConfigCopyWith(ImuConfig value, $Res Function(ImuConfig) then) =
      _$ImuConfigCopyWithImpl<$Res, ImuConfig>;
  @useResult
  $Res call(
      {bool usePitchAndRoll,
      bool swapPitchAndRoll,
      ImuZeroValues zeroValues,
      bool useYaw,
      bool invertYaw,
      bool invertPitch,
      bool invertRoll,
      double pitchGain,
      double rollGain,
      int delayReadings,
      bool useOnlyGnssSyncedReadings});

  $ImuZeroValuesCopyWith<$Res> get zeroValues;
}

/// @nodoc
class _$ImuConfigCopyWithImpl<$Res, $Val extends ImuConfig>
    implements $ImuConfigCopyWith<$Res> {
  _$ImuConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImuConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usePitchAndRoll = null,
    Object? swapPitchAndRoll = null,
    Object? zeroValues = null,
    Object? useYaw = null,
    Object? invertYaw = null,
    Object? invertPitch = null,
    Object? invertRoll = null,
    Object? pitchGain = null,
    Object? rollGain = null,
    Object? delayReadings = null,
    Object? useOnlyGnssSyncedReadings = null,
  }) {
    return _then(_value.copyWith(
      usePitchAndRoll: null == usePitchAndRoll
          ? _value.usePitchAndRoll
          : usePitchAndRoll // ignore: cast_nullable_to_non_nullable
              as bool,
      swapPitchAndRoll: null == swapPitchAndRoll
          ? _value.swapPitchAndRoll
          : swapPitchAndRoll // ignore: cast_nullable_to_non_nullable
              as bool,
      zeroValues: null == zeroValues
          ? _value.zeroValues
          : zeroValues // ignore: cast_nullable_to_non_nullable
              as ImuZeroValues,
      useYaw: null == useYaw
          ? _value.useYaw
          : useYaw // ignore: cast_nullable_to_non_nullable
              as bool,
      invertYaw: null == invertYaw
          ? _value.invertYaw
          : invertYaw // ignore: cast_nullable_to_non_nullable
              as bool,
      invertPitch: null == invertPitch
          ? _value.invertPitch
          : invertPitch // ignore: cast_nullable_to_non_nullable
              as bool,
      invertRoll: null == invertRoll
          ? _value.invertRoll
          : invertRoll // ignore: cast_nullable_to_non_nullable
              as bool,
      pitchGain: null == pitchGain
          ? _value.pitchGain
          : pitchGain // ignore: cast_nullable_to_non_nullable
              as double,
      rollGain: null == rollGain
          ? _value.rollGain
          : rollGain // ignore: cast_nullable_to_non_nullable
              as double,
      delayReadings: null == delayReadings
          ? _value.delayReadings
          : delayReadings // ignore: cast_nullable_to_non_nullable
              as int,
      useOnlyGnssSyncedReadings: null == useOnlyGnssSyncedReadings
          ? _value.useOnlyGnssSyncedReadings
          : useOnlyGnssSyncedReadings // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of ImuConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ImuZeroValuesCopyWith<$Res> get zeroValues {
    return $ImuZeroValuesCopyWith<$Res>(_value.zeroValues, (value) {
      return _then(_value.copyWith(zeroValues: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImuConfigImplCopyWith<$Res>
    implements $ImuConfigCopyWith<$Res> {
  factory _$$ImuConfigImplCopyWith(
          _$ImuConfigImpl value, $Res Function(_$ImuConfigImpl) then) =
      __$$ImuConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool usePitchAndRoll,
      bool swapPitchAndRoll,
      ImuZeroValues zeroValues,
      bool useYaw,
      bool invertYaw,
      bool invertPitch,
      bool invertRoll,
      double pitchGain,
      double rollGain,
      int delayReadings,
      bool useOnlyGnssSyncedReadings});

  @override
  $ImuZeroValuesCopyWith<$Res> get zeroValues;
}

/// @nodoc
class __$$ImuConfigImplCopyWithImpl<$Res>
    extends _$ImuConfigCopyWithImpl<$Res, _$ImuConfigImpl>
    implements _$$ImuConfigImplCopyWith<$Res> {
  __$$ImuConfigImplCopyWithImpl(
      _$ImuConfigImpl _value, $Res Function(_$ImuConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ImuConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usePitchAndRoll = null,
    Object? swapPitchAndRoll = null,
    Object? zeroValues = null,
    Object? useYaw = null,
    Object? invertYaw = null,
    Object? invertPitch = null,
    Object? invertRoll = null,
    Object? pitchGain = null,
    Object? rollGain = null,
    Object? delayReadings = null,
    Object? useOnlyGnssSyncedReadings = null,
  }) {
    return _then(_$ImuConfigImpl(
      usePitchAndRoll: null == usePitchAndRoll
          ? _value.usePitchAndRoll
          : usePitchAndRoll // ignore: cast_nullable_to_non_nullable
              as bool,
      swapPitchAndRoll: null == swapPitchAndRoll
          ? _value.swapPitchAndRoll
          : swapPitchAndRoll // ignore: cast_nullable_to_non_nullable
              as bool,
      zeroValues: null == zeroValues
          ? _value.zeroValues
          : zeroValues // ignore: cast_nullable_to_non_nullable
              as ImuZeroValues,
      useYaw: null == useYaw
          ? _value.useYaw
          : useYaw // ignore: cast_nullable_to_non_nullable
              as bool,
      invertYaw: null == invertYaw
          ? _value.invertYaw
          : invertYaw // ignore: cast_nullable_to_non_nullable
              as bool,
      invertPitch: null == invertPitch
          ? _value.invertPitch
          : invertPitch // ignore: cast_nullable_to_non_nullable
              as bool,
      invertRoll: null == invertRoll
          ? _value.invertRoll
          : invertRoll // ignore: cast_nullable_to_non_nullable
              as bool,
      pitchGain: null == pitchGain
          ? _value.pitchGain
          : pitchGain // ignore: cast_nullable_to_non_nullable
              as double,
      rollGain: null == rollGain
          ? _value.rollGain
          : rollGain // ignore: cast_nullable_to_non_nullable
              as double,
      delayReadings: null == delayReadings
          ? _value.delayReadings
          : delayReadings // ignore: cast_nullable_to_non_nullable
              as int,
      useOnlyGnssSyncedReadings: null == useOnlyGnssSyncedReadings
          ? _value.useOnlyGnssSyncedReadings
          : useOnlyGnssSyncedReadings // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImuConfigImpl implements _ImuConfig {
  const _$ImuConfigImpl(
      {this.usePitchAndRoll = true,
      this.swapPitchAndRoll = false,
      this.zeroValues = const ImuZeroValues(),
      this.useYaw = false,
      this.invertYaw = false,
      this.invertPitch = false,
      this.invertRoll = false,
      this.pitchGain = 1,
      this.rollGain = 1,
      this.delayReadings = 30,
      this.useOnlyGnssSyncedReadings = true});

  factory _$ImuConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImuConfigImplFromJson(json);

  /// Whether the vehicle should take into account pitch and roll when
  /// representing its position.
  @override
  @JsonKey()
  final bool usePitchAndRoll;

  /// Whether the pich and roll axes should be swapped.
  @override
  @JsonKey()
  final bool swapPitchAndRoll;

  /// The zero values for the different axes of the IMU.
  @override
  @JsonKey()
  final ImuZeroValues zeroValues;

  /// Whether the vehicle's bearing should be the one from the IMU.
  @override
  @JsonKey()
  final bool useYaw;

  /// Whether the bearing axis should be inverted.
  @override
  @JsonKey()
  final bool invertYaw;

  /// Whether the pitch axis should be inverted.
  @override
  @JsonKey()
  final bool invertPitch;

  /// Whether the roll axis should be inverted.
  @override
  @JsonKey()
  final bool invertRoll;

  /// A multiplier for how much the pitch reading should be amplified/reduced.
  @override
  @JsonKey()
  final double pitchGain;

  /// A multiplier for how much the pitch reading should be amplified/reduced.
  @override
  @JsonKey()
  final double rollGain;

  /// How many milliseconds we should delay the readings to match the GNSS fix
  /// time.
  @override
  @JsonKey()
  final int delayReadings;

  /// Whether to only use readings that are synced with a GNSS reading.
  @override
  @JsonKey()
  final bool useOnlyGnssSyncedReadings;

  @override
  String toString() {
    return 'ImuConfig(usePitchAndRoll: $usePitchAndRoll, swapPitchAndRoll: $swapPitchAndRoll, zeroValues: $zeroValues, useYaw: $useYaw, invertYaw: $invertYaw, invertPitch: $invertPitch, invertRoll: $invertRoll, pitchGain: $pitchGain, rollGain: $rollGain, delayReadings: $delayReadings, useOnlyGnssSyncedReadings: $useOnlyGnssSyncedReadings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImuConfigImpl &&
            (identical(other.usePitchAndRoll, usePitchAndRoll) ||
                other.usePitchAndRoll == usePitchAndRoll) &&
            (identical(other.swapPitchAndRoll, swapPitchAndRoll) ||
                other.swapPitchAndRoll == swapPitchAndRoll) &&
            (identical(other.zeroValues, zeroValues) ||
                other.zeroValues == zeroValues) &&
            (identical(other.useYaw, useYaw) || other.useYaw == useYaw) &&
            (identical(other.invertYaw, invertYaw) ||
                other.invertYaw == invertYaw) &&
            (identical(other.invertPitch, invertPitch) ||
                other.invertPitch == invertPitch) &&
            (identical(other.invertRoll, invertRoll) ||
                other.invertRoll == invertRoll) &&
            (identical(other.pitchGain, pitchGain) ||
                other.pitchGain == pitchGain) &&
            (identical(other.rollGain, rollGain) ||
                other.rollGain == rollGain) &&
            (identical(other.delayReadings, delayReadings) ||
                other.delayReadings == delayReadings) &&
            (identical(other.useOnlyGnssSyncedReadings,
                    useOnlyGnssSyncedReadings) ||
                other.useOnlyGnssSyncedReadings == useOnlyGnssSyncedReadings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      usePitchAndRoll,
      swapPitchAndRoll,
      zeroValues,
      useYaw,
      invertYaw,
      invertPitch,
      invertRoll,
      pitchGain,
      rollGain,
      delayReadings,
      useOnlyGnssSyncedReadings);

  /// Create a copy of ImuConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImuConfigImplCopyWith<_$ImuConfigImpl> get copyWith =>
      __$$ImuConfigImplCopyWithImpl<_$ImuConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImuConfigImplToJson(
      this,
    );
  }
}

abstract class _ImuConfig implements ImuConfig {
  const factory _ImuConfig(
      {final bool usePitchAndRoll,
      final bool swapPitchAndRoll,
      final ImuZeroValues zeroValues,
      final bool useYaw,
      final bool invertYaw,
      final bool invertPitch,
      final bool invertRoll,
      final double pitchGain,
      final double rollGain,
      final int delayReadings,
      final bool useOnlyGnssSyncedReadings}) = _$ImuConfigImpl;

  factory _ImuConfig.fromJson(Map<String, dynamic> json) =
      _$ImuConfigImpl.fromJson;

  /// Whether the vehicle should take into account pitch and roll when
  /// representing its position.
  @override
  bool get usePitchAndRoll;

  /// Whether the pich and roll axes should be swapped.
  @override
  bool get swapPitchAndRoll;

  /// The zero values for the different axes of the IMU.
  @override
  ImuZeroValues get zeroValues;

  /// Whether the vehicle's bearing should be the one from the IMU.
  @override
  bool get useYaw;

  /// Whether the bearing axis should be inverted.
  @override
  bool get invertYaw;

  /// Whether the pitch axis should be inverted.
  @override
  bool get invertPitch;

  /// Whether the roll axis should be inverted.
  @override
  bool get invertRoll;

  /// A multiplier for how much the pitch reading should be amplified/reduced.
  @override
  double get pitchGain;

  /// A multiplier for how much the pitch reading should be amplified/reduced.
  @override
  double get rollGain;

  /// How many milliseconds we should delay the readings to match the GNSS fix
  /// time.
  @override
  int get delayReadings;

  /// Whether to only use readings that are synced with a GNSS reading.
  @override
  bool get useOnlyGnssSyncedReadings;

  /// Create a copy of ImuConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImuConfigImplCopyWith<_$ImuConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
