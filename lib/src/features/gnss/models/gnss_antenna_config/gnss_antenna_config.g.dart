// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gnss_antenna_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GnssAntennaConfig _$GnssAntennaConfigFromJson(Map<String, dynamic> json) =>
    _GnssAntennaConfig(
      longitudinalOffset: (json['longitudinalOffset'] as num?)?.toDouble() ?? 0,
      lateralOffset: (json['lateralOffset'] as num?)?.toDouble() ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 2.8,
      useDualHeading: json['useDualHeading'] as bool? ?? false,
      useDualRoll: json['useDualRoll'] as bool? ?? false,
      dualBaseline: (json['dualBaseline'] as num?)?.toDouble() ?? 1,
      dualRelativeAngle: (json['dualRelativeAngle'] as num?)?.toDouble() ?? 90,
      dualRollGain: (json['dualRollGain'] as num?)?.toDouble() ?? 1,
      invertDualRoll: json['invertDualRoll'] as bool? ?? false,
      receiverConfigs:
          (json['receiverConfigs'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          null,
    );

Map<String, dynamic> _$GnssAntennaConfigToJson(_GnssAntennaConfig instance) =>
    <String, dynamic>{
      'longitudinalOffset': instance.longitudinalOffset,
      'lateralOffset': instance.lateralOffset,
      'height': instance.height,
      'useDualHeading': instance.useDualHeading,
      'useDualRoll': instance.useDualRoll,
      'dualBaseline': instance.dualBaseline,
      'dualRelativeAngle': instance.dualRelativeAngle,
      'dualRollGain': instance.dualRollGain,
      'invertDualRoll': instance.invertDualRoll,
      'receiverConfigs': instance.receiverConfigs,
    };
