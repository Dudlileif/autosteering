// Copyright (C) 2024 Gaute Hagen
//
// This file is part of Autosteering.
//
// Autosteering is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Autosteering is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Autosteering.  If not, see <https://www.gnu.org/licenses/>.

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logging_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loggingFileHash() => r'ed46d8c91fabcf7c7d1bfcbd8a4e3b70be91377b';

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
