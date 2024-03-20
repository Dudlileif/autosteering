// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bufferedFieldHash() => r'fc5a46a11891012983087d68adae337a2cc4b9cb';

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
String _$saveFieldHash() => r'1597ca27ab3b1d04585ac7ef64c02cebe733cc1b';

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
class SaveFieldFamily extends Family {
  /// A provider for saving [field] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveField].
  const SaveFieldFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'saveFieldProvider';

  /// A provider for saving [field] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [saveField].
  SaveFieldProvider call(
    Field field, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) {
    return SaveFieldProvider(
      field,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  SaveFieldProvider getProviderOverride(
    covariant SaveFieldProvider provider,
  ) {
    return call(
      provider.field,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(SaveFieldRef ref) create) {
    return _$SaveFieldFamilyOverride(this, create);
  }
}

class _$SaveFieldFamilyOverride implements FamilyOverride {
  _$SaveFieldFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(SaveFieldRef ref) create;

  @override
  final SaveFieldFamily overriddenFamily;

  @override
  SaveFieldProvider getProviderOverride(
    covariant SaveFieldProvider provider,
  ) {
    return provider._copyWith(create);
  }
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
    bool downloadIfWeb = false,
  }) : this._internal(
          (ref) => saveField(
            ref as SaveFieldRef,
            field,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
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
          downloadIfWeb: downloadIfWeb,
        );

  SaveFieldProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.field,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final Field field;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(SaveFieldRef ref) create,
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
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    Field, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      field,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SaveFieldProviderElement(this);
  }

  SaveFieldProvider _copyWith(
    FutureOr<void> Function(SaveFieldRef ref) create,
  ) {
    return SaveFieldProvider._internal(
      (ref) => create(ref as SaveFieldRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      field: field,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveFieldProvider &&
        other.field == field &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, field.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SaveFieldRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `field` of this provider.
  Field get field;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _SaveFieldProviderElement extends AutoDisposeFutureProviderElement<void>
    with SaveFieldRef {
  _SaveFieldProviderElement(super.provider);

  @override
  Field get field => (origin as SaveFieldProvider).field;
  @override
  String? get overrideName => (origin as SaveFieldProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as SaveFieldProvider).downloadIfWeb;
}

String _$exportFieldHash() => r'b707b1328302d7bc5842645493ab7c5c1f5e3464';

/// A provider for exporting [field] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportField].
@ProviderFor(exportField)
const exportFieldProvider = ExportFieldFamily();

/// A provider for exporting [field] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportField].
class ExportFieldFamily extends Family {
  /// A provider for exporting [field] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportField].
  const ExportFieldFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'exportFieldProvider';

  /// A provider for exporting [field] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportField].
  ExportFieldProvider call(
    Field field, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) {
    return ExportFieldProvider(
      field,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @visibleForOverriding
  @override
  ExportFieldProvider getProviderOverride(
    covariant ExportFieldProvider provider,
  ) {
    return call(
      provider.field,
      overrideName: provider.overrideName,
      downloadIfWeb: provider.downloadIfWeb,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(ExportFieldRef ref) create) {
    return _$ExportFieldFamilyOverride(this, create);
  }
}

class _$ExportFieldFamilyOverride implements FamilyOverride {
  _$ExportFieldFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(ExportFieldRef ref) create;

  @override
  final ExportFieldFamily overriddenFamily;

  @override
  ExportFieldProvider getProviderOverride(
    covariant ExportFieldProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for exporting [field] to a file.
///
/// Override the file name with [overrideName].
///
/// Copied from [exportField].
class ExportFieldProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for exporting [field] to a file.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [exportField].
  ExportFieldProvider(
    Field field, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) : this._internal(
          (ref) => exportField(
            ref as ExportFieldRef,
            field,
            overrideName: overrideName,
            downloadIfWeb: downloadIfWeb,
          ),
          from: exportFieldProvider,
          name: r'exportFieldProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$exportFieldHash,
          dependencies: ExportFieldFamily._dependencies,
          allTransitiveDependencies:
              ExportFieldFamily._allTransitiveDependencies,
          field: field,
          overrideName: overrideName,
          downloadIfWeb: downloadIfWeb,
        );

  ExportFieldProvider._internal(
    super.create, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.field,
    required this.overrideName,
    required this.downloadIfWeb,
  }) : super.internal();

  final Field field;
  final String? overrideName;
  final bool downloadIfWeb;

  @override
  Override overrideWith(
    FutureOr<void> Function(ExportFieldRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExportFieldProvider._internal(
        (ref) => create(ref as ExportFieldRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        field: field,
        overrideName: overrideName,
        downloadIfWeb: downloadIfWeb,
      ),
    );
  }

  @override
  (
    Field, {
    String? overrideName,
    bool downloadIfWeb,
  }) get argument {
    return (
      field,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _ExportFieldProviderElement(this);
  }

  ExportFieldProvider _copyWith(
    FutureOr<void> Function(ExportFieldRef ref) create,
  ) {
    return ExportFieldProvider._internal(
      (ref) => create(ref as ExportFieldRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      field: field,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportFieldProvider &&
        other.field == field &&
        other.overrideName == overrideName &&
        other.downloadIfWeb == downloadIfWeb;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, field.hashCode);
    hash = _SystemHash.combine(hash, overrideName.hashCode);
    hash = _SystemHash.combine(hash, downloadIfWeb.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExportFieldRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `field` of this provider.
  Field get field;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;

  /// The parameter `downloadIfWeb` of this provider.
  bool get downloadIfWeb;
}

class _ExportFieldProviderElement extends AutoDisposeFutureProviderElement<void>
    with ExportFieldRef {
  _ExportFieldProviderElement(super.provider);

  @override
  Field get field => (origin as ExportFieldProvider).field;
  @override
  String? get overrideName => (origin as ExportFieldProvider).overrideName;
  @override
  bool get downloadIfWeb => (origin as ExportFieldProvider).downloadIfWeb;
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
String _$deleteFieldHash() => r'72213ab0d9d868bd948d453674cd94510ea39aa5';

/// A provider for deleting [field] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteField].
@ProviderFor(deleteField)
const deleteFieldProvider = DeleteFieldFamily();

/// A provider for deleting [field] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteField].
class DeleteFieldFamily extends Family {
  /// A provider for deleting [field] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteField].
  const DeleteFieldFamily();

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'deleteFieldProvider';

  /// A provider for deleting [field] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteField].
  DeleteFieldProvider call(
    Field field, {
    String? overrideName,
  }) {
    return DeleteFieldProvider(
      field,
      overrideName: overrideName,
    );
  }

  @visibleForOverriding
  @override
  DeleteFieldProvider getProviderOverride(
    covariant DeleteFieldProvider provider,
  ) {
    return call(
      provider.field,
      overrideName: provider.overrideName,
    );
  }

  /// Enables overriding the behavior of this provider, no matter the parameters.
  Override overrideWith(FutureOr<void> Function(DeleteFieldRef ref) create) {
    return _$DeleteFieldFamilyOverride(this, create);
  }
}

class _$DeleteFieldFamilyOverride implements FamilyOverride {
  _$DeleteFieldFamilyOverride(this.overriddenFamily, this.create);

  final FutureOr<void> Function(DeleteFieldRef ref) create;

  @override
  final DeleteFieldFamily overriddenFamily;

  @override
  DeleteFieldProvider getProviderOverride(
    covariant DeleteFieldProvider provider,
  ) {
    return provider._copyWith(create);
  }
}

/// A provider for deleting [field] from the user file system.
///
/// Override the file name with [overrideName].
///
/// Copied from [deleteField].
class DeleteFieldProvider extends AutoDisposeFutureProvider<void> {
  /// A provider for deleting [field] from the user file system.
  ///
  /// Override the file name with [overrideName].
  ///
  /// Copied from [deleteField].
  DeleteFieldProvider(
    Field field, {
    String? overrideName,
  }) : this._internal(
          (ref) => deleteField(
            ref as DeleteFieldRef,
            field,
            overrideName: overrideName,
          ),
          from: deleteFieldProvider,
          name: r'deleteFieldProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteFieldHash,
          dependencies: DeleteFieldFamily._dependencies,
          allTransitiveDependencies:
              DeleteFieldFamily._allTransitiveDependencies,
          field: field,
          overrideName: overrideName,
        );

  DeleteFieldProvider._internal(
    super.create, {
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
    FutureOr<void> Function(DeleteFieldRef ref) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteFieldProvider._internal(
        (ref) => create(ref as DeleteFieldRef),
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
  (
    Field, {
    String? overrideName,
  }) get argument {
    return (
      field,
      overrideName: overrideName,
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteFieldProviderElement(this);
  }

  DeleteFieldProvider _copyWith(
    FutureOr<void> Function(DeleteFieldRef ref) create,
  ) {
    return DeleteFieldProvider._internal(
      (ref) => create(ref as DeleteFieldRef),
      name: name,
      dependencies: dependencies,
      allTransitiveDependencies: allTransitiveDependencies,
      debugGetCreateSourceHash: debugGetCreateSourceHash,
      from: from,
      field: field,
      overrideName: overrideName,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteFieldProvider &&
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

mixin DeleteFieldRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `field` of this provider.
  Field get field;

  /// The parameter `overrideName` of this provider.
  String? get overrideName;
}

class _DeleteFieldProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteFieldRef {
  _DeleteFieldProviderElement(super.provider);

  @override
  Field get field => (origin as DeleteFieldProvider).field;
  @override
  String? get overrideName => (origin as DeleteFieldProvider).overrideName;
}

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
String _$activeFieldHash() => r'cfafb2d250b006032865db2e2e719c9c6fc7cad2';

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
String _$fieldExteriorRingHash() => r'fa5543b11982dc3d28fcd1fed939870033c3c355';

/// A provider for the recorded exterior ring of a field.
///
/// Copied from [FieldExteriorRing].
@ProviderFor(FieldExteriorRing)
final fieldExteriorRingProvider =
    NotifierProvider<FieldExteriorRing, List<Geographic>?>.internal(
  FieldExteriorRing.new,
  name: r'fieldExteriorRingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldExteriorRingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldExteriorRing = Notifier<List<Geographic>?>;
String _$fieldInteriorRingsHash() =>
    r'f14e02bd6765947a51d6866fd90d8f1a33ba785a';

/// A provider for the recorded interior rings of a field.
///
/// Copied from [FieldInteriorRings].
@ProviderFor(FieldInteriorRings)
final fieldInteriorRingsProvider =
    NotifierProvider<FieldInteriorRings, List<List<Geographic>>?>.internal(
  FieldInteriorRings.new,
  name: r'fieldInteriorRingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fieldInteriorRingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FieldInteriorRings = Notifier<List<List<Geographic>>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
