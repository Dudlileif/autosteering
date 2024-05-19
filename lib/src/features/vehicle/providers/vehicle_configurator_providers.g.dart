// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_configurator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
