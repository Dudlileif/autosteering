import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'vehicle_input.freezed.dart';
part 'vehicle_input.g.dart';

@freezed
class VehicleInput with _$VehicleInput {
  const factory VehicleInput({
    LatLng? position,
    double? velocity,
    double? wheelAngle,
  }) = _VehicleInput;

  factory VehicleInput.fromJson(Map<String, Object?> json) =>
      _$VehicleInputFromJson(json);
}
