// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_debug_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether to show equipment turning debug features.

@ProviderFor(DebugEquipmentTurning)
final debugEquipmentTurningProvider = DebugEquipmentTurningProvider._();

/// Whether to show equipment turning debug features.
final class DebugEquipmentTurningProvider
    extends $NotifierProvider<DebugEquipmentTurning, bool> {
  /// Whether to show equipment turning debug features.
  DebugEquipmentTurningProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentTurningProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugEquipmentTurningHash();

  @$internal
  @override
  DebugEquipmentTurning create() => DebugEquipmentTurning();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$debugEquipmentTurningHash() =>
    r'505d86aca95ee1ecf4d7722b1b8ec4732cafc2de';

/// Whether to show equipment turning debug features.

abstract class _$DebugEquipmentTurning extends $Notifier<bool> {
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

/// Whether to show equipment trajectory debug features.

@ProviderFor(DebugEquipmentTrajectory)
final debugEquipmentTrajectoryProvider = DebugEquipmentTrajectoryProvider._();

/// Whether to show equipment trajectory debug features.
final class DebugEquipmentTrajectoryProvider
    extends $NotifierProvider<DebugEquipmentTrajectory, bool> {
  /// Whether to show equipment trajectory debug features.
  DebugEquipmentTrajectoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentTrajectoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugEquipmentTrajectoryHash();

  @$internal
  @override
  DebugEquipmentTrajectory create() => DebugEquipmentTrajectory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$debugEquipmentTrajectoryHash() =>
    r'e8913cdf95316803986dc56586b6c051229b1645';

/// Whether to show equipment trajectory debug features.

abstract class _$DebugEquipmentTrajectory extends $Notifier<bool> {
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

/// Whether to show equipment travelled path debug.

@ProviderFor(DebugEquipmentTravelledPath)
final debugEquipmentTravelledPathProvider =
    DebugEquipmentTravelledPathProvider._();

/// Whether to show equipment travelled path debug.
final class DebugEquipmentTravelledPathProvider
    extends $NotifierProvider<DebugEquipmentTravelledPath, bool> {
  /// Whether to show equipment travelled path debug.
  DebugEquipmentTravelledPathProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentTravelledPathProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugEquipmentTravelledPathHash();

  @$internal
  @override
  DebugEquipmentTravelledPath create() => DebugEquipmentTravelledPath();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$debugEquipmentTravelledPathHash() =>
    r'd00ac2fee4f69e5e50b2aee0f051801ef1446459';

/// Whether to show equipment travelled path debug.

abstract class _$DebugEquipmentTravelledPath extends $Notifier<bool> {
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

/// The amount of points [DebugEquipmentTravelledPathList] should hold.

@ProviderFor(DebugEquipmentTravelledPathSize)
final debugEquipmentTravelledPathSizeProvider =
    DebugEquipmentTravelledPathSizeProvider._();

/// The amount of points [DebugEquipmentTravelledPathList] should hold.
final class DebugEquipmentTravelledPathSizeProvider
    extends $NotifierProvider<DebugEquipmentTravelledPathSize, int> {
  /// The amount of points [DebugEquipmentTravelledPathList] should hold.
  DebugEquipmentTravelledPathSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentTravelledPathSizeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugEquipmentTravelledPathSizeHash();

  @$internal
  @override
  DebugEquipmentTravelledPathSize create() => DebugEquipmentTravelledPathSize();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$debugEquipmentTravelledPathSizeHash() =>
    r'd835c19880e4ca9e3fcde0bea5887c8ca233abfc';

/// The amount of points [DebugEquipmentTravelledPathList] should hold.

abstract class _$DebugEquipmentTravelledPathSize extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A list of the last [DebugEquipmentTravelledPathSize] position points for the
/// equipments.

@ProviderFor(DebugEquipmentTravelledPathList)
final debugEquipmentTravelledPathListProvider =
    DebugEquipmentTravelledPathListProvider._();

/// A list of the last [DebugEquipmentTravelledPathSize] position points for the
/// equipments.
final class DebugEquipmentTravelledPathListProvider
    extends
        $NotifierProvider<
          DebugEquipmentTravelledPathList,
          Map<int, List<LatLng>>
        > {
  /// A list of the last [DebugEquipmentTravelledPathSize] position points for the
  /// equipments.
  DebugEquipmentTravelledPathListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentTravelledPathListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugEquipmentTravelledPathListHash();

  @$internal
  @override
  DebugEquipmentTravelledPathList create() => DebugEquipmentTravelledPathList();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<int, List<LatLng>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<int, List<LatLng>>>(value),
    );
  }
}

String _$debugEquipmentTravelledPathListHash() =>
    r'118059aed79cd43ae37cb1a73211f46fc866c49f';

/// A list of the last [DebugEquipmentTravelledPathSize] position points for the
/// equipments.

abstract class _$DebugEquipmentTravelledPathList
    extends $Notifier<Map<int, List<LatLng>>> {
  Map<int, List<LatLng>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<Map<int, List<LatLng>>, Map<int, List<LatLng>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<int, List<LatLng>>, Map<int, List<LatLng>>>,
              Map<int, List<LatLng>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// Whether to show equipment hitches debug.

@ProviderFor(DebugEquipmentHitches)
final debugEquipmentHitchesProvider = DebugEquipmentHitchesProvider._();

/// Whether to show equipment hitches debug.
final class DebugEquipmentHitchesProvider
    extends $NotifierProvider<DebugEquipmentHitches, bool> {
  /// Whether to show equipment hitches debug.
  DebugEquipmentHitchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentHitchesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugEquipmentHitchesHash();

  @$internal
  @override
  DebugEquipmentHitches create() => DebugEquipmentHitches();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$debugEquipmentHitchesHash() =>
    r'c5cd8ff4bacc9eaae3279a59e8aabdc0788a0900';

/// Whether to show equipment hitches debug.

abstract class _$DebugEquipmentHitches extends $Notifier<bool> {
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

/// Whether to show equipment section debug features.

@ProviderFor(DebugEquipmentSections)
final debugEquipmentSectionsProvider = DebugEquipmentSectionsProvider._();

/// Whether to show equipment section debug features.
final class DebugEquipmentSectionsProvider
    extends $NotifierProvider<DebugEquipmentSections, bool> {
  /// Whether to show equipment section debug features.
  DebugEquipmentSectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentSectionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugEquipmentSectionsHash();

  @$internal
  @override
  DebugEquipmentSections create() => DebugEquipmentSections();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$debugEquipmentSectionsHash() =>
    r'9aaece3c4a3bc86a84fa4f2c9ccca871209fc4b7';

/// Whether to show equipment section debug features.

abstract class _$DebugEquipmentSections extends $Notifier<bool> {
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

/// The amount of seconds equipment trajectories should predict.

@ProviderFor(DebugEquipmentTrajectorySeconds)
final debugEquipmentTrajectorySecondsProvider =
    DebugEquipmentTrajectorySecondsProvider._();

/// The amount of seconds equipment trajectories should predict.
final class DebugEquipmentTrajectorySecondsProvider
    extends $NotifierProvider<DebugEquipmentTrajectorySeconds, double> {
  /// The amount of seconds equipment trajectories should predict.
  DebugEquipmentTrajectorySecondsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentTrajectorySecondsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugEquipmentTrajectorySecondsHash();

  @$internal
  @override
  DebugEquipmentTrajectorySeconds create() => DebugEquipmentTrajectorySeconds();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$debugEquipmentTrajectorySecondsHash() =>
    r'0672ab28735f211fb81549a366345a7a95ec204f';

/// The amount of seconds equipment trajectories should predict.

abstract class _$DebugEquipmentTrajectorySeconds extends $Notifier<double> {
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

/// The minimum length equipment trajectories should predict.

@ProviderFor(DebugEquipmentTrajectoryMinLength)
final debugEquipmentTrajectoryMinLengthProvider =
    DebugEquipmentTrajectoryMinLengthProvider._();

/// The minimum length equipment trajectories should predict.
final class DebugEquipmentTrajectoryMinLengthProvider
    extends $NotifierProvider<DebugEquipmentTrajectoryMinLength, double> {
  /// The minimum length equipment trajectories should predict.
  DebugEquipmentTrajectoryMinLengthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugEquipmentTrajectoryMinLengthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$debugEquipmentTrajectoryMinLengthHash();

  @$internal
  @override
  DebugEquipmentTrajectoryMinLength create() =>
      DebugEquipmentTrajectoryMinLength();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$debugEquipmentTrajectoryMinLengthHash() =>
    r'c76331b37ae0a325b201b8b8bc0408a28be66f06';

/// The minimum length equipment trajectories should predict.

abstract class _$DebugEquipmentTrajectoryMinLength extends $Notifier<double> {
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
