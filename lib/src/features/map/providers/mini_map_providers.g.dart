// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mini_map_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the mini map should be shown.

@ProviderFor(ShowMiniMap)
const showMiniMapProvider = ShowMiniMapProvider._();

/// Whether the mini map should be shown.
final class ShowMiniMapProvider extends $NotifierProvider<ShowMiniMap, bool> {
  /// Whether the mini map should be shown.
  const ShowMiniMapProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showMiniMapProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showMiniMapHash();

  @$internal
  @override
  ShowMiniMap create() => ShowMiniMap();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showMiniMapHash() => r'513352096bf01f8d799c4a05c054c2930695d6e2';

/// Whether the mini map should be shown.

abstract class _$ShowMiniMap extends $Notifier<bool> {
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

/// Whether the map is ready to be shown or not.

@ProviderFor(MiniMapReady)
const miniMapReadyProvider = MiniMapReadyProvider._();

/// Whether the map is ready to be shown or not.
final class MiniMapReadyProvider extends $NotifierProvider<MiniMapReady, bool> {
  /// Whether the map is ready to be shown or not.
  const MiniMapReadyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'miniMapReadyProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$miniMapReadyHash();

  @$internal
  @override
  MiniMapReady create() => MiniMapReady();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$miniMapReadyHash() => r'ded8c7d96056a32ee3954e84edaa1daf8e2928e4';

/// Whether the map is ready to be shown or not.

abstract class _$MiniMapReady extends $Notifier<bool> {
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

/// The mini map [MapController] provider, which allows controlling the
/// map from outside the widget code itself.

@ProviderFor(MiniMapController)
const miniMapControllerProvider = MiniMapControllerProvider._();

/// The mini map [MapController] provider, which allows controlling the
/// map from outside the widget code itself.
final class MiniMapControllerProvider
    extends $NotifierProvider<MiniMapController, MapController> {
  /// The mini map [MapController] provider, which allows controlling the
  /// map from outside the widget code itself.
  const MiniMapControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'miniMapControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$miniMapControllerHash();

  @$internal
  @override
  MiniMapController create() => MiniMapController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapController value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapController>(value),
    );
  }
}

String _$miniMapControllerHash() => r'7e44e646a23fd34c4f6798edbcd67e4d11824e13';

/// The mini map [MapController] provider, which allows controlling the
/// map from outside the widget code itself.

abstract class _$MiniMapController extends $Notifier<MapController> {
  MapController build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MapController, MapController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapController, MapController>,
              MapController,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Whether the mini map always should point to the north and not rotate.

@ProviderFor(MiniMapLockToField)
const miniMapLockToFieldProvider = MiniMapLockToFieldProvider._();

/// Whether the mini map always should point to the north and not rotate.
final class MiniMapLockToFieldProvider
    extends $NotifierProvider<MiniMapLockToField, bool> {
  /// Whether the mini map always should point to the north and not rotate.
  const MiniMapLockToFieldProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'miniMapLockToFieldProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$miniMapLockToFieldHash();

  @$internal
  @override
  MiniMapLockToField create() => MiniMapLockToField();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$miniMapLockToFieldHash() =>
    r'de4f0f13fec719a82df594f58b8a831a86ccc645';

/// Whether the mini map always should point to the north and not rotate.

abstract class _$MiniMapLockToField extends $Notifier<bool> {
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

/// Whether the mini map always should point to the north and not rotate.

@ProviderFor(MiniMapAlwaysPointNorth)
const miniMapAlwaysPointNorthProvider = MiniMapAlwaysPointNorthProvider._();

/// Whether the mini map always should point to the north and not rotate.
final class MiniMapAlwaysPointNorthProvider
    extends $NotifierProvider<MiniMapAlwaysPointNorth, bool> {
  /// Whether the mini map always should point to the north and not rotate.
  const MiniMapAlwaysPointNorthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'miniMapAlwaysPointNorthProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$miniMapAlwaysPointNorthHash();

  @$internal
  @override
  MiniMapAlwaysPointNorth create() => MiniMapAlwaysPointNorth();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$miniMapAlwaysPointNorthHash() =>
    r'1ec4ab2f97d16d9260b159ff7d8b2c9665133f07';

/// Whether the mini map always should point to the north and not rotate.

abstract class _$MiniMapAlwaysPointNorth extends $Notifier<bool> {
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

/// Whether the mini map always should point to the north and not rotate.

@ProviderFor(MiniMapSize)
const miniMapSizeProvider = MiniMapSizeProvider._();

/// Whether the mini map always should point to the north and not rotate.
final class MiniMapSizeProvider extends $NotifierProvider<MiniMapSize, double> {
  /// Whether the mini map always should point to the north and not rotate.
  const MiniMapSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'miniMapSizeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$miniMapSizeHash();

  @$internal
  @override
  MiniMapSize create() => MiniMapSize();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$miniMapSizeHash() => r'2d209cd72ad7be46bd686724ae49229b4c1fb906';

/// Whether the mini map always should point to the north and not rotate.

abstract class _$MiniMapSize extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
