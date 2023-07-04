// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VehicleInput _$$_VehicleInputFromJson(Map<String, dynamic> json) =>
    _$_VehicleInput(
      position: json['position'] == null
          ? null
          : LatLng.fromJson(json['position'] as Map<String, dynamic>),
      velocity: (json['velocity'] as num?)?.toDouble(),
      velocityDelta: (json['velocityDelta'] as num?)?.toDouble(),
      steeringAngle: (json['steeringAngle'] as num?)?.toDouble(),
      steeringAngleDelta: (json['steeringAngleDelta'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_VehicleInputToJson(_$_VehicleInput instance) =>
    <String, dynamic>{
      'position': instance.position,
      'velocity': instance.velocity,
      'velocityDelta': instance.velocityDelta,
      'steeringAngle': instance.steeringAngle,
      'steeringAngleDelta': instance.steeringAngleDelta,
    };
