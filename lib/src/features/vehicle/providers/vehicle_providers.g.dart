// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mainVehicleHash() => r'81ef89c0875797227d48ba861117365ed1af4161';

/// The main provider for the vehicle state.
///
/// Copied from [MainVehicle].
@ProviderFor(MainVehicle)
final mainVehicleProvider = NotifierProvider<MainVehicle, Vehicle>.internal(
  MainVehicle.new,
  name: r'mainVehicleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mainVehicleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MainVehicle = Notifier<Vehicle>;
String _$autoSteerEnabledHash() => r'491f89abd6aa83fa8ef8a6fb8c79430e99631e54';

/// A provider for whether the vehicle should steer automatically.
///
/// Copied from [AutoSteerEnabled].
@ProviderFor(AutoSteerEnabled)
final autoSteerEnabledProvider =
    NotifierProvider<AutoSteerEnabled, bool>.internal(
  AutoSteerEnabled.new,
  name: r'autoSteerEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$autoSteerEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AutoSteerEnabled = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
