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

part of 'ab_curve_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$aBCurveHash() => r'ca317833b0cf971a81eeb840a8959afe406321a9';

/// A provider for the AB-curve.
///
/// Copied from [aBCurve].
@ProviderFor(aBCurve)
final aBCurveProvider = FutureProvider<ABCurve?>.internal(
  aBCurve,
  name: r'aBCurveProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$aBCurveHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ABCurveRef = FutureProviderRef<ABCurve?>;
String _$aBCurvePointsHash() => r'f783f125a4f62ab54bc4cae5dd8235c7ffbf6c54';

/// A provider for the curve points for the AB-curve.
///
/// Copied from [ABCurvePoints].
@ProviderFor(ABCurvePoints)
final aBCurvePointsProvider =
    NotifierProvider<ABCurvePoints, List<WayPoint>?>.internal(
  ABCurvePoints.new,
  name: r'aBCurvePointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$aBCurvePointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ABCurvePoints = Notifier<List<WayPoint>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
