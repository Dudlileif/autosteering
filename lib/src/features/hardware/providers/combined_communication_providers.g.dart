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

part of 'combined_communication_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$combinedNativeNetworkHash() =>
    r'4ba9f82efda0a1ed11b5830d3e95c455319784d1';

/// A provider for combining the native network providers that need to be
/// watched.
///
/// Copied from [_combinedNativeNetwork].
@ProviderFor(_combinedNativeNetwork)
final _combinedNativeNetworkProvider = AutoDisposeProvider<void>.internal(
  _combinedNativeNetwork,
  name: r'_combinedNativeNetworkProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$combinedNativeNetworkHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _CombinedNativeNetworkRef = AutoDisposeProviderRef<void>;
String _$combinedSerialHash() => r'1be0dcfb897a650492502310a5db5e310c1d7e33';

/// A provider for combining the serial providers that need to be watched.
///
/// Copied from [_combinedSerial].
@ProviderFor(_combinedSerial)
final _combinedSerialProvider = AutoDisposeProvider<void>.internal(
  _combinedSerial,
  name: r'_combinedSerialProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$combinedSerialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _CombinedSerialRef = AutoDisposeProviderRef<void>;
String _$combinedCommunicationHash() =>
    r'9c08adfaf6b83d1262f49bc346095fd7016781f9';

/// A provider for combining all the network and hardware communication
/// providers that need to be watched.
///
/// Copied from [combinedCommunication].
@ProviderFor(combinedCommunication)
final combinedCommunicationProvider = AutoDisposeProvider<void>.internal(
  combinedCommunication,
  name: r'combinedCommunicationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$combinedCommunicationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CombinedCommunicationRef = AutoDisposeProviderRef<void>;
String _$hardwareAliveHash() => r'158f328c1db19e884059d53dec8cce39bb60c838';

/// A provider for whether any hardware is connected and communicating with
/// us.
///
/// Copied from [hardwareAlive].
@ProviderFor(hardwareAlive)
final hardwareAliveProvider = AutoDisposeProvider<bool>.internal(
  hardwareAlive,
  name: r'hardwareAliveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HardwareAliveRef = AutoDisposeProviderRef<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
