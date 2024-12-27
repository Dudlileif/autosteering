// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$webArtificialStartupDelayHash() =>
    r'f831f3a69daa90ccb70513f2f34a719add77ca79';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WebArtificialStartupDelayRef = AutoDisposeFutureProviderRef<void>;
String _$startupLoadingHash() => r'e4c2d53169c4b5d78e458670da14e400a2d7d098';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StartupLoadingRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
