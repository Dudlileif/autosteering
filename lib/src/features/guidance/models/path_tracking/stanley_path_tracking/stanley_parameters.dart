part of '../path_tracking.dart';

/// A class for encompassing the coefficients for [StanleyPathTracking].
class StanleyParameters extends Equatable {
  /// A class for encompassing the coefficients for [StanleyPathTracking].
  ///
  /// [crossDistanceCoefficient] is the cross distance gain coefficient.
  /// [softeningCoefficient] is the softening coefficient for low speeds, it
  /// helps keeping numerical stability when v -> 0.
  /// [velocityCoefficient] is the coefficient for how much the velocity
  /// should reduce cross distance part of the equation.
  const StanleyParameters({
    this.crossDistanceCoefficient = 1.5,
    this.softeningCoefficient = 1e-5,
    this.velocityCoefficient = 1.3,
  });

  /// A factory constructor that takes an input map of the form:
  ///
  /// ```
  /// {
  ///   'crossDistanceCoefficient': 1.5,
  ///   'softeningCoefficient': 1e-5,
  ///   'velocityCoefficient': 1.3,
  /// }
  /// ```
  factory StanleyParameters.fromJson(Map<String, dynamic> json) =>
      StanleyParameters(
        crossDistanceCoefficient: json['crossDistanceCoefficient'] as double,
        softeningCoefficient: json['softeningCoefficient'] as double,
        velocityCoefficient: json['velocityCoefficient'] as double,
      );

  /// Proportional cross distance coefficient.
  final double crossDistanceCoefficient;

  /// The coefficient to ensure numerical stability when v -> 0.
  final double softeningCoefficient;

  /// Proportional coefficient for how much the velocity should alter the
  /// steering angle.
  final double velocityCoefficient;

  /// Returns a new [StanleyParameters] from this with altered parameters.
  StanleyParameters copyWith({
    double? crossDistanceCoefficient,
    double? softeningCoefficient,
    double? velocityCoefficient,
  }) =>
      StanleyParameters(
        crossDistanceCoefficient:
            crossDistanceCoefficient ?? this.crossDistanceCoefficient,
        softeningCoefficient: softeningCoefficient ?? this.softeningCoefficient,
        velocityCoefficient: velocityCoefficient ?? this.velocityCoefficient,
      );

  /// A list of objects to check for equatability.
  @override
  List<Object?> get props =>
      [crossDistanceCoefficient, softeningCoefficient, velocityCoefficient];

  /// A json compatible serialization of this class.
  Map<String, dynamic> toJson() => {
        'crossDistanceCoefficient': crossDistanceCoefficient,
        'softeningCoefficient': softeningCoefficient,
        'velocityCoefficient': velocityCoefficient,
      };
}
