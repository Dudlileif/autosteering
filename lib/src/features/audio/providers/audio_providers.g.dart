// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioQueueHash() => r'423f546acccca02e1db1c376d583c012ff516307';

/// A provider for a set queue of [AudioAsset]s, which also automatically plays
/// and removes them after they are added.
///
/// Copied from [AudioQueue].
@ProviderFor(AudioQueue)
final audioQueueProvider =
    NotifierProvider<AudioQueue, Set<AudioAsset>>.internal(
  AudioQueue.new,
  name: r'audioQueueProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$audioQueueHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioQueue = Notifier<Set<AudioAsset>>;
String _$audioVolumeHash() => r'fdb8c304e003e7758b1d6251c17d7bbe5a1abb14';

/// A provider for all the audio volume levels.
///
/// Copied from [AudioVolume].
@ProviderFor(AudioVolume)
final audioVolumeProvider =
    NotifierProvider<AudioVolume, Map<AudioAsset, double>>.internal(
  AudioVolume.new,
  name: r'audioVolumeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$audioVolumeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AudioVolume = Notifier<Map<AudioAsset, double>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
