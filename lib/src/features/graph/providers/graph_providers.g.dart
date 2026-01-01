// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether the [DraggableGraph] should be shown.

@ProviderFor(ShowDraggableGraph)
final showDraggableGraphProvider = ShowDraggableGraphProvider._();

/// A provider for whether the [DraggableGraph] should be shown.
final class ShowDraggableGraphProvider
    extends $NotifierProvider<ShowDraggableGraph, bool> {
  /// A provider for whether the [DraggableGraph] should be shown.
  ShowDraggableGraphProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showDraggableGraphProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showDraggableGraphHash();

  @$internal
  @override
  ShowDraggableGraph create() => ShowDraggableGraph();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showDraggableGraphHash() =>
    r'2f4ab960e1e72974e7c25516ff7f36db5051b3d5';

/// A provider for whether the [DraggableGraph] should be shown.

abstract class _$ShowDraggableGraph extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the time, in seconds, for the graph to show.

@ProviderFor(GraphRetainTimeSeconds)
final graphRetainTimeSecondsProvider = GraphRetainTimeSecondsProvider._();

/// A provider for the time, in seconds, for the graph to show.
final class GraphRetainTimeSecondsProvider
    extends $NotifierProvider<GraphRetainTimeSeconds, double> {
  /// A provider for the time, in seconds, for the graph to show.
  GraphRetainTimeSecondsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphRetainTimeSecondsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphRetainTimeSecondsHash();

  @$internal
  @override
  GraphRetainTimeSeconds create() => GraphRetainTimeSeconds();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$graphRetainTimeSecondsHash() =>
    r'1be2194a9c6c43bf4a569ade0c97df769906119d';

/// A provider for the time, in seconds, for the graph to show.

abstract class _$GraphRetainTimeSeconds extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the currently active [GraphParameter]s, i.e. which data to
/// show on the graph.

@ProviderFor(GraphActiveParameters)
final graphActiveParametersProvider = GraphActiveParametersProvider._();

/// A provider for the currently active [GraphParameter]s, i.e. which data to
/// show on the graph.
final class GraphActiveParametersProvider
    extends $NotifierProvider<GraphActiveParameters, Set<GraphParameter>> {
  /// A provider for the currently active [GraphParameter]s, i.e. which data to
  /// show on the graph.
  GraphActiveParametersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphActiveParametersProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphActiveParametersHash();

  @$internal
  @override
  GraphActiveParameters create() => GraphActiveParameters();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<GraphParameter> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<GraphParameter>>(value),
    );
  }
}

String _$graphActiveParametersHash() =>
    r'739b0c14a994830e11df10bc0fe50f0930945a86';

/// A provider for the currently active [GraphParameter]s, i.e. which data to
/// show on the graph.

abstract class _$GraphActiveParameters extends $Notifier<Set<GraphParameter>> {
  Set<GraphParameter> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Set<GraphParameter>, Set<GraphParameter>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<GraphParameter>, Set<GraphParameter>>,
              Set<GraphParameter>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the currently active [GraphData], derived from
/// [GraphActiveParameters].

@ProviderFor(graphActiveData)
final graphActiveDataProvider = GraphActiveDataProvider._();

/// A provider for the currently active [GraphData], derived from
/// [GraphActiveParameters].

final class GraphActiveDataProvider
    extends $FunctionalProvider<Set<GraphData>, Set<GraphData>, Set<GraphData>>
    with $Provider<Set<GraphData>> {
  /// A provider for the currently active [GraphData], derived from
  /// [GraphActiveParameters].
  GraphActiveDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphActiveDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphActiveDataHash();

  @$internal
  @override
  $ProviderElement<Set<GraphData>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Set<GraphData> create(Ref ref) {
    return graphActiveData(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<GraphData> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<GraphData>>(value),
    );
  }
}

String _$graphActiveDataHash() => r'71410bb4a1062a0af018495a5ee5978e4cd880f8';

/// A provider for the values to show on the graph.
///
/// It is periodically refreshed with new data at a rate of 30 Hz.

@ProviderFor(GraphValues)
final graphValuesProvider = GraphValuesProvider._();

/// A provider for the values to show on the graph.
///
/// It is periodically refreshed with new data at a rate of 30 Hz.
final class GraphValuesProvider
    extends
        $NotifierProvider<
          GraphValues,
          Map<GraphData, List<({double normalized, num raw})?>>
        > {
  /// A provider for the values to show on the graph.
  ///
  /// It is periodically refreshed with new data at a rate of 30 Hz.
  GraphValuesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'graphValuesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$graphValuesHash();

  @$internal
  @override
  GraphValues create() => GraphValues();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(
    Map<GraphData, List<({double normalized, num raw})?>> value,
  ) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<
            Map<GraphData, List<({double normalized, num raw})?>>
          >(value),
    );
  }
}

String _$graphValuesHash() => r'51660a35a3c9353505c69c31949c6838554d42c2';

/// A provider for the values to show on the graph.
///
/// It is periodically refreshed with new data at a rate of 30 Hz.

abstract class _$GraphValues
    extends $Notifier<Map<GraphData, List<({double normalized, num raw})?>>> {
  Map<GraphData, List<({double normalized, num raw})?>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              Map<GraphData, List<({double normalized, num raw})?>>,
              Map<GraphData, List<({double normalized, num raw})?>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<GraphData, List<({double normalized, num raw})?>>,
                Map<GraphData, List<({double normalized, num raw})?>>
              >,
              Map<GraphData, List<({double normalized, num raw})?>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the UI [Offset] for the path recording configurator.

@ProviderFor(DraggableGraphUiOffset)
final draggableGraphUiOffsetProvider = DraggableGraphUiOffsetProvider._();

/// A provider for the UI [Offset] for the path recording configurator.
final class DraggableGraphUiOffsetProvider
    extends $NotifierProvider<DraggableGraphUiOffset, Offset> {
  /// A provider for the UI [Offset] for the path recording configurator.
  DraggableGraphUiOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'draggableGraphUiOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$draggableGraphUiOffsetHash();

  @$internal
  @override
  DraggableGraphUiOffset create() => DraggableGraphUiOffset();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Offset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Offset>(value),
    );
  }
}

String _$draggableGraphUiOffsetHash() =>
    r'dac0b1b9a3737680f5bec07fb93e5e83238211a8';

/// A provider for the UI [Offset] for the path recording configurator.

abstract class _$DraggableGraphUiOffset extends $Notifier<Offset> {
  Offset build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Offset, Offset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Offset, Offset>,
              Offset,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
