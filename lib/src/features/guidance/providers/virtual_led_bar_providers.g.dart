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
    r'eaeacb3fefae9a4672f25d8a62c01ab1b5858668';

/// A provider for whether the virtual led bar should be enabled/shown.
///
/// Copied from [VirtualLedBarEnabled].
@ProviderFor(VirtualLedBarEnabled)
final virtualLedBarEnabledProvider =
    NotifierProvider<VirtualLedBarEnabled, bool>.internal(
  VirtualLedBarEnabled.new,
  name: r'virtualLedBarEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$virtualLedBarEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VirtualLedBarEnabled = Notifier<bool>;
String _$virtualLedBarConfigurationHash() =>
    r'd7f206ae26286c9665eb999e194dce98729a7e8e';

/// A provider for storing the configuration for the virtual led bar.
///
/// Copied from [VirtualLedBarConfiguration].
@ProviderFor(VirtualLedBarConfiguration)
final virtualLedBarConfigurationProvider =
    NotifierProvider<VirtualLedBarConfiguration, LedBarConfig>.internal(
  VirtualLedBarConfiguration.new,
  name: r'virtualLedBarConfigurationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$virtualLedBarConfigurationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VirtualLedBarConfiguration = Notifier<LedBarConfig>;
String _$virtualLedBarTestingHash() =>
    r'e46b67efe6fcce8633d15f6fa1a61e2603d705d1';

/// A provider for whether we're testing the virtual LED bar with
/// [VirtualLedBarTestingDistance].
///
/// Copied from [VirtualLedBarTesting].
@ProviderFor(VirtualLedBarTesting)
final virtualLedBarTestingProvider =
    NotifierProvider<VirtualLedBarTesting, bool>.internal(
  VirtualLedBarTesting.new,
  name: r'virtualLedBarTestingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$virtualLedBarTestingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VirtualLedBarTesting = Notifier<bool>;
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
