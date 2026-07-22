// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editable_path_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for whether the editable path feature should be enabled.

@ProviderFor(ActiveEditablePathType)
final activeEditablePathTypeProvider = ActiveEditablePathTypeProvider._();

/// A provider for whether the editable path feature should be enabled.
final class ActiveEditablePathTypeProvider
    extends $NotifierProvider<ActiveEditablePathType, EditablePathType?> {
  /// A provider for whether the editable path feature should be enabled.
  ActiveEditablePathTypeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeEditablePathTypeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeEditablePathTypeHash();

  @$internal
  @override
  ActiveEditablePathType create() => ActiveEditablePathType();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditablePathType? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditablePathType?>(value),
    );
  }
}

String _$activeEditablePathTypeHash() =>
    r'563bcc0177be5d9cc316ef9a753682a712210cf5';

/// A provider for whether the editable path feature should be enabled.

abstract class _$ActiveEditablePathType extends $Notifier<EditablePathType?> {
  EditablePathType? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<EditablePathType?, EditablePathType?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditablePathType?, EditablePathType?>,
              EditablePathType?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the editable path points.

@ProviderFor(EditablePathPoints)
final editablePathPointsProvider = EditablePathPointsProvider._();

/// A provider for the editable path points.
final class EditablePathPointsProvider
    extends $NotifierProvider<EditablePathPoints, List<Geographic>?> {
  /// A provider for the editable path points.
  EditablePathPointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editablePathPointsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editablePathPointsHash();

  @$internal
  @override
  EditablePathPoints create() => EditablePathPoints();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Geographic>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Geographic>?>(value),
    );
  }
}

String _$editablePathPointsHash() =>
    r'd449a16759f66bd93827d29e9d1dc9581908a97e';

/// A provider for the editable path points.

abstract class _$EditablePathPoints extends $Notifier<List<Geographic>?> {
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

/// A provider with [EditablePathPoints] converted to [WayPoint]s.

@ProviderFor(editablePathAsWayPoints)
final editablePathAsWayPointsProvider = EditablePathAsWayPointsProvider._();

/// A provider with [EditablePathPoints] converted to [WayPoint]s.

final class EditablePathAsWayPointsProvider
    extends
        $FunctionalProvider<List<WayPoint>?, List<WayPoint>?, List<WayPoint>?>
    with $Provider<List<WayPoint>?> {
  /// A provider with [EditablePathPoints] converted to [WayPoint]s.
  EditablePathAsWayPointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editablePathAsWayPointsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editablePathAsWayPointsHash();

  @$internal
  @override
  $ProviderElement<List<WayPoint>?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<WayPoint>? create(Ref ref) {
    return editablePathAsWayPoints(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WayPoint>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WayPoint>?>(value),
    );
  }
}

String _$editablePathAsWayPointsHash() =>
    r'fd7625015e6459d6750ab92468e15ffd1869b741';
