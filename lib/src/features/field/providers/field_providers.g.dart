// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bufferedFieldHash() => r'97f5b22f26b076475002714893cee317abe31334';

/// A provider for creating and updating the buffered test field.
///
/// Copied from [bufferedField].
@ProviderFor(bufferedField)
final bufferedFieldProvider = FutureProvider<Field?>.internal(
  bufferedField,
  name: r'bufferedFieldProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$bufferedFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BufferedFieldRef = FutureProviderRef<Field?>;
String _$saveFieldHash() => r'6618b0c9eb255bde804a6dc997047d5098089801';

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
class SaveFieldProvider extends AutoDisposeProvider<AsyncValue<void>> {
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
    AsyncValue<void> Function(SaveFieldRef provider) create,
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
  AutoDisposeProviderElement<AsyncValue<void>> createElement() {
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

mixin SaveFieldRef on AutoDisposeProviderRef<AsyncValue<void>> {
  /// The parameter `field` of this provider.
  Field get field;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;
}

class _SaveFieldProviderElement
    extends AutoDisposeProviderElement<AsyncValue<void>> with SaveFieldRef {
  _SaveFieldProviderElement(super.provider);

  @override
  Field get field => (origin as SaveFieldProvider).field;
  @override
  String? get overrideName => (origin as SaveFieldProvider).overrideName;
}

String _$savedFieldsHash() => r'e00c8b585fa3074ce2c60744e8a8b05c79da1a54';

/// A provider for reading and holding all the saved [Field]s in the
/// user file directory.
///
/// Copied from [savedFields].
@ProviderFor(savedFields)
final savedFieldsProvider = Provider<AsyncValue<List<Field>>>.internal(
  savedFields,
  name: r'savedFieldsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$savedFieldsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavedFieldsRef = ProviderRef<AsyncValue<List<Field>>>;
String _$showFieldHash() => r'ebab742cb524d06aa00b5ac6dfa2ee9419256ec8';

/// A provider for whether the active field should be shown.
///
/// Copied from [ShowField].
@ProviderFor(ShowField)
final showFieldProvider = NotifierProvider<ShowField, bool>.internal(
  ShowField.new,
  name: r'showFieldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$showFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowField = Notifier<bool>;
String _$activeFieldHash() => r'1748d540c188a01efa133d71f24d1904b578b4f6';

/// A provider for the active field.
///
/// Copied from [ActiveField].
@ProviderFor(ActiveField)
final activeFieldProvider = NotifierProvider<ActiveField, Field?>.internal(
  ActiveField.new,
  name: r'activeFieldProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$activeFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveField = Notifier<Field?>;
String _$showFieldBorderPointsHash() =>
    r'11acdacf420ead33ce1cc33abb7d1c74df1252ca';

/// A provider for whether the active field's border's points should be shown.
///
/// Copied from [ShowFieldBorderPoints].
@ProviderFor(ShowFieldBorderPoints)
final showFieldBorderPointsProvider =
    NotifierProvider<ShowFieldBorderPoints, bool>.internal(
  ShowFieldBorderPoints.new,
  name: r'showFieldBorderPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showFieldBorderPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowFieldBorderPoints = Notifier<bool>;
String _$showFieldBoundingBoxHash() =>
    r'3e70292800ffeea15d7e02ed37cf1b40622e7b69';

/// A provider for whether bounding box of the active field should be shown.
///
/// Copied from [ShowFieldBoundingBox].
@ProviderFor(ShowFieldBoundingBox)
final showFieldBoundingBoxProvider =
    NotifierProvider<ShowFieldBoundingBox, bool>.internal(
  ShowFieldBoundingBox.new,
  name: r'showFieldBoundingBoxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showFieldBoundingBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowFieldBoundingBox = Notifier<bool>;
String _$fieldExteriorBufferJoinHash() =>
    r'796c3ea0136fee705c8d8110d559a4fb988d1c32';

/// A provider for which type of join should be used when buffering the
/// exterior.
///
/// Copied from [FieldExteriorBufferJoin].
@ProviderFor(FieldExteriorBufferJoin)
final fieldExteriorBufferJoinProvider =
    NotifierProvider<FieldExteriorBufferJoin, BufferJoin>.internal(
  FieldExteriorBufferJoin.new,
  name: r'fieldExteriorBufferJoinProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldExteriorBufferJoinHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldExteriorBufferJoin = Notifier<BufferJoin>;
String _$fieldInteriorBufferJoinHash() =>
    r'871e2407321b8aa38922a125be5f6d4cb692a302';

/// A provider for which type of join should be used when buffering the
/// interior holes.
///
/// Copied from [FieldInteriorBufferJoin].
@ProviderFor(FieldInteriorBufferJoin)
final fieldInteriorBufferJoinProvider =
    NotifierProvider<FieldInteriorBufferJoin, BufferJoin>.internal(
  FieldInteriorBufferJoin.new,
  name: r'fieldInteriorBufferJoinProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldInteriorBufferJoinHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldInteriorBufferJoin = Notifier<BufferJoin>;
String _$fieldBufferEnabledHash() =>
    r'b63d6f348ec45ee7d6ba061321dd2608225b0685';

/// Whether the field buffer functionality should be enabled.
///
/// Copied from [FieldBufferEnabled].
@ProviderFor(FieldBufferEnabled)
final fieldBufferEnabledProvider =
    NotifierProvider<FieldBufferEnabled, bool>.internal(
  FieldBufferEnabled.new,
  name: r'fieldBufferEnabledProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldBufferEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldBufferEnabled = Notifier<bool>;
String _$fieldExteriorBufferDistanceHash() =>
    r'105f35fd275a4aed8b16bb80cdad26a65ce629bb';

/// A provider for the distance that the test [Field.polygon] exterior should
/// be buffered.
///
/// Copied from [FieldExteriorBufferDistance].
@ProviderFor(FieldExteriorBufferDistance)
final fieldExteriorBufferDistanceProvider =
    NotifierProvider<FieldExteriorBufferDistance, double>.internal(
  FieldExteriorBufferDistance.new,
  name: r'fieldExteriorBufferDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldExteriorBufferDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldExteriorBufferDistance = Notifier<double>;
String _$fieldInteriorBufferDistanceHash() =>
    r'e32da69d4e33be67288838bfb61c1a21dc3cf6c8';

/// A provider for the distance that the test [Field.polygon] interior should
/// be buffered.
///
/// Copied from [FieldInteriorBufferDistance].
@ProviderFor(FieldInteriorBufferDistance)
final fieldInteriorBufferDistanceProvider =
    NotifierProvider<FieldInteriorBufferDistance, double>.internal(
  FieldInteriorBufferDistance.new,
  name: r'fieldInteriorBufferDistanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldInteriorBufferDistanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldInteriorBufferDistance = Notifier<double>;
String _$showBufferedFieldHash() => r'cf5a7873736143e204602485c35222ce2788739d';

/// A provider for whether the buffered test field should be shown.
///
/// Copied from [ShowBufferedField].
@ProviderFor(ShowBufferedField)
final showBufferedFieldProvider =
    NotifierProvider<ShowBufferedField, bool>.internal(
  ShowBufferedField.new,
  name: r'showBufferedFieldProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showBufferedFieldHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowBufferedField = Notifier<bool>;
String _$showBufferedFieldBoundingBoxHash() =>
    r'4c34d79c7b64b263a6fa54134b1153740c2709eb';

/// A provider for whether bounding box of the test field should be shown.
///
/// Copied from [ShowBufferedFieldBoundingBox].
@ProviderFor(ShowBufferedFieldBoundingBox)
final showBufferedFieldBoundingBoxProvider =
    NotifierProvider<ShowBufferedFieldBoundingBox, bool>.internal(
  ShowBufferedFieldBoundingBox.new,
  name: r'showBufferedFieldBoundingBoxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showBufferedFieldBoundingBoxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowBufferedFieldBoundingBox = Notifier<bool>;
String _$fieldBufferGetRawPointsHash() =>
    r'a4474508c937cec9e5a205b8aab69445bdb419af';

/// A provider for whether bounding box of the test field should be shown.
///
/// Copied from [FieldBufferGetRawPoints].
@ProviderFor(FieldBufferGetRawPoints)
final fieldBufferGetRawPointsProvider =
    NotifierProvider<FieldBufferGetRawPoints, bool>.internal(
  FieldBufferGetRawPoints.new,
  name: r'fieldBufferGetRawPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldBufferGetRawPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldBufferGetRawPoints = Notifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
