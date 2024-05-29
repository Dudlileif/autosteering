// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_led_bar_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$virtualLedBarPerpendicularDistanceHash() =>
    r'944f8bd9c814d79aad936eb8adfb78c89570e68b';

/// A provider for the perpendicular distance to the currently active
/// guidance, otherwise 0.
///
/// Copied from [virtualLedBarPerpendicularDistance].
@ProviderFor(virtualLedBarPerpendicularDistance)
final virtualLedBarPerpendicularDistanceProvider =
    AutoDisposeProvider<double?>.internal(
  virtualLedBarPerpendicularDistance,
  name: r'virtualLedBarPerpendicularDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$virtualLedBarPerpendicularDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef VirtualLedBarPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$virtualLedBarEnabledHash() =>
    r'7a632335c05cb31df6ccffc883715df48395aa0c';

/// A provider for whether the virtual led bar should be enabled/shown.
///
/// Copied from [VirtualLedBarEnabled].
@ProviderFor(VirtualLedBarEnabled)
final virtualLedBarEnabledProvider =
    AutoDisposeNotifierProvider<VirtualLedBarEnabled, bool>.internal(
  VirtualLedBarEnabled.new,
  name: r'virtualLedBarEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$virtualLedBarEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VirtualLedBarEnabled = AutoDisposeNotifier<bool>;
String _$virtualLedBarConfigurationHash() =>
    r'b78d4a79f2d7d3ee4fe0b7e86d72b5a408008a7e';

/// A provider for storing the configuration for the virtual led bar.
///
/// Copied from [VirtualLedBarConfiguration].
@ProviderFor(VirtualLedBarConfiguration)
final virtualLedBarConfigurationProvider = AutoDisposeNotifierProvider<
    VirtualLedBarConfiguration, LedBarConfig>.internal(
  VirtualLedBarConfiguration.new,
  name: r'virtualLedBarConfigurationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$virtualLedBarConfigurationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VirtualLedBarConfiguration = AutoDisposeNotifier<LedBarConfig>;
String _$virtualLedBarTestingHash() =>
    r'f69cdf35b95757c8bd6b2818359b004c292b6193';

/// A provider for whether we're testing the virtual LED bar with
/// [VirtualLedBarTestingDistance].
///
/// Copied from [VirtualLedBarTesting].
@ProviderFor(VirtualLedBarTesting)
final virtualLedBarTestingProvider =
    AutoDisposeNotifierProvider<VirtualLedBarTesting, bool>.internal(
  VirtualLedBarTesting.new,
  name: r'virtualLedBarTestingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$virtualLedBarTestingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VirtualLedBarTesting = AutoDisposeNotifier<bool>;
String _$virtualLedBarTestingDistanceHash() =>
    r'f7b3cc291f25d74f03ac10d5aeacaac2dd9e6b4b';

/// A provider for a testing cross track distance for the virtual LED bar.
///
/// Copied from [VirtualLedBarTestingDistance].
@ProviderFor(VirtualLedBarTestingDistance)
final virtualLedBarTestingDistanceProvider =
    AutoDisposeNotifierProvider<VirtualLedBarTestingDistance, double?>.internal(
  VirtualLedBarTestingDistance.new,
  name: r'virtualLedBarTestingDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$virtualLedBarTestingDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VirtualLedBarTestingDistance = AutoDisposeNotifier<double?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
