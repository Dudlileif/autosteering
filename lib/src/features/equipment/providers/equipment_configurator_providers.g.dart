// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_configurator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the index of the naviagtion rail of the equipment
/// configurator dialog.

@ProviderFor(EquipmentConfiguratorIndex)
final equipmentConfiguratorIndexProvider =
    EquipmentConfiguratorIndexProvider._();

/// A provider for the index of the naviagtion rail of the equipment
/// configurator dialog.
final class EquipmentConfiguratorIndexProvider
    extends $NotifierProvider<EquipmentConfiguratorIndex, int> {
  /// A provider for the index of the naviagtion rail of the equipment
  /// configurator dialog.
  EquipmentConfiguratorIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'equipmentConfiguratorIndexProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$equipmentConfiguratorIndexHash();

  @$internal
  @override
  EquipmentConfiguratorIndex create() => EquipmentConfiguratorIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$equipmentConfiguratorIndexHash() =>
    r'9cbbea135c7f306ffcbe0bfc379b5e39826de238';

/// A provider for the index of the naviagtion rail of the equipment
/// configurator dialog.

abstract class _$EquipmentConfiguratorIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the equipment from the configurator.

@ProviderFor(ConfiguredEquipment)
final configuredEquipmentProvider = ConfiguredEquipmentProvider._();

/// A provider for the equipment from the configurator.
final class ConfiguredEquipmentProvider
    extends $NotifierProvider<ConfiguredEquipment, Equipment> {
  /// A provider for the equipment from the configurator.
  ConfiguredEquipmentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredEquipmentProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredEquipmentHash();

  @$internal
  @override
  ConfiguredEquipment create() => ConfiguredEquipment();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Equipment value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Equipment>(value),
    );
  }
}

String _$configuredEquipmentHash() =>
    r'b7c8ba36e74c11777dea123a17b281783100b62b';

/// A provider for the equipment from the configurator.

abstract class _$ConfiguredEquipment extends $Notifier<Equipment> {
  Equipment build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Equipment, Equipment>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Equipment, Equipment>,
              Equipment,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether the configured equipment sections should have equal
/// widths.

@ProviderFor(ConfiguredEquipmentEqualWidths)
final configuredEquipmentEqualWidthsProvider =
    ConfiguredEquipmentEqualWidthsProvider._();

/// A provider for whether the configured equipment sections should have equal
/// widths.
final class ConfiguredEquipmentEqualWidthsProvider
    extends $NotifierProvider<ConfiguredEquipmentEqualWidths, bool> {
  /// A provider for whether the configured equipment sections should have equal
  /// widths.
  ConfiguredEquipmentEqualWidthsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredEquipmentEqualWidthsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredEquipmentEqualWidthsHash();

  @$internal
  @override
  ConfiguredEquipmentEqualWidths create() => ConfiguredEquipmentEqualWidths();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$configuredEquipmentEqualWidthsHash() =>
    r'587d2d05d483ac9fab17d49a6b5433a1d058d73a';

/// A provider for whether the configured equipment sections should have equal
/// widths.

abstract class _$ConfiguredEquipmentEqualWidths extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for whether the configured equipment sections should have equal
/// working widths.

@ProviderFor(ConfiguredEquipmentEqualWorkingWidths)
final configuredEquipmentEqualWorkingWidthsProvider =
    ConfiguredEquipmentEqualWorkingWidthsProvider._();

/// A provider for whether the configured equipment sections should have equal
/// working widths.
final class ConfiguredEquipmentEqualWorkingWidthsProvider
    extends $NotifierProvider<ConfiguredEquipmentEqualWorkingWidths, bool> {
  /// A provider for whether the configured equipment sections should have equal
  /// working widths.
  ConfiguredEquipmentEqualWorkingWidthsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredEquipmentEqualWorkingWidthsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$configuredEquipmentEqualWorkingWidthsHash();

  @$internal
  @override
  ConfiguredEquipmentEqualWorkingWidths create() =>
      ConfiguredEquipmentEqualWorkingWidths();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$configuredEquipmentEqualWorkingWidthsHash() =>
    r'c3ed65aa2db23fb876a07abedfe86381791fbeee';

/// A provider for whether the configured equipment sections should have equal
/// working widths.

abstract class _$ConfiguredEquipmentEqualWorkingWidths extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
