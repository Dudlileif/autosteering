// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_loading_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startupLoadingHash() => r'0a5b887de3b0977961de5f5b059035fe025e7913';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
