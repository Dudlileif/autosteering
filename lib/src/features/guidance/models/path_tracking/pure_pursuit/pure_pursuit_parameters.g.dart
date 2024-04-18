// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pure_pursuit_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurePursuitParametersImpl _$$PurePursuitParametersImplFromJson(
        Map<String, dynamic> json) =>
    _$PurePursuitParametersImpl(
      lookAheadMinDistance:
          (json['lookAheadMinDistance'] as num?)?.toDouble() ?? 0.75,
      lookAheadSeconds: (json['lookAheadSeconds'] as num?)?.toDouble() ?? 1,
    );

Map<String, dynamic> _$$PurePursuitParametersImplToJson(
        _$PurePursuitParametersImpl instance) =>
    <String, dynamic>{
      'lookAheadMinDistance': instance.lookAheadMinDistance,
      'lookAheadSeconds': instance.lookAheadSeconds,
    };
