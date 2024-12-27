// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virtual_led_bar_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$virtualLedBarPerpendicularDistanceHash() =>
    r'58efc5e084dec6dc5db0ac1ca95b0ca8c09e337b';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef VirtualLedBarPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$virtualLedBarEnabledHash() =>
    r'2fdc9535a062f326fb448d88d6539c2d62d97a8d';

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
    r'0275de340e9ed384fbb938893114fcb72782de86';

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
    r'53c1979ff9d5c8abcf6276282e2cda455e4c5be8';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
