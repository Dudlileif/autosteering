// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pure_pursuit_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purePursuitPerpendicularDistanceHash() =>
    r'fa15bc3d44fa8d9604ab11253e67924e6f055761';

/// A provider for the perpendicular distance from the [DisplayPurePursuit] line
/// to the [MainVehicle].
///
/// Copied from [purePursuitPerpendicularDistance].
@ProviderFor(purePursuitPerpendicularDistance)
final purePursuitPerpendicularDistanceProvider =
    AutoDisposeProvider<double?>.internal(
  purePursuitPerpendicularDistance,
  name: r'purePursuitPerpendicularDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purePursuitPerpendicularDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PurePursuitPerpendicularDistanceRef = AutoDisposeProviderRef<double?>;
String _$pursuitInterpolationDistanceHash() =>
    r'613aa73bb69740dda4993c9d4255487c79dd3778';

/// A provider for the velocity gain for the [LookAheadDistance].
///
/// Copied from [PursuitInterpolationDistance].
@ProviderFor(PursuitInterpolationDistance)
final pursuitInterpolationDistanceProvider =
    NotifierProvider<PursuitInterpolationDistance, double>.internal(
  PursuitInterpolationDistance.new,
  name: r'pursuitInterpolationDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pursuitInterpolationDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PursuitInterpolationDistance = Notifier<double>;
String _$configuredPurePursuitHash() =>
    r'cb6588925f664c1a12577c07166d2bb21ad24af0';

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
String _$enablePurePursuitHash() => r'a6f67c9a872f07a2f3673cea178c4819fb8b48bb';

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
String _$pursuitModeHash() => r'13cbf8a34f72658677ad31554e5733b412039b3c';

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
String _$purePursuitLoopHash() => r'59aa8894ef7b149833f5e3f1b0e281840e26b28b';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
