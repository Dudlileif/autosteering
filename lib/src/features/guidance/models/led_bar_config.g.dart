// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'led_bar_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedBarConfigImpl _$$LedBarConfigImplFromJson(Map<String, dynamic> json) =>
    _$LedBarConfigImpl(
      centerCount: (json['centerCount'] as num?)?.toInt() ?? 2,
      intermediateCount: (json['intermediateCount'] as num?)?.toInt() ?? 2,
      endCount: (json['endCount'] as num?)?.toInt() ?? 2,
      oddCenter: json['oddCenter'] as bool? ?? false,
      distancePerLed: (json['distancePerLed'] as num?)?.toDouble() ?? 0.04,
      evenCenterSimulateOdd: json['evenCenterSimulateOdd'] as bool? ?? false,
      endColor: json['endColor'] == null
          ? Colors.red
          : const ColorSerializer().fromJson(json['endColor'] as String),
      intermediateColor: json['intermediateColor'] == null
          ? Colors.yellow
          : const ColorSerializer()
              .fromJson(json['intermediateColor'] as String),
      centerColor: json['centerColor'] == null
          ? Colors.green
          : const ColorSerializer().fromJson(json['centerColor'] as String),
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
      'endColor': const ColorSerializer().toJson(instance.endColor),
      'intermediateColor':
          const ColorSerializer().toJson(instance.intermediateColor),
      'centerColor': const ColorSerializer().toJson(instance.centerColor),
      'ledSize': instance.ledSize,
      'barWidth': instance.barWidth,
      'reverseBar': instance.reverseBar,
    };
