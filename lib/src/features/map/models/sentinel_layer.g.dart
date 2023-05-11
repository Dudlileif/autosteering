// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentinel_layer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SentinelLayer _$$_SentinelLayerFromJson(Map<String, dynamic> json) =>
    _$_SentinelLayer(
      instanceId: json['instanceId'] as String,
      layerType: $enumDecode(_$SentinelLayerTypeEnumMap, json['layerType']),
    );

Map<String, dynamic> _$$_SentinelLayerToJson(_$_SentinelLayer instance) =>
    <String, dynamic>{
      'instanceId': instance.instanceId,
      'layerType': _$SentinelLayerTypeEnumMap[instance.layerType]!,
    };

const _$SentinelLayerTypeEnumMap = {
  SentinelLayerType.trueColor: 'trueColor',
  SentinelLayerType.agriculture: 'agriculture',
  SentinelLayerType.ndvi: 'ndvi',
};
