// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pure_pursuit_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purePursuitHash() => r'98381f9c11478d34002186c48b1804625253473b';

/// A provider for creating and holding a [PurePursuit] model for the
/// previously recorded waypoints.
///
/// Copied from [purePursuit].
@ProviderFor(purePursuit)
final purePursuitProvider = Provider<PurePursuit?>.internal(
  purePursuit,
  name: r'purePursuitProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$purePursuitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PurePursuitRef = ProviderRef<PurePursuit?>;
String _$enablePurePursuitHash() => r'9d9832e2b0d5910da2552adcfe18a3a57f63ceb4';

/// A provider for whether or not the vehicle should follow the [purePursuit]
/// tracking model.
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
String _$pursuitModeHash() => r'8e798d23b858e45e57a261bee6a4cedaf394ae0b';

/// A provider for which steering mode the [PurePursuit] model should use.
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

/// A provider for which looping mode the [purePursuit] should follow.
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

/// A provider for the look ahead distance of the [PurePursuit] model.
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

/// A provider for the activated [PurePursuit] model, typically recieved and
/// updated from the simulator.
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
