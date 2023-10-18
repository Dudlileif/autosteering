// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'led_bar_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedBarConfigImpl _$$LedBarConfigImplFromJson(Map<String, dynamic> json) =>
    _$LedBarConfigImpl(
      leftEndCount: json['leftEndCount'] as int? ?? 2,
      leftIntermediateCount: json['leftIntermediateCount'] as int? ?? 2,
      centerCount: json['centerCount'] as int? ?? 3,
      rightIntermediateCount: json['rightIntermediateCount'] as int? ?? 2,
      rightEndCount: json['rightEndCount'] as int? ?? 2,
      distancePerLed: (json['distancePerLed'] as num?)?.toDouble() ?? 0.04,
      evenCenterSimulateOdd: json['evenCenterSimulateOdd'] as bool? ?? false,
      endColor: json['endColor'] as int? ?? 0xFFFF0000,
      intermediateColor: json['intermediateColor'] as int? ?? 0xFFFFEF3B,
      centerColor: json['centerColor'] as int? ?? 0xFF00FF00,
      ledSize: (json['ledSize'] as num?)?.toDouble() ?? 32,
    );

Map<String, dynamic> _$$LedBarConfigImplToJson(_$LedBarConfigImpl instance) =>
    <String, dynamic>{
      'leftEndCount': instance.leftEndCount,
      'leftIntermediateCount': instance.leftIntermediateCount,
      'centerCount': instance.centerCount,
      'rightIntermediateCount': instance.rightIntermediateCount,
      'rightEndCount': instance.rightEndCount,
      'distancePerLed': instance.distancePerLed,
      'evenCenterSimulateOdd': instance.evenCenterSimulateOdd,
      'endColor': instance.endColor,
      'intermediateColor': instance.intermediateColor,
      'centerColor': instance.centerColor,
      'ledSize': instance.ledSize,
    };
