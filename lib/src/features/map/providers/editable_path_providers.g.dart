// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editable_path_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$editablePathAsWayPointsHash() =>
    r'cdc1ff455bcdc08cd149b206f0dbd59b7250fffd';

/// A provider with [EditablePathPoints] converted to [WayPoint]s.
///
/// Copied from [editablePathAsWayPoints].
@ProviderFor(editablePathAsWayPoints)
final editablePathAsWayPointsProvider =
    AutoDisposeProvider<List<WayPoint>?>.internal(
  editablePathAsWayPoints,
  name: r'editablePathAsWayPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editablePathAsWayPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EditablePathAsWayPointsRef = AutoDisposeProviderRef<List<WayPoint>?>;
String _$activeEditablePathTypeHash() =>
    r'2259071575a7b5ee68ebdd9ff4e6fee7b9471fa8';

/// A provider for whether the editable path feature should be enabled.
///
/// Copied from [ActiveEditablePathType].
@ProviderFor(ActiveEditablePathType)
final activeEditablePathTypeProvider =
    NotifierProvider<ActiveEditablePathType, EditablePathType?>.internal(
  ActiveEditablePathType.new,
  name: r'activeEditablePathTypeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeEditablePathTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveEditablePathType = Notifier<EditablePathType?>;
String _$editablePathPointsHash() =>
    r'a641a560924c37f3f2c73e1a4283acbb71bf5c12';

/// A provider for the editable path points.
///
/// Copied from [EditablePathPoints].
@ProviderFor(EditablePathPoints)
final editablePathPointsProvider =
    AutoDisposeNotifierProvider<EditablePathPoints, List<Geographic>?>.internal(
  EditablePathPoints.new,
  name: r'editablePathPointsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editablePathPointsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EditablePathPoints = AutoDisposeNotifier<List<Geographic>?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter, deprecated_member_use_from_same_package
