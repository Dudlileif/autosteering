// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'implement_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for getting implements from the database.

@ProviderFor(implements)
final implementsProvider = ImplementsFamily._();

/// A provider for getting implements from the database.

final class ImplementsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Equipment>>,
          List<Equipment>,
          FutureOr<List<Equipment>>
        >
    with $FutureModifier<List<Equipment>>, $FutureProvider<List<Equipment>> {
  /// A provider for getting implements from the database.
  ImplementsProvider._({
    required ImplementsFamily super.from,
    required ({int limit, int? offset}) super.argument,
  }) : super(
         retry: null,
         name: r'implementsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$implementsHash();

  @override
  String toString() {
    return r'implementsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<Equipment>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Equipment>> create(Ref ref) {
    final argument = this.argument as ({int limit, int? offset});
    return implements(ref, limit: argument.limit, offset: argument.offset);
  }

  @override
  bool operator ==(Object other) {
    return other is ImplementsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$implementsHash() => r'6160adafb06c35d976a9ca752e861554af6c08b3';

/// A provider for getting implements from the database.

final class ImplementsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<Equipment>>,
          ({int limit, int? offset})
        > {
  ImplementsFamily._()
    : super(
        retry: null,
        name: r'implementsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for getting implements from the database.

  ImplementsProvider call({int limit = 10, int? offset}) =>
      ImplementsProvider._(
        argument: (limit: limit, offset: offset),
        from: this,
      );

  @override
  String toString() => r'implementsProvider';
}

/// A provider for inserting [implement] into the database.

@ProviderFor(insertImplement)
final insertImplementProvider = InsertImplementFamily._();

/// A provider for inserting [implement] into the database.

final class InsertImplementProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for inserting [implement] into the database.
  InsertImplementProvider._({
    required InsertImplementFamily super.from,
    required (Equipment, {bool setLoaded}) super.argument,
  }) : super(
         retry: null,
         name: r'insertImplementProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$insertImplementHash();

  @override
  String toString() {
    return r'insertImplementProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (Equipment, {bool setLoaded});
    return insertImplement(ref, argument.$1, setLoaded: argument.setLoaded);
  }

  @override
  bool operator ==(Object other) {
    return other is InsertImplementProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$insertImplementHash() => r'a292b5cf78738a54ac02ec5b89354fbd00315951';

/// A provider for inserting [implement] into the database.

final class InsertImplementFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Equipment, {bool setLoaded})
        > {
  InsertImplementFamily._()
    : super(
        retry: null,
        name: r'insertImplementProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for inserting [implement] into the database.

  InsertImplementProvider call(Equipment implement, {bool setLoaded = false}) =>
      InsertImplementProvider._(
        argument: (implement, setLoaded: setLoaded),
        from: this,
      );

  @override
  String toString() => r'insertImplementProvider';
}

/// A provider for updating [implement] in the database.

@ProviderFor(updateImplement)
final updateImplementProvider = UpdateImplementFamily._();

/// A provider for updating [implement] in the database.

final class UpdateImplementProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for updating [implement] in the database.
  UpdateImplementProvider._({
    required UpdateImplementFamily super.from,
    required (Equipment, {bool setLoaded}) super.argument,
  }) : super(
         retry: null,
         name: r'updateImplementProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$updateImplementHash();

  @override
  String toString() {
    return r'updateImplementProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (Equipment, {bool setLoaded});
    return updateImplement(ref, argument.$1, setLoaded: argument.setLoaded);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateImplementProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$updateImplementHash() => r'92c289aa4be14c8b945a3133fb9551a24a619ac3';

/// A provider for updating [implement] in the database.

final class UpdateImplementFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Equipment, {bool setLoaded})
        > {
  UpdateImplementFamily._()
    : super(
        retry: null,
        name: r'updateImplementProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for updating [implement] in the database.

  UpdateImplementProvider call(Equipment implement, {bool setLoaded = false}) =>
      UpdateImplementProvider._(
        argument: (implement, setLoaded: setLoaded),
        from: this,
      );

  @override
  String toString() => r'updateImplementProvider';
}
