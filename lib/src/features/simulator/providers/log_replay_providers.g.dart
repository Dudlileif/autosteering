// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_replay_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loadLogReplayFromFileHash() =>
    r'6ba5796280dac725327ca7ed4ac0418a92a13373';

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

/// A provider for loading a [LogReplay] from a file at [path], if it's valid.
///
/// Copied from [loadLogReplayFromFile].
@ProviderFor(loadLogReplayFromFile)
const loadLogReplayFromFileProvider = LoadLogReplayFromFileFamily();

/// A provider for loading a [LogReplay] from a file at [path], if it's valid.
///
/// Copied from [loadLogReplayFromFile].
class LoadLogReplayFromFileFamily extends Family<AsyncValue<LogReplay?>> {
  /// A provider for loading a [LogReplay] from a file at [path], if it's valid.
  ///
  /// Copied from [loadLogReplayFromFile].
  const LoadLogReplayFromFileFamily();

  /// A provider for loading a [LogReplay] from a file at [path], if it's valid.
  ///
  /// Copied from [loadLogReplayFromFile].
  LoadLogReplayFromFileProvider call(
    String path,
  ) {
    return LoadLogReplayFromFileProvider(
      path,
    );
  }

  @override
  LoadLogReplayFromFileProvider getProviderOverride(
    covariant LoadLogReplayFromFileProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadLogReplayFromFileProvider';
}

/// A provider for loading a [LogReplay] from a file at [path], if it's valid.
///
/// Copied from [loadLogReplayFromFile].
class LoadLogReplayFromFileProvider
    extends AutoDisposeFutureProvider<LogReplay?> {
  /// A provider for loading a [LogReplay] from a file at [path], if it's valid.
  ///
  /// Copied from [loadLogReplayFromFile].
  LoadLogReplayFromFileProvider(
    String path,
  ) : this._internal(
          (ref) => loadLogReplayFromFile(
            ref as LoadLogReplayFromFileRef,
            path,
          ),
          from: loadLogReplayFromFileProvider,
          name: r'loadLogReplayFromFileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loadLogReplayFromFileHash,
          dependencies: LoadLogReplayFromFileFamily._dependencies,
          allTransitiveDependencies:
              LoadLogReplayFromFileFamily._allTransitiveDependencies,
          path: path,
        );

  LoadLogReplayFromFileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    FutureOr<LogReplay?> Function(LoadLogReplayFromFileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadLogReplayFromFileProvider._internal(
        (ref) => create(ref as LoadLogReplayFromFileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<LogReplay?> createElement() {
    return _LoadLogReplayFromFileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadLogReplayFromFileProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LoadLogReplayFromFileRef on AutoDisposeFutureProviderRef<LogReplay?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _LoadLogReplayFromFileProviderElement
    extends AutoDisposeFutureProviderElement<LogReplay?>
    with LoadLogReplayFromFileRef {
  _LoadLogReplayFromFileProviderElement(super.provider);

  @override
  String get path => (origin as LoadLogReplayFromFileProvider).path;
}

String _$importLogReplayHash() => r'84cfd0d7482681fc37eff87267949565678292e8';

/// A provider for importing a [LogReplay] from a file.
///
/// Copied from [importLogReplay].
@ProviderFor(importLogReplay)
final importLogReplayProvider = AutoDisposeFutureProvider<LogReplay?>.internal(
  importLogReplay,
  name: r'importLogReplayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$importLogReplayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImportLogReplayRef = AutoDisposeFutureProviderRef<LogReplay?>;
String _$activeLogReplayHash() => r'195f4b2bbb2fc4c9d5dea10337159c26e10b3005';

/// A provider for the active [LogReplay].
///
/// Copied from [ActiveLogReplay].
@ProviderFor(ActiveLogReplay)
final activeLogReplayProvider =
    NotifierProvider<ActiveLogReplay, LogReplay?>.internal(
  ActiveLogReplay.new,
  name: r'activeLogReplayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeLogReplayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveLogReplay = Notifier<LogReplay?>;
String _$logReplayIndexHash() => r'dc32309208b056c60eaad78b57186e6a104098c4';

/// A provider for the index of the playing log replay.
///
/// Copied from [LogReplayIndex].
@ProviderFor(LogReplayIndex)
final logReplayIndexProvider = NotifierProvider<LogReplayIndex, int>.internal(
  LogReplayIndex.new,
  name: r'logReplayIndexProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$logReplayIndexHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LogReplayIndex = Notifier<int>;
String _$loopLogReplayHash() => r'f36f57fa1b38f4e031ff6d8d77b258e463ca639d';

/// A provider for whether the log replays should loop.
///
/// Copied from [LoopLogReplay].
@ProviderFor(LoopLogReplay)
final loopLogReplayProvider = NotifierProvider<LoopLogReplay, bool>.internal(
  LoopLogReplay.new,
  name: r'loopLogReplayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loopLogReplayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoopLogReplay = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
