// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioQueueHash() => r'c56d27c63a08771a95327aa7bb59c3673289809f';

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
String _$audioVolumeHash() => r'd91f9400ee21decaf12f8656f5be02f60a65e87f';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
