// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'look_ahead_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lookAheadDistanceHash() => r'88a53a0827e724b4c8d9d671fa62054cea09f0c1';

/// A provider for the look ahead distance for the guidance modes.
///
/// Copied from [LookAheadDistance].
@ProviderFor(LookAheadDistance)
final lookAheadDistanceProvider =
    NotifierProvider<LookAheadDistance, double>.internal(
  LookAheadDistance.new,
  name: r'lookAheadDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lookAheadDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LookAheadDistance = Notifier<double>;
String _$lookAheadVelocityGainHash() =>
    r'45ffa3578a5b9d56d17237af11422d1ec1f26147';

/// A provider for the velocity gain for the [LookAheadDistance].
///
/// Copied from [LookAheadVelocityGain].
@ProviderFor(LookAheadVelocityGain)
final lookAheadVelocityGainProvider =
    NotifierProvider<LookAheadVelocityGain, double>.internal(
  LookAheadVelocityGain.new,
  name: r'lookAheadVelocityGainProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lookAheadVelocityGainHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LookAheadVelocityGain = Notifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
