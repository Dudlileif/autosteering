// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_configurator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadFileConfiguredEquipmentHash() =>
    r'2c50b664e21f4cce3943c07b540c4934dc834834';

/// A provider for loading a vehicle configuration from the user file directory
/// and applying it to the [ConfiguredEquipment] provider.
///
/// Copied from [loadFileConfiguredEquipment].
@ProviderFor(loadFileConfiguredEquipment)
final loadFileConfiguredEquipmentProvider =
    AutoDisposeProvider<AsyncValue<Equipment?>>.internal(
  loadFileConfiguredEquipment,
  name: r'loadFileConfiguredEquipmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadFileConfiguredEquipmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoadFileConfiguredEquipmentRef
    = AutoDisposeProviderRef<AsyncValue<Equipment?>>;
String _$equipmentConfiguratorIndexHash() =>
    r'9cbbea135c7f306ffcbe0bfc379b5e39826de238';

/// A provider for the index of the naviagtion rail of the equipment
/// configurator dialog.
///
/// Copied from [EquipmentConfiguratorIndex].
@ProviderFor(EquipmentConfiguratorIndex)
final equipmentConfiguratorIndexProvider =
    NotifierProvider<EquipmentConfiguratorIndex, int>.internal(
  EquipmentConfiguratorIndex.new,
  name: r'equipmentConfiguratorIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$equipmentConfiguratorIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EquipmentConfiguratorIndex = Notifier<int>;
String _$equipmentConfiguratorPageControllerHash() =>
    r'fb9ff60b4db6d3371e94b5cf7219ea525f36a214';

/// A provider for creating a [PageController] for using throughout the
/// [EquipmentConfigurator].
///
/// Copied from [EquipmentConfiguratorPageController].
@ProviderFor(EquipmentConfiguratorPageController)
final equipmentConfiguratorPageControllerProvider = AutoDisposeNotifierProvider<
    EquipmentConfiguratorPageController, Raw<PageController>>.internal(
  EquipmentConfiguratorPageController.new,
  name: r'equipmentConfiguratorPageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$equipmentConfiguratorPageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EquipmentConfiguratorPageController
    = AutoDisposeNotifier<Raw<PageController>>;
String _$configuredEquipmentHash() =>
    r'd6fcdb2c7a05e34cfc6c8202508159aa8b1f5ee1';

/// A provider for the vehicle from the configurator.
///
/// Copied from [ConfiguredEquipment].
@ProviderFor(ConfiguredEquipment)
final configuredEquipmentProvider =
    NotifierProvider<ConfiguredEquipment, Equipment>.internal(
  ConfiguredEquipment.new,
  name: r'configuredEquipmentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredEquipmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredEquipment = Notifier<Equipment>;
String _$configuredEquipmentNameTextControllerHash() =>
    r'3878676ff2f7f2bd83325e00081e17499463cbd4';

/// A provider for the [TextEditingController] for the name in the
/// equipment configurator.
///
/// Copied from [ConfiguredEquipmentNameTextController].
@ProviderFor(ConfiguredEquipmentNameTextController)
final configuredEquipmentNameTextControllerProvider = NotifierProvider<
    ConfiguredEquipmentNameTextController, Raw<TextEditingController>>.internal(
  ConfiguredEquipmentNameTextController.new,
  name: r'configuredEquipmentNameTextControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredEquipmentNameTextControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredEquipmentNameTextController
    = Notifier<Raw<TextEditingController>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
