// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'was_reading.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WasReadingImpl _$$WasReadingImplFromJson(Map<String, dynamic> json) =>
    _$WasReadingImpl(
      receiveTime:
          const DateTimeSerializer().fromJson(json['receiveTime'] as String),
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$WasReadingImplToJson(_$WasReadingImpl instance) =>
    <String, dynamic>{
      'receiveTime': const DateTimeSerializer().toJson(instance.receiveTime),
      'value': instance.value,
    };
