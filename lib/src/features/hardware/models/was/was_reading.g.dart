// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WasReading _$WasReadingFromJson(Map<String, dynamic> json) => _WasReading(
  receiveTime: const DateTimeSerializer().fromJson(
    json['receiveTime'] as String,
  ),
  value: (json['value'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$WasReadingToJson(_WasReading instance) =>
    <String, dynamic>{
      'receiveTime': const DateTimeSerializer().toJson(instance.receiveTime),
      'value': instance.value,
    };
