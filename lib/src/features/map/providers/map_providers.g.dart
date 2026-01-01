// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the map is ready to be shown or not.

@ProviderFor(MapReady)
final mapReadyProvider = MapReadyProvider._();

/// Whether the map is ready to be shown or not.
final class MapReadyProvider extends $NotifierProvider<MapReady, bool> {
  /// Whether the map is ready to be shown or not.
  MapReadyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapReadyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapReadyHash();

  @$internal
  @override
  MapReady create() => MapReady();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$mapReadyHash() => r'36f729a428a7b1c5015737d8834d2c0b15df71ab';

/// Whether the map is ready to be shown or not.

abstract class _$MapReady extends $Notifier<bool> {
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

/// The main [MapController] provider, which allows controlling the map from
/// outside the widget code itself.

@ProviderFor(MainMapController)
final mainMapControllerProvider = MainMapControllerProvider._();

/// The main [MapController] provider, which allows controlling the map from
/// outside the widget code itself.
final class MainMapControllerProvider
    extends $NotifierProvider<MainMapController, MapController> {
  /// The main [MapController] provider, which allows controlling the map from
  /// outside the widget code itself.
  MainMapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainMapControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainMapControllerHash();

  @$internal
  @override
  MainMapController create() => MainMapController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapController>(value),
    );
  }
}

String _$mainMapControllerHash() => r'd86c68d7c52e5619b02fb085cedf0d871848bdb8';

/// The main [MapController] provider, which allows controlling the map from
/// outside the widget code itself.

abstract class _$MainMapController extends $Notifier<MapController> {
  MapController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapController, MapController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapController, MapController>,
              MapController,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// The home position of the vehicle, i.e. where the vehicle will reset to.

@ProviderFor(HomePosition)
final homePositionProvider = HomePositionProvider._();

/// The home position of the vehicle, i.e. where the vehicle will reset to.
final class HomePositionProvider
    extends $NotifierProvider<HomePosition, LatLng> {
  /// The home position of the vehicle, i.e. where the vehicle will reset to.
  HomePositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homePositionProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homePositionHash();

  @$internal
  @override
  HomePosition create() => HomePosition();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LatLng value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LatLng>(value),
    );
  }
}

String _$homePositionHash() => r'19f063a826dfa7c035b97e4a86031bf7361eb1e8';

/// The home position of the vehicle, i.e. where the vehicle will reset to.

abstract class _$HomePosition extends $Notifier<LatLng> {
  LatLng build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<LatLng, LatLng>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LatLng, LatLng>,
              LatLng,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Whether the map should center on the vehicle or if it could be moved freely.

@ProviderFor(CenterMapOnVehicle)
final centerMapOnVehicleProvider = CenterMapOnVehicleProvider._();

/// Whether the map should center on the vehicle or if it could be moved freely.
final class CenterMapOnVehicleProvider
    extends $NotifierProvider<CenterMapOnVehicle, bool> {
  /// Whether the map should center on the vehicle or if it could be moved freely.
  CenterMapOnVehicleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'centerMapOnVehicleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$centerMapOnVehicleHash();

  @$internal
  @override
  CenterMapOnVehicle create() => CenterMapOnVehicle();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$centerMapOnVehicleHash() =>
    r'35ca7b7367e2181e085fe54d8ebb539dfccf2ca6';

/// Whether the map should center on the vehicle or if it could be moved freely.

abstract class _$CenterMapOnVehicle extends $Notifier<bool> {
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

/// A provider for controlling the zoom when a gamepad button is held down.
///
/// The map will keep zooming in/out while the button is held down.

@ProviderFor(ZoomTimerController)
final zoomTimerControllerProvider = ZoomTimerControllerProvider._();

/// A provider for controlling the zoom when a gamepad button is held down.
///
/// The map will keep zooming in/out while the button is held down.
final class ZoomTimerControllerProvider
    extends $NotifierProvider<ZoomTimerController, Timer?> {
  /// A provider for controlling the zoom when a gamepad button is held down.
  ///
  /// The map will keep zooming in/out while the button is held down.
  ZoomTimerControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'zoomTimerControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$zoomTimerControllerHash();

  @$internal
  @override
  ZoomTimerController create() => ZoomTimerController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Timer? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Timer?>(value),
    );
  }
}

String _$zoomTimerControllerHash() =>
    r'2ef50dd41405ce24faea17e0204176f15925134d';

/// A provider for controlling the zoom when a gamepad button is held down.
///
/// The map will keep zooming in/out while the button is held down.

abstract class _$ZoomTimerController extends $Notifier<Timer?> {
  Timer? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Timer?, Timer?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Timer?, Timer?>,
              Timer?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// How much the map center should be offset from the vehicle.

@ProviderFor(mapOffset)
final mapOffsetProvider = MapOffsetProvider._();

/// How much the map center should be offset from the vehicle.

final class MapOffsetProvider
    extends
        $FunctionalProvider<MapCenterOffset, MapCenterOffset, MapCenterOffset>
    with $Provider<MapCenterOffset> {
  /// How much the map center should be offset from the vehicle.
  MapOffsetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapOffsetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapOffsetHash();

  @$internal
  @override
  $ProviderElement<MapCenterOffset> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MapCenterOffset create(Ref ref) {
    return mapOffset(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCenterOffset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCenterOffset>(value),
    );
  }
}

String _$mapOffsetHash() => r'b8bbceca43463ca497cded9989ed80bc93c1fc98';

/// How much the map center should be offset from the vehicle when using
/// 2D view.

@ProviderFor(MapOffset2D)
final mapOffset2DProvider = MapOffset2DProvider._();

/// How much the map center should be offset from the vehicle when using
/// 2D view.
final class MapOffset2DProvider
    extends $NotifierProvider<MapOffset2D, MapCenterOffset> {
  /// How much the map center should be offset from the vehicle when using
  /// 2D view.
  MapOffset2DProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapOffset2DProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapOffset2DHash();

  @$internal
  @override
  MapOffset2D create() => MapOffset2D();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCenterOffset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCenterOffset>(value),
    );
  }
}

String _$mapOffset2DHash() => r'61edf217771e62a642a6839ef2f09369edcb5054';

/// How much the map center should be offset from the vehicle when using
/// 2D view.

abstract class _$MapOffset2D extends $Notifier<MapCenterOffset> {
  MapCenterOffset build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapCenterOffset, MapCenterOffset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapCenterOffset, MapCenterOffset>,
              MapCenterOffset,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// How much the map center should be offset from the vehicle when using
/// 3D view.

@ProviderFor(MapOffset3D)
final mapOffset3DProvider = MapOffset3DProvider._();

/// How much the map center should be offset from the vehicle when using
/// 3D view.
final class MapOffset3DProvider
    extends $NotifierProvider<MapOffset3D, MapCenterOffset> {
  /// How much the map center should be offset from the vehicle when using
  /// 3D view.
  MapOffset3DProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapOffset3DProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapOffset3DHash();

  @$internal
  @override
  MapOffset3D create() => MapOffset3D();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCenterOffset value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCenterOffset>(value),
    );
  }
}

String _$mapOffset3DHash() => r'5cf6b59d77109e1b658a050688c679d4195c212a';

/// How much the map center should be offset from the vehicle when using
/// 3D view.

abstract class _$MapOffset3D extends $Notifier<MapCenterOffset> {
  MapCenterOffset build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapCenterOffset, MapCenterOffset>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapCenterOffset, MapCenterOffset>,
              MapCenterOffset,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// The map center offset applied to the vehicle position, contains the
/// actual center position of the map.

@ProviderFor(offsetVehiclePosition)
final offsetVehiclePositionProvider = OffsetVehiclePositionProvider._();

/// The map center offset applied to the vehicle position, contains the
/// actual center position of the map.

final class OffsetVehiclePositionProvider
    extends $FunctionalProvider<LatLng, LatLng, LatLng>
    with $Provider<LatLng> {
  /// The map center offset applied to the vehicle position, contains the
  /// actual center position of the map.
  OffsetVehiclePositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'offsetVehiclePositionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$offsetVehiclePositionHash();

  @$internal
  @override
  $ProviderElement<LatLng> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LatLng create(Ref ref) {
    return offsetVehiclePosition(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LatLng value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LatLng>(value),
    );
  }
}

String _$offsetVehiclePositionHash() =>
    r'581e0cf4438c8f86b9067529dec3b7df56afe008';

/// Whether the map always should point to the north and not rotate.

@ProviderFor(AlwaysPointNorth)
final alwaysPointNorthProvider = AlwaysPointNorthProvider._();

/// Whether the map always should point to the north and not rotate.
final class AlwaysPointNorthProvider
    extends $NotifierProvider<AlwaysPointNorth, bool> {
  /// Whether the map always should point to the north and not rotate.
  AlwaysPointNorthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'alwaysPointNorthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$alwaysPointNorthHash();

  @$internal
  @override
  AlwaysPointNorth create() => AlwaysPointNorth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$alwaysPointNorthHash() => r'34219ed8614164321d8799ffdd299d8f460ff0ad';

/// Whether the map always should point to the north and not rotate.

abstract class _$AlwaysPointNorth extends $Notifier<bool> {
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

/// Whether to enable a 3D perspective for the map, otherwise an orthogonal
/// view is used.

@ProviderFor(MapUse3DPerspective)
final mapUse3DPerspectiveProvider = MapUse3DPerspectiveProvider._();

/// Whether to enable a 3D perspective for the map, otherwise an orthogonal
/// view is used.
final class MapUse3DPerspectiveProvider
    extends $NotifierProvider<MapUse3DPerspective, bool> {
  /// Whether to enable a 3D perspective for the map, otherwise an orthogonal
  /// view is used.
  MapUse3DPerspectiveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapUse3DPerspectiveProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapUse3DPerspectiveHash();

  @$internal
  @override
  MapUse3DPerspective create() => MapUse3DPerspective();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$mapUse3DPerspectiveHash() =>
    r'78fc37044a94d5afe2ac1e2e317d7e1bfd575303';

/// Whether to enable a 3D perspective for the map, otherwise an orthogonal
/// view is used.

abstract class _$MapUse3DPerspective extends $Notifier<bool> {
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

/// The angle that the 3D perspective should be seen from, as in radians
/// from the orthogonal view.

@ProviderFor(Map3DPerspectiveAngle)
final map3DPerspectiveAngleProvider = Map3DPerspectiveAngleProvider._();

/// The angle that the 3D perspective should be seen from, as in radians
/// from the orthogonal view.
final class Map3DPerspectiveAngleProvider
    extends $NotifierProvider<Map3DPerspectiveAngle, double> {
  /// The angle that the 3D perspective should be seen from, as in radians
  /// from the orthogonal view.
  Map3DPerspectiveAngleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'map3DPerspectiveAngleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$map3DPerspectiveAngleHash();

  @$internal
  @override
  Map3DPerspectiveAngle create() => Map3DPerspectiveAngle();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$map3DPerspectiveAngleHash() =>
    r'eb242d22c74963558ad446fdf18a4ca6fb8d3b3b';

/// The angle that the 3D perspective should be seen from, as in radians
/// from the orthogonal view.

abstract class _$Map3DPerspectiveAngle extends $Notifier<double> {
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

/// The zoom value that the map should use when being created.

@ProviderFor(MapZoom)
final mapZoomProvider = MapZoomProvider._();

/// The zoom value that the map should use when being created.
final class MapZoomProvider extends $NotifierProvider<MapZoom, double> {
  /// The zoom value that the map should use when being created.
  MapZoomProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapZoomProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapZoomHash();

  @$internal
  @override
  MapZoom create() => MapZoom();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$mapZoomHash() => r'9b86aaf1b7c0bb8e07ed467ebfb892e0336f0514';

/// The zoom value that the map should use when being created.

abstract class _$MapZoom extends $Notifier<double> {
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

/// A provider for finding the first cache date of the map layer cache
/// at the given [path].

@ProviderFor(mapCacheDate)
final mapCacheDateProvider = MapCacheDateFamily._();

/// A provider for finding the first cache date of the map layer cache
/// at the given [path].

final class MapCacheDateProvider
    extends
        $FunctionalProvider<
          AsyncValue<DateTime?>,
          DateTime?,
          FutureOr<DateTime?>
        >
    with $FutureModifier<DateTime?>, $FutureProvider<DateTime?> {
  /// A provider for finding the first cache date of the map layer cache
  /// at the given [path].
  MapCacheDateProvider._({
    required MapCacheDateFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'mapCacheDateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapCacheDateHash();

  @override
  String toString() {
    return r'mapCacheDateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<DateTime?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<DateTime?> create(Ref ref) {
    final argument = this.argument as String;
    return mapCacheDate(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MapCacheDateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapCacheDateHash() => r'18cbbbeec7b58f48dcd447634fc9cffd0dcbd75a';

/// A provider for finding the first cache date of the map layer cache
/// at the given [path].

final class MapCacheDateFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<DateTime?>, String> {
  MapCacheDateFamily._()
    : super(
        retry: null,
        name: r'mapCacheDateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// A provider for finding the first cache date of the map layer cache
  /// at the given [path].

  MapCacheDateProvider call(String filePath) =>
      MapCacheDateProvider._(argument: filePath, from: this);

  @override
  String toString() => r'mapCacheDateProvider';
}

/// A provider for listing all the map layer cache folders.

@ProviderFor(mapCacheDirectories)
final mapCacheDirectoriesProvider = MapCacheDirectoriesProvider._();

/// A provider for listing all the map layer cache folders.

final class MapCacheDirectoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>
        >
    with $FutureModifier<List<String>>, $FutureProvider<List<String>> {
  /// A provider for listing all the map layer cache folders.
  MapCacheDirectoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCacheDirectoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapCacheDirectoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<String>> create(Ref ref) {
    return mapCacheDirectories(ref);
  }
}

String _$mapCacheDirectoriesHash() =>
    r'c6af4beb4c54652d190a0bf89d94f79fb6834e1a';

/// Whether the map should be allowed to download tiles over the internet.

@ProviderFor(MapAllowDownload)
final mapAllowDownloadProvider = MapAllowDownloadProvider._();

/// Whether the map should be allowed to download tiles over the internet.
final class MapAllowDownloadProvider
    extends $NotifierProvider<MapAllowDownload, bool> {
  /// Whether the map should be allowed to download tiles over the internet.
  MapAllowDownloadProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapAllowDownloadProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapAllowDownloadHash();

  @$internal
  @override
  MapAllowDownload create() => MapAllowDownload();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$mapAllowDownloadHash() => r'1ced70a153678e5415176206bf4f38a06024352d';

/// Whether the map should be allowed to download tiles over the internet.

abstract class _$MapAllowDownload extends $Notifier<bool> {
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

/// The size of the currently displayed map grid.

@ProviderFor(MapGridSize)
final mapGridSizeProvider = MapGridSizeProvider._();

/// The size of the currently displayed map grid.
final class MapGridSizeProvider
    extends $NotifierProvider<MapGridSize, double?> {
  /// The size of the currently displayed map grid.
  MapGridSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapGridSizeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapGridSizeHash();

  @$internal
  @override
  MapGridSize create() => MapGridSize();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double?>(value),
    );
  }
}

String _$mapGridSizeHash() => r'724dc6e828b687e501539db9f96fdf664cc54683';

/// The size of the currently displayed map grid.

abstract class _$MapGridSize extends $Notifier<double?> {
  double? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<double?, double?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double?, double?>,
              double?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Whether the grid size indicator should be shown.

@ProviderFor(ShowGridSizeIndicator)
final showGridSizeIndicatorProvider = ShowGridSizeIndicatorProvider._();

/// Whether the grid size indicator should be shown.
final class ShowGridSizeIndicatorProvider
    extends $NotifierProvider<ShowGridSizeIndicator, bool> {
  /// Whether the grid size indicator should be shown.
  ShowGridSizeIndicatorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showGridSizeIndicatorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showGridSizeIndicatorHash();

  @$internal
  @override
  ShowGridSizeIndicator create() => ShowGridSizeIndicator();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showGridSizeIndicatorHash() =>
    r'd900954a852121d822ea4b7f4729e96d33e0b2c7';

/// Whether the grid size indicator should be shown.

abstract class _$ShowGridSizeIndicator extends $Notifier<bool> {
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
