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

part of 'hardware_serial_providers_web.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availableSerialPortsHash() =>
    r'9cf35c6bf4f99989b7e7975f5834be223cfc1397';

/// A provider for the available serial ports.
///
/// Copied from [availableSerialPorts].
@ProviderFor(availableSerialPorts)
final availableSerialPortsProvider =
    AutoDisposeProvider<List<Object?>>.internal(
  availableSerialPorts,
  name: r'availableSerialPortsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$availableSerialPortsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AvailableSerialPortsRef = AutoDisposeProviderRef<List<Object?>>;
String _$hardwareSerialStreamHash() =>
    r'24b7b64ed1cd98f19e874d141110bb7d5b0a2002';

/// A stream of the incoming serial data from the connected hardware.
///
/// Copied from [hardwareSerialStream].
@ProviderFor(hardwareSerialStream)
final hardwareSerialStreamProvider = StreamProvider<String?>.internal(
  hardwareSerialStream,
  name: r'hardwareSerialStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef HardwareSerialStreamRef = StreamProviderRef<String?>;
String _$hardwareSerialBaudRateHash() =>
    r'44e0974b8d9a3527549121492e82f5c4423eeed4';

/// A provider for the baud rate for the [HardwareSerial] connection.
///
/// Copied from [HardwareSerialBaudRate].
@ProviderFor(HardwareSerialBaudRate)
final hardwareSerialBaudRateProvider =
    NotifierProvider<HardwareSerialBaudRate, int>.internal(
  HardwareSerialBaudRate.new,
  name: r'hardwareSerialBaudRateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialBaudRateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareSerialBaudRate = Notifier<int>;
String _$hardwareSerialHash() => r'94a5a704dd8ae3206030a39d1ef3008a8a442317';

/// A provider for the hardware serial connection.
///
/// Copied from [HardwareSerial].
@ProviderFor(HardwareSerial)
final hardwareSerialProvider =
    NotifierProvider<HardwareSerial, Object?>.internal(
  HardwareSerial.new,
  name: r'hardwareSerialProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareSerial = Notifier<Object?>;
String _$hardwareSerialAliveHash() =>
    r'6b241bdd065caa0090ff1211560115098e20a838';

/// A provider for telling whether the [HardwareSerial] is receiving data.
///
/// If not set to true in the last second, it will invalidate itself and
/// restart as false.
///
/// Copied from [HardwareSerialAlive].
@ProviderFor(HardwareSerialAlive)
final hardwareSerialAliveProvider =
    NotifierProvider<HardwareSerialAlive, bool>.internal(
  HardwareSerialAlive.new,
  name: r'hardwareSerialAliveProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$hardwareSerialAliveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HardwareSerialAlive = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
