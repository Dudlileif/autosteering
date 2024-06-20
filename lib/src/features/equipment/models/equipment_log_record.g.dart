// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_log_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EquipmentLogRecordImpl _$$EquipmentLogRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$EquipmentLogRecordImpl(
      time: const DateTimeSerializer().fromJson(json['time'] as String),
      activeSections: (json['activeSections'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      wayPoint: WayPoint.fromJson(json['wayPoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EquipmentLogRecordImplToJson(
        _$EquipmentLogRecordImpl instance) =>
    <String, dynamic>{
      'time': const DateTimeSerializer().toJson(instance.time),
      'activeSections': instance.activeSections,
      'wayPoint': instance.wayPoint,
    };
