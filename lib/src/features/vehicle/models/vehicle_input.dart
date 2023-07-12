import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'vehicle_input.freezed.dart';
part 'vehicle_input.g.dart';

/// A data class for updating the vehicle/simulator with new input.
@freezed
class VehicleInput with _$VehicleInput {
  /// A data class for updating the vehicle/simulator with new input.
  /// All the entries are optional, so any number of them can be used at once.
  ///
  /// [position] is the position of the vehicle.
  ///
  /// [velocity] is the velocity of the vehicle.
  ///
  /// [velocityDelta] is the change in velocity from current velocity.
  ///
  /// [steeringAngle] is the  steering angle input of the vehicle.
  ///
  /// [steeringAngleDelta] is the change of steering angle of the vehicle from
  /// the current angle.
  const factory VehicleInput({
    /// The position of the vehicle.
    LatLng? position,

    /// The velocity of the vehicle.
    double? velocity,

    /// Change in velocity from current velocity.
    double? velocityDelta,

    /// The steering angle of the vehicle.
    double? steeringAngle,

    /// The change of steering angle of the vehicle from the current angle.
    double? steeringAngleDelta,
  }) = _VehicleInput;

  /// Creates a [VehicleInput] from a [json] object.
  factory VehicleInput.fromJson(Map<String, Object?> json) =>
      _$VehicleInputFromJson(json);
}
