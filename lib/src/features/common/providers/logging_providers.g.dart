// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggingFileHash() => r'6e3d9b53091b590f3166c29b9ad662329102b37d';

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
String _$exportLogsHash() => r'a75b5b50675852db1fe6e5d0e5ec9c0ae972efbb';

/// A provider for exporting all log files.
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
String _$numLogFilesHash() => r'21064b74a0124b4c85f1346f9cb67ac191d18a54';

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
