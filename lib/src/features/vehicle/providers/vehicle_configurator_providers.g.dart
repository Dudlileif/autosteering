// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_configurator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadFileConfiguredVehicleHash() =>
    r'384bd3dac75187c0bb5113174af4e267f8c094f3';

/// A provider for loading a vehicle configuration from the user file directory
/// and applying it to the [ConfiguredVehicle] provider.
///
/// Copied from [loadFileConfiguredVehicle].
@ProviderFor(loadFileConfiguredVehicle)
final loadFileConfiguredVehicleProvider =
    AutoDisposeProvider<AsyncValue<Vehicle?>>.internal(
  loadFileConfiguredVehicle,
  name: r'loadFileConfiguredVehicleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadFileConfiguredVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoadFileConfiguredVehicleRef
    = AutoDisposeProviderRef<AsyncValue<Vehicle?>>;
String _$vehicleConfiguratorIndexHash() =>
    r'59eb4552cefea9c3b9faf76807f06d4c9b3fd013';

/// A provider for the index of the naviagtion rail of the vehicle configurator
/// dialog.
///
/// Copied from [VehicleConfiguratorIndex].
@ProviderFor(VehicleConfiguratorIndex)
final vehicleConfiguratorIndexProvider =
    NotifierProvider<VehicleConfiguratorIndex, int>.internal(
  VehicleConfiguratorIndex.new,
  name: r'vehicleConfiguratorIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleConfiguratorIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehicleConfiguratorIndex = Notifier<int>;
String _$vehicleConfiguratorPageControllerHash() =>
    r'80f4df3524b18c93a0873affcda40efb0cb813a1';

/// A provider for creating a [PageController] for using throughout the
/// [VehicleConfigurator].
///
/// Copied from [VehicleConfiguratorPageController].
@ProviderFor(VehicleConfiguratorPageController)
final vehicleConfiguratorPageControllerProvider = AutoDisposeNotifierProvider<
    VehicleConfiguratorPageController, Raw<PageController>>.internal(
  VehicleConfiguratorPageController.new,
  name: r'vehicleConfiguratorPageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$vehicleConfiguratorPageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VehicleConfiguratorPageController
    = AutoDisposeNotifier<Raw<PageController>>;
String _$configuredVehicleHash() => r'eb1f64783782544db4e453b41900d68d6c47a02f';

/// A provider for the vehicle from the configurator.
///
/// Copied from [ConfiguredVehicle].
@ProviderFor(ConfiguredVehicle)
final configuredVehicleProvider =
    NotifierProvider<ConfiguredVehicle, Vehicle>.internal(
  ConfiguredVehicle.new,
  name: r'configuredVehicleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredVehicle = Notifier<Vehicle>;
String _$configuredVehicleNameTextControllerHash() =>
    r'd8b7f016f0a9b03ed341a95fe5cc05009c10a0ed';

/// A provider for the [TextEditingController] for the name in the
/// vehicle configurator.
///
/// Copied from [ConfiguredVehicleNameTextController].
@ProviderFor(ConfiguredVehicleNameTextController)
final configuredVehicleNameTextControllerProvider = NotifierProvider<
    ConfiguredVehicleNameTextController, Raw<TextEditingController>>.internal(
  ConfiguredVehicleNameTextController.new,
  name: r'configuredVehicleNameTextControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredVehicleNameTextControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredVehicleNameTextController
    = Notifier<Raw<TextEditingController>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
