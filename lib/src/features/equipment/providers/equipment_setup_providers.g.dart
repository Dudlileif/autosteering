// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_setup_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$saveEquipmentSetupHash() =>
    r'a7ca6d2f19e49b15171ac3076c6fdfa7c7a64aee';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipmentSetup].
@ProviderFor(saveEquipmentSetup)
const saveEquipmentSetupProvider = SaveEquipmentSetupFamily();

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipmentSetup].
class SaveEquipmentSetupFamily extends Family {
  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipmentSetup].
  const SaveEquipmentSetupFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveEquipmentSetupProvider';

  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipmentSetup].
  SaveEquipmentSetupProvider call(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return SaveEquipmentSetupProvider(
      setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  SaveEquipmentSetupProvider getProviderOverride(
    covariant SaveEquipmentSetupProvider provider,
  ) {
    return call(
      provider.setup,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(
      AsyncValue<void> Function(SaveEquipmentSetupRef ref) create) {
    return _$SaveEquipmentSetupFamilyOverride(this, create);
  }
}

class _$SaveEquipmentSetupFamilyOverride implements FamilyOverride {
  _$SaveEquipmentSetupFamilyOverride(this.overriddenFamily, this.create);

  final AsyncValue<void> Function(SaveEquipmentSetupRef ref) create;

  @override
  final SaveEquipmentSetupFamily overriddenFamily;

  @override
  SaveEquipmentSetupProvider getProviderOverride(
    covariant SaveEquipmentSetupProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for saving [setup] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveEquipmentSetup].
class SaveEquipmentSetupProvider extends AutoDisposeProvider<AsyncValue<void>> {
  /// A provider for saving [setup] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveEquipmentSetup].
  SaveEquipmentSetupProvider(
    EquipmentSetup setup, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveEquipmentSetup(
            ref as SaveEquipmentSetupRef,
            setup,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: saveEquipmentSetupProvider,
          name: r'saveEquipmentSetupProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveEquipmentSetupHash,
          dependencies: SaveEquipmentSetupFamily._dependencies,
          allTransitiveDependencies:
              SaveEquipmentSetupFamily._allTransitiveDependencies,
          setup: setup,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  SaveEquipmentSetupProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.setup,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final EquipmentSetup setup;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    AsyncValue<void> Function(SaveEquipmentSetupRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveEquipmentSetupProvider._internal(
        (ref) => create(ref as SaveEquipmentSetupRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        setup: setup,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    EquipmentSetup, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeProviderElement<AsyncValue<void>> createElement() {
    return _SaveEquipmentSetupProviderElement(this);
  }

  SaveEquipmentSetupProvider _copyWith(
    AsyncValue<void> Function(SaveEquipmentSetupRef ref) create,
  ) {
    return SaveEquipmentSetupProvider._internal(
      (ref) => create(ref as SaveEquipmentSetupRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      setup: setup,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveEquipmentSetupProvider &&
        other.setup == setup &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, setup.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveEquipmentSetupRef on AutoDisposeProviderRef<AsyncValue<void>> {
  /// The parameter `setup` of this provider.
  EquipmentSetup get setup;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveEquipmentSetupProviderElement
    extends AutoDisposeProviderElement<AsyncValue<void>>
    with SaveEquipmentSetupRef {
  _SaveEquipmentSetupProviderElement(super.provider);

  @override
  EquipmentSetup get setup => (origin as SaveEquipmentSetupProvider).setup;
  @override
  String? get overrideName =>
      (origin as SaveEquipmentSetupProvider).overrideName;
  @override
  bool get downloadIfWeb =>
      (origin as SaveEquipmentSetupProvider).downloadIfWeb;
}

String _$savedEquipmentSetupsHash() =>
    r'58613a2f727b9ebbcb46e388043dbd4f301c12c7';

/// A provider for reading and holding all the saved [EquipmentSetup]s in the
/// user file directory.
///
/// Copied from [savedEquipmentSetups].
@ProviderFor(savedEquipmentSetups)
final savedEquipmentSetupsProvider =
    Provider<AsyncValue<List<EquipmentSetup>>>.internal(
  savedEquipmentSetups,
  name: r'savedEquipmentSetupsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savedEquipmentSetupsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedEquipmentSetupsRef = ProviderRef<AsyncValue<List<EquipmentSetup>>>;
String _$configuredEquipmentSetupHash() =>
    r'71c216b7b74326207c15483b43159727e9ee7743';

/// A provider or holding the configured/loaded [EquipmentSetup] in memory.
///
/// Copied from [ConfiguredEquipmentSetup].
@ProviderFor(ConfiguredEquipmentSetup)
final configuredEquipmentSetupProvider =
    NotifierProvider<ConfiguredEquipmentSetup, EquipmentSetup?>.internal(
  ConfiguredEquipmentSetup.new,
  name: r'configuredEquipmentSetupProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredEquipmentSetupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredEquipmentSetup = Notifier<EquipmentSetup?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
