part of 'pid_controller.dart';

/// A class for encompassing the gain parameters for a [PidController].
class PidParameters extends Equatable {
  /// A class for encompassing the gain parameters for a [PidController].
  ///
  /// [p] is the proportional gain.
  /// [i] is the integral gain.
  /// [d] is the derivative gain.
  const PidParameters({
    required this.p,
    required this.i,
    required this.d,
  });

  /// Proportional gain.
  final double p;

  /// Integral gain.
  final double i;

  /// Derivative gain.
  final double d;

  /// Returns a new [PidParameters] from this with altered parameters.
  PidParameters copyWith({double? p, double? i, double? d}) =>
      PidParameters(p: p ?? this.p, i: i ?? this.i, d: d ?? this.d);

  /// A list of objects to check for equatability.
  @override
  List<Object?> get props => [p, i, d];
}
