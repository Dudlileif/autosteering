// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImuConfigImpl _$$ImuConfigImplFromJson(Map<String, dynamic> json) =>
    _$ImuConfigImpl(
      usePitchAndRoll: json['usePitchAndRoll'] as bool? ?? true,
      swapPitchAndRoll: json['swapPitchAndRoll'] as bool? ?? false,
      zeroValues: json['zeroValues'] == null
          ? const ImuZeroValues()
          : ImuZeroValues.fromJson(json['zeroValues'] as Map<String, dynamic>),
      useBearing: json['useBearing'] as bool? ?? false,
      invertPitch: json['invertPitch'] as bool? ?? false,
      invertRoll: json['invertRoll'] as bool? ?? false,
      pitchGain: (json['pitchGain'] as num?)?.toDouble() ?? 1,
      rollGain: (json['rollGain'] as num?)?.toDouble() ?? 1,
    );

Map<String, dynamic> _$$ImuConfigImplToJson(_$ImuConfigImpl instance) =>
    <String, dynamic>{
      'usePitchAndRoll': instance.usePitchAndRoll,
      'swapPitchAndRoll': instance.swapPitchAndRoll,
      'zeroValues': instance.zeroValues,
      'useBearing': instance.useBearing,
      'invertPitch': instance.invertPitch,
      'invertRoll': instance.invertRoll,
      'pitchGain': instance.pitchGain,
      'rollGain': instance.rollGain,
    };