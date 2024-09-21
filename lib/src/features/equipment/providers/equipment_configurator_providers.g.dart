// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_configurator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$configuredEquipmentHash() =>
    r'b7c8ba36e74c11777dea123a17b281783100b62b';

/// A provider for the equipment from the configurator.
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
String _$configuredEquipmentEqualWidthsHash() =>
    r'97bb66816bf1ac7fedec51b4edf0dd504e61f845';

/// A provider for whether the configured equipment sections should have equal
/// widths.
///
/// Copied from [ConfiguredEquipmentEqualWidths].
@ProviderFor(ConfiguredEquipmentEqualWidths)
final configuredEquipmentEqualWidthsProvider =
    AutoDisposeNotifierProvider<ConfiguredEquipmentEqualWidths, bool>.internal(
  ConfiguredEquipmentEqualWidths.new,
  name: r'configuredEquipmentEqualWidthsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredEquipmentEqualWidthsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredEquipmentEqualWidths = AutoDisposeNotifier<bool>;
String _$configuredEquipmentEqualWorkingWidthsHash() =>
    r'bf903cff7cceae18776df42c40ae3fe822263ce6';

/// A provider for whether the configured equipment sections should have equal
/// working widths.
///
/// Copied from [ConfiguredEquipmentEqualWorkingWidths].
@ProviderFor(ConfiguredEquipmentEqualWorkingWidths)
final configuredEquipmentEqualWorkingWidthsProvider =
    AutoDisposeNotifierProvider<ConfiguredEquipmentEqualWorkingWidths,
        bool>.internal(
  ConfiguredEquipmentEqualWorkingWidths.new,
  name: r'configuredEquipmentEqualWorkingWidthsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredEquipmentEqualWorkingWidthsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredEquipmentEqualWorkingWidths = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
