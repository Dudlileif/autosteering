// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggingFileHash() => r'9722b40771003dbbd416a42cc54194523b95c3ff';

/// A provider for creating a logging file for the session.
///
/// Copied from [loggingFile].
@ProviderFor(loggingFile)
final loggingFileProvider = FutureProvider<File?>.internal(
  loggingFile,
  name: r'loggingFileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggingFileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggingFileRef = FutureProviderRef<File?>;
String _$loggingHash() => r'920750c2de3d064f19412962729f3a2d911315c3';

/// A provider for the [Logger] that prints the logs to console and a file
/// if on native platforms.
///
/// Copied from [logging].
@ProviderFor(logging)
final loggingProvider = Provider<Logger>.internal(
  logging,
  name: r'loggingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loggingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoggingRef = ProviderRef<Logger>;
String _$exportLogsHash() => r'ec0c87deee3c7e3edad23a05a711288cb9160cee';

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

/// A provider for exporting all log files.
///
/// Copied from [exportLogs].
@ProviderFor(exportLogs)
const exportLogsProvider = ExportLogsFamily();

/// A provider for exporting all log files.
///
/// Copied from [exportLogs].
class ExportLogsFamily extends Family {
  /// A provider for exporting all log files.
  ///
  /// Copied from [exportLogs].
  const ExportLogsFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportLogsProvider';

  /// A provider for exporting all log files.
  ///
  /// Copied from [exportLogs].
  ExportLogsProvider call({
    bool zip = true,
  }) {
    return ExportLogsProvider(
      zip: zip,
    );
  }

  @visibleForOverriding
  @override
  ExportLogsProvider getProviderOverride(
    covariant ExportLogsProvider provider,
  ) {
    return call(
      zip: provider.zip,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(ExportLogsRef ref) create) {
    return _$ExportLogsFamilyOverride(this, create);
  }
}

class _$ExportLogsFamilyOverride implements FamilyOverride {
  _$ExportLogsFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportLogsRef ref) create;

  @override
  final ExportLogsFamily overriddenFamily;

  @override
  ExportLogsProvider getProviderOverride(
    covariant ExportLogsProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for exporting all log files.
///
/// Copied from [exportLogs].
class ExportLogsProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting all log files.
  ///
  /// Copied from [exportLogs].
  ExportLogsProvider({
    bool zip = true,
  }) : this._internal(
          (ref) => exportLogs(
            ref as ExportLogsRef,
            zip: zip,
          ),
          from: exportLogsProvider,
          name: r'exportLogsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportLogsHash,
          dependencies: ExportLogsFamily._dependencies,
          allTransitiveDependencies:
              ExportLogsFamily._allTransitiveDependencies,
          zip: zip,
        );

  ExportLogsProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.zip,
  }) : super.internal();

  final bool zip;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportLogsRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportLogsProvider._internal(
        (ref) => create(ref as ExportLogsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        zip: zip,
      ),
    );
  }

  @override
  ({
    bool zip,
  }) get argument {
    return (zip: zip,);
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportLogsProviderElement(this);
  }

  ExportLogsProvider _copyWith(
    FutureOr<void> Function(ExportLogsRef ref) create,
  ) {
    return ExportLogsProvider._internal(
      (ref) => create(ref as ExportLogsRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      zip: zip,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportLogsProvider && other.zip == zip;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, zip.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExportLogsRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `zip` of this provider.
  bool get zip;
}

class _ExportLogsProviderElement extends AutoDisposeFutureProviderElement<void>
    with ExportLogsRef {
  _ExportLogsProviderElement(super.provider);

  @override
  bool get zip => (origin as ExportLogsProvider).zip;
}

String _$daysToKeepLogFilesHash() =>
    r'4e9befa0bc288ecc17ae2d42ac4e89826b8b600b';

/// A provider for the number of log files to keep in the logs directory.
///
/// Copied from [DaysToKeepLogFiles].
@ProviderFor(DaysToKeepLogFiles)
final daysToKeepLogFilesProvider =
    NotifierProvider<DaysToKeepLogFiles, int>.internal(
  DaysToKeepLogFiles.new,
  name: r'daysToKeepLogFilesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$daysToKeepLogFilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DaysToKeepLogFiles = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
