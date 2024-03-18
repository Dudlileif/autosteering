// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

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
