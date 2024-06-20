// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stanley_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StanleyParametersImpl _$$StanleyParametersImplFromJson(
        Map<String, dynamic> json) =>
    _$StanleyParametersImpl(
      crossDistanceGain: (json['crossDistanceGain'] as num?)?.toDouble() ?? 1.5,
      softeningGain: (json['softeningGain'] as num?)?.toDouble() ?? 1e-5,
      velocityGain: (json['velocityGain'] as num?)?.toDouble() ?? 1.3,
    );

Map<String, dynamic> _$$StanleyParametersImplToJson(
        _$StanleyParametersImpl instance) =>
    <String, dynamic>{
      'crossDistanceGain': instance.crossDistanceGain,
      'softeningGain': instance.softeningGain,
      'velocityGain': instance.velocityGain,
    };
