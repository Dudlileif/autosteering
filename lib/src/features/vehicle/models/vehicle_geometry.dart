// Copyright (C) 2026 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_geometry.freezed.dart';
part 'vehicle_geometry.g.dart';

/// A class with parameters for the geometry of a vehicle.
@Freezed(fromJson: true, toJson: true, unionKey: 'type')
sealed class VehicleGeometry with _$VehicleGeometry {
  /// A class with parameters for the geometry of an axle steered vehicle.
  @FreezedUnionValue('axle_steered')
  const factory VehicleGeometry.axleSteered({
    /// The length of the vehicle excluding wheels, in meters.
    required double length,

    /// The width of the vehicle excluding wheels, in meters.
    required double width,

    /// The best/minimum turning radius, in meters.
    required double minTurningRadius,

    /// The maximum angle that the steering wheels can turn, in degrees.
    required double steeringAngleMax,

    /// The distance between the centers of the wheels on the solid axle.
    required double trackWidth,

    /// The distance between the wheel axles.
    required double wheelBase,

    /// The diameter of the steering axle wheels.
    required double steeringAxleWheelDiameter,

    /// The diameter of the solid axle wheels
    required double solidAxleWheelDiameter,

    /// The width of the steering axle wheels.
    required double steeringAxleWheelWidth,

    /// The width of the solid axle wheels.
    required double solidAxleWheelWidth,

    /// The distance from the solid axle position to the frontmost part of the
    /// vehicle, typically the bonnet or the frame.
    ///
    /// Used to draw the vehicle in correct proportions.
    required double solidAxleToFrontDistance,

    /// The distance to the front hitch point from the solid axle.
    double? solidAxleToFrontHitchDistance,

    /// The distance to the rear hitch point from the solid axle.
    double? solidAxleToRearHitchDistance,

    /// The distance to the rear drawbar hitch point from the solid axle.
    double? solidAxleToRearDrawbarDistance,

    /// The distance between the twin/triple etc. wheels.
    @Default(0.05) double wheelSpacing,

    /// The number of wheels, i.e. twin/triples etc...
    @Default(1) int numWheels,

    /// A modifier ratio for the Ackermann central angle. Defaults to 1.
    ///
    /// A higher value will cause a sharper turn, and a lower value a looser
    /// turn.
    ///
    /// ```ackermannAngle = steeringAngleInput / ackermannSteeringRatio```
    @Default(1) double ackermannSteeringRatio,

    /// A modifier to adjust the outside wheel angle by
    /// ```outsideAngle = innerAngle -
    ///   ackermannPercentage*(innerAngle-ackermannAngle)```
    @Default(100) double ackermannPercentage,
  }) = AxleSteeredVehicleGeometry;

  /// A class with parameters for the geometry of an articulated vehicle.
  @FreezedUnionValue('articulated')
  const factory VehicleGeometry.articulated({
    /// The length of the vehicle excluding wheels, in meters.
    required double length,

    /// The width of the vehicle excluding wheels, in meters.
    required double width,

    /// The minimum turning radius of the front axle.
    required double minTurningRadius,

    /// The maximum angle that the steering pivot can turn, in degrees.
    required double steeringAngleMax,

    /// The distance between the centers of the wheels on the rear axle.
    required double trackWidth,

    /// The distance from the vehicle articulation pivot point to the front
    /// axle center position.
    required double pivotToFrontAxle,

    /// The distance from the vehicle articulation pivot point to the rear
    /// axle center position.
    required double pivotToRearAxle,

    /// The distance from the front axle position to the frontmost part of the
    /// vehicle, typically the bonnet or the frame.
    required double frontAxleToFrontDistance,

    /// The distance from the rear axle to the rear fixed hitch point.
    required double rearAxleToHitchDistance,

    /// The distance from the rear axle to the rear drawbar hitch point.
    required double rearAxleToDrawbarDistance,

    /// The distance from the rear axle position to the rearmost part of the
    /// vehicle, excluding hitches, typically wheel fenders.
    required double rearAxleToEndDistance,

    /// The diameter of the wheels.
    required double wheelDiameter,

    /// The width of the wheels.
    required double wheelWidth,

    /// The distance from the front axle to the front fixed hitch point.
    double? frontAxleToHitchDistance,

    /// The distance between the twin/triple etc. wheels.
    @Default(0.05) double wheelSpacing,

    /// The number of wheels, i.e. twin/triples etc...
    @Default(1) int numWheels,
  }) = ArticulatedVehicleGeometry;

  factory VehicleGeometry.fromJson(Map<String, dynamic> json) =>
      _$VehicleGeometryFromJson(json);
}
