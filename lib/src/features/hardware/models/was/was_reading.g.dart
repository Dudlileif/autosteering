// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasReadingImpl _$$WasReadingImplFromJson(Map<String, dynamic> json) =>
    _$WasReadingImpl(
      receiveTime: DateTime.parse(json['receiveTime'] as String),
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WasReadingImplToJson(_$WasReadingImpl instance) =>
    <String, dynamic>{
      'receiveTime': instance.receiveTime.toIso8601String(),
      'value': instance.value,
    };
