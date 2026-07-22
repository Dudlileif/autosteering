// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_tracking_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PathTrackingParameters _$PathTrackingParametersFromJson(
  Map<String, dynamic> json,
) => _PathTrackingParameters(
  mode:
      $enumDecodeNullable(_$PathTrackingModeEnumMap, json['mode']) ??
      PathTrackingMode.purePursuit,
  purePursuit: json['purePursuit'] == null
      ? const PurePursuitParameters()
      : PurePursuitParameters.fromJson(
          json['purePursuit'] as Map<String, dynamic>,
        ),
  stanley: json['stanley'] == null
      ? const StanleyParameters()
      : StanleyParameters.fromJson(json['stanley'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PathTrackingParametersToJson(
  _PathTrackingParameters instance,
) => <String, dynamic>{
  'mode': instance.mode,
  'purePursuit': instance.purePursuit,
  'stanley': instance.stanley,
};

const _$PathTrackingModeEnumMap = {
  PathTrackingMode.purePursuit: 'purePursuit',
  PathTrackingMode.stanley: 'stanley',
};
