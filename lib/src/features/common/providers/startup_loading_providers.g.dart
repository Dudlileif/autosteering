// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for adding an artificial startup delay on web, as it won't
/// properly load without it.

@ProviderFor(webArtificialStartupDelay)
final webArtificialStartupDelayProvider = WebArtificialStartupDelayProvider._();

/// A provider for adding an artificial startup delay on web, as it won't
/// properly load without it.

final class WebArtificialStartupDelayProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for adding an artificial startup delay on web, as it won't
  /// properly load without it.
  WebArtificialStartupDelayProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'webArtificialStartupDelayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$webArtificialStartupDelayHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return webArtificialStartupDelay(ref);
  }
}

String _$webArtificialStartupDelayHash() =>
    r'f831f3a69daa90ccb70513f2f34a719add77ca79';

/// A provider for handling the initial loading of saved user files.
///
/// Returns true whilst loading and false when all files have been loaded.

@ProviderFor(startupLoading)
final startupLoadingProvider = StartupLoadingProvider._();

/// A provider for handling the initial loading of saved user files.
///
/// Returns true whilst loading and false when all files have been loaded.

final class StartupLoadingProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// A provider for handling the initial loading of saved user files.
  ///
  /// Returns true whilst loading and false when all files have been loaded.
  StartupLoadingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'startupLoadingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$startupLoadingHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return startupLoading(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$startupLoadingHash() => r'61b4888fcd70351d95c601bcbe05f7bb7278bf1d';
