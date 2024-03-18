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

part of 'gauge_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gaugeTravelledDistanceHash() =>
    r'22e1975ceb6cfe8953845751975f1fd6c6ecab37';

/// A provider for the distance travelled by the vehicle.
///
/// Copied from [GaugeTravelledDistance].
@ProviderFor(GaugeTravelledDistance)
final gaugeTravelledDistanceProvider =
    AutoDisposeNotifierProvider<GaugeTravelledDistance, double>.internal(
  GaugeTravelledDistance.new,
  name: r'gaugeTravelledDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gaugeTravelledDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GaugeTravelledDistance = AutoDisposeNotifier<double>;
String _$gaugeVelocityHash() => r'fc356f6d1b5f3e0bee2eff50319b6b478a02317f';

/// A provider for the vehicle's velocity gauge.
///
/// Copied from [GaugeVelocity].
@ProviderFor(GaugeVelocity)
final gaugeVelocityProvider =
    AutoDisposeNotifierProvider<GaugeVelocity, double>.internal(
  GaugeVelocity.new,
  name: r'gaugeVelocityProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gaugeVelocityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GaugeVelocity = AutoDisposeNotifier<double>;
String _$gaugeBearingHash() => r'f7dc6a96a1d98593d3f7ab36603e999f5089917a';

/// A provider for the vehicle's bearing gauge.
///
/// Copied from [GaugeBearing].
@ProviderFor(GaugeBearing)
final gaugeBearingProvider =
    AutoDisposeNotifierProvider<GaugeBearing, double>.internal(
  GaugeBearing.new,
  name: r'gaugeBearingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gaugeBearingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GaugeBearing = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
