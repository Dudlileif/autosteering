part of '../path_tracking.dart';

/// A class for encompassing the gains for [StanleyPathTracking].
class StanleyParameters extends Equatable {
  /// A class for encompassing the gains for [StanleyPathTracking].
  ///
  /// [crossDistanceGain] is the cross distance gain gain.
  /// [softeningGain] is the softening gain for low speeds, it
  /// helps keeping numerical stability when v -> 0.
  /// [velocityGain] is the gain for how much the velocity
  /// should reduce cross distance part of the equation.
  const StanleyParameters({
    this.crossDistanceGain = 1.5,
    this.softeningGain = 1e-5,
    this.velocityGain = 1.3,
  });

  /// A factory constructor that takes an input map of the form:
  ///
  /// ```
  /// {
  ///   'cross_distance_gain': 1.5,
  ///   'softening_gain': 1e-5,
  ///   'velocity_gain': 1.3,
  /// }
  /// ```
  factory StanleyParameters.fromJson(Map<String, dynamic> json) =>
      StanleyParameters(
        crossDistanceGain: json['cross_distance_gain'] as double,
        softeningGain: json['softening_gain'] as double,
        velocityGain: json['velocity_gain'] as double,
      );

  /// Proportional cross distance gain coefficient.
  final double crossDistanceGain;

  /// The coefficient to ensure numerical stability when v -> 0.
  final double softeningGain;

  /// Proportional coefficient for how much the velocity should alter the
  /// steering angle.
  final double velocityGain;

  /// Returns a new [StanleyParameters] from this with altered parameters.
  StanleyParameters copyWith({
    double? crossDistanceGain,
    double? softeningGain,
    double? velocityGain,
  }) =>
      StanleyParameters(
        crossDistanceGain: crossDistanceGain ?? this.crossDistanceGain,
        softeningGain: softeningGain ?? this.softeningGain,
        velocityGain: velocityGain ?? this.velocityGain,
      );

  /// A list of objects to check for equatability.
  @override
  List<Object?> get props => [crossDistanceGain, softeningGain, velocityGain];

  /// A json compatible serialization of this class.
  Map<String, dynamic> toJson() => {
        'cross_distance_gain': crossDistanceGain,
        'softening_gain': softeningGain,
        'velocity_gain': velocityGain,
      };
}
