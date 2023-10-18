// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentinel_layer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SentinelLayerImpl _$$SentinelLayerImplFromJson(Map<String, dynamic> json) =>
    _$SentinelLayerImpl(
      instanceId: json['instanceId'] as String,
      layerType: $enumDecode(_$SentinelLayerTypeEnumMap, json['layerType']),
    );

Map<String, dynamic> _$$SentinelLayerImplToJson(_$SentinelLayerImpl instance) =>
    <String, dynamic>{
      'instanceId': instance.instanceId,
      'layerType': _$SentinelLayerTypeEnumMap[instance.layerType]!,
    };

const _$SentinelLayerTypeEnumMap = {
  SentinelLayerType.trueColor: 'trueColor',
  SentinelLayerType.agriculture: 'agriculture',
  SentinelLayerType.ndvi: 'ndvi',
};
