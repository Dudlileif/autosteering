// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImuReadingImpl _$$ImuReadingImplFromJson(Map<String, dynamic> json) =>
    _$ImuReadingImpl(
      receiveTime: DateTime.parse(json['receiveTime'] as String),
      yawFromStartup: json['yawFromStartup'] as num? ?? 0,
      pitch: json['pitch'] as num? ?? 0,
      roll: json['roll'] as num? ?? 0,
    );

Map<String, dynamic> _$$ImuReadingImplToJson(_$ImuReadingImpl instance) =>
    <String, dynamic>{
      'receiveTime': instance.receiveTime.toIso8601String(),
      'yawFromStartup': instance.yawFromStartup,
      'pitch': instance.pitch,
      'roll': instance.roll,
    };
