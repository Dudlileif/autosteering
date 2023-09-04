// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsFileHash() => r'a2e517281998370a558a7a74e7585b39b7324f7d';

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
String _$webLocalStorageHash() => r'526abc59599a023e50673133a84be495adc314fc';

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
String _$settingsHash() => r'176b53107fe8a3750be5ed44a83a04ac600a12b5';

/// A provider for the settings map for the application.
///
/// Copied from [Settings].
@ProviderFor(Settings)
final settingsProvider =
    NotifierProvider<Settings, Map<String, dynamic>>.internal(
  Settings.new,
  name: r'settingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$settingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Settings = Notifier<Map<String, dynamic>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
