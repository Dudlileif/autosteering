// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fileDirectoryHash() => r'0080a2a62693229d011134fffccce3b51fd5d52b';

/// A provider for the main user file directory for the application.
///
/// Copied from [fileDirectory].
@ProviderFor(fileDirectory)
final fileDirectoryProvider = FutureProvider<Directory>.internal(
  fileDirectory,
  name: r'fileDirectoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fileDirectoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FileDirectoryRef = FutureProviderRef<Directory>;
String _$directorySizeHash() => r'337aa83b96d3e5f675df8befcf5d3ec4f8d021ab';

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

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.
///
/// Copied from [directorySize].
@ProviderFor(directorySize)
const directorySizeProvider = DirectorySizeFamily();

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.
///
/// Copied from [directorySize].
class DirectorySizeFamily extends Family<AsyncValue<int?>> {
  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.
  ///
  /// Copied from [directorySize].
  const DirectorySizeFamily();

  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.
  ///
  /// Copied from [directorySize].
  DirectorySizeProvider call(
    String path,
  ) {
    return DirectorySizeProvider(
      path,
    );
  }

  @override
  DirectorySizeProvider getProviderOverride(
    covariant DirectorySizeProvider provider,
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
  String? get name => r'directorySizeProvider';
}

/// A provider for finding the size of the [Directory] at [path].
///
/// Returns the size in number of bytes.
///
/// Copied from [directorySize].
class DirectorySizeProvider extends AutoDisposeFutureProvider<int?> {
  /// A provider for finding the size of the [Directory] at [path].
  ///
  /// Returns the size in number of bytes.
  ///
  /// Copied from [directorySize].
  DirectorySizeProvider(
    String path,
  ) : this._internal(
          (ref) => directorySize(
            ref as DirectorySizeRef,
            path,
          ),
          from: directorySizeProvider,
          name: r'directorySizeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$directorySizeHash,
          dependencies: DirectorySizeFamily._dependencies,
          allTransitiveDependencies:
              DirectorySizeFamily._allTransitiveDependencies,
          path: path,
        );

  DirectorySizeProvider._internal(
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
    FutureOr<int?> Function(DirectorySizeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DirectorySizeProvider._internal(
        (ref) => create(ref as DirectorySizeRef),
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
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _DirectorySizeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DirectorySizeProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DirectorySizeRef on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `path` of this provider.
  String get path;
}

class _DirectorySizeProviderElement
    extends AutoDisposeFutureProviderElement<int?> with DirectorySizeRef {
  _DirectorySizeProviderElement(super.provider);

  @override
  String get path => (origin as DirectorySizeProvider).path;
}

String _$directoryDeleteHash() => r'1bc28a5c77a52476af58a451f219f4f6b481cc44';

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.
///
/// Copied from [directoryDelete].
@ProviderFor(directoryDelete)
const directoryDeleteProvider = DirectoryDeleteFamily();

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.
///
/// Copied from [directoryDelete].
class DirectoryDeleteFamily extends Family<AsyncValue<bool>> {
  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.
  ///
  /// Copied from [directoryDelete].
  const DirectoryDeleteFamily();

  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.
  ///
  /// Copied from [directoryDelete].
  DirectoryDeleteProvider call(
    String path,
  ) {
    return DirectoryDeleteProvider(
      path,
    );
  }

  @override
  DirectoryDeleteProvider getProviderOverride(
    covariant DirectoryDeleteProvider provider,
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
  String? get name => r'directoryDeleteProvider';
}

/// A provider for deleting the [Directory] at [path].
///
/// Returns true if the directory no longer exists.
///
/// Copied from [directoryDelete].
class DirectoryDeleteProvider extends AutoDisposeFutureProvider<bool> {
  /// A provider for deleting the [Directory] at [path].
  ///
  /// Returns true if the directory no longer exists.
  ///
  /// Copied from [directoryDelete].
  DirectoryDeleteProvider(
    String path,
  ) : this._internal(
          (ref) => directoryDelete(
            ref as DirectoryDeleteRef,
            path,
          ),
          from: directoryDeleteProvider,
          name: r'directoryDeleteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$directoryDeleteHash,
          dependencies: DirectoryDeleteFamily._dependencies,
          allTransitiveDependencies:
              DirectoryDeleteFamily._allTransitiveDependencies,
          path: path,
        );

  DirectoryDeleteProvider._internal(
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
    FutureOr<bool> Function(DirectoryDeleteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DirectoryDeleteProvider._internal(
        (ref) => create(ref as DirectoryDeleteRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DirectoryDeleteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DirectoryDeleteProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DirectoryDeleteRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `path` of this provider.
  String get path;
}

class _DirectoryDeleteProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DirectoryDeleteRef {
  _DirectoryDeleteProviderElement(super.provider);

  @override
  String get path => (origin as DirectoryDeleteProvider).path;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
