import 'dart:collection';
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
    required this.antennaHeight,
    required this.minTurningRadius,
    required this.steeringAngleMax,
    required this.trackWidth,
    this.antennaLateralOffset = 0,
    this.invertSteeringInput = false,
    this.steeringAngleInput = 0,
    this.length = 4,
    this.width = 2.5,
    this.pitch = 0,
    this.roll = 0,
    this.isSimulated = false,
    this.useIMUPitchAndRoll = true,
    super.hitchFrontFixedChild,
    super.hitchRearFixedChild,
    super.hitchRearTowbarChild,
    super.name,
    super.uuid,
    this.pathTrackingMode = PathTrackingMode.purePursuit,
    PidParameters? pidParameters,
    PurePursuitParameters? purePursuitParameters,
    StanleyParameters? stanleyParameters,
    DateTime? lastUsed,
    Geographic position = const Geographic(lon: 0, lat: 0),
    double bearing = 0,
    double velocity = 0,
  })  : _bearing = bearing,
        _velocity = velocity,
        antennaPosition = position,
        pidParameters = pidParameters ?? const PidParameters(),
        stanleyParameters = stanleyParameters ?? const StanleyParameters(),
        purePursuitParameters =
            purePursuitParameters ?? const PurePursuitParameters(),
        lastUsed = lastUsed ?? DateTime.now();

  /// Creates the appropriate [Vehicle] subclass from the [json] object.
  ///
  /// The returned object is one of the following:
  ///
  /// [Tractor] or
  /// [Harvester] or
  /// [ArticulatedTractor]
  factory Vehicle.fromJson(Map<String, dynamic> json) {
    final info = Map<String, dynamic>.from(json['info'] as Map);
    final type = info['type'];
    return switch (type) {
      'Tractor' => Tractor.fromJson(json),
      'Harvester' => Harvester.fromJson(json),
      'Articulated tractor' => ArticulatedTractor.fromJson(json),
      _ => Tractor.fromJson(json),
    };
  }

  /// The last time this vehicle was used.
  DateTime lastUsed;

  /// The height of the antenna above the ground, in meters.
  double antennaHeight;

  /// How much the antenna is offset from the center line of the vehicle
  /// in the forward direction, in meters.
  double antennaLateralOffset;

  /// The distance between the centers of the wheels on the solid axle.
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
  /// when using a PID controller mode.
  PidParameters pidParameters;

  /// Parameters for the [lookAheadDistance] when using a pure pursuit/look
  /// ahead steering mode.
  PurePursuitParameters purePursuitParameters;

  /// The Stanley gain coefficients for controlling the steering of this vehicle
  /// when using a Stanley path tracking steering mode.
  StanleyParameters stanleyParameters;

  /// Which steering mode the path tracking should use.
  PathTrackingMode pathTrackingMode;

  /// The velocity of the vehicle as set from the outside.
  double _velocity;

  /// The length of the vehicle, in meters.
  double length;

  /// The width of the vehicle, in meters.
  double width;

  /// Whether the vehicle is simulated.
  bool isSimulated;

  /// Whether the roll and pitch should affect the [position].
  bool useIMUPitchAndRoll;

  /// The pitch of the vehicle as degrees of inclination around the x-axis
  /// (across) the vehicle in the forward direction.
  double pitch;

  /// The roll of the vehicle as degrees of roll around the y-axis (along) the
  /// vehicle in the forward direction.
  double roll;

  /// Bearing as set from the outside.
  double _bearing = 0;

  /// Antenna position of the vehicle.
  Geographic antennaPosition;

  /// The [antennaPosition] moved to the center line of the vehicle.
  Geographic get centeredAntennaPosition =>
      switch (antennaLateralOffset.abs() > 0) {
        false => antennaPosition,
        true => antennaPosition.spherical.destinationPoint(
            distance: antennaLateralOffset,
            bearing: bearing + 90,
          )
      };

  /// The lateral offset of the the antenna's true ground position to the
  /// mounted position.
  double get antennaRollLateralOffset => sin(roll.toRadians()) * antennaHeight;

  /// The longitudinal offset of the the antenna's true ground position to the
  /// mounted position.
  double get antennaPitchLongitudinalOffset =>
      sin(pitch.toRadians()) * antennaHeight;

  /// The projected ground position of the antenna of this vehicle accounting
  /// for [pitch] and [roll].
  @override
  Geographic get position => switch (useIMUPitchAndRoll) {
        false => antennaPosition,
        true => antennaPosition.spherical
            .destinationPoint(
              distance: antennaRollLateralOffset,
              bearing: bearing - 90,
            )
            .spherical
            .destinationPoint(
              distance: antennaPitchLongitudinalOffset,
              bearing: bearing,
            ),
      };

  @override
  set position(Geographic value) =>
      antennaPosition = switch (useIMUPitchAndRoll) {
        false => value,
        true => value.spherical
            .destinationPoint(
              distance: -antennaRollLateralOffset,
              bearing: bearing - 90,
            )
            .spherical
            .destinationPoint(
              distance: -antennaPitchLongitudinalOffset,
              bearing: bearing,
            )
      };

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

  /// The distance from the ground position to the antenna position.
  double get positionToAntennaDistance =>
      position.spherical.distanceTo(antennaPosition);

  /// The bearing from the ground position to the antenna position.
  double get positionToAntennaBearing =>
      position.spherical.initialBearingTo(antennaPosition);

  /// The distance between the wheel axles.
  double get wheelBase;

  /// Where the look ahead distance calculation should start.
  Geographic get lookAheadStartPosition;

  /// The effective look ahead distance for the vehicle.
  ///
  /// The distance is altered according to [purePursuitParameters].
  double get lookAheadDistance =>
      purePursuitParameters.lookAheadDistance +
      velocity.abs() * purePursuitParameters.lookAheadVelocityGain;

  /// A [WayPoint] for the vehicle in it's current state, i.e. position, bearing
  /// and velocity.
  WayPoint get wayPoint => WayPoint(
        position: position,
        bearing: bearing,
        velocity: velocity,
      );

  /// Reqiure wheel angle above 0.01 deg.
  static const double minSteeringAngle = 0.01;

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

  /// The position of the Stanley axle in the vehicle direction. Used when
  /// calculating Stanley path tracking values.
  Geographic get stanleyAxlePosition;

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

  /// Updates the [position] and [bearing] according to the current [velocity],
  /// [bearing], [steeringAngle] for the next [period] seconds.
  ///
  /// The attached hitch children are then updated with [updateChildren]
  /// afterwards.
  void updatePositionAndBearing(
    double period,
    Geographic? turningCircleCenter,
  ) {
    if (period > 0) {
      if (angularVelocity != null && turningCircleCenter != null) {
        updatePositionAndBearingTurning(period, turningCircleCenter);
      } else if (velocity.abs() > 0) {
        updatePositionStraight(period);
      }
      updateChildren();
    }
  }

  /// Updates the [position] and [bearing] for the next [period] seconds when
  /// turning around [turningCircleCenter], i.e. with a constant
  /// [steeringAngle].
  void updatePositionAndBearingTurning(
    double period,
    Geographic turningCircleCenter,
  );

  /// Updates the [position] for the next [period] seconds when going straight.
  void updatePositionStraight(double period) =>
      position = position.spherical.destinationPoint(
        distance: velocity * period,
        bearing: bearing,
      );

  /// The predicted look ahead axle position and bearing when continuing the
  /// vehicle's movement with [steeringAngle] for a time [period] in seconds.
  ({Geographic position, double bearing}) predictedLookAheadPosition(
    double period,
    double steeringAngle,
  ) {
    if (velocity.abs() > 0) {
      // Turning
      if (steeringAngle.abs() > 0) {
        return predictedLookAheadPositionTurning(period, steeringAngle);
      }

      // Straight
      final newPoint = lookAheadStartPosition.spherical
          .destinationPoint(distance: velocity * period, bearing: bearing);
      final newBearing =
          lookAheadStartPosition.spherical.finalBearingTo(newPoint);
      return (
        position: newPoint,
        bearing: newBearing.isFinite ? newBearing : bearing
      );
    }
    return (position: lookAheadStartPosition, bearing: bearing);
  }

  /// The predicted look ahead axle position and bearing when continuing the
  /// vehicle's movement while turning with [steeringAngle] for a time
  /// [period] in seconds.
  ({Geographic position, double bearing}) predictedLookAheadPositionTurning(
    double period,
    double steeringAngle,
  );

  /// The predicted Stanley axle position and bearing when continuing the
  /// vehicle's movement with [steeringAngle] for a time [period] in seconds.
  ({Geographic position, double bearing}) predictedStanleyPosition(
    double period,
    double steeringAngle,
  ) {
    if (velocity.abs() > 0) {
      // Turning
      if (steeringAngle.abs() > 0) {
        return predictedStanleyPositionTurning(period, steeringAngle);
      }
      // Straight
      final newPoint = stanleyAxlePosition.spherical
          .destinationPoint(distance: velocity * period, bearing: bearing);

      return (position: newPoint, bearing: bearing);
    }
    return (position: stanleyAxlePosition, bearing: bearing);
  }

  /// The predicted Stanley axle position and bearing when continuing the
  /// vehicle's movement while turning with [steeringAngle] for a time
  /// [period] in seconds.
  ({Geographic position, double bearing}) predictedStanleyPositionTurning(
    double period,
    double steeringAngle,
  );

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
        isSimulated,
      ];

  /// Returns a new [Vehicle] based on this one, but with
  /// parameters/variables altered.
  @override
  Vehicle copyWith({
    Geographic? position,
    double? antennaHeight,
    double? antennaLateralOffset,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    bool? invertSteeringInput,
    PathTrackingMode? pathTrackingMode,
    PidParameters? pidParameters,
    PurePursuitParameters? purePursuitParameters,
    StanleyParameters? stanleyParameters,
    double? velocity,
    double? bearing,
    double? steeringAngleInput,
    double? length,
    double? width,
    bool? isSimulated,
    bool? useIMUPitchAndRoll,
    Hitchable? hitchParent,
    Hitchable? hitchFrontFixedChild,
    Hitchable? hitchRearFixedChild,
    Hitchable? hitchRearTowbarChild,
    String? name,
    String? uuid,
  });

  /// Converts the object to a json compatible structure.
  Map<String, dynamic> toJson() {
    final map = SplayTreeMap<String, dynamic>();
    map['info'] = {
      'name': name,
      'uuid': uuid,
      'last_used': lastUsed.toIso8601String(),
    };
    map['antenna'] = {
      'height': antennaHeight,
      'lateral_offset': antennaLateralOffset,
    };
    map['dimensions'] = {
      'length': length,
      'width': width,
      'track_width': trackWidth,
    };

    map['pid_parameters'] = pidParameters;

    map['pure_pursuit_parameters'] = purePursuitParameters;

    map['stanley_parameters'] = stanleyParameters;

    map['steering'] = {
      'invert_steering_input': invertSteeringInput,
      'min_turning_radius': minTurningRadius,
      'path_tracking_mode': pathTrackingMode.name,
      'steering_angle_max': steeringAngleMax,
    };

    return map;
  }
}
