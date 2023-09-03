// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bufferedTestFieldHash() => r'd7c4bccea7d56059eb954fe107f67293aaf8553c';

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
String _$saveFieldHash() => r'8b466b70606fc1c306fa7546945a0a45eb752f1a';

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

/// A provider for saving [field] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveField].
@ProviderFor(saveField)
const saveFieldProvider = SaveFieldFamily();

/// A provider for saving [field] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveField].
class SaveFieldFamily extends Family<AsyncValue<void>> {
  /// A provider for saving [field] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveField].
  const SaveFieldFamily();

  /// A provider for saving [field] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveField].
  SaveFieldProvider call(
    Field field, {
    String? overrideName,
  }) {
    return SaveFieldProvider(
      field,
      overrideName: overrideName,
    );
  }

  @override
  SaveFieldProvider getProviderOverride(
    covariant SaveFieldProvider provider,
  ) {
    return call(
      provider.field,
      overrideName: provider.overrideName,
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
  String? get name => r'saveFieldProvider';
}

/// A provider for saving [field] to a file in the user file directory.
///
/// Override the file name with [overrideName].
///
/// Copied from [saveField].
class SaveFieldProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for saving [field] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveField].
  SaveFieldProvider(
    Field field, {
    String? overrideName,
  }) : this._internal(
          (ref) => saveField(
            ref as SaveFieldRef,
            field,
            overrideName: overrideName,
          ),
          from: saveFieldProvider,
          name: r'saveFieldProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$saveFieldHash,
          dependencies: SaveFieldFamily._dependencies,
          allTransitiveDependencies: SaveFieldFamily._allTransitiveDependencies,
          field: field,
          overrideName: overrideName,
        );

  SaveFieldProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.field,
    required this.overrideName,
  }) : super.internal();

  final Field field;
  final String? overrideName;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveFieldRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SaveFieldProvider._internal(
        (ref) => create(ref as SaveFieldRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        field: field,
        overrideName: overrideName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveFieldProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SaveFieldProvider &&
        other.field == field &&
        other.overrideName == overrideName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, field.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveFieldRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `field` of this provider.
  Field get field;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;
}

class _SaveFieldProviderElement extends AutoDisposeFutureProviderElement<void>
    with SaveFieldRef {
  _SaveFieldProviderElement(super.provider);

  @override
  Field get field => (origin as SaveFieldProvider).field;
  @override
  String? get overrideName => (origin as SaveFieldProvider).overrideName;
}

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
String _$testFieldHash() => r'c1bbd41747c33e123d55c5e06fb3cb600ec8c842';

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
String _$testFieldExteriorBufferJoinHash() =>
    r'e7bb38ffbdcb1035e13de68ad41edb49e51471f1';

/// A provider for which type of join should be used when buffering the
/// exterior.
///
/// Copied from [TestFieldExteriorBufferJoin].
@ProviderFor(TestFieldExteriorBufferJoin)
final testFieldExteriorBufferJoinProvider =
    NotifierProvider<TestFieldExteriorBufferJoin, BufferJoin>.internal(
  TestFieldExteriorBufferJoin.new,
  name: r'testFieldExteriorBufferJoinProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testFieldExteriorBufferJoinHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestFieldExteriorBufferJoin = Notifier<BufferJoin>;
String _$testFieldInteriorBufferJoinHash() =>
    r'946bc828c562fafbaa8308f297f7f8c05e03c95a';

/// A provider for which type of join should be used when buffering the
/// interior holes.
///
/// Copied from [TestFieldInteriorBufferJoin].
@ProviderFor(TestFieldInteriorBufferJoin)
final testFieldInteriorBufferJoinProvider =
    NotifierProvider<TestFieldInteriorBufferJoin, BufferJoin>.internal(
  TestFieldInteriorBufferJoin.new,
  name: r'testFieldInteriorBufferJoinProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testFieldInteriorBufferJoinHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestFieldInteriorBufferJoin = Notifier<BufferJoin>;
String _$testFieldExteriorBufferDistanceHash() =>
    r'8e78e437129733750d660be1bd17d6804adbd92f';

/// A provider for the distance that the test [Field.polygon] exterior should
/// be buffered.
///
/// Copied from [TestFieldExteriorBufferDistance].
@ProviderFor(TestFieldExteriorBufferDistance)
final testFieldExteriorBufferDistanceProvider =
    NotifierProvider<TestFieldExteriorBufferDistance, double>.internal(
  TestFieldExteriorBufferDistance.new,
  name: r'testFieldExteriorBufferDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testFieldExteriorBufferDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestFieldExteriorBufferDistance = Notifier<double>;
String _$testFieldInteriorBufferDistanceHash() =>
    r'58813242eab697b0bb3db7c1f032be760d924e4b';

/// A provider for the distance that the test [Field.polygon] interior should
/// be buffered.
///
/// Copied from [TestFieldInteriorBufferDistance].
@ProviderFor(TestFieldInteriorBufferDistance)
final testFieldInteriorBufferDistanceProvider =
    NotifierProvider<TestFieldInteriorBufferDistance, double>.internal(
  TestFieldInteriorBufferDistance.new,
  name: r'testFieldInteriorBufferDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testFieldInteriorBufferDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestFieldInteriorBufferDistance = Notifier<double>;
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
String _$testFieldBufferGetRawPointsHash() =>
    r'7b4cc16f5238849a684f0f6c447eac72ec06f4f9';

/// A provider for whether bounding box of the test field should be shown.
///
/// Copied from [TestFieldBufferGetRawPoints].
@ProviderFor(TestFieldBufferGetRawPoints)
final testFieldBufferGetRawPointsProvider =
    NotifierProvider<TestFieldBufferGetRawPoints, bool>.internal(
  TestFieldBufferGetRawPoints.new,
  name: r'testFieldBufferGetRawPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$testFieldBufferGetRawPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestFieldBufferGetRawPoints = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
