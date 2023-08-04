import 'dart:math';

import 'package:agopengps_flutter/src/features/common/common.dart';
import 'package:agopengps_flutter/src/features/guidance/guidance.dart';
import 'package:agopengps_flutter/src/features/hitching/hitching.dart';
import 'package:agopengps_flutter/src/features/vehicle/vehicle.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart' as map;
import 'package:geobase/geobase.dart';
import 'package:latlong2/latlong.dart';

part 'vehicle_types/articulated_tractor.dart';
part 'vehicle_types/axle_steered_vehicle.dart';
part 'vehicle_types/harvester.dart';
part 'vehicle_types/tractor.dart';

/// A base class for vehicles that handles all common parameters/variables
/// and methods.
sealed class Vehicle extends Hitchable with EquatableMixin {
  /// A base class for vehicles that handles all common parameters/variables
  /// and methods.
  Vehicle({
    required Geographic position,
    required this.antennaHeight,
    required this.minTurningRadius,
    required this.steeringAngleMax,
    required this.trackWidth,
    required this.pidParameters,
    this.invertSteeringInput = false,
    this.steeringAngleInput = 0,
    this.length = 4,
    this.width = 2.5,
    this.simulated = false,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
    double bearing = 0,
    double velocity = 0,
  })  : _bearing = bearing,
        _velocity = velocity,
        _position = position;

  /// Antenna position of the vehicle. Assumed centered in the
  /// width dimension of the vehicle.
  Geographic _position;

  /// The height of the antenna above the ground, in meters.
  double antennaHeight;

  /// The distance between the center of the wheels on the solid axle.
  double trackWidth;

  /// The best/minimum turning radius, in meters.
  double minTurningRadius;

  /// The maximum angle that the steering wheels/pivot can turn, in degrees.
  double steeringAngleMax;

  /// This is the Ackermann input angle or the angle of the articulation for an
  /// articulated tractor.
  double steeringAngleInput;

  /// Whether the [steeringAngleInput] should be inverted.
  bool invertSteeringInput;

  /// The PID parameters for controlling the steering of this vehicle
  /// with
  PidParameters pidParameters;

  /// The velocity of the vehicle as set from the outside.
  double _velocity;

  /// The length of the vehicle, in meters.
  double length;

  /// The width of the vehicle, in meters.
  double width;

  /// Whether the vehicle is simulated.
  bool simulated;

  /// Bearing as set from the outside.
  double _bearing = 0;

  @override
  Geographic get position => _position;

  @override
  set position(Geographic value) => _position = value;

  /// The velocity of the vehicle, in m/s, meters per second, in the bearing
  /// direction.
  @override
  double get velocity => _velocity;

  /// Update the velocity of the vehicle.
  @override
  set velocity(double value) => _velocity = value;

  /// The bearing of the vehicle, in degrees.
  @override
  double get bearing => _bearing;

  /// Update the bearing of the vehicle, [value] in degrees.
  @override
  set bearing(double value) => _bearing = value;

  /// The distance between the wheel axles.
  double get wheelBase;

  /// Where the look ahead distance calculation should start.
  Geographic get lookAheadStartPosition;

  /// A [WayPoint] for the vehicle in it's current state, i.e. position, bearing
  /// and velocity.
  WayPoint get wayPoint => WayPoint(
        position: position,
        bearing: bearing,
        velocity: velocity,
      );

  /// Reqiure wheel angle above 0.01 deg.
  double get minSteeringAngle => 0.01;

  /// The [steeringAngleInput] accounted for [invertSteeringInput] and
  /// [minSteeringAngle].
  double get steeringAngle =>
      switch (steeringAngleInput.abs() > minSteeringAngle) {
        true => switch (invertSteeringInput) {
            true => -steeringAngleInput,
            false => steeringAngleInput,
          },
        false => 0,
      };

  /// The position of the pursuit axle in the the vehicle direction. Used when
  /// calculating the pure pursuit values.
  Geographic get pursuitAxlePosition;

  /// Basic circle markers for showing the vehicle's steering related
  /// points.
  List<map.CircleMarker> get steeringDebugMarkers;

  /// Basic polylines for showing the vehicle's steering related
  /// points.
  List<map.Polyline> get steeringDebugLines;

  /// Polygons for drawing the wheels of the vehicle.
  List<map.Polygon> get wheelPolygons;

  /// The turning radius corresponding to the current [steeringAngle].
  double? get currentTurningRadius;

  /// The center point of which the [currentTurningRadius] revolves around.
  Geographic? get turningRadiusCenter;

  /// The angular velocity of the vehicle, if it is turning.
  /// degrees/s, does not care about clockwise/counter-clockwise direction.
  double? get angularVelocity => currentTurningRadius != null
      ? (velocity / (2 * pi * currentTurningRadius!)) * 360
      : null;

  /// The projected trajectory for the moving vehicle.
  ///
  /// Based on the current [steeringAngle], [velocity] and
  /// [currentTurningRadius].
  Path get trajectory;

  /// Whether the vehicle is reversing or not.
  @override
  bool get isReversing => velocity < 0;

  /// Whether the vehicle is turning to the left,
  /// otherwise assumed turning to the right.
  bool get isTurningLeft => steeringAngle < 0;

  /// Polygons for visualizing the extent of the vehicle.
  List<map.Polygon> get polygons;

  /// Props used for checking for equality.
  @override
  List<Object> get props => [
        position,
        antennaHeight,
        minTurningRadius,
        steeringAngleMax,
        trackWidth,
        invertSteeringInput,
        velocity,
        bearing,
        steeringAngleInput,
        length,
        width,
        simulated,
      ];

  /// Returns a new [Vehicle] based on this one, but with
  /// parameters/variables altered.
  @override
  Vehicle copyWith({
    Geographic? position,
    double? antennaHeight,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    bool? invertSteeringInput,
    PidParameters? pidParameters,
    double? velocity,
    double? bearing,
    double? steeringAngleInput,
    double? length,
    double? width,
    bool? simulated,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    String? name,
  });
}
