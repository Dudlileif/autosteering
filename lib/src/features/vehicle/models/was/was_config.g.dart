// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasConfigImpl _$$WasConfigImplFromJson(Map<String, dynamic> json) =>
    _$WasConfigImpl(
      invertInput: json['invertInput'] as bool? ?? false,
      bits: json['bits'] as int? ?? 12,
      min: json['min'] as int? ?? 0,
      max: json['max'] as int? ?? 4095,
      center: json['center'] as int? ?? 2047,
    );

Map<String, dynamic> _$$WasConfigImplToJson(_$WasConfigImpl instance) =>
    <String, dynamic>{
      'invertInput': instance.invertInput,
      'bits': instance.bits,
      'min': instance.min,
      'max': instance.max,
      'center': instance.center,
    };
