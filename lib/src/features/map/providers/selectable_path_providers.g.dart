// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selectable_path_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether the selectable path feature should be enabled.

@ProviderFor(EnableSelectablePath)
const enableSelectablePathProvider = EnableSelectablePathProvider._();

/// A provider for whether the selectable path feature should be enabled.
final class EnableSelectablePathProvider
    extends $NotifierProvider<EnableSelectablePath, bool> {
  /// A provider for whether the selectable path feature should be enabled.
  const EnableSelectablePathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enableSelectablePathProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enableSelectablePathHash();

  @$internal
  @override
  EnableSelectablePath create() => EnableSelectablePath();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$enableSelectablePathHash() =>
    r'0caf521f93cf07d64674307c5308a790c169164d';

/// A provider for whether the selectable path feature should be enabled.

abstract class _$EnableSelectablePath extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the index of the start point of the selected path.

@ProviderFor(SelectablePathIndexStart)
const selectablePathIndexStartProvider = SelectablePathIndexStartProvider._();

/// A provider for the index of the start point of the selected path.
final class SelectablePathIndexStartProvider
    extends $NotifierProvider<SelectablePathIndexStart, int?> {
  /// A provider for the index of the start point of the selected path.
  const SelectablePathIndexStartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectablePathIndexStartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectablePathIndexStartHash();

  @$internal
  @override
  SelectablePathIndexStart create() => SelectablePathIndexStart();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectablePathIndexStartHash() =>
    r'bf2a4698c3644ba58d1664ec155da65decea5473';

/// A provider for the index of the start point of the selected path.

abstract class _$SelectablePathIndexStart extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the index of the end point of the selected path.

@ProviderFor(SelectablePathIndexEnd)
const selectablePathIndexEndProvider = SelectablePathIndexEndProvider._();

/// A provider for the index of the end point of the selected path.
final class SelectablePathIndexEndProvider
    extends $NotifierProvider<SelectablePathIndexEnd, int?> {
  /// A provider for the index of the end point of the selected path.
  const SelectablePathIndexEndProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectablePathIndexEndProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectablePathIndexEndHash();

  @$internal
  @override
  SelectablePathIndexEnd create() => SelectablePathIndexEnd();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int?>(value),
    );
  }
}

String _$selectablePathIndexEndHash() =>
    r'8dc7fd976144efdf639e954a59f10835d60bb446';

/// A provider for the index of the end point of the selected path.

abstract class _$SelectablePathIndexEnd extends $Notifier<int?> {
  int? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int?, int?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int?, int?>,
              int?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the selectable path to get indices from.

@ProviderFor(SelectablePathPoints)
const selectablePathPointsProvider = SelectablePathPointsProvider._();

/// A provider for the selectable path to get indices from.
final class SelectablePathPointsProvider
    extends $NotifierProvider<SelectablePathPoints, Iterable<Geographic>?> {
  /// A provider for the selectable path to get indices from.
  const SelectablePathPointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectablePathPointsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectablePathPointsHash();

  @$internal
  @override
  SelectablePathPoints create() => SelectablePathPoints();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<Geographic>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<Geographic>?>(value),
    );
  }
}

String _$selectablePathPointsHash() =>
    r'b445bba8f4f20fd241673998b207f7751fd725d8';

/// A provider for the selectable path to get indices from.

abstract class _$SelectablePathPoints extends $Notifier<Iterable<Geographic>?> {
  Iterable<Geographic>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Iterable<Geographic>?, Iterable<Geographic>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Iterable<Geographic>?, Iterable<Geographic>?>,
              Iterable<Geographic>?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for several segment selections on the selectable path.

@ProviderFor(SelectablePathIndexSegments)
const selectablePathIndexSegmentsProvider =
    SelectablePathIndexSegmentsProvider._();

/// A provider for several segment selections on the selectable path.
final class SelectablePathIndexSegmentsProvider
    extends
        $NotifierProvider<
          SelectablePathIndexSegments,
          Iterable<Iterable<int>>?
        > {
  /// A provider for several segment selections on the selectable path.
  const SelectablePathIndexSegmentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectablePathIndexSegmentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectablePathIndexSegmentsHash();

  @$internal
  @override
  SelectablePathIndexSegments create() => SelectablePathIndexSegments();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<Iterable<int>>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<Iterable<int>>?>(value),
    );
  }
}

String _$selectablePathIndexSegmentsHash() =>
    r'bb36f9e23356f601713e9fc8f1e2d9308551d608';

/// A provider for several segment selections on the selectable path.

abstract class _$SelectablePathIndexSegments
    extends $Notifier<Iterable<Iterable<int>>?> {
  Iterable<Iterable<int>>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<Iterable<Iterable<int>>?, Iterable<Iterable<int>>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Iterable<Iterable<int>>?, Iterable<Iterable<int>>?>,
              Iterable<Iterable<int>>?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// A provider for the indices of the [SelectablePathPoints] that lie between
/// [SelectablePathIndexStart] and [SelectablePathIndexEnd].

@ProviderFor(selectablePathIndices)
const selectablePathIndicesProvider = SelectablePathIndicesProvider._();

/// A provider for the indices of the [SelectablePathPoints] that lie between
/// [SelectablePathIndexStart] and [SelectablePathIndexEnd].

final class SelectablePathIndicesProvider
    extends $FunctionalProvider<Iterable<int>?, Iterable<int>?, Iterable<int>?>
    with $Provider<Iterable<int>?> {
  /// A provider for the indices of the [SelectablePathPoints] that lie between
  /// [SelectablePathIndexStart] and [SelectablePathIndexEnd].
  const SelectablePathIndicesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectablePathIndicesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectablePathIndicesHash();

  @$internal
  @override
  $ProviderElement<Iterable<int>?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Iterable<int>? create(Ref ref) {
    return selectablePathIndices(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<int>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<int>?>(value),
    );
  }
}

String _$selectablePathIndicesHash() =>
    r'7debc9c0e2236ff6afded7e6b14d6ad2eecc900f';

/// A provider for the points of the [SelectablePathPoints] that lie between
/// [SelectablePathIndexStart] and [SelectablePathIndexEnd].

@ProviderFor(selectablePathStartToEnd)
const selectablePathStartToEndProvider = SelectablePathStartToEndProvider._();

/// A provider for the points of the [SelectablePathPoints] that lie between
/// [SelectablePathIndexStart] and [SelectablePathIndexEnd].

final class SelectablePathStartToEndProvider
    extends
        $FunctionalProvider<
          Iterable<Geographic>?,
          Iterable<Geographic>?,
          Iterable<Geographic>?
        >
    with $Provider<Iterable<Geographic>?> {
  /// A provider for the points of the [SelectablePathPoints] that lie between
  /// [SelectablePathIndexStart] and [SelectablePathIndexEnd].
  const SelectablePathStartToEndProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectablePathStartToEndProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectablePathStartToEndHash();

  @$internal
  @override
  $ProviderElement<Iterable<Geographic>?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Iterable<Geographic>? create(Ref ref) {
    return selectablePathStartToEnd(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Iterable<Geographic>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Iterable<Geographic>?>(value),
    );
  }
}

String _$selectablePathStartToEndHash() =>
    r'1653c2983c4052920b8b85e8a22e137037eb23ac';
