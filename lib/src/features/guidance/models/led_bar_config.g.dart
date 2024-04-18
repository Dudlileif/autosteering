// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'led_bar_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedBarConfigImpl _$$LedBarConfigImplFromJson(Map<String, dynamic> json) =>
    _$LedBarConfigImpl(
      centerCount: json['centerCount'] as int? ?? 2,
      intermediateCount: json['intermediateCount'] as int? ?? 2,
      endCount: json['endCount'] as int? ?? 2,
      oddCenter: json['oddCenter'] as bool? ?? false,
      distancePerLed: (json['distancePerLed'] as num?)?.toDouble() ?? 0.04,
      evenCenterSimulateOdd: json['evenCenterSimulateOdd'] as bool? ?? false,
      endColor: json['endColor'] as int? ?? 0xFFFF0000,
      intermediateColor: json['intermediateColor'] as int? ?? 0xFFFFEF3B,
      centerColor: json['centerColor'] as int? ?? 0xFF00FF00,
      ledSize: (json['ledSize'] as num?)?.toDouble() ?? 20,
      barWidth: (json['barWidth'] as num?)?.toDouble() ?? 800,
      reverseBar: json['reverseBar'] as bool? ?? false,
    );

Map<String, dynamic> _$$LedBarConfigImplToJson(_$LedBarConfigImpl instance) =>
    <String, dynamic>{
      'centerCount': instance.centerCount,
      'intermediateCount': instance.intermediateCount,
      'endCount': instance.endCount,
      'oddCenter': instance.oddCenter,
      'distancePerLed': instance.distancePerLed,
      'evenCenterSimulateOdd': instance.evenCenterSimulateOdd,
      'endColor': instance.endColor,
      'intermediateColor': instance.intermediateColor,
      'centerColor': instance.centerColor,
      'ledSize': instance.ledSize,
      'barWidth': instance.barWidth,
      'reverseBar': instance.reverseBar,
    };
