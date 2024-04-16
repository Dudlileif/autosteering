// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggingFileHash() => r'c92ef9f069c0d27baa011c068210785b1b497da8';

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
String _$loggingHash() => r'dbcbf5822913d13ee9d90299cd962b050b7303f2';

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
String _$exportLogsHash() => r'771ac027c0aae20717c6de5d7dee078774a1d922';

/// A provider for exporting the log files.
///
/// Copied from [exportLogs].
@ProviderFor(exportLogs)
final exportLogsProvider = AutoDisposeFutureProvider<void>.internal(
  exportLogs,
  name: r'exportLogsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$exportLogsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ExportLogsRef = AutoDisposeFutureProviderRef<void>;
String _$numLogFilesHash() => r'c895a18c677dcbad03cd88f3cf65040b6c060843';

/// A provider for the number of log files to keep in the logs directory.
///
/// Copied from [NumLogFiles].
@ProviderFor(NumLogFiles)
final numLogFilesProvider = NotifierProvider<NumLogFiles, int>.internal(
  NumLogFiles.new,
  name: r'numLogFilesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$numLogFilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NumLogFiles = Notifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
