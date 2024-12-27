// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsFileHash() => r'a6f310725b72ef429d2134c232eb973da492a4c3';

/// A provider for the main settings file for the application.
///
/// Copied from [settingsFile].
@ProviderFor(settingsFile)
final settingsFileProvider = FutureProvider<File>.internal(
  settingsFile,
  name: r'settingsFileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingsFileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsFileRef = FutureProviderRef<File>;
String _$webLocalStorageHash() => r'50d83eb101a9fb85659a1001a54480b4c30a3c85';

/// A provider for the local storage data map for the web version of the
/// application.
///
/// Copied from [webLocalStorage].
@ProviderFor(webLocalStorage)
final webLocalStorageProvider = Provider<Storage>.internal(
  webLocalStorage,
  name: r'webLocalStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$webLocalStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WebLocalStorageRef = ProviderRef<Storage>;
String _$exportSettingsHash() => r'a30f6a519a4fe93718a98f15d053a84a61ef82d1';

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

/// A provider for exporting [Settings] to a file.
///
/// Copied from [exportSettings].
@ProviderFor(exportSettings)
const exportSettingsProvider = ExportSettingsFamily();

/// A provider for exporting [Settings] to a file.
///
/// Copied from [exportSettings].
class ExportSettingsFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting [Settings] to a file.
  ///
  /// Copied from [exportSettings].
  const ExportSettingsFamily();

  /// A provider for exporting [Settings] to a file.
  ///
  /// Copied from [exportSettings].
  ExportSettingsProvider call({
    String? overrideName,
    bool downloadIfWeb = true,
    bool removeSensitiveData = false,
  }) {
    return ExportSettingsProvider(
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
      removeSensitiveData: removeSensitiveData,
    );
  }

  @override
  ExportSettingsProvider getProviderOverride(
    covariant ExportSettingsProvider provider,
  ) {
    return call(
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
      removeSensitiveData: provider.removeSensitiveData,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportSettingsProvider';
}

/// A provider for exporting [Settings] to a file.
///
/// Copied from [exportSettings].
class ExportSettingsProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting [Settings] to a file.
  ///
  /// Copied from [exportSettings].
  ExportSettingsProvider({
    String? overrideName,
    bool downloadIfWeb = true,
    bool removeSensitiveData = false,
  }) : this._internal(
          (ref) => exportSettings(
            ref as ExportSettingsRef,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
            removeSensitiveData: removeSensitiveData,
          ),
          from: exportSettingsProvider,
          name: r'exportSettingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportSettingsHash,
          dependencies: ExportSettingsFamily._dependencies,
          allTransitiveDependencies:
              ExportSettingsFamily._allTransitiveDependencies,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
          removeSensitiveData: removeSensitiveData,
        );

  ExportSettingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.overrideName,
    required this.downloadIfWeb,
    required this.removeSensitiveData,
  }) : super.internal();

  final String? overrideName;
  final bool downloadIfWeb;
  final bool removeSensitiveData;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportSettingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportSettingsProvider._internal(
        (ref) => create(ref as ExportSettingsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
        removeSensitiveData: removeSensitiveData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportSettingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportSettingsProvider &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb &&
        other.removeSensitiveData == removeSensitiveData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);
    hash = _SystemHash.combine(hash, removeSensitiveData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ExportSettingsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;

  /// The parameter `removeSensitiveData` of this provider.
  bool get removeSensitiveData;
}

class _ExportSettingsProviderElement
    extends AutoDisposeFutureProviderElement<void> with ExportSettingsRef {
  _ExportSettingsProviderElement(super.provider);

  @override
  String? get overrideName => (origin as ExportSettingsProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as ExportSettingsProvider).downloadIfWeb;
  @override
  bool get removeSensitiveData =>
      (origin as ExportSettingsProvider).removeSensitiveData;
}

String _$importSettingsHash() => r'7fd98dbc99f40dd856c455a77da9f6794b426f66';

/// A provider for importing [Settings] from a file.
///
/// Copied from [importSettings].
@ProviderFor(importSettings)
final importSettingsProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>?>.internal(
  importSettings,
  name: r'importSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ImportSettingsRef = AutoDisposeFutureProviderRef<Map<String, dynamic>?>;
String _$reloadAllSettingsHash() => r'cda9fc34c9c7c0205dce8fe1dd421b55ecabeb0c';

/// A provider for rebuilding all providers that reads [Settings] during the
/// build method.
///
/// Copied from [reloadAllSettings].
@ProviderFor(reloadAllSettings)
final reloadAllSettingsProvider = Provider<String>.internal(
  reloadAllSettings,
  name: r'reloadAllSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reloadAllSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReloadAllSettingsRef = ProviderRef<String>;
String _$settingsHash() => r'f3ac848cd62beea67a4251253bd530c81d2089e8';

/// A provider for the settings map for the application.
///
/// Copied from [Settings].
@ProviderFor(Settings)
final settingsProvider =
    NotifierProvider<Settings, SplayTreeMap<String, dynamic>>.internal(
  Settings.new,
  name: r'settingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Settings = Notifier<SplayTreeMap<String, dynamic>>;
String _$enableDebugModeHash() => r'2620409a83bf2fc27eb9fe765a5d4e982543ca47';

/// A provider for whether the debug features and switches should be shown.
///
/// Copied from [EnableDebugMode].
@ProviderFor(EnableDebugMode)
final enableDebugModeProvider =
    NotifierProvider<EnableDebugMode, bool>.internal(
  EnableDebugMode.new,
  name: r'enableDebugModeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enableDebugModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnableDebugMode = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
