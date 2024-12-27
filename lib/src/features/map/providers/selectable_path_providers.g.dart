// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selectable_path_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectablePathIndicesHash() =>
    r'7debc9c0e2236ff6afded7e6b14d6ad2eecc900f';

/// A provider for the indices of the [SelectablePathPoints] that lie between
/// [SelectablePathIndexStart] and [SelectablePathIndexEnd].
///
/// Copied from [selectablePathIndices].
@ProviderFor(selectablePathIndices)
final selectablePathIndicesProvider =
    AutoDisposeProvider<Iterable<int>?>.internal(
  selectablePathIndices,
  name: r'selectablePathIndicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectablePathIndicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectablePathIndicesRef = AutoDisposeProviderRef<Iterable<int>?>;
String _$selectablePathStartToEndHash() =>
    r'1653c2983c4052920b8b85e8a22e137037eb23ac';

/// A provider for the points of the [SelectablePathPoints] that lie between
/// [SelectablePathIndexStart] and [SelectablePathIndexEnd].
///
/// Copied from [selectablePathStartToEnd].
@ProviderFor(selectablePathStartToEnd)
final selectablePathStartToEndProvider =
    AutoDisposeProvider<Iterable<Geographic>?>.internal(
  selectablePathStartToEnd,
  name: r'selectablePathStartToEndProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectablePathStartToEndHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectablePathStartToEndRef
    = AutoDisposeProviderRef<Iterable<Geographic>?>;
String _$enableSelectablePathHash() =>
    r'0caf521f93cf07d64674307c5308a790c169164d';

/// A provider for whether the selectable path feature should be enabled.
///
/// Copied from [EnableSelectablePath].
@ProviderFor(EnableSelectablePath)
final enableSelectablePathProvider =
    NotifierProvider<EnableSelectablePath, bool>.internal(
  EnableSelectablePath.new,
  name: r'enableSelectablePathProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$enableSelectablePathHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EnableSelectablePath = Notifier<bool>;
String _$selectablePathIndexStartHash() =>
    r'bf2a4698c3644ba58d1664ec155da65decea5473';

/// A provider for the index of the start point of the selected path.
///
/// Copied from [SelectablePathIndexStart].
@ProviderFor(SelectablePathIndexStart)
final selectablePathIndexStartProvider =
    AutoDisposeNotifierProvider<SelectablePathIndexStart, int?>.internal(
  SelectablePathIndexStart.new,
  name: r'selectablePathIndexStartProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectablePathIndexStartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectablePathIndexStart = AutoDisposeNotifier<int?>;
String _$selectablePathIndexEndHash() =>
    r'8dc7fd976144efdf639e954a59f10835d60bb446';

/// A provider for the index of the end point of the selected path.
///
/// Copied from [SelectablePathIndexEnd].
@ProviderFor(SelectablePathIndexEnd)
final selectablePathIndexEndProvider =
    AutoDisposeNotifierProvider<SelectablePathIndexEnd, int?>.internal(
  SelectablePathIndexEnd.new,
  name: r'selectablePathIndexEndProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectablePathIndexEndHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectablePathIndexEnd = AutoDisposeNotifier<int?>;
String _$selectablePathPointsHash() =>
    r'b445bba8f4f20fd241673998b207f7751fd725d8';

/// A provider for the selectable path to get indices from.
///
/// Copied from [SelectablePathPoints].
@ProviderFor(SelectablePathPoints)
final selectablePathPointsProvider = AutoDisposeNotifierProvider<
    SelectablePathPoints, Iterable<Geographic>?>.internal(
  SelectablePathPoints.new,
  name: r'selectablePathPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectablePathPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectablePathPoints = AutoDisposeNotifier<Iterable<Geographic>?>;
String _$selectablePathIndexSegmentsHash() =>
    r'bb36f9e23356f601713e9fc8f1e2d9308551d608';

/// A provider for several segment selections on the selectable path.
///
/// Copied from [SelectablePathIndexSegments].
@ProviderFor(SelectablePathIndexSegments)
final selectablePathIndexSegmentsProvider = AutoDisposeNotifierProvider<
    SelectablePathIndexSegments, Iterable<Iterable<int>>?>.internal(
  SelectablePathIndexSegments.new,
  name: r'selectablePathIndexSegmentsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectablePathIndexSegmentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectablePathIndexSegments
    = AutoDisposeNotifier<Iterable<Iterable<int>>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
