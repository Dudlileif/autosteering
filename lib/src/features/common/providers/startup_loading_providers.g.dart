// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$webArtificialStartupDelayHash() =>
    r'b29b7eca285fb9384eea01ca6e1495a35a880170';

/// A provider for adding an artificial startup delay on web, as it won't
/// properly load without it.
///
/// Copied from [webArtificialStartupDelay].
@ProviderFor(webArtificialStartupDelay)
final webArtificialStartupDelayProvider =
    AutoDisposeFutureProvider<void>.internal(
  webArtificialStartupDelay,
  name: r'webArtificialStartupDelayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$webArtificialStartupDelayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WebArtificialStartupDelayRef = AutoDisposeFutureProviderRef<void>;
String _$startupLoadingHash() => r'6810817788fa515e4800d07d5cb38d0e4d03b9b5';

/// A provider for handling the initial loading of saved user files.
///
/// Returns true whilst loading and false when all files have been loaded.
///
/// Copied from [startupLoading].
@ProviderFor(startupLoading)
final startupLoadingProvider = AutoDisposeProvider<bool>.internal(
  startupLoading,
  name: r'startupLoadingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$startupLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StartupLoadingRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
