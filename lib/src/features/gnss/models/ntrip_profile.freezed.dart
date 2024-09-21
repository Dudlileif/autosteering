// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ntrip_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NtripProfile _$NtripProfileFromJson(Map<String, dynamic> json) {
  return _NtripProfile.fromJson(json);
}

/// @nodoc
mixin _$NtripProfile {
  /// The name of this profile.
  String get name => throw _privateConstructorUsedError;

  /// The host address for the NTRIP caster.
  String get hostAddress => throw _privateConstructorUsedError;

  /// The mount point to connect to.
  String get mountPoint => throw _privateConstructorUsedError;

  /// The port for connecting to the NTRIP caster.
  int get port => throw _privateConstructorUsedError;

  /// Username for connecting to the mount point.
  String? get username => throw _privateConstructorUsedError;

  /// Password for connecting to the mount point.
  String? get password => throw _privateConstructorUsedError;

  /// The interval in seconds for sending position back to the caster.
  int? get ggaSendingInterval => throw _privateConstructorUsedError;

  /// Serializes this NtripProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NtripProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NtripProfileCopyWith<NtripProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NtripProfileCopyWith<$Res> {
  factory $NtripProfileCopyWith(
          NtripProfile value, $Res Function(NtripProfile) then) =
      _$NtripProfileCopyWithImpl<$Res, NtripProfile>;
  @useResult
  $Res call(
      {String name,
      String hostAddress,
      String mountPoint,
      int port,
      String? username,
      String? password,
      int? ggaSendingInterval});
}

/// @nodoc
class _$NtripProfileCopyWithImpl<$Res, $Val extends NtripProfile>
    implements $NtripProfileCopyWith<$Res> {
  _$NtripProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NtripProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hostAddress = null,
    Object? mountPoint = null,
    Object? port = null,
    Object? username = freezed,
    Object? password = freezed,
    Object? ggaSendingInterval = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hostAddress: null == hostAddress
          ? _value.hostAddress
          : hostAddress // ignore: cast_nullable_to_non_nullable
              as String,
      mountPoint: null == mountPoint
          ? _value.mountPoint
          : mountPoint // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      ggaSendingInterval: freezed == ggaSendingInterval
          ? _value.ggaSendingInterval
          : ggaSendingInterval // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NtripProfileImplCopyWith<$Res>
    implements $NtripProfileCopyWith<$Res> {
  factory _$$NtripProfileImplCopyWith(
          _$NtripProfileImpl value, $Res Function(_$NtripProfileImpl) then) =
      __$$NtripProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String hostAddress,
      String mountPoint,
      int port,
      String? username,
      String? password,
      int? ggaSendingInterval});
}

/// @nodoc
class __$$NtripProfileImplCopyWithImpl<$Res>
    extends _$NtripProfileCopyWithImpl<$Res, _$NtripProfileImpl>
    implements _$$NtripProfileImplCopyWith<$Res> {
  __$$NtripProfileImplCopyWithImpl(
      _$NtripProfileImpl _value, $Res Function(_$NtripProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of NtripProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hostAddress = null,
    Object? mountPoint = null,
    Object? port = null,
    Object? username = freezed,
    Object? password = freezed,
    Object? ggaSendingInterval = freezed,
  }) {
    return _then(_$NtripProfileImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hostAddress: null == hostAddress
          ? _value.hostAddress
          : hostAddress // ignore: cast_nullable_to_non_nullable
              as String,
      mountPoint: null == mountPoint
          ? _value.mountPoint
          : mountPoint // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      ggaSendingInterval: freezed == ggaSendingInterval
          ? _value.ggaSendingInterval
          : ggaSendingInterval // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NtripProfileImpl implements _NtripProfile {
  const _$NtripProfileImpl(
      {required this.name,
      required this.hostAddress,
      required this.mountPoint,
      this.port = 2101,
      this.username,
      this.password,
      this.ggaSendingInterval});

  factory _$NtripProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$NtripProfileImplFromJson(json);

  /// The name of this profile.
  @override
  final String name;

  /// The host address for the NTRIP caster.
  @override
  final String hostAddress;

  /// The mount point to connect to.
  @override
  final String mountPoint;

  /// The port for connecting to the NTRIP caster.
  @override
  @JsonKey()
  final int port;

  /// Username for connecting to the mount point.
  @override
  final String? username;

  /// Password for connecting to the mount point.
  @override
  final String? password;

  /// The interval in seconds for sending position back to the caster.
  @override
  final int? ggaSendingInterval;

  @override
  String toString() {
    return 'NtripProfile(name: $name, hostAddress: $hostAddress, mountPoint: $mountPoint, port: $port, username: $username, password: $password, ggaSendingInterval: $ggaSendingInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NtripProfileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hostAddress, hostAddress) ||
                other.hostAddress == hostAddress) &&
            (identical(other.mountPoint, mountPoint) ||
                other.mountPoint == mountPoint) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.ggaSendingInterval, ggaSendingInterval) ||
                other.ggaSendingInterval == ggaSendingInterval));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, hostAddress, mountPoint,
      port, username, password, ggaSendingInterval);

  /// Create a copy of NtripProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NtripProfileImplCopyWith<_$NtripProfileImpl> get copyWith =>
      __$$NtripProfileImplCopyWithImpl<_$NtripProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NtripProfileImplToJson(
      this,
    );
  }
}

abstract class _NtripProfile implements NtripProfile {
  const factory _NtripProfile(
      {required final String name,
      required final String hostAddress,
      required final String mountPoint,
      final int port,
      final String? username,
      final String? password,
      final int? ggaSendingInterval}) = _$NtripProfileImpl;

  factory _NtripProfile.fromJson(Map<String, dynamic> json) =
      _$NtripProfileImpl.fromJson;

  /// The name of this profile.
  @override
  String get name;

  /// The host address for the NTRIP caster.
  @override
  String get hostAddress;

  /// The mount point to connect to.
  @override
  String get mountPoint;

  /// The port for connecting to the NTRIP caster.
  @override
  int get port;

  /// Username for connecting to the mount point.
  @override
  String? get username;

  /// Password for connecting to the mount point.
  @override
  String? get password;

  /// The interval in seconds for sending position back to the caster.
  @override
  int? get ggaSendingInterval;

  /// Create a copy of NtripProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NtripProfileImplCopyWith<_$NtripProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
