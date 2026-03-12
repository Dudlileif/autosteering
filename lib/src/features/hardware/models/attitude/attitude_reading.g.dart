// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attitude_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GnssAttitudeReading _$GnssAttitudeReadingFromJson(Map<String, dynamic> json) =>
    GnssAttitudeReading(
      receiveTime: const DateTimeSerializer().fromJson(
        json['receiveTime'] as String,
      ),
      yaw: (json['yaw'] as num?)?.toDouble() ?? null,
      pitch: (json['pitch'] as num?)?.toDouble() ?? null,
      roll: (json['roll'] as num?)?.toDouble() ?? null,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$GnssAttitudeReadingToJson(
  GnssAttitudeReading instance,
) => <String, dynamic>{
  'receiveTime': const DateTimeSerializer().toJson(instance.receiveTime),
  'yaw': instance.yaw,
  'pitch': instance.pitch,
  'roll': instance.roll,
  'runtimeType': instance.$type,
};

ImuReading _$ImuReadingFromJson(Map<String, dynamic> json) => ImuReading(
  receiveTime: const DateTimeSerializer().fromJson(
    json['receiveTime'] as String,
  ),
  yaw: (json['yaw'] as num?)?.toDouble() ?? 0,
  pitch: (json['pitch'] as num?)?.toDouble() ?? 0,
  roll: (json['roll'] as num?)?.toDouble() ?? 0,
  accelerationX: (json['accelerationX'] as num?)?.toDouble() ?? 0,
  accelerationY: (json['accelerationY'] as num?)?.toDouble() ?? 0,
  accelerationZ: (json['accelerationZ'] as num?)?.toDouble() ?? 0,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$ImuReadingToJson(ImuReading instance) =>
    <String, dynamic>{
      'receiveTime': const DateTimeSerializer().toJson(instance.receiveTime),
      'yaw': instance.yaw,
      'pitch': instance.pitch,
      'roll': instance.roll,
      'accelerationX': instance.accelerationX,
      'accelerationY': instance.accelerationY,
      'accelerationZ': instance.accelerationZ,
      'runtimeType': instance.$type,
    };
