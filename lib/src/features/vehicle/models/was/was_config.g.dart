// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasConfigImpl _$$WasConfigImplFromJson(Map<String, dynamic> json) =>
    _$WasConfigImpl(
      useWas: json['useWas'] as bool? ?? true,
      invertInput: json['invertInput'] as bool? ?? false,
      bits: json['bits'] as int? ?? 12,
      min: json['min'] as int? ?? 100,
      max: json['max'] as int? ?? 4000,
      center: json['center'] as int? ?? 1500,
    );

Map<String, dynamic> _$$WasConfigImplToJson(_$WasConfigImpl instance) =>
    <String, dynamic>{
      'useWas': instance.useWas,
      'invertInput': instance.invertInput,
      'bits': instance.bits,
      'min': instance.min,
      'max': instance.max,
      'center': instance.center,
    };
