// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Connector _$ConnectorFromJson(Map<String, dynamic> json) => _Connector(
  longitudinalOffsetFromRef: (json['longitudinalOffsetFromRef'] as num)
      .toDouble(),
  lateralOffsetFromRef: (json['lateralOffsetFromRef'] as num).toDouble(),
  type: $enumDecode(_$ConnectorTypeEnumMap, json['type']),
  relation: $enumDecode(_$ConnectorRelationEnumMap, json['relation']),
  vehicleId: (json['vehicleId'] as num?)?.toInt(),
  implementId: (json['implementId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  verticalOffsetFromRef:
      (json['verticalOffsetFromRef'] as num?)?.toDouble() ?? 0,
  angle: (json['angle'] as num?)?.toDouble() ?? 0,
  createdAt: _$JsonConverterFromJson<String, DateTime>(
    json['createdAt'],
    const DateTimeSerializer().fromJson,
  ),
  lastUpdatedAt: _$JsonConverterFromJson<String, DateTime>(
    json['lastUpdatedAt'],
    const DateTimeSerializer().fromJson,
  ),
);

Map<String, dynamic> _$ConnectorToJson(_Connector instance) =>
    <String, dynamic>{
      'longitudinalOffsetFromRef': instance.longitudinalOffsetFromRef,
      'lateralOffsetFromRef': instance.lateralOffsetFromRef,
      'type': _$ConnectorTypeEnumMap[instance.type]!,
      'relation': _$ConnectorRelationEnumMap[instance.relation]!,
      'vehicleId': instance.vehicleId,
      'implementId': instance.implementId,
      'id': instance.id,
      'verticalOffsetFromRef': instance.verticalOffsetFromRef,
      'angle': instance.angle,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
        instance.createdAt,
        const DateTimeSerializer().toJson,
      ),
      'lastUpdatedAt': _$JsonConverterToJson<String, DateTime>(
        instance.lastUpdatedAt,
        const DateTimeSerializer().toJson,
      ),
    };

const _$ConnectorTypeEnumMap = {
  ConnectorType.fixed: 'fixed',
  ConnectorType.drawbar: 'drawbar',
};

const _$ConnectorRelationEnumMap = {
  ConnectorRelation.parent: 'parent',
  ConnectorRelation.child: 'child',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
