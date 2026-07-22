// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dubins_path_debug_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the Dubins path feature should be debugged.

@ProviderFor(EnableDubinsPathDebug)
final enableDubinsPathDebugProvider = EnableDubinsPathDebugProvider._();

/// Whether the Dubins path feature should be debugged.
final class EnableDubinsPathDebugProvider
    extends $NotifierProvider<EnableDubinsPathDebug, bool> {
  /// Whether the Dubins path feature should be debugged.
  EnableDubinsPathDebugProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enableDubinsPathDebugProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enableDubinsPathDebugHash();

  @$internal
  @override
  EnableDubinsPathDebug create() => EnableDubinsPathDebug();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$enableDubinsPathDebugHash() =>
    r'5bc798c25e032544f6aba25dc9bc2da90f22ec44';

/// Whether the Dubins path feature should be debugged.

abstract class _$EnableDubinsPathDebug extends $Notifier<bool> {
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

/// Whether to show the turning circles for the Dubins path.

@ProviderFor(ShowDubinsPathDebugCircles)
final showDubinsPathDebugCirclesProvider =
    ShowDubinsPathDebugCirclesProvider._();

/// Whether to show the turning circles for the Dubins path.
final class ShowDubinsPathDebugCirclesProvider
    extends $NotifierProvider<ShowDubinsPathDebugCircles, bool> {
  /// Whether to show the turning circles for the Dubins path.
  ShowDubinsPathDebugCirclesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showDubinsPathDebugCirclesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showDubinsPathDebugCirclesHash();

  @$internal
  @override
  ShowDubinsPathDebugCircles create() => ShowDubinsPathDebugCircles();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showDubinsPathDebugCirclesHash() =>
    r'5891960f3c944dd42c4a29e4db13361c8c6ff8eb';

/// Whether to show the turning circles for the Dubins path.

abstract class _$ShowDubinsPathDebugCircles extends $Notifier<bool> {
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

/// The starting point for the Dubins path.

@ProviderFor(DubinsPathDebugStartPoint)
final dubinsPathDebugStartPointProvider = DubinsPathDebugStartPointProvider._();

/// The starting point for the Dubins path.
final class DubinsPathDebugStartPointProvider
    extends $NotifierProvider<DubinsPathDebugStartPoint, WayPoint?> {
  /// The starting point for the Dubins path.
  DubinsPathDebugStartPointProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dubinsPathDebugStartPointProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dubinsPathDebugStartPointHash();

  @$internal
  @override
  DubinsPathDebugStartPoint create() => DubinsPathDebugStartPoint();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WayPoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WayPoint?>(value),
    );
  }
}

String _$dubinsPathDebugStartPointHash() =>
    r'34396034575b2993bec1dee396873357438c20e4';

/// The starting point for the Dubins path.

abstract class _$DubinsPathDebugStartPoint extends $Notifier<WayPoint?> {
  WayPoint? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WayPoint?, WayPoint?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WayPoint?, WayPoint?>,
              WayPoint?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// The ending point for the Dubins path.

@ProviderFor(DubinsPathDebugEndPoint)
final dubinsPathDebugEndPointProvider = DubinsPathDebugEndPointProvider._();

/// The ending point for the Dubins path.
final class DubinsPathDebugEndPointProvider
    extends $NotifierProvider<DubinsPathDebugEndPoint, WayPoint?> {
  /// The ending point for the Dubins path.
  DubinsPathDebugEndPointProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dubinsPathDebugEndPointProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dubinsPathDebugEndPointHash();

  @$internal
  @override
  DubinsPathDebugEndPoint create() => DubinsPathDebugEndPoint();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WayPoint? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WayPoint?>(value),
    );
  }
}

String _$dubinsPathDebugEndPointHash() =>
    r'5bec54f99573dc734b5b531dde2edeb623f9a2b8';

/// The ending point for the Dubins path.

abstract class _$DubinsPathDebugEndPoint extends $Notifier<WayPoint?> {
  WayPoint? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WayPoint?, WayPoint?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WayPoint?, WayPoint?>,
              WayPoint?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Which type of Dubins path to debug/draw.

@ProviderFor(DubinsPathDebugPathType)
final dubinsPathDebugPathTypeProvider = DubinsPathDebugPathTypeProvider._();

/// Which type of Dubins path to debug/draw.
final class DubinsPathDebugPathTypeProvider
    extends $NotifierProvider<DubinsPathDebugPathType, DubinsPathType?> {
  /// Which type of Dubins path to debug/draw.
  DubinsPathDebugPathTypeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dubinsPathDebugPathTypeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dubinsPathDebugPathTypeHash();

  @$internal
  @override
  DubinsPathDebugPathType create() => DubinsPathDebugPathType();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DubinsPathType? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DubinsPathType?>(value),
    );
  }
}

String _$dubinsPathDebugPathTypeHash() =>
    r'db8f582506c21d252bfd7b448432d055327147f8';

/// Which type of Dubins path to debug/draw.

abstract class _$DubinsPathDebugPathType extends $Notifier<DubinsPathType?> {
  DubinsPathType? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DubinsPathType?, DubinsPathType?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DubinsPathType?, DubinsPathType?>,
              DubinsPathType?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// The current [DubinsPath] object that we can debug.

@ProviderFor(debugDubinsPath)
final debugDubinsPathProvider = DebugDubinsPathProvider._();

/// The current [DubinsPath] object that we can debug.

final class DebugDubinsPathProvider
    extends $FunctionalProvider<DubinsPath?, DubinsPath?, DubinsPath?>
    with $Provider<DubinsPath?> {
  /// The current [DubinsPath] object that we can debug.
  DebugDubinsPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugDubinsPathProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugDubinsPathHash();

  @$internal
  @override
  $ProviderElement<DubinsPath?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DubinsPath? create(Ref ref) {
    return debugDubinsPath(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DubinsPath? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DubinsPath?>(value),
    );
  }
}

String _$debugDubinsPathHash() => r'a8f0f4a514414c5f4d128633ccfb0b97b67425c7';

/// Which type of Dubins path to debug/draw.

@ProviderFor(DubinsPathDebugStepSize)
final dubinsPathDebugStepSizeProvider = DubinsPathDebugStepSizeProvider._();

/// Which type of Dubins path to debug/draw.
final class DubinsPathDebugStepSizeProvider
    extends $NotifierProvider<DubinsPathDebugStepSize, double> {
  /// Which type of Dubins path to debug/draw.
  DubinsPathDebugStepSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dubinsPathDebugStepSizeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dubinsPathDebugStepSizeHash();

  @$internal
  @override
  DubinsPathDebugStepSize create() => DubinsPathDebugStepSize();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$dubinsPathDebugStepSizeHash() =>
    r'9452d5770fd368ba784818c8866414e8e8dd3155';

/// Which type of Dubins path to debug/draw.

abstract class _$DubinsPathDebugStepSize extends $Notifier<double> {
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
