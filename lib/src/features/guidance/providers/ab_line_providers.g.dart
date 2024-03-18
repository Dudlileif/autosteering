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

part of 'ab_line_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aBLineHash() => r'365aa0d0ea1388c5f9aa3b333c7262b0532415db';

/// A provider for the AB-line.
///
/// Copied from [aBLine].
@ProviderFor(aBLine)
final aBLineProvider = FutureProvider<ABLine?>.internal(
  aBLine,
  name: r'aBLineProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBLineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ABLineRef = FutureProviderRef<ABLine?>;
String _$aPlusLineHash() => r'f0b296c3da1c91bcd9c4d4177c1cde7ea70275c7';

/// A provider for the A+-line.
///
/// Copied from [aPlusLine].
@ProviderFor(aPlusLine)
final aPlusLineProvider = FutureProvider<APlusLine?>.internal(
  aPlusLine,
  name: r'aPlusLineProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aPlusLineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef APlusLineRef = FutureProviderRef<APlusLine?>;
String _$aPlusLineBearingHash() => r'59b6ab1e4921ed1dacf2103e6613059183d6ebae';

/// A provider for the A+-line bearing.
///
/// Copied from [APlusLineBearing].
@ProviderFor(APlusLineBearing)
final aPlusLineBearingProvider =
    NotifierProvider<APlusLineBearing, double?>.internal(
  APlusLineBearing.new,
  name: r'aPlusLineBearingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aPlusLineBearingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$APlusLineBearing = Notifier<double?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
