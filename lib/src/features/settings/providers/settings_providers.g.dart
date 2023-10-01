// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsFileHash() => r'5ae326d6deaa1de3aae96f532d59da0ed6e6106a';

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

typedef SettingsFileRef = FutureProviderRef<File>;
String _$webLocalStorageHash() => r'4539d261f98b68fbd255a7cbbd3a04f3947cc9ad';

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

typedef WebLocalStorageRef = ProviderRef<Storage>;
String _$settingsHash() => r'9854ab732cfc8758af67f5456e9f7ff6cce13be0';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
