// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WasConfig _$WasConfigFromJson(Map<String, dynamic> json) => _WasConfig(
  useWas: json['useWas'] as bool? ?? true,
  invertInput: json['invertInput'] as bool? ?? false,
  bits: (json['bits'] as num?)?.toInt() ?? 12,
);

Map<String, dynamic> _$WasConfigToJson(_WasConfig instance) =>
    <String, dynamic>{
      'useWas': instance.useWas,
      'invertInput': instance.invertInput,
      'bits': instance.bits,
    };
