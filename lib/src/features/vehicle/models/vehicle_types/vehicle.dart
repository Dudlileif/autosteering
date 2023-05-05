import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/// A base class for vehicles that handles all common parameters/variables
/// and methods.
abstract class Vehicle extends Equatable {
  const Vehicle({
    required this.position,
    required this.antennaHeight,
    required this.minTurningRadius,
    required this.steeringAngleMax,
    required this.trackWidth,
    this.invertSteeringInput = false,
    this.velocity = 0,
    this.heading = 0,
    this.steeringAngleInput = 0,
    this.length = 4,
    this.width = 2.5,
    this.acceleration = 0,
    this.simulated = false,
  });

  /// Antenna position of the vehicle. Assumed centered in the
  /// width dimension of the vehicle.
  final LatLng position;

  /// The height of the antenna above the ground, in meters.
  final double antennaHeight;

  /// The distance between the center of the wheels on the solid axle.
  final double trackWidth;

  /// The best/minimum turning radius, in meters.
  final double minTurningRadius;

  /// The maximum angle that the steering wheels can turn, in degrees.
  final double steeringAngleMax;

  /// The heading of the vehicle, in degrees.
  final double heading;

  /// This is the Ackermann input angle, imagined to be on the middle of
  /// the steering axle, as if the vehicle only had one center
  /// steering wheel.
  final double steeringAngleInput;

  /// Whether the [steeringAngleInput] should be inverted.
  final bool invertSteeringInput;

  /// The velocity of the vehicle, in m/s, meters per second, in the heading
  /// direction.
  final double velocity;

  /// The acceleration of the vehicle, in m/s^2, in the heading direction.
  final double acceleration;

  /// The length of the vehicle, in meters.
  final double length;

  /// The width of the vehicle, in meters.
  final double width;

  /// Whether the vehicle is simulated.
  final bool simulated;

  /// Geo-calculator used to calculate offsets.
  static const distance = Distance(roundResult: false);

  // Reqiure wheel angle above 1 deg when using simulator, 0.01 deg otherwise.
  // This is due to some error at low angle calculation, which could
  // give wrong movement.
  double get minSteeringAngle => simulated ? 1 : 0.01;

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

  /// Polygons for drawing the wheels of the vehicle.
  List<Polygon> get wheelPolygons;

  /// The turning radius corresponding to the current [steeringAngle].
  double? get currentTurningRadius;

  /// The center point of which the [currentTurningRadius] revolves around.
  LatLng? get turningRadiusCenter;

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
  bool get isReversing => velocity < 0;

  /// Whether the vehicle is turning to the left,
  /// otherwise assumed turning to the right.
  bool get isTurningLeft => steeringAngle < 0;

  /// Polygons for visualizing the extent of the vehicle.
  List<Polygon> get polygons;

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
        heading,
        steeringAngleInput,
        length,
        width,
        acceleration,
        simulated,
      ];

  /// Returns a new [Vehicle] based on the this one, but with
  /// parameters/variables altered.
  Vehicle copyWith({
    LatLng? position,
    double? antennaHeight,
    double? minTurningRadius,
    double? steeringAngleMax,
    double? trackWidth,
    bool? invertSteeringInput,
    double? velocity,
    double? heading,
    double? steeringAngleInput,
    double? length,
    double? width,
    double? acceleration,
    bool? simulated,
  });
}
