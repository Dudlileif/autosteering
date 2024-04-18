// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_recording_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PathRecordingSettingsImpl _$$PathRecordingSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$PathRecordingSettingsImpl(
      minDistance: (json['minDistance'] as num?)?.toDouble() ?? 1,
      maxDistance: (json['maxDistance'] as num?)?.toDouble() ?? 20,
      maxBearingDifference:
          (json['maxBearingDifference'] as num?)?.toDouble() ?? 1,
      lateralOffset: (json['lateralOffset'] as num?)?.toDouble() ?? 0,
      longitudinalOffset: (json['longitudinalOffset'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$PathRecordingSettingsImplToJson(
        _$PathRecordingSettingsImpl instance) =>
    <String, dynamic>{
      'minDistance': instance.minDistance,
      'maxDistance': instance.maxDistance,
      'maxBearingDifference': instance.maxBearingDifference,
      'lateralOffset': instance.lateralOffset,
      'longitudinalOffset': instance.longitudinalOffset,
    };
