// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motor_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MotorConfigImpl _$$MotorConfigImplFromJson(Map<String, dynamic> json) =>
    _$MotorConfigImpl(
      invertOutput: json['invertOutput'] as bool? ?? false,
      maxRPM: json['maxRPM'] as int? ?? 200,
    );

Map<String, dynamic> _$$MotorConfigImplToJson(_$MotorConfigImpl instance) =>
    <String, dynamic>{
      'invertOutput': instance.invertOutput,
      'maxRPM': instance.maxRPM,
    };
