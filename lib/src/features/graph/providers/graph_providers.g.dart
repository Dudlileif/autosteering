// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$graphActiveDataHash() => r'71410bb4a1062a0af018495a5ee5978e4cd880f8';

/// A provider for the currently active [GraphData], derived from
/// [GraphActiveParameters].
///
/// Copied from [graphActiveData].
@ProviderFor(graphActiveData)
final graphActiveDataProvider = AutoDisposeProvider<Set<GraphData>>.internal(
  graphActiveData,
  name: r'graphActiveDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$graphActiveDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GraphActiveDataRef = AutoDisposeProviderRef<Set<GraphData>>;
String _$showDraggableGraphHash() =>
    r'2f4ab960e1e72974e7c25516ff7f36db5051b3d5';

/// A provider for whether the [DraggableGraph] should be shown.
///
/// Copied from [ShowDraggableGraph].
@ProviderFor(ShowDraggableGraph)
final showDraggableGraphProvider =
    AutoDisposeNotifierProvider<ShowDraggableGraph, bool>.internal(
  ShowDraggableGraph.new,
  name: r'showDraggableGraphProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$showDraggableGraphHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ShowDraggableGraph = AutoDisposeNotifier<bool>;
String _$graphRetainTimeSecondsHash() =>
    r'1be2194a9c6c43bf4a569ade0c97df769906119d';

/// A provider for the time, in seconds, for the graph to show.
///
/// Copied from [GraphRetainTimeSeconds].
@ProviderFor(GraphRetainTimeSeconds)
final graphRetainTimeSecondsProvider =
    NotifierProvider<GraphRetainTimeSeconds, double>.internal(
  GraphRetainTimeSeconds.new,
  name: r'graphRetainTimeSecondsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$graphRetainTimeSecondsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GraphRetainTimeSeconds = Notifier<double>;
String _$graphActiveParametersHash() =>
    r'739b0c14a994830e11df10bc0fe50f0930945a86';

/// A provider for the currently active [GraphParameter]s, i.e. which data to
/// show on the graph.
///
/// Copied from [GraphActiveParameters].
@ProviderFor(GraphActiveParameters)
final graphActiveParametersProvider =
    NotifierProvider<GraphActiveParameters, Set<GraphParameter>>.internal(
  GraphActiveParameters.new,
  name: r'graphActiveParametersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$graphActiveParametersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GraphActiveParameters = Notifier<Set<GraphParameter>>;
String _$graphValuesHash() => r'51660a35a3c9353505c69c31949c6838554d42c2';

/// A provider for the values to show on the graph.
///
/// It is periodically refreshed with new data at a rate of 30 Hz.
///
/// Copied from [GraphValues].
@ProviderFor(GraphValues)
final graphValuesProvider = AutoDisposeNotifierProvider<GraphValues,
    Map<GraphData, List<({double normalized, num raw})?>>>.internal(
  GraphValues.new,
  name: r'graphValuesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$graphValuesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GraphValues = AutoDisposeNotifier<
    Map<GraphData, List<({double normalized, num raw})?>>>;
String _$draggableGraphUiOffsetHash() =>
    r'dac0b1b9a3737680f5bec07fb93e5e83238211a8';

/// A provider for the UI [Offset] for the path recording configurator.
///
/// Copied from [DraggableGraphUiOffset].
@ProviderFor(DraggableGraphUiOffset)
final draggableGraphUiOffsetProvider =
    AutoDisposeNotifierProvider<DraggableGraphUiOffset, Offset>.internal(
  DraggableGraphUiOffset.new,
  name: r'draggableGraphUiOffsetProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$draggableGraphUiOffsetHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DraggableGraphUiOffset = AutoDisposeNotifier<Offset>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
