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

  /// A factory constructor that takes an input map of the form:
  ///
  /// ```
  /// {'p': 0.5, 'i': 2.7, 'd':0.15}
  /// ```
  factory PidParameters.fromJson(Map<String, dynamic> json) => PidParameters(
        p: json['p'] as double,
        i: json['i'] as double,
        d: json['d'] as double,
      );

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

  /// A json compatible serialization of this class.
  Map<String, dynamic> toJson() => {'p': p, 'i': i, 'd': d};
}
