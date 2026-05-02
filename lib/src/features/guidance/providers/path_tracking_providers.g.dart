// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_tracking_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the path interpolation distance.

@ProviderFor(PathInterpolationDistance)
final pathInterpolationDistanceProvider = PathInterpolationDistanceProvider._();

/// A provider for the path interpolation distance.
final class PathInterpolationDistanceProvider
    extends $NotifierProvider<PathInterpolationDistance, double> {
  /// A provider for the path interpolation distance.
  PathInterpolationDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pathInterpolationDistanceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pathInterpolationDistanceHash();

  @$internal
  @override
  PathInterpolationDistance create() => PathInterpolationDistance();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$pathInterpolationDistanceHash() =>
    r'2f3dd72ebc9b619f2fa786217d2162ccaf6659cf';

/// A provider for the path interpolation distance.

abstract class _$PathInterpolationDistance extends $Notifier<double> {
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

/// A provider for holding the [WayPoint]s for the [ConfiguredPathTracking].

@ProviderFor(PathTrackingPoints)
final pathTrackingPointsProvider = PathTrackingPointsProvider._();

/// A provider for holding the [WayPoint]s for the [ConfiguredPathTracking].
final class PathTrackingPointsProvider
    extends $NotifierProvider<PathTrackingPoints, List<WayPoint>?> {
  /// A provider for holding the [WayPoint]s for the [ConfiguredPathTracking].
  PathTrackingPointsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pathTrackingPointsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pathTrackingPointsHash();

  @$internal
  @override
  PathTrackingPoints create() => PathTrackingPoints();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WayPoint>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WayPoint>?>(value),
    );
  }
}

String _$pathTrackingPointsHash() =>
    r'225ee956c9e62f4ceaef54b35b9440a9da0a130d';

/// A provider for holding the [WayPoint]s for the [ConfiguredPathTracking].

abstract class _$PathTrackingPoints extends $Notifier<List<WayPoint>?> {
  List<WayPoint>? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<WayPoint>?, List<WayPoint>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<WayPoint>?, List<WayPoint>?>,
              List<WayPoint>?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for creating and holding a [PathTracking] model for the
/// previously recorded waypoints.

@ProviderFor(ConfiguredPathTracking)
final configuredPathTrackingProvider = ConfiguredPathTrackingProvider._();

/// A provider for creating and holding a [PathTracking] model for the
/// previously recorded waypoints.
final class ConfiguredPathTrackingProvider
    extends $NotifierProvider<ConfiguredPathTracking, PathTracking?> {
  /// A provider for creating and holding a [PathTracking] model for the
  /// previously recorded waypoints.
  ConfiguredPathTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'configuredPathTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$configuredPathTrackingHash();

  @$internal
  @override
  ConfiguredPathTracking create() => ConfiguredPathTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PathTracking? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PathTracking?>(value),
    );
  }
}

String _$configuredPathTrackingHash() =>
    r'67fef335827c9ce6545ee764535ce808c929dd6d';

/// A provider for creating and holding a [PathTracking] model for the
/// previously recorded waypoints.

abstract class _$ConfiguredPathTracking extends $Notifier<PathTracking?> {
  PathTracking? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PathTracking?, PathTracking?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PathTracking?, PathTracking?>,
              PathTracking?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for which looping mode the [ConfiguredPathTracking] should
/// follow.

@ProviderFor(PathTrackingLoop)
final pathTrackingLoopProvider = PathTrackingLoopProvider._();

/// A provider for which looping mode the [ConfiguredPathTracking] should
/// follow.
final class PathTrackingLoopProvider
    extends $NotifierProvider<PathTrackingLoop, PathTrackingLoopMode> {
  /// A provider for which looping mode the [ConfiguredPathTracking] should
  /// follow.
  PathTrackingLoopProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pathTrackingLoopProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pathTrackingLoopHash();

  @$internal
  @override
  PathTrackingLoop create() => PathTrackingLoop();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PathTrackingLoopMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PathTrackingLoopMode>(value),
    );
  }
}

String _$pathTrackingLoopHash() => r'9e18bb1af4a02e1301d6d53c7efbae48e92d1cf7';

/// A provider for which looping mode the [ConfiguredPathTracking] should
/// follow.

abstract class _$PathTrackingLoop extends $Notifier<PathTrackingLoopMode> {
  PathTrackingLoopMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PathTrackingLoopMode, PathTrackingLoopMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PathTrackingLoopMode, PathTrackingLoopMode>,
              PathTrackingLoopMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the activated [ConfiguredPathTracking] model, typically
/// recieved and updated from the simulator.

@ProviderFor(DisplayPathTracking)
final displayPathTrackingProvider = DisplayPathTrackingProvider._();

/// A provider for the activated [ConfiguredPathTracking] model, typically
/// recieved and updated from the simulator.
final class DisplayPathTrackingProvider
    extends $NotifierProvider<DisplayPathTracking, PathTracking?> {
  /// A provider for the activated [ConfiguredPathTracking] model, typically
  /// recieved and updated from the simulator.
  DisplayPathTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'displayPathTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$displayPathTrackingHash();

  @$internal
  @override
  DisplayPathTracking create() => DisplayPathTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PathTracking? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PathTracking?>(value),
    );
  }
}

String _$displayPathTrackingHash() =>
    r'75006e9bed786d31170be96c14532152b1cd073e';

/// A provider for the activated [ConfiguredPathTracking] model, typically
/// recieved and updated from the simulator.

abstract class _$DisplayPathTracking extends $Notifier<PathTracking?> {
  PathTracking? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PathTracking?, PathTracking?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PathTracking?, PathTracking?>,
              PathTracking?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// A provider for the perpendicular distance from the [DisplayPathTracking]
/// line to the [MainVehicle].

@ProviderFor(pathTrackingPerpendicularDistance)
final pathTrackingPerpendicularDistanceProvider =
    PathTrackingPerpendicularDistanceProvider._();

/// A provider for the perpendicular distance from the [DisplayPathTracking]
/// line to the [MainVehicle].

final class PathTrackingPerpendicularDistanceProvider
    extends $FunctionalProvider<double?, double?, double?>
    with $Provider<double?> {
  /// A provider for the perpendicular distance from the [DisplayPathTracking]
  /// line to the [MainVehicle].
  PathTrackingPerpendicularDistanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pathTrackingPerpendicularDistanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$pathTrackingPerpendicularDistanceHash();

  @$internal
  @override
  $ProviderElement<double?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double? create(Ref ref) {
    return pathTrackingPerpendicularDistance(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$pathTrackingPerpendicularDistanceHash() =>
    r'ab61512d7ccd9748ae77183141f2bb13657d91e9';

/// A provider for whether or not the path tracking should be shown.

@ProviderFor(ShowPathTracking)
final showPathTrackingProvider = ShowPathTrackingProvider._();

/// A provider for whether or not the path tracking should be shown.
final class ShowPathTrackingProvider
    extends $NotifierProvider<ShowPathTracking, bool> {
  /// A provider for whether or not the path tracking should be shown.
  ShowPathTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showPathTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showPathTrackingHash();

  @$internal
  @override
  ShowPathTracking create() => ShowPathTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showPathTrackingHash() => r'4aaabec2c84ce508eef43de33976367de2f6079f';

/// A provider for whether or not the path tracking should be shown.

abstract class _$ShowPathTracking extends $Notifier<bool> {
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

/// Whether the path tracking debug features should show.

@ProviderFor(DebugPathTracking)
final debugPathTrackingProvider = DebugPathTrackingProvider._();

/// Whether the path tracking debug features should show.
final class DebugPathTrackingProvider
    extends $NotifierProvider<DebugPathTracking, bool> {
  /// Whether the path tracking debug features should show.
  DebugPathTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'debugPathTrackingProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$debugPathTrackingHash();

  @$internal
  @override
  DebugPathTracking create() => DebugPathTracking();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$debugPathTrackingHash() => r'db41c00fa0d4a921e7251aea9fce8d341463b4c9';

/// Whether the path tracking debug features should show.

abstract class _$DebugPathTracking extends $Notifier<bool> {
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

/// A provider for loading an [PathTracking] from a file at [path], if it's
/// valid.

@ProviderFor(loadPathTrackingFromFile)
final loadPathTrackingFromFileProvider = LoadPathTrackingFromFileFamily._();

/// A provider for loading an [PathTracking] from a file at [path], if it's
/// valid.

final class LoadPathTrackingFromFileProvider
    extends
        $FunctionalProvider<
          AsyncValue<PathTracking?>,
          PathTracking?,
          FutureOr<PathTracking?>
        >
    with $FutureModifier<PathTracking?>, $FutureProvider<PathTracking?> {
  /// A provider for loading an [PathTracking] from a file at [path], if it's
  /// valid.
  LoadPathTrackingFromFileProvider._({
    required LoadPathTrackingFromFileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadPathTrackingFromFileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadPathTrackingFromFileHash();

  @override
  String toString() {
    return r'loadPathTrackingFromFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PathTracking?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PathTracking?> create(Ref ref) {
    final argument = this.argument as String;
    return loadPathTrackingFromFile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadPathTrackingFromFileProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadPathTrackingFromFileHash() =>
    r'1bd1565ccac6edd0976ed44d73f99a2816ece0e1';

/// A provider for loading an [PathTracking] from a file at [path], if it's
/// valid.

final class LoadPathTrackingFromFileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PathTracking?>, String> {
  LoadPathTrackingFromFileFamily._()
    : super(
        retry: null,
        name: r'loadPathTrackingFromFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for loading an [PathTracking] from a file at [path], if it's
  /// valid.

  LoadPathTrackingFromFileProvider call(String path) =>
      LoadPathTrackingFromFileProvider._(argument: path, from: this);

  @override
  String toString() => r'loadPathTrackingFromFileProvider';
}

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

@ProviderFor(savePathTracking)
final savePathTrackingProvider = SavePathTrackingFamily._();

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SavePathTrackingProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  SavePathTrackingProvider._({
    required SavePathTrackingFamily super.from,
    required (PathTracking, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'savePathTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$savePathTrackingHash();

  @override
  String toString() {
    return r'savePathTrackingProvider'
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
            as (PathTracking, {String? overrideName, bool downloadIfWeb});
    return savePathTracking(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SavePathTrackingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$savePathTrackingHash() => r'5f8be03f26d7b23c96ba905ea99d125515453057';

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class SavePathTrackingFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (PathTracking, {String? overrideName, bool downloadIfWeb})
        > {
  SavePathTrackingFamily._()
    : super(
        retry: null,
        name: r'savePathTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].

  SavePathTrackingProvider call(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => SavePathTrackingProvider._(
    argument: (
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'savePathTrackingProvider';
}

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

@ProviderFor(exportPathTracking)
final exportPathTrackingProvider = ExportPathTrackingFamily._();

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class ExportPathTrackingProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].
  ExportPathTrackingProvider._({
    required ExportPathTrackingFamily super.from,
    required (PathTracking, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'exportPathTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportPathTrackingHash();

  @override
  String toString() {
    return r'exportPathTrackingProvider'
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
            as (PathTracking, {String? overrideName, bool downloadIfWeb});
    return exportPathTracking(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ExportPathTrackingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportPathTrackingHash() =>
    r'db15fe7381f02c1a3312bee2ecd235c8360e7640';

/// A provider for saving [tracking] to a file in the user file directory.
///
/// Override the file name with [overrideName].

final class ExportPathTrackingFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (PathTracking, {String? overrideName, bool downloadIfWeb})
        > {
  ExportPathTrackingFamily._()
    : super(
        retry: null,
        name: r'exportPathTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for saving [tracking] to a file in the user file directory.
  ///
  /// Override the file name with [overrideName].

  ExportPathTrackingProvider call(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = false,
  }) => ExportPathTrackingProvider._(
    argument: (
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'exportPathTrackingProvider';
}

/// A provider for reading and holding all the saved [PathTracking] in the
/// user file directory.

@ProviderFor(savedPathTrackings)
final savedPathTrackingsProvider = SavedPathTrackingsProvider._();

/// A provider for reading and holding all the saved [PathTracking] in the
/// user file directory.

final class SavedPathTrackingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PathTracking>>,
          List<PathTracking>,
          FutureOr<List<PathTracking>>
        >
    with
        $FutureModifier<List<PathTracking>>,
        $FutureProvider<List<PathTracking>> {
  /// A provider for reading and holding all the saved [PathTracking] in the
  /// user file directory.
  SavedPathTrackingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savedPathTrackingsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savedPathTrackingsHash();

  @$internal
  @override
  $FutureProviderElement<List<PathTracking>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PathTracking>> create(Ref ref) {
    return savedPathTrackings(ref);
  }
}

String _$savedPathTrackingsHash() =>
    r'af0113ed05ba71176298ddc62b963c93bb7c40d7';

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].

@ProviderFor(deletePathTracking)
final deletePathTrackingProvider = DeletePathTrackingFamily._();

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].

final class DeletePathTrackingProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].
  DeletePathTrackingProvider._({
    required DeletePathTrackingFamily super.from,
    required (PathTracking, {String? overrideName, bool downloadIfWeb})
    super.argument,
  }) : super(
         retry: null,
         name: r'deletePathTrackingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deletePathTrackingHash();

  @override
  String toString() {
    return r'deletePathTrackingProvider'
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
            as (PathTracking, {String? overrideName, bool downloadIfWeb});
    return deletePathTracking(
      ref,
      argument.$1,
      overrideName: argument.overrideName,
      downloadIfWeb: argument.downloadIfWeb,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DeletePathTrackingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deletePathTrackingHash() =>
    r'b510007c9f5577e46da70958dd8c88e3bc22fe41';

/// A provider for deleting [tracking] from the user file systemm.
///
/// Override the file name with [overrideName].

final class DeletePathTrackingFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<void>,
          (PathTracking, {String? overrideName, bool downloadIfWeb})
        > {
  DeletePathTrackingFamily._()
    : super(
        retry: null,
        name: r'deletePathTrackingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for deleting [tracking] from the user file systemm.
  ///
  /// Override the file name with [overrideName].

  DeletePathTrackingProvider call(
    PathTracking tracking, {
    String? overrideName,
    bool downloadIfWeb = true,
  }) => DeletePathTrackingProvider._(
    argument: (
      tracking,
      overrideName: overrideName,
      downloadIfWeb: downloadIfWeb,
    ),
    from: this,
  );

  @override
  String toString() => r'deletePathTrackingProvider';
}

/// A provider for importing a [PathTracking] from a file and applying it to
/// the [ConfiguredPathTracking] provider.

@ProviderFor(importPathTracking)
final importPathTrackingProvider = ImportPathTrackingProvider._();

/// A provider for importing a [PathTracking] from a file and applying it to
/// the [ConfiguredPathTracking] provider.

final class ImportPathTrackingProvider
    extends
        $FunctionalProvider<
          AsyncValue<PathTracking?>,
          PathTracking?,
          FutureOr<PathTracking?>
        >
    with $FutureModifier<PathTracking?>, $FutureProvider<PathTracking?> {
  /// A provider for importing a [PathTracking] from a file and applying it to
  /// the [ConfiguredPathTracking] provider.
  ImportPathTrackingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'importPathTrackingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$importPathTrackingHash();

  @$internal
  @override
  $FutureProviderElement<PathTracking?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PathTracking?> create(Ref ref) {
    return importPathTracking(ref);
  }
}

String _$importPathTrackingHash() =>
    r'0232d12f7d56e617da15344ff5a5e84d886ea4bd';

/// A provider for exporting all guidance files.

@ProviderFor(exportGuidances)
final exportGuidancesProvider = ExportGuidancesFamily._();

/// A provider for exporting all guidance files.

final class ExportGuidancesProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  /// A provider for exporting all guidance files.
  ExportGuidancesProvider._({
    required ExportGuidancesFamily super.from,
    required bool super.argument,
  }) : super(
         retry: null,
         name: r'exportGuidancesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$exportGuidancesHash();

  @override
  String toString() {
    return r'exportGuidancesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as bool;
    return exportGuidances(ref, zip: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ExportGuidancesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$exportGuidancesHash() => r'c3a70f44a023ff06985977bc6f6cbf05b7d30e7b';

/// A provider for exporting all guidance files.

final class ExportGuidancesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, bool> {
  ExportGuidancesFamily._()
    : super(
        retry: null,
        name: r'exportGuidancesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for exporting all guidance files.

  ExportGuidancesProvider call({bool zip = true}) =>
      ExportGuidancesProvider._(argument: zip, from: this);

  @override
  String toString() => r'exportGuidancesProvider';
}
