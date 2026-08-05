// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'implement_configurator_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the index of the naviagtion rail of the implement
/// configurator dialog.

@ProviderFor(ImplementConfiguratorIndex)
final implementConfiguratorIndexProvider =
    ImplementConfiguratorIndexProvider._();

/// A provider for the index of the naviagtion rail of the implement
/// configurator dialog.
final class ImplementConfiguratorIndexProvider
    extends $NotifierProvider<ImplementConfiguratorIndex, int> {
  /// A provider for the index of the naviagtion rail of the implement
  /// configurator dialog.
  ImplementConfiguratorIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'implementConfiguratorIndexProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$implementConfiguratorIndexHash();

  @$internal
  @override
  ImplementConfiguratorIndex create() => ImplementConfiguratorIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$implementConfiguratorIndexHash() =>
    r'792a5674c7d9d0264ec7f3850f0e962a0fcea53e';

/// A provider for the index of the naviagtion rail of the implement
/// configurator dialog.

abstract class _$ImplementConfiguratorIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the implement from the configurator.

@ProviderFor(ConfiguredImplement)
final configuredImplementProvider = ConfiguredImplementProvider._();

/// A provider for the implement from the configurator.
final class ConfiguredImplementProvider
    extends $NotifierProvider<ConfiguredImplement, Equipment> {
  /// A provider for the implement from the configurator.
  ConfiguredImplementProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredImplementProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredImplementHash();

  @$internal
  @override
  ConfiguredImplement create() => ConfiguredImplement();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Equipment value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Equipment>(value),
    );
  }
}

String _$configuredImplementHash() =>
    r'3ce93b2a806ffbb0bdd0ad2861e12d1642c8a452';

/// A provider for the implement from the configurator.

abstract class _$ConfiguredImplement extends $Notifier<Equipment> {
  Equipment build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Equipment, Equipment>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Equipment, Equipment>,
              Equipment,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether the configured equipment sections should have equal
/// widths.

@ProviderFor(ConfiguredImplementEqualWidths)
final configuredImplementEqualWidthsProvider =
    ConfiguredImplementEqualWidthsProvider._();

/// A provider for whether the configured equipment sections should have equal
/// widths.
final class ConfiguredImplementEqualWidthsProvider
    extends $NotifierProvider<ConfiguredImplementEqualWidths, bool> {
  /// A provider for whether the configured equipment sections should have equal
  /// widths.
  ConfiguredImplementEqualWidthsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredImplementEqualWidthsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredImplementEqualWidthsHash();

  @$internal
  @override
  ConfiguredImplementEqualWidths create() => ConfiguredImplementEqualWidths();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$configuredImplementEqualWidthsHash() =>
    r'150b691aee76d971b615860fa8083fa1e2ed78b7';

/// A provider for whether the configured equipment sections should have equal
/// widths.

abstract class _$ConfiguredImplementEqualWidths extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

@ProviderFor(ConfiguredImplementOpenSections)
final configuredImplementOpenSectionsProvider =
    ConfiguredImplementOpenSectionsProvider._();

final class ConfiguredImplementOpenSectionsProvider
    extends $NotifierProvider<ConfiguredImplementOpenSections, Set<int>> {
  ConfiguredImplementOpenSectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredImplementOpenSectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredImplementOpenSectionsHash();

  @$internal
  @override
  ConfiguredImplementOpenSections create() => ConfiguredImplementOpenSections();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<int> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<int>>(value),
    );
  }
}

String _$configuredImplementOpenSectionsHash() =>
    r'b8f878c34e17b0eca462e93687cc0757aba360e5';

abstract class _$ConfiguredImplementOpenSections extends $Notifier<Set<int>> {
  Set<int> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<int>, Set<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<int>, Set<int>>,
              Set<int>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
