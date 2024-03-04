import 'package:autosteering/src/features/vehicle/models/pid_controller/pid_controller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pid_parameters.freezed.dart';
part 'pid_parameters.g.dart';

/// A class for encompassing the gain parameters for a [PidController].
@freezed
class PidParameters with _$PidParameters {
  /// A class for encompassing the gain parameters for a [PidController].
  ///
  /// [p] is the proportional gain.
  /// [i] is the integral gain.
  /// [d] is the derivative gain.
  const factory PidParameters({
    /// Proportional gain.
    @Default(20) double p,

    /// Integral gain.
    @Default(0.130) double i,

    /// Derivative gain.
    @Default(0.063) double d,
  }) = _PidParameters;

  /// Creates a [PidParameters] object from the [json] object.
  factory PidParameters.fromJson(Map<String, Object?> json) =>
      _$PidParametersFromJson(json);
}
