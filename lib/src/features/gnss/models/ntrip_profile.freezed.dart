// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ntrip_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NtripProfile {

/// The name of this profile.
 String get name;/// The host address for the NTRIP caster.
 String get hostAddress;/// The mount point to connect to.
 String get mountPoint;/// The port for connecting to the NTRIP caster.
 int get port;/// Username for connecting to the mount point.
 String? get username;/// Password for connecting to the mount point.
 String? get password;/// The interval in seconds for sending position back to the caster.
 int? get ggaSendingInterval;
/// Create a copy of NtripProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NtripProfileCopyWith<NtripProfile> get copyWith => _$NtripProfileCopyWithImpl<NtripProfile>(this as NtripProfile, _$identity);

  /// Serializes this NtripProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NtripProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.hostAddress, hostAddress) || other.hostAddress == hostAddress)&&(identical(other.mountPoint, mountPoint) || other.mountPoint == mountPoint)&&(identical(other.port, port) || other.port == port)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.ggaSendingInterval, ggaSendingInterval) || other.ggaSendingInterval == ggaSendingInterval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,hostAddress,mountPoint,port,username,password,ggaSendingInterval);

@override
String toString() {
  return 'NtripProfile(name: $name, hostAddress: $hostAddress, mountPoint: $mountPoint, port: $port, username: $username, password: $password, ggaSendingInterval: $ggaSendingInterval)';
}


}

/// @nodoc
abstract mixin class $NtripProfileCopyWith<$Res>  {
  factory $NtripProfileCopyWith(NtripProfile value, $Res Function(NtripProfile) _then) = _$NtripProfileCopyWithImpl;
@useResult
$Res call({
 String name, String hostAddress, String mountPoint, int port, String? username, String? password, int? ggaSendingInterval
});




}
/// @nodoc
class _$NtripProfileCopyWithImpl<$Res>
    implements $NtripProfileCopyWith<$Res> {
  _$NtripProfileCopyWithImpl(this._self, this._then);

  final NtripProfile _self;
  final $Res Function(NtripProfile) _then;

/// Create a copy of NtripProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? hostAddress = null,Object? mountPoint = null,Object? port = null,Object? username = freezed,Object? password = freezed,Object? ggaSendingInterval = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hostAddress: null == hostAddress ? _self.hostAddress : hostAddress // ignore: cast_nullable_to_non_nullable
as String,mountPoint: null == mountPoint ? _self.mountPoint : mountPoint // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,ggaSendingInterval: freezed == ggaSendingInterval ? _self.ggaSendingInterval : ggaSendingInterval // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _NtripProfile implements NtripProfile {
  const _NtripProfile({required this.name, required this.hostAddress, required this.mountPoint, this.port = 2101, this.username, this.password, this.ggaSendingInterval});
  factory _NtripProfile.fromJson(Map<String, dynamic> json) => _$NtripProfileFromJson(json);

/// The name of this profile.
@override final  String name;
/// The host address for the NTRIP caster.
@override final  String hostAddress;
/// The mount point to connect to.
@override final  String mountPoint;
/// The port for connecting to the NTRIP caster.
@override@JsonKey() final  int port;
/// Username for connecting to the mount point.
@override final  String? username;
/// Password for connecting to the mount point.
@override final  String? password;
/// The interval in seconds for sending position back to the caster.
@override final  int? ggaSendingInterval;

/// Create a copy of NtripProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NtripProfileCopyWith<_NtripProfile> get copyWith => __$NtripProfileCopyWithImpl<_NtripProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NtripProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NtripProfile&&(identical(other.name, name) || other.name == name)&&(identical(other.hostAddress, hostAddress) || other.hostAddress == hostAddress)&&(identical(other.mountPoint, mountPoint) || other.mountPoint == mountPoint)&&(identical(other.port, port) || other.port == port)&&(identical(other.username, username) || other.username == username)&&(identical(other.password, password) || other.password == password)&&(identical(other.ggaSendingInterval, ggaSendingInterval) || other.ggaSendingInterval == ggaSendingInterval));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,hostAddress,mountPoint,port,username,password,ggaSendingInterval);

@override
String toString() {
  return 'NtripProfile(name: $name, hostAddress: $hostAddress, mountPoint: $mountPoint, port: $port, username: $username, password: $password, ggaSendingInterval: $ggaSendingInterval)';
}


}

/// @nodoc
abstract mixin class _$NtripProfileCopyWith<$Res> implements $NtripProfileCopyWith<$Res> {
  factory _$NtripProfileCopyWith(_NtripProfile value, $Res Function(_NtripProfile) _then) = __$NtripProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String hostAddress, String mountPoint, int port, String? username, String? password, int? ggaSendingInterval
});




}
/// @nodoc
class __$NtripProfileCopyWithImpl<$Res>
    implements _$NtripProfileCopyWith<$Res> {
  __$NtripProfileCopyWithImpl(this._self, this._then);

  final _NtripProfile _self;
  final $Res Function(_NtripProfile) _then;

/// Create a copy of NtripProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? hostAddress = null,Object? mountPoint = null,Object? port = null,Object? username = freezed,Object? password = freezed,Object? ggaSendingInterval = freezed,}) {
  return _then(_NtripProfile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hostAddress: null == hostAddress ? _self.hostAddress : hostAddress // ignore: cast_nullable_to_non_nullable
as String,mountPoint: null == mountPoint ? _self.mountPoint : mountPoint // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,ggaSendingInterval: freezed == ggaSendingInterval ? _self.ggaSendingInterval : ggaSendingInterval // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
