// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stanley_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StanleyParameters _$StanleyParametersFromJson(Map<String, dynamic> json) =>
    _StanleyParameters(
      crossDistanceGain: (json['crossDistanceGain'] as num?)?.toDouble() ?? 1.5,
      softeningGain: (json['softeningGain'] as num?)?.toDouble() ?? 1e-5,
      velocityGain: (json['velocityGain'] as num?)?.toDouble() ?? 1.3,
    );

Map<String, dynamic> _$StanleyParametersToJson(_StanleyParameters instance) =>
    <String, dynamic>{
      'crossDistanceGain': instance.crossDistanceGain,
      'softeningGain': instance.softeningGain,
      'velocityGain': instance.velocityGain,
    };
