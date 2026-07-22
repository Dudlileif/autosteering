// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether the active field should be shown.

@ProviderFor(ShowField)
final showFieldProvider = ShowFieldProvider._();

/// A provider for whether the active field should be shown.
final class ShowFieldProvider extends $NotifierProvider<ShowField, bool> {
  /// A provider for whether the active field should be shown.
  ShowFieldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showFieldProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showFieldHash();

  @$internal
  @override
  ShowField create() => ShowField();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showFieldHash() => r'ebab742cb524d06aa00b5ac6dfa2ee9419256ec8';

/// A provider for whether the active field should be shown.

abstract class _$ShowField extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the active field.

@ProviderFor(ActiveField)
final activeFieldProvider = ActiveFieldProvider._();

/// A provider for the active field.
final class ActiveFieldProvider extends $NotifierProvider<ActiveField, Field?> {
  /// A provider for the active field.
  ActiveFieldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeFieldProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeFieldHash();

  @$internal
  @override
  ActiveField create() => ActiveField();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Field? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Field?>(value),
    );
  }
}

String _$activeFieldHash() => r'6b464dec170f5960fb38979160138d08b78346f2';

/// A provider for the active field.

abstract class _$ActiveField extends $Notifier<Field?> {
  Field? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Field?, Field?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Field?, Field?>,
              Field?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether the active field's border's points should be shown.

@ProviderFor(ShowFieldBorderPoints)
final showFieldBorderPointsProvider = ShowFieldBorderPointsProvider._();

/// A provider for whether the active field's border's points should be shown.
final class ShowFieldBorderPointsProvider
    extends $NotifierProvider<ShowFieldBorderPoints, bool> {
  /// A provider for whether the active field's border's points should be shown.
  ShowFieldBorderPointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showFieldBorderPointsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showFieldBorderPointsHash();

  @$internal
  @override
  ShowFieldBorderPoints create() => ShowFieldBorderPoints();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showFieldBorderPointsHash() =>
    r'11acdacf420ead33ce1cc33abb7d1c74df1252ca';

/// A provider for whether the active field's border's points should be shown.

abstract class _$ShowFieldBorderPoints extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether bounding box of the active field should be shown.

@ProviderFor(ShowFieldBoundingBox)
final showFieldBoundingBoxProvider = ShowFieldBoundingBoxProvider._();

/// A provider for whether bounding box of the active field should be shown.
final class ShowFieldBoundingBoxProvider
    extends $NotifierProvider<ShowFieldBoundingBox, bool> {
  /// A provider for whether bounding box of the active field should be shown.
  ShowFieldBoundingBoxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showFieldBoundingBoxProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showFieldBoundingBoxHash();

  @$internal
  @override
  ShowFieldBoundingBox create() => ShowFieldBoundingBox();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showFieldBoundingBoxHash() =>
    r'3e70292800ffeea15d7e02ed37cf1b40622e7b69';

/// A provider for whether bounding box of the active field should be shown.

abstract class _$ShowFieldBoundingBox extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for which type of join should be used when buffering the
/// exterior.

@ProviderFor(FieldExteriorBufferJoin)
final fieldExteriorBufferJoinProvider = FieldExteriorBufferJoinProvider._();

/// A provider for which type of join should be used when buffering the
/// exterior.
final class FieldExteriorBufferJoinProvider
    extends $NotifierProvider<FieldExteriorBufferJoin, BufferJoin> {
  /// A provider for which type of join should be used when buffering the
  /// exterior.
  FieldExteriorBufferJoinProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldExteriorBufferJoinProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldExteriorBufferJoinHash();

  @$internal
  @override
  FieldExteriorBufferJoin create() => FieldExteriorBufferJoin();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BufferJoin value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BufferJoin>(value),
    );
  }
}

String _$fieldExteriorBufferJoinHash() =>
    r'796c3ea0136fee705c8d8110d559a4fb988d1c32';

/// A provider for which type of join should be used when buffering the
/// exterior.

abstract class _$FieldExteriorBufferJoin extends $Notifier<BufferJoin> {
  BufferJoin build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<BufferJoin, BufferJoin>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BufferJoin, BufferJoin>,
              BufferJoin,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for which type of join should be used when buffering the
/// interior holes.

@ProviderFor(FieldInteriorBufferJoin)
final fieldInteriorBufferJoinProvider = FieldInteriorBufferJoinProvider._();

/// A provider for which type of join should be used when buffering the
/// interior holes.
final class FieldInteriorBufferJoinProvider
    extends $NotifierProvider<FieldInteriorBufferJoin, BufferJoin> {
  /// A provider for which type of join should be used when buffering the
  /// interior holes.
  FieldInteriorBufferJoinProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldInteriorBufferJoinProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldInteriorBufferJoinHash();

  @$internal
  @override
  FieldInteriorBufferJoin create() => FieldInteriorBufferJoin();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BufferJoin value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BufferJoin>(value),
    );
  }
}

String _$fieldInteriorBufferJoinHash() =>
    r'871e2407321b8aa38922a125be5f6d4cb692a302';

/// A provider for which type of join should be used when buffering the
/// interior holes.

abstract class _$FieldInteriorBufferJoin extends $Notifier<BufferJoin> {
  BufferJoin build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<BufferJoin, BufferJoin>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BufferJoin, BufferJoin>,
              BufferJoin,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Whether the field buffer functionality should be enabled.

@ProviderFor(FieldBufferEnabled)
final fieldBufferEnabledProvider = FieldBufferEnabledProvider._();

/// Whether the field buffer functionality should be enabled.
final class FieldBufferEnabledProvider
    extends $NotifierProvider<FieldBufferEnabled, bool> {
  /// Whether the field buffer functionality should be enabled.
  FieldBufferEnabledProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldBufferEnabledProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldBufferEnabledHash();

  @$internal
  @override
  FieldBufferEnabled create() => FieldBufferEnabled();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$fieldBufferEnabledHash() =>
    r'b63d6f348ec45ee7d6ba061321dd2608225b0685';

/// Whether the field buffer functionality should be enabled.

abstract class _$FieldBufferEnabled extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for which type of field buffer distance should be used.

@ProviderFor(ActiveFieldBufferDistanceType)
final activeFieldBufferDistanceTypeProvider =
    ActiveFieldBufferDistanceTypeProvider._();

/// A provider for which type of field buffer distance should be used.
final class ActiveFieldBufferDistanceTypeProvider
    extends
        $NotifierProvider<
          ActiveFieldBufferDistanceType,
          FieldBufferDistanceType
        > {
  /// A provider for which type of field buffer distance should be used.
  ActiveFieldBufferDistanceTypeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeFieldBufferDistanceTypeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeFieldBufferDistanceTypeHash();

  @$internal
  @override
  ActiveFieldBufferDistanceType create() => ActiveFieldBufferDistanceType();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FieldBufferDistanceType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FieldBufferDistanceType>(value),
    );
  }
}

String _$activeFieldBufferDistanceTypeHash() =>
    r'7bf041a894a1e891c19465ab9dbfe6f732975280';

/// A provider for which type of field buffer distance should be used.

abstract class _$ActiveFieldBufferDistanceType
    extends $Notifier<FieldBufferDistanceType> {
  FieldBufferDistanceType build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<FieldBufferDistanceType, FieldBufferDistanceType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FieldBufferDistanceType, FieldBufferDistanceType>,
              FieldBufferDistanceType,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the distance that the [Field.polygon] exterior should
/// be buffered.

@ProviderFor(FieldExteriorBufferDistance)
final fieldExteriorBufferDistanceProvider =
    FieldExteriorBufferDistanceProvider._();

/// A provider for the distance that the [Field.polygon] exterior should
/// be buffered.
final class FieldExteriorBufferDistanceProvider
    extends $NotifierProvider<FieldExteriorBufferDistance, double> {
  /// A provider for the distance that the [Field.polygon] exterior should
  /// be buffered.
  FieldExteriorBufferDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldExteriorBufferDistanceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldExteriorBufferDistanceHash();

  @$internal
  @override
  FieldExteriorBufferDistance create() => FieldExteriorBufferDistance();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$fieldExteriorBufferDistanceHash() =>
    r'4693f24b08d8dd156481241f95cecbe3b0dfbeb3';

/// A provider for the distance that the [Field.polygon] exterior should
/// be buffered.

abstract class _$FieldExteriorBufferDistance extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the distance that the [Field.polygon] interior should
/// be buffered.

@ProviderFor(FieldInteriorBufferDistance)
final fieldInteriorBufferDistanceProvider =
    FieldInteriorBufferDistanceProvider._();

/// A provider for the distance that the [Field.polygon] interior should
/// be buffered.
final class FieldInteriorBufferDistanceProvider
    extends $NotifierProvider<FieldInteriorBufferDistance, double> {
  /// A provider for the distance that the [Field.polygon] interior should
  /// be buffered.
  FieldInteriorBufferDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldInteriorBufferDistanceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldInteriorBufferDistanceHash();

  @$internal
  @override
  FieldInteriorBufferDistance create() => FieldInteriorBufferDistance();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$fieldInteriorBufferDistanceHash() =>
    r'78534523499709892325c399ff3f435a25455f4e';

/// A provider for the distance that the [Field.polygon] interior should
/// be buffered.

abstract class _$FieldInteriorBufferDistance extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether the buffered field should be shown.

@ProviderFor(ShowBufferedField)
final showBufferedFieldProvider = ShowBufferedFieldProvider._();

/// A provider for whether the buffered field should be shown.
final class ShowBufferedFieldProvider
    extends $NotifierProvider<ShowBufferedField, bool> {
  /// A provider for whether the buffered field should be shown.
  ShowBufferedFieldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showBufferedFieldProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showBufferedFieldHash();

  @$internal
  @override
  ShowBufferedField create() => ShowBufferedField();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showBufferedFieldHash() => r'8557480be302964bd7b38ea41bbd394f51362e80';

/// A provider for whether the buffered field should be shown.

abstract class _$ShowBufferedField extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for creating and updating the buffered test field.

@ProviderFor(bufferedField)
final bufferedFieldProvider = BufferedFieldProvider._();

/// A provider for creating and updating the buffered test field.

final class BufferedFieldProvider
    extends $FunctionalProvider<AsyncValue<Field?>, Field?, FutureOr<Field?>>
    with $FutureModifier<Field?>, $FutureProvider<Field?> {
  /// A provider for creating and updating the buffered test field.
  BufferedFieldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bufferedFieldProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bufferedFieldHash();

  @$internal
  @override
  $FutureProviderElement<Field?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Field?> create(Ref ref) {
    return bufferedField(ref);
  }
}

String _$bufferedFieldHash() => r'b656a524caa62cc5ce4277030d42447c39bbf122';

/// A provider for whether bounding box of the test field should be shown.

@ProviderFor(ShowBufferedFieldBoundingBox)
final showBufferedFieldBoundingBoxProvider =
    ShowBufferedFieldBoundingBoxProvider._();

/// A provider for whether bounding box of the test field should be shown.
final class ShowBufferedFieldBoundingBoxProvider
    extends $NotifierProvider<ShowBufferedFieldBoundingBox, bool> {
  /// A provider for whether bounding box of the test field should be shown.
  ShowBufferedFieldBoundingBoxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showBufferedFieldBoundingBoxProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showBufferedFieldBoundingBoxHash();

  @$internal
  @override
  ShowBufferedFieldBoundingBox create() => ShowBufferedFieldBoundingBox();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showBufferedFieldBoundingBoxHash() =>
    r'4c34d79c7b64b263a6fa54134b1153740c2709eb';

/// A provider for whether bounding box of the test field should be shown.

abstract class _$ShowBufferedFieldBoundingBox extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for whether bounding box of the field should be shown.

@ProviderFor(FieldBufferGetRawPoints)
final fieldBufferGetRawPointsProvider = FieldBufferGetRawPointsProvider._();

/// A provider for whether bounding box of the field should be shown.
final class FieldBufferGetRawPointsProvider
    extends $NotifierProvider<FieldBufferGetRawPoints, bool> {
  /// A provider for whether bounding box of the field should be shown.
  FieldBufferGetRawPointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldBufferGetRawPointsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldBufferGetRawPointsHash();

  @$internal
  @override
  FieldBufferGetRawPoints create() => FieldBufferGetRawPoints();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$fieldBufferGetRawPointsHash() =>
    r'a4474508c937cec9e5a205b8aab69445bdb419af';

/// A provider for whether bounding box of the field should be shown.

abstract class _$FieldBufferGetRawPoints extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the recorded exterior ring of a field.

@ProviderFor(FieldExteriorRing)
final fieldExteriorRingProvider = FieldExteriorRingProvider._();

/// A provider for the recorded exterior ring of a field.
final class FieldExteriorRingProvider
    extends $NotifierProvider<FieldExteriorRing, List<Geographic>?> {
  /// A provider for the recorded exterior ring of a field.
  FieldExteriorRingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldExteriorRingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldExteriorRingHash();

  @$internal
  @override
  FieldExteriorRing create() => FieldExteriorRing();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Geographic>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Geographic>?>(value),
    );
  }
}

String _$fieldExteriorRingHash() => r'fa5543b11982dc3d28fcd1fed939870033c3c355';

/// A provider for the recorded exterior ring of a field.

abstract class _$FieldExteriorRing extends $Notifier<List<Geographic>?> {
  List<Geographic>? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Geographic>?, List<Geographic>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Geographic>?, List<Geographic>?>,
              List<Geographic>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the recorded interior rings of a field.

@ProviderFor(FieldInteriorRings)
final fieldInteriorRingsProvider = FieldInteriorRingsProvider._();

/// A provider for the recorded interior rings of a field.
final class FieldInteriorRingsProvider
    extends $NotifierProvider<FieldInteriorRings, List<List<Geographic>>?> {
  /// A provider for the recorded interior rings of a field.
  FieldInteriorRingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fieldInteriorRingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fieldInteriorRingsHash();

  @$internal
  @override
  FieldInteriorRings create() => FieldInteriorRings();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<List<Geographic>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<List<Geographic>>?>(value),
    );
  }
}

String _$fieldInteriorRingsHash() =>
    r'f14e02bd6765947a51d6866fd90d8f1a33ba785a';

/// A provider for the recorded interior rings of a field.

abstract class _$FieldInteriorRings extends $Notifier<List<List<Geographic>>?> {
  List<List<Geographic>>? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<List<List<Geographic>>?, List<List<Geographic>>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<List<Geographic>>?, List<List<Geographic>>?>,
              List<List<Geographic>>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for saving [field] to a file in the user file directory.
///
/// Override the file name with [overrideName].

@ProviderFor(saveField)
final saveFieldProvider = SaveFieldFamily._();

/// A provider for saving [field] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveFieldProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [field] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  SaveFieldProvider._({
    required SaveFieldFamily super.from,
    required (Field, {String? overrideName, bool downloadIfWeb}) super.argument,
  }) : super(
         retry: null,
         name: r'saveFieldProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$saveFieldHash();

  @override
  String toString() {
    return r'saveFieldProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument as (Field, {String? overrideName, bool downloadIfWeb});
    return saveField(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SaveFieldProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$saveFieldHash() => r'8ad4d55d826dda65ac1bd7623da255d18431bead';

/// A provider for saving [field] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SaveFieldFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Field, {String? overrideName, bool downloadIfWeb})
        > {
  SaveFieldFamily._()
    : super(
        retry: null,
        name: r'saveFieldProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// A provider for saving [field] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].

  SaveFieldProvider call(
    Field field, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => SaveFieldProvider._(
    argument: (field, overrideName: overrideName, downloadIfWeb: downloadIfWeb),
    from: this,
  );

  @override
  String toString() => r'saveFieldProvider';
}

/// A provider for exporting [field] to a file.
///
/// Override the file name with [overrideName].

@ProviderFor(exportField)
final exportFieldProvider = ExportFieldFamily._();

/// A provider for exporting [field] to a file.
///
/// Override the file name with [overrideName].

final class ExportFieldProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting [field] to a file.
  ///
  /// Override the file name with [overrideName].
  ExportFieldProvider._({
    required ExportFieldFamily super.from,
    required (
      Field, {
      String dialogTitle,
      String? overrideName,
      bool downloadIfWeb,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'exportFieldProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportFieldHash();

  @override
  String toString() {
    return r'exportFieldProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument =
        this.argument
            as (
              Field, {
              String dialogTitle,
              String? overrideName,
              bool downloadIfWeb,
            });
    return exportField(
      ref,
      argument.$1,
      dialogTitle: argument.dialogTitle,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportFieldProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportFieldHash() => r'256b61b1e74bf86a0959a96c343082269cc8c592';

/// A provider for exporting [field] to a file.
///
/// Override the file name with [overrideName].

final class ExportFieldFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (
            Field, {
            String dialogTitle,
            String? overrideName,
            bool downloadIfWeb,
          })
        > {
  ExportFieldFamily._()
    : super(
        retry: null,
        name: r'exportFieldProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting [field] to a file.
  ///
  /// Override the file name with [overrideName].

  ExportFieldProvider call(
    Field field, {
    required String dialogTitle,
    String? overrideName,
    bool downloadIfWeb = true,
  }) => ExportFieldProvider._(
    argument: (
      field,
      dialogTitle: dialogTitle,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'exportFieldProvider';
}

/// A provider for reading and holding all the saved [Field]s in the
/// user file directory.

@ProviderFor(savedFields)
final savedFieldsProvider = SavedFieldsProvider._();

/// A provider for reading and holding all the saved [Field]s in the
/// user file directory.

final class SavedFieldsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Field>>,
          List<Field>,
          FutureOr<List<Field>>
        >
    with $FutureModifier<List<Field>>, $FutureProvider<List<Field>> {
  /// A provider for reading and holding all the saved [Field]s in the
  /// user file directory.
  SavedFieldsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedFieldsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedFieldsHash();

  @$internal
  @override
  $FutureProviderElement<List<Field>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Field>> create(Ref ref) {
    return savedFields(ref);
  }
}

String _$savedFieldsHash() => r'fc23b1736f10f7e7593bf9ba74f16ea673b149ed';

/// A provider for deleting [field] from the user file system.
///
/// Override the file name with [overrideName].

@ProviderFor(deleteField)
final deleteFieldProvider = DeleteFieldFamily._();

/// A provider for deleting [field] from the user file system.
///
/// Override the file name with [overrideName].

final class DeleteFieldProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting [field] from the user file system.
  ///
  /// Override the file name with [overrideName].
  DeleteFieldProvider._({
    required DeleteFieldFamily super.from,
    required (Field, {String? overrideName}) super.argument,
  }) : super(
         retry: null,
         name: r'deleteFieldProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteFieldHash();

  @override
  String toString() {
    return r'deleteFieldProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as (Field, {String? overrideName});
    return deleteField(ref, argument.$1, overrideName: argument.overrideName);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteFieldProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteFieldHash() => r'8902ddd80ed51caa11ba5927c4d3aa1d10cc3b0f';

/// A provider for deleting [field] from the user file system.
///
/// Override the file name with [overrideName].

final class DeleteFieldFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (Field, {String? overrideName})
        > {
  DeleteFieldFamily._()
    : super(
        retry: null,
        name: r'deleteFieldProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting [field] from the user file system.
  ///
  /// Override the file name with [overrideName].

  DeleteFieldProvider call(Field field, {String? overrideName}) =>
      DeleteFieldProvider._(
        argument: (field, overrideName: overrideName),
        from: this,
      );

  @override
  String toString() => r'deleteFieldProvider';
}

/// A provider for loading a [Field] from a file at [path], if it's valid.

@ProviderFor(loadFieldFromFile)
final loadFieldFromFileProvider = LoadFieldFromFileFamily._();

/// A provider for loading a [Field] from a file at [path], if it's valid.

final class LoadFieldFromFileProvider
    extends $FunctionalProvider<AsyncValue<Field?>, Field?, FutureOr<Field?>>
    with $FutureModifier<Field?>, $FutureProvider<Field?> {
  /// A provider for loading a [Field] from a file at [path], if it's valid.
  LoadFieldFromFileProvider._({
    required LoadFieldFromFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadFieldFromFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadFieldFromFileHash();

  @override
  String toString() {
    return r'loadFieldFromFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Field?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Field?> create(Ref ref) {
    final argument = this.argument as String;
    return loadFieldFromFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadFieldFromFileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadFieldFromFileHash() => r'defdf4eda3e6aa375860ecaddb0a99bc3fb1ae46';

/// A provider for loading a [Field] from a file at [path], if it's valid.

final class LoadFieldFromFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Field?>, String> {
  LoadFieldFromFileFamily._()
    : super(
        retry: null,
        name: r'loadFieldFromFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for loading a [Field] from a file at [path], if it's valid.

  LoadFieldFromFileProvider call(String path) =>
      LoadFieldFromFileProvider._(argument: path, from: this);

  @override
  String toString() => r'loadFieldFromFileProvider';
}

/// A provider for importing a field from a file and applying
/// [ActiveField] provider.

@ProviderFor(importField)
final importFieldProvider = ImportFieldFamily._();

/// A provider for importing a field from a file and applying
/// [ActiveField] provider.

final class ImportFieldProvider
    extends $FunctionalProvider<AsyncValue<Field?>, Field?, FutureOr<Field?>>
    with $FutureModifier<Field?>, $FutureProvider<Field?> {
  /// A provider for importing a field from a file and applying
  /// [ActiveField] provider.
  ImportFieldProvider._({
    required ImportFieldFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'importFieldProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$importFieldHash();

  @override
  String toString() {
    return r'importFieldProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Field?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Field?> create(Ref ref) {
    final argument = this.argument as String;
    return importField(ref, dialogTitle: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImportFieldProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$importFieldHash() => r'8f91ca2cdd0832304d6854f5b7849bea5aace053';

/// A provider for importing a field from a file and applying
/// [ActiveField] provider.

final class ImportFieldFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Field?>, String> {
  ImportFieldFamily._()
    : super(
        retry: null,
        name: r'importFieldProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for importing a field from a file and applying
  /// [ActiveField] provider.

  ImportFieldProvider call({required String dialogTitle}) =>
      ImportFieldProvider._(argument: dialogTitle, from: this);

  @override
  String toString() => r'importFieldProvider';
}

/// A provider for exporting all field files.

@ProviderFor(exportFields)
final exportFieldsProvider = ExportFieldsFamily._();

/// A provider for exporting all field files.

final class ExportFieldsProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting all field files.
  ExportFieldsProvider._({
    required ExportFieldsFamily super.from,
    required ({String dialogTitle, bool zip}) super.argument,
  }) : super(
         retry: null,
         name: r'exportFieldsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportFieldsHash();

  @override
  String toString() {
    return r'exportFieldsProvider'
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
    return exportFields(
      ref,
      dialogTitle: argument.dialogTitle,
      zip: argument.zip,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportFieldsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportFieldsHash() => r'76b542a2997d81e7769be4bd5ec676caa0b6095e';

/// A provider for exporting all field files.

final class ExportFieldsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          ({String dialogTitle, bool zip})
        > {
  ExportFieldsFamily._()
    : super(
        retry: null,
        name: r'exportFieldsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all field files.

  ExportFieldsProvider call({required String dialogTitle, bool zip = true}) =>
      ExportFieldsProvider._(
        argument: (dialogTitle: dialogTitle, zip: zip),
        from: this,
      );

  @override
  String toString() => r'exportFieldsProvider';
}
