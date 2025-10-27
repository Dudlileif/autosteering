// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_log_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EquipmentLogRecord _$EquipmentLogRecordFromJson(Map<String, dynamic> json) =>
    _EquipmentLogRecord(
      time: const DateTimeSerializer().fromJson(json['time'] as String),
      activeSections: (json['activeSections'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      wayPoint: WayPoint.fromJson(json['wayPoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EquipmentLogRecordToJson(_EquipmentLogRecord instance) =>
    <String, dynamic>{
      'time': const DateTimeSerializer().toJson(instance.time),
      'activeSections': instance.activeSections,
      'wayPoint': instance.wayPoint,
    };
