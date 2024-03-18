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

part of 'simulator_core_native_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$simCoreIsolateStreamHash() =>
    r'e009c506c854197c4cae43e4db14cdef9be8b699';

/// A provider that creates a stream and watches the vehicle simulator on the
/// native platforms.
///
/// It will update the stream with vehicle updates from the simulator and also
/// update the vehicle gauge providers.
///
/// Copied from [simCoreIsolateStream].
@ProviderFor(simCoreIsolateStream)
final simCoreIsolateStreamProvider =
    AutoDisposeStreamProvider<Vehicle>.internal(
  simCoreIsolateStream,
  name: r'simCoreIsolateStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreIsolateStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimCoreIsolateStreamRef = AutoDisposeStreamProviderRef<Vehicle>;
String _$simCoreVehicleDrivingHash() =>
    r'1e93ef44e9d72033818e379ab89ead115ae29748';

/// A provider that watches the simulated vehicle and updates the map
/// position when necessary.
///
/// Copied from [simCoreVehicleDriving].
@ProviderFor(simCoreVehicleDriving)
final simCoreVehicleDrivingProvider = AutoDisposeProvider<void>.internal(
  simCoreVehicleDriving,
  name: r'simCoreVehicleDrivingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreVehicleDrivingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SimCoreVehicleDrivingRef = AutoDisposeProviderRef<void>;
String _$simInputHash() => r'dfc8c3fc330abaece77b1bf54227fab9a59ac2d9';

/// A provider for sending messages to the [SimulatorCore].
///
/// Copied from [SimInput].
@ProviderFor(SimInput)
final simInputProvider = NotifierProvider<SimInput, void>.internal(
  SimInput.new,
  name: r'simInputProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$simInputHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimInput = Notifier<void>;
String _$simCoreIsolatePortHash() =>
    r'97bc1ab0d5f60bf018705ef747f9409839c8e4cc';

/// A provider for keeping the isolate [SendPort] for when working on a
/// native platform. Vehicle inputs gets directed here from [SimInput].
///
/// Copied from [_SimCoreIsolatePort].
@ProviderFor(_SimCoreIsolatePort)
final _simCoreIsolatePortProvider =
    NotifierProvider<_SimCoreIsolatePort, SendPort?>.internal(
  _SimCoreIsolatePort.new,
  name: r'_simCoreIsolatePortProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$simCoreIsolatePortHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SimCoreIsolatePort = Notifier<SendPort?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
