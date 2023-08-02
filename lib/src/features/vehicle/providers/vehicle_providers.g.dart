// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainVehicleHash() => r'81ef89c0875797227d48ba861117365ed1af4161';

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
    r'8f56b17e4d80d300688beea21c377223b368fa0a';

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
String _$vehicleBearingHash() => r'3631ee582bf4d5a582f69897529d4aba141f61ab';

/// A provider for the vehicle's bearing gauge.
///
/// Copied from [VehicleBearing].
@ProviderFor(VehicleBearing)
final vehicleBearingProvider =
    AutoDisposeNotifierProvider<VehicleBearing, double>.internal(
  VehicleBearing.new,
  name: r'vehicleBearingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleBearingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehicleBearing = AutoDisposeNotifier<double>;
String _$autoSteerEnabledHash() => r'491f89abd6aa83fa8ef8a6fb8c79430e99631e54';

/// A provider for whether the vehicle should steer automatically.
///
/// Copied from [AutoSteerEnabled].
@ProviderFor(AutoSteerEnabled)
final autoSteerEnabledProvider =
    NotifierProvider<AutoSteerEnabled, bool>.internal(
  AutoSteerEnabled.new,
  name: r'autoSteerEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autoSteerEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AutoSteerEnabled = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
