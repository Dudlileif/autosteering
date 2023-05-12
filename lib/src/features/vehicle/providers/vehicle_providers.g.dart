// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainVehicleHash() => r'61ec75fcba2ef443709aa528baf8f644a6036732';

/// See also [MainVehicle].
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
    r'7edcf32efb1f7984dfc10d8df6f362d86c7c734d';

/// See also [VehicleTravelledDistance].
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

/// See also [VehicleVelocity].
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

/// See also [VehicleHeading].
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
