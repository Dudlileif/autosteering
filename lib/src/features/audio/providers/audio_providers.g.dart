// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for a set queue of [AudioAsset]s, which also automatically plays
/// and removes them after they are added.

@ProviderFor(AudioQueue)
final audioQueueProvider = AudioQueueProvider._();

/// A provider for a set queue of [AudioAsset]s, which also automatically plays
/// and removes them after they are added.
final class AudioQueueProvider
    extends $NotifierProvider<AudioQueue, Set<AudioAsset>> {
  /// A provider for a set queue of [AudioAsset]s, which also automatically plays
  /// and removes them after they are added.
  AudioQueueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioQueueProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioQueueHash();

  @$internal
  @override
  AudioQueue create() => AudioQueue();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<AudioAsset> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<AudioAsset>>(value),
    );
  }
}

String _$audioQueueHash() => r'32b88a8ab5ee5134ffd17f220659c137d02d3bd9';

/// A provider for a set queue of [AudioAsset]s, which also automatically plays
/// and removes them after they are added.

abstract class _$AudioQueue extends $Notifier<Set<AudioAsset>> {
  Set<AudioAsset> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<AudioAsset>, Set<AudioAsset>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<AudioAsset>, Set<AudioAsset>>,
              Set<AudioAsset>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for all the audio volume levels.

@ProviderFor(AudioVolume)
final audioVolumeProvider = AudioVolumeProvider._();

/// A provider for all the audio volume levels.
final class AudioVolumeProvider
    extends $NotifierProvider<AudioVolume, Map<AudioAsset, double>> {
  /// A provider for all the audio volume levels.
  AudioVolumeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'audioVolumeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$audioVolumeHash();

  @$internal
  @override
  AudioVolume create() => AudioVolume();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<AudioAsset, double> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<AudioAsset, double>>(value),
    );
  }
}

String _$audioVolumeHash() => r'd91f9400ee21decaf12f8656f5be02f60a65e87f';

/// A provider for all the audio volume levels.

abstract class _$AudioVolume extends $Notifier<Map<AudioAsset, double>> {
  Map<AudioAsset, double> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<Map<AudioAsset, double>, Map<AudioAsset, double>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<AudioAsset, double>, Map<AudioAsset, double>>,
              Map<AudioAsset, double>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
