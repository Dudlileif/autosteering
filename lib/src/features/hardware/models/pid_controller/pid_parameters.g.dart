// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pid_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PidParameters _$PidParametersFromJson(Map<String, dynamic> json) =>
    _PidParameters(
      p: (json['p'] as num?)?.toDouble() ?? 20,
      i: (json['i'] as num?)?.toDouble() ?? 0.130,
      d: (json['d'] as num?)?.toDouble() ?? 0.063,
    );

Map<String, dynamic> _$PidParametersToJson(_PidParameters instance) =>
    <String, dynamic>{'p': instance.p, 'i': instance.i, 'd': instance.d};
