// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imu_zero_values.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ImuZeroValues _$ImuZeroValuesFromJson(Map<String, dynamic> json) =>
    _ImuZeroValues(
      bearingZero: json['bearingZero'] as num? ?? 0,
      pitchZero: json['pitchZero'] as num? ?? 0,
      rollZero: json['rollZero'] as num? ?? 0,
    );

Map<String, dynamic> _$ImuZeroValuesToJson(_ImuZeroValues instance) =>
    <String, dynamic>{
      'bearingZero': instance.bearingZero,
      'pitchZero': instance.pitchZero,
      'rollZero': instance.rollZero,
    };
