// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggingFileHash() => r'1686c73d176db3741d2781a203b120e8b9fff7c0';

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
String _$loggingHash() => r'c3daef15934f73489c9c9a9fec1c418d9d712579';

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
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
