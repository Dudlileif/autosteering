// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_thresholds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleThresholds _$VehicleThresholdsFromJson(
  Map<String, dynamic> json,
) => _VehicleThresholds(
  minVelocity: (json['minVelocity'] as num?)?.toDouble() ?? 0.05,
  maxVelocity: (json['maxVelocity'] as num?)?.toDouble() ?? 5,
  maxReversingVelocity: (json['maxReversingVelocity'] as num?)?.toDouble() ?? 0,
  maxAngularVelocity: (json['maxAngularVelocity'] as num?)?.toDouble() ?? 30,
);

Map<String, dynamic> _$VehicleThresholdsToJson(_VehicleThresholds instance) =>
    <String, dynamic>{
      'minVelocity': instance.minVelocity,
      'maxVelocity': instance.maxVelocity,
      'maxReversingVelocity': instance.maxReversingVelocity,
      'maxAngularVelocity': instance.maxAngularVelocity,
    };
