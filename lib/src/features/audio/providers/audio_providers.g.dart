// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$audioPlayerHash() => r'844a5df316e188cf4787fba182362243ddda05c1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// A provider for playing an audio notification/sound when GNSS RTK fix
/// accuracy is lost.
///
/// Copied from [audioPlayer].
@ProviderFor(audioPlayer)
const audioPlayerProvider = AudioPlayerFamily();

/// A provider for playing an audio notification/sound when GNSS RTK fix
/// accuracy is lost.
///
/// Copied from [audioPlayer].
class AudioPlayerFamily extends Family {
  /// A provider for playing an audio notification/sound when GNSS RTK fix
  /// accuracy is lost.
  ///
  /// Copied from [audioPlayer].
  const AudioPlayerFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'audioPlayerProvider';

  /// A provider for playing an audio notification/sound when GNSS RTK fix
  /// accuracy is lost.
  ///
  /// Copied from [audioPlayer].
  AudioPlayerProvider call(
    AudioAsset asset,
  ) {
    return AudioPlayerProvider(
      asset,
    );
  }

  @visibleForOverriding
  @override
  AudioPlayerProvider getProviderOverride(
    covariant AudioPlayerProvider provider,
  ) {
    return call(
      provider.asset,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(AudioPlayerRef ref) create) {
    return _$AudioPlayerFamilyOverride(this, create);
  }
}

class _$AudioPlayerFamilyOverride implements FamilyOverride {
  _$AudioPlayerFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(AudioPlayerRef ref) create;

  @override
  final AudioPlayerFamily overriddenFamily;

  @override
  AudioPlayerProvider getProviderOverride(
    covariant AudioPlayerProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for playing an audio notification/sound when GNSS RTK fix
/// accuracy is lost.
///
/// Copied from [audioPlayer].
class AudioPlayerProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for playing an audio notification/sound when GNSS RTK fix
  /// accuracy is lost.
  ///
  /// Copied from [audioPlayer].
  AudioPlayerProvider(
    AudioAsset asset,
  ) : this._internal(
          (ref) => audioPlayer(
            ref as AudioPlayerRef,
            asset,
          ),
          from: audioPlayerProvider,
          name: r'audioPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$audioPlayerHash,
          dependencies: AudioPlayerFamily._dependencies,
          allTransitiveDependencies:
              AudioPlayerFamily._allTransitiveDependencies,
          asset: asset,
        );

  AudioPlayerProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.asset,
  }) : super.internal();

  final AudioAsset asset;

  @override
  Override overrideWith(
    FutureOr<void> Function(AudioPlayerRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AudioPlayerProvider._internal(
        (ref) => create(ref as AudioPlayerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        asset: asset,
      ),
    );
  }

  @override
  (AudioAsset,) get argument {
    return (asset,);
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _AudioPlayerProviderElement(this);
  }

  AudioPlayerProvider _copyWith(
    FutureOr<void> Function(AudioPlayerRef ref) create,
  ) {
    return AudioPlayerProvider._internal(
      (ref) => create(ref as AudioPlayerRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      asset: asset,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AudioPlayerProvider && other.asset == asset;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, asset.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AudioPlayerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `asset` of this provider.
  AudioAsset get asset;
}

class _AudioPlayerProviderElement extends AutoDisposeFutureProviderElement<void>
    with AudioPlayerRef {
  _AudioPlayerProviderElement(super.provider);

  @override
  AudioAsset get asset => (origin as AudioPlayerProvider).asset;
}

String _$audioVolumeHash() => r'e72ad3338dda207f382714b789d0a3c0403fdf35';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
