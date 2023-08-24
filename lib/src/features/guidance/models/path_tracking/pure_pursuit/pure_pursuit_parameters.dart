part of '../path_tracking.dart';

/// A class for encompassing the coefficients for [PurePursuitPathTracking].
class PurePursuitParameters extends Equatable {
  /// A class for encompassing the coefficients for [PurePursuitPathTracking].
  ///
  /// [lookAheadDistance] is how far ahead the vehicle should look for a
  /// point to chase.
  ///
  /// [lookAheadVelocityGain] is the coefficient for how much the vehicle's
  /// velocity should add to the [lookAheadDistance].
  const PurePursuitParameters({
    this.lookAheadDistance = 4.0,
    this.lookAheadVelocityGain = 0.5,
  });

  /// A factory constructor that takes an input map of the form:
  ///
  /// ```
  /// {
  ///   'look_ahead_distance': 4,
  ///   'look_ahead_velocity_gain': 0.5,
  /// }
  /// ```
  factory PurePursuitParameters.fromJson(Map<String, dynamic> json) =>
      PurePursuitParameters(
        lookAheadDistance: json['look_ahead_distance'] as double,
        lookAheadVelocityGain: json['look_ahead_velocity_gain'] as double,
      );

  /// How far ahead the vehicle should look for a point to chase.
  final double lookAheadDistance;

  /// Proportional gain coefficient for how much the velocity should add to the
  /// [lookAheadDistance].
  final double lookAheadVelocityGain;

  /// Returns a new [PurePursuitParameters] from this with altered parameters.
  PurePursuitParameters copyWith({
    double? lookAheadDistance,
    double? lookAheadVelocityGain,
  }) =>
      PurePursuitParameters(
        lookAheadDistance: lookAheadDistance ?? this.lookAheadDistance,
        lookAheadVelocityGain:
            lookAheadVelocityGain ?? this.lookAheadVelocityGain,
      );

  /// A list of objects to check for equatability.
  @override
  List<Object?> get props => [lookAheadDistance, lookAheadVelocityGain];

  /// A json compatible serialization of this class.
  Map<String, dynamic> toJson() => {
        'look_ahead_distance': lookAheadDistance,
        'look_ahead_velocity_gain': lookAheadVelocityGain,
      };
}
