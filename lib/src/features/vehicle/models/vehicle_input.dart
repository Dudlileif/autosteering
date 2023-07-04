import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'vehicle_input.freezed.dart';
part 'vehicle_input.g.dart';

/// A data class for updating the vehicle/simulator with new input.
@freezed
class VehicleInput with _$VehicleInput {
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

  factory VehicleInput.fromJson(Map<String, Object?> json) =>
      _$VehicleInputFromJson(json);
}
