// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pure_pursuit_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$configuredPurePursuitHash() =>
    r'a079d969dfaa0a8a7924344102abe0aed3c9475f';

/// A provider for creating and holding a [PurePursuit] model for the
/// previously recorded waypoints.
///
/// Copied from [ConfiguredPurePursuit].
@ProviderFor(ConfiguredPurePursuit)
final configuredPurePursuitProvider =
    NotifierProvider<ConfiguredPurePursuit, PurePursuit?>.internal(
  ConfiguredPurePursuit.new,
  name: r'configuredPurePursuitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$configuredPurePursuitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConfiguredPurePursuit = Notifier<PurePursuit?>;
String _$enablePurePursuitHash() => r'938f70c30bf51f34d21d1169bc32eba29a85aedc';

/// A provider for whether or not the vehicle should follow the
/// [ConfiguredPurePursuit] tracking model.
///
/// Copied from [EnablePurePursuit].
@ProviderFor(EnablePurePursuit)
final enablePurePursuitProvider =
    NotifierProvider<EnablePurePursuit, bool>.internal(
  EnablePurePursuit.new,
  name: r'enablePurePursuitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enablePurePursuitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnablePurePursuit = Notifier<bool>;
String _$pursuitModeHash() => r'47d8fafa7d49b3347e33e0e0f0cb631a49615d15';

/// A provider for which steering mode the [ConfiguredPurePursuit] model should
/// use.
///
/// Copied from [PursuitMode].
@ProviderFor(PursuitMode)
final pursuitModeProvider =
    NotifierProvider<PursuitMode, PurePursuitMode>.internal(
  PursuitMode.new,
  name: r'pursuitModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pursuitModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PursuitMode = Notifier<PurePursuitMode>;
String _$purePursuitLoopHash() => r'348334dc74b35f8ff0599ec5557333c7c719fe5d';

/// A provider for which looping mode the [ConfiguredPurePursuit] should follow.
///
/// Copied from [PurePursuitLoop].
@ProviderFor(PurePursuitLoop)
final purePursuitLoopProvider =
    NotifierProvider<PurePursuitLoop, PurePursuitLoopMode>.internal(
  PurePursuitLoop.new,
  name: r'purePursuitLoopProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purePursuitLoopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PurePursuitLoop = Notifier<PurePursuitLoopMode>;
String _$lookAheadDistanceHash() => r'cc5238aefa1ff1c179aea9507f00d9770269e555';

/// A provider for the look ahead distance of the [ConfiguredPurePursuit] model.
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
String _$displayPurePursuitHash() =>
    r'9e5dcfbf4401f0910761b08a1a07dc28204c9af2';

/// A provider for the activated [ConfiguredPurePursuit] model, typically
/// recieved and updated from the simulator.
///
/// Copied from [DisplayPurePursuit].
@ProviderFor(DisplayPurePursuit)
final displayPurePursuitProvider =
    AutoDisposeNotifierProvider<DisplayPurePursuit, PurePursuit?>.internal(
  DisplayPurePursuit.new,
  name: r'displayPurePursuitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$displayPurePursuitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DisplayPurePursuit = AutoDisposeNotifier<PurePursuit?>;
String _$debugPurePursuitHash() => r'e5b2ab7bd405a3b4c8a82334bf7ab12045348937';

/// A provider for whether or not the pure pursuit debugging features should
/// show.
///
/// Copied from [DebugPurePursuit].
@ProviderFor(DebugPurePursuit)
final debugPurePursuitProvider =
    NotifierProvider<DebugPurePursuit, bool>.internal(
  DebugPurePursuit.new,
  name: r'debugPurePursuitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$debugPurePursuitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DebugPurePursuit = Notifier<bool>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
