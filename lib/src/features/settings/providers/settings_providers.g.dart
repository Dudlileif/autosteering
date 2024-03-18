// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
