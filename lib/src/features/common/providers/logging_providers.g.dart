// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the number of log files to keep in the logs directory.

@ProviderFor(DaysToKeepLogFiles)
final daysToKeepLogFilesProvider = DaysToKeepLogFilesProvider._();

/// A provider for the number of log files to keep in the logs directory.
final class DaysToKeepLogFilesProvider
    extends $NotifierProvider<DaysToKeepLogFiles, int> {
  /// A provider for the number of log files to keep in the logs directory.
  DaysToKeepLogFilesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'daysToKeepLogFilesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$daysToKeepLogFilesHash();

  @$internal
  @override
  DaysToKeepLogFiles create() => DaysToKeepLogFiles();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$daysToKeepLogFilesHash() =>
    r'f45016703c854b34f58586a7e5ab8cb8c7562617';

/// A provider for the number of log files to keep in the logs directory.

abstract class _$DaysToKeepLogFiles extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for creating a logging file for the session.

@ProviderFor(loggingFile)
final loggingFileProvider = LoggingFileProvider._();

/// A provider for creating a logging file for the session.

final class LoggingFileProvider
    extends $FunctionalProvider<AsyncValue<File?>, File?, FutureOr<File?>>
    with $FutureModifier<File?>, $FutureProvider<File?> {
  /// A provider for creating a logging file for the session.
  LoggingFileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggingFileProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggingFileHash();

  @$internal
  @override
  $FutureProviderElement<File?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<File?> create(Ref ref) {
    return loggingFile(ref);
  }
}

String _$loggingFileHash() => r'6003cea7133df2cf0f96fd49d6ff65983dad336d';

/// A provider for the [Logger] that prints the logs to console and a file
/// if on native platforms.

@ProviderFor(logging)
final loggingProvider = LoggingProvider._();

/// A provider for the [Logger] that prints the logs to console and a file
/// if on native platforms.

final class LoggingProvider extends $FunctionalProvider<Logger, Logger, Logger>
    with $Provider<Logger> {
  /// A provider for the [Logger] that prints the logs to console and a file
  /// if on native platforms.
  LoggingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loggingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loggingHash();

  @$internal
  @override
  $ProviderElement<Logger> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Logger create(Ref ref) {
    return logging(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Logger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Logger>(value),
    );
  }
}

String _$loggingHash() => r'e7501a1b838141081caeb41f09ad98c3119e6a52';

/// A provider for exporting all log files.

@ProviderFor(exportLogs)
final exportLogsProvider = ExportLogsFamily._();

/// A provider for exporting all log files.

final class ExportLogsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting all log files.
  ExportLogsProvider._({
    required ExportLogsFamily super.from,
    required ({String dialogTitle, bool zip}) super.argument,
  }) : super(
         retry: null,
         name: r'exportLogsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportLogsHash();

  @override
  String toString() {
    return r'exportLogsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as ({String dialogTitle, bool zip});
    return exportLogs(
      ref,
      dialogTitle: argument.dialogTitle,
      zip: argument.zip,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportLogsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportLogsHash() => r'd00ab49cbbfbdc606fc7e7b88f4d53c71ab238db';

/// A provider for exporting all log files.

final class ExportLogsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String dialogTitle, bool zip})
        > {
  ExportLogsFamily._()
    : super(
        retry: null,
        name: r'exportLogsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all log files.

  ExportLogsProvider call({required String dialogTitle, bool zip = true}) =>
      ExportLogsProvider._(
        argument: (dialogTitle: dialogTitle, zip: zip),
        from: this,
      );

  @override
  String toString() => r'exportLogsProvider';
}
