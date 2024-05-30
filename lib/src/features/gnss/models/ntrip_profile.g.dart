// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ntrip_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NtripProfileImpl _$$NtripProfileImplFromJson(Map<String, dynamic> json) =>
    _$NtripProfileImpl(
      name: json['name'] as String,
      hostAddress: json['hostAddress'] as String,
      mountPoint: json['mountPoint'] as String,
      port: (json['port'] as num?)?.toInt() ?? 2101,
      username: json['username'] as String?,
      password: json['password'] as String?,
      ggaSendingInterval: (json['ggaSendingInterval'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$NtripProfileImplToJson(_$NtripProfileImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hostAddress': instance.hostAddress,
      'mountPoint': instance.mountPoint,
      'port': instance.port,
      'username': instance.username,
      'password': instance.password,
      'ggaSendingInterval': instance.ggaSendingInterval,
    };
