// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pure_pursuit_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurePursuitParameters _$PurePursuitParametersFromJson(
  Map<String, dynamic> json,
) => _PurePursuitParameters(
  lookAheadMinDistance:
      (json['lookAheadMinDistance'] as num?)?.toDouble() ?? 0.75,
  lookAheadSeconds: (json['lookAheadSeconds'] as num?)?.toDouble() ?? 1,
);

Map<String, dynamic> _$PurePursuitParametersToJson(
  _PurePursuitParameters instance,
) => <String, dynamic>{
  'lookAheadMinDistance': instance.lookAheadMinDistance,
  'lookAheadSeconds': instance.lookAheadSeconds,
};
