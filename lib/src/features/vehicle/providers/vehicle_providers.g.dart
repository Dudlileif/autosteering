// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainVehicleHash() => r'13866f0760c5b44c4adcf7dd1a06aaf61578a3c9';

/// The main provider for the vehicle state.
///
/// Copied from [MainVehicle].
@ProviderFor(MainVehicle)
final mainVehicleProvider = NotifierProvider<MainVehicle, Vehicle>.internal(
  MainVehicle.new,
  name: r'mainVehicleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mainVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainVehicle = Notifier<Vehicle>;
String _$vehicleTravelledDistanceHash() =>
    r'6a316e0c90297686a35761fd5e29de66cb214254';

/// A provider for the distance travelled by the vehicle.
///
/// Copied from [VehicleTravelledDistance].
@ProviderFor(VehicleTravelledDistance)
final vehicleTravelledDistanceProvider =
    AutoDisposeNotifierProvider<VehicleTravelledDistance, double>.internal(
  VehicleTravelledDistance.new,
  name: r'vehicleTravelledDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleTravelledDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehicleTravelledDistance = AutoDisposeNotifier<double>;
String _$vehicleVelocityHash() => r'28b83020d7c59ceb0ed8e2098344c48249c608fe';

/// A provider for the vehicle's velocity gauge.
///
/// Copied from [VehicleVelocity].
@ProviderFor(VehicleVelocity)
final vehicleVelocityProvider =
    AutoDisposeNotifierProvider<VehicleVelocity, double>.internal(
  VehicleVelocity.new,
  name: r'vehicleVelocityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleVelocityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehicleVelocity = AutoDisposeNotifier<double>;
String _$vehicleHeadingHash() => r'8d735c55694e84dd953388bf76a895d61845f23c';

/// A provider for the vehicle's heading gauge.
///
/// Copied from [VehicleHeading].
@ProviderFor(VehicleHeading)
final vehicleHeadingProvider =
    AutoDisposeNotifierProvider<VehicleHeading, double>.internal(
  VehicleHeading.new,
  name: r'vehicleHeadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleHeadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehicleHeading = AutoDisposeNotifier<double>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
