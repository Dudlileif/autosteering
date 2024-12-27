// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggingFileHash() => r'c6bcc79f6e4630020bf30c8ce9ac21a9445723ae';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoggingFileRef = FutureProviderRef<File?>;
String _$loggingHash() => r'e7501a1b838141081caeb41f09ad98c3119e6a52';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoggingRef = ProviderRef<Logger>;
String _$exportLogsHash() => r'1a0452517f5ccf79309ad6c8e13cce8434e22cc5';

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
class ExportLogsFamily extends Family<AsyncValue<void>> {
  /// A provider for exporting all log files.
  ///
  /// Copied from [exportLogs].
  const ExportLogsFamily();

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

  @override
  ExportLogsProvider getProviderOverride(
    covariant ExportLogsProvider provider,
  ) {
    return call(
      zip: provider.zip,
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
  String? get name => r'exportLogsProvider';
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
    super._createNotifier, {
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
    FutureOr<void> Function(ExportLogsRef provider) create,
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
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportLogsProviderElement(this);
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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
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
    r'f45016703c854b34f58586a7e5ab8cb8c7562617';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
