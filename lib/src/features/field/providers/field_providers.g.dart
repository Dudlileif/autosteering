// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bufferedTestFieldHash() => r'56f94b78bdd547df2ea94ea95bff35a514bf3255';

/// A provider for creating and updating the buffered test field.
///
/// Copied from [bufferedTestField].
@ProviderFor(bufferedTestField)
final bufferedTestFieldProvider = AutoDisposeProvider<Field?>.internal(
  bufferedTestField,
  name: r'bufferedTestFieldProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bufferedTestFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BufferedTestFieldRef = AutoDisposeProviderRef<Field?>;
String _$showTestFieldHash() => r'a3993988e676a7ab37cae6cf51099d1bdcce4c02';

/// A provider for whether the test field should be shown.
///
/// Copied from [ShowTestField].
@ProviderFor(ShowTestField)
final showTestFieldProvider = NotifierProvider<ShowTestField, bool>.internal(
  ShowTestField.new,
  name: r'showTestFieldProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showTestFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowTestField = Notifier<bool>;
String _$testFieldHash() => r'5374bdd9c28699f725df8b6b15b87e86f6294b6f';

/// A provider for a test field.
///
/// Copied from [TestField].
@ProviderFor(TestField)
final testFieldProvider = NotifierProvider<TestField, Field?>.internal(
  TestField.new,
  name: r'testFieldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$testFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestField = Notifier<Field?>;
String _$showTestFieldBoundingBoxHash() =>
    r'ec6d2646331fa347f9cd762a8ccdf00762538fb0';

/// A provider for whether bounding box of the test field should be shown.
///
/// Copied from [ShowTestFieldBoundingBox].
@ProviderFor(ShowTestFieldBoundingBox)
final showTestFieldBoundingBoxProvider =
    NotifierProvider<ShowTestFieldBoundingBox, bool>.internal(
  ShowTestFieldBoundingBox.new,
  name: r'showTestFieldBoundingBoxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showTestFieldBoundingBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowTestFieldBoundingBox = Notifier<bool>;
String _$testFieldBufferDistanceHash() =>
    r'cf552eae3579f864d8c8b958c48e513e64ee3172';

/// A provider for the distance that the test [Field.border] should be buffered.
///
/// Copied from [TestFieldBufferDistance].
@ProviderFor(TestFieldBufferDistance)
final testFieldBufferDistanceProvider =
    NotifierProvider<TestFieldBufferDistance, double>.internal(
  TestFieldBufferDistance.new,
  name: r'testFieldBufferDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testFieldBufferDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestFieldBufferDistance = Notifier<double>;
String _$testFieldHoleBufferDistanceHash() =>
    r'19b2050544251c6db733880c955707d48a5618eb';

/// A provider for the distance that the test [Field.holes] should be buffered.
///
/// Copied from [TestFieldHoleBufferDistance].
@ProviderFor(TestFieldHoleBufferDistance)
final testFieldHoleBufferDistanceProvider =
    NotifierProvider<TestFieldHoleBufferDistance, double>.internal(
  TestFieldHoleBufferDistance.new,
  name: r'testFieldHoleBufferDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testFieldHoleBufferDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestFieldHoleBufferDistance = Notifier<double>;
String _$showBufferedTestFieldHash() =>
    r'f8c51b9c66d6ee3b8718f1f04cdb38d315d6e698';

/// A provider for whether the buffered test field should be shown.
///
/// Copied from [ShowBufferedTestField].
@ProviderFor(ShowBufferedTestField)
final showBufferedTestFieldProvider =
    NotifierProvider<ShowBufferedTestField, bool>.internal(
  ShowBufferedTestField.new,
  name: r'showBufferedTestFieldProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showBufferedTestFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowBufferedTestField = Notifier<bool>;
String _$showBufferedTestFieldBoundingBoxHash() =>
    r'f95243b447996f54815738c36dc1a485c192fde7';

/// A provider for whether bounding box of the test field should be shown.
///
/// Copied from [ShowBufferedTestFieldBoundingBox].
@ProviderFor(ShowBufferedTestFieldBoundingBox)
final showBufferedTestFieldBoundingBoxProvider =
    NotifierProvider<ShowBufferedTestFieldBoundingBox, bool>.internal(
  ShowBufferedTestFieldBoundingBox.new,
  name: r'showBufferedTestFieldBoundingBoxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showBufferedTestFieldBoundingBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowBufferedTestFieldBoundingBox = Notifier<bool>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
