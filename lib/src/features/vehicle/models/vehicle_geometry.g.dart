// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_geometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AxleSteeredVehicleGeometry _$AxleSteeredVehicleGeometryFromJson(
  Map<String, dynamic> json,
) => AxleSteeredVehicleGeometry(
  length: (json['length'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  minTurningRadius: (json['minTurningRadius'] as num).toDouble(),
  steeringAngleMax: (json['steeringAngleMax'] as num).toDouble(),
  trackWidth: (json['trackWidth'] as num).toDouble(),
  wheelBase: (json['wheelBase'] as num).toDouble(),
  steeringAxleWheelDiameter: (json['steeringAxleWheelDiameter'] as num)
      .toDouble(),
  solidAxleWheelDiameter: (json['solidAxleWheelDiameter'] as num).toDouble(),
  steeringAxleWheelWidth: (json['steeringAxleWheelWidth'] as num).toDouble(),
  solidAxleWheelWidth: (json['solidAxleWheelWidth'] as num).toDouble(),
  solidAxleToFrontDistance: (json['solidAxleToFrontDistance'] as num)
      .toDouble(),
  solidAxleToFrontHitchDistance: (json['solidAxleToFrontHitchDistance'] as num?)
      ?.toDouble(),
  solidAxleToRearHitchDistance: (json['solidAxleToRearHitchDistance'] as num?)
      ?.toDouble(),
  solidAxleToRearDrawbarDistance:
      (json['solidAxleToRearDrawbarDistance'] as num?)?.toDouble(),
  wheelSpacing: (json['wheelSpacing'] as num?)?.toDouble() ?? 0.05,
  numWheels: (json['numWheels'] as num?)?.toInt() ?? 1,
  ackermannSteeringRatio:
      (json['ackermannSteeringRatio'] as num?)?.toDouble() ?? 1,
  ackermannPercentage: (json['ackermannPercentage'] as num?)?.toDouble() ?? 100,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$AxleSteeredVehicleGeometryToJson(
  AxleSteeredVehicleGeometry instance,
) => <String, dynamic>{
  'length': instance.length,
  'width': instance.width,
  'minTurningRadius': instance.minTurningRadius,
  'steeringAngleMax': instance.steeringAngleMax,
  'trackWidth': instance.trackWidth,
  'wheelBase': instance.wheelBase,
  'steeringAxleWheelDiameter': instance.steeringAxleWheelDiameter,
  'solidAxleWheelDiameter': instance.solidAxleWheelDiameter,
  'steeringAxleWheelWidth': instance.steeringAxleWheelWidth,
  'solidAxleWheelWidth': instance.solidAxleWheelWidth,
  'solidAxleToFrontDistance': instance.solidAxleToFrontDistance,
  'solidAxleToFrontHitchDistance': instance.solidAxleToFrontHitchDistance,
  'solidAxleToRearHitchDistance': instance.solidAxleToRearHitchDistance,
  'solidAxleToRearDrawbarDistance': instance.solidAxleToRearDrawbarDistance,
  'wheelSpacing': instance.wheelSpacing,
  'numWheels': instance.numWheels,
  'ackermannSteeringRatio': instance.ackermannSteeringRatio,
  'ackermannPercentage': instance.ackermannPercentage,
  'type': instance.$type,
};

ArticulatedVehicleGeometry _$ArticulatedVehicleGeometryFromJson(
  Map<String, dynamic> json,
) => ArticulatedVehicleGeometry(
  length: (json['length'] as num).toDouble(),
  width: (json['width'] as num).toDouble(),
  minTurningRadius: (json['minTurningRadius'] as num).toDouble(),
  steeringAngleMax: (json['steeringAngleMax'] as num).toDouble(),
  trackWidth: (json['trackWidth'] as num).toDouble(),
  pivotToFrontAxle: (json['pivotToFrontAxle'] as num).toDouble(),
  pivotToRearAxle: (json['pivotToRearAxle'] as num).toDouble(),
  frontAxleToFrontDistance: (json['frontAxleToFrontDistance'] as num)
      .toDouble(),
  rearAxleToHitchDistance: (json['rearAxleToHitchDistance'] as num).toDouble(),
  rearAxleToDrawbarDistance: (json['rearAxleToDrawbarDistance'] as num)
      .toDouble(),
  rearAxleToEndDistance: (json['rearAxleToEndDistance'] as num).toDouble(),
  wheelDiameter: (json['wheelDiameter'] as num).toDouble(),
  wheelWidth: (json['wheelWidth'] as num).toDouble(),
  frontAxleToHitchDistance: (json['frontAxleToHitchDistance'] as num?)
      ?.toDouble(),
  wheelSpacing: (json['wheelSpacing'] as num?)?.toDouble() ?? 0.05,
  numWheels: (json['numWheels'] as num?)?.toInt() ?? 1,
  $type: json['type'] as String?,
);

Map<String, dynamic> _$ArticulatedVehicleGeometryToJson(
  ArticulatedVehicleGeometry instance,
) => <String, dynamic>{
  'length': instance.length,
  'width': instance.width,
  'minTurningRadius': instance.minTurningRadius,
  'steeringAngleMax': instance.steeringAngleMax,
  'trackWidth': instance.trackWidth,
  'pivotToFrontAxle': instance.pivotToFrontAxle,
  'pivotToRearAxle': instance.pivotToRearAxle,
  'frontAxleToFrontDistance': instance.frontAxleToFrontDistance,
  'rearAxleToHitchDistance': instance.rearAxleToHitchDistance,
  'rearAxleToDrawbarDistance': instance.rearAxleToDrawbarDistance,
  'rearAxleToEndDistance': instance.rearAxleToEndDistance,
  'wheelDiameter': instance.wheelDiameter,
  'wheelWidth': instance.wheelWidth,
  'frontAxleToHitchDistance': instance.frontAxleToHitchDistance,
  'wheelSpacing': instance.wheelSpacing,
  'numWheels': instance.numWheels,
  'type': instance.$type,
};
