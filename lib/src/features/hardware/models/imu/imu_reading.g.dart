// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImuReadingImpl _$$ImuReadingImplFromJson(Map<String, dynamic> json) =>
    _$ImuReadingImpl(
      receiveTime: DateTime.parse(json['receiveTime'] as String),
      yaw: json['yaw'] as num? ?? 0,
      pitch: json['pitch'] as num? ?? 0,
      roll: json['roll'] as num? ?? 0,
      accelerationX: json['accelerationX'] as num? ?? 0,
      accelerationY: json['accelerationY'] as num? ?? 0,
      accelerationZ: json['accelerationZ'] as num? ?? 0,
    );

Map<String, dynamic> _$$ImuReadingImplToJson(_$ImuReadingImpl instance) =>
    <String, dynamic>{
      'receiveTime': instance.receiveTime.toIso8601String(),
      'yaw': instance.yaw,
      'pitch': instance.pitch,
      'roll': instance.roll,
      'accelerationX': instance.accelerationX,
      'accelerationY': instance.accelerationY,
      'accelerationZ': instance.accelerationZ,
    };
