// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasConfigImpl _$$WasConfigImplFromJson(Map<String, dynamic> json) =>
    _$WasConfigImpl(
      useWas: json['useWas'] as bool? ?? true,
      invertInput: json['invertInput'] as bool? ?? false,
      bits: (json['bits'] as num?)?.toInt() ?? 12,
    );

Map<String, dynamic> _$$WasConfigImplToJson(_$WasConfigImpl instance) =>
    <String, dynamic>{
      'useWas': instance.useWas,
      'invertInput': instance.invertInput,
      'bits': instance.bits,
    };
