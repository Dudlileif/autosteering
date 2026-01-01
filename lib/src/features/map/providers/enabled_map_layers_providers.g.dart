// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enabled_map_layers_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Whether the OpenStreetMap layer should be shown.

@ProviderFor(ShowOSMLayer)
final showOSMLayerProvider = ShowOSMLayerProvider._();

/// Whether the OpenStreetMap layer should be shown.
final class ShowOSMLayerProvider extends $NotifierProvider<ShowOSMLayer, bool> {
  /// Whether the OpenStreetMap layer should be shown.
  ShowOSMLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showOSMLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showOSMLayerHash();

  @$internal
  @override
  ShowOSMLayer create() => ShowOSMLayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showOSMLayerHash() => r'b323c7740a070ca00572ab48ed973460a5117698';

/// Whether the OpenStreetMap layer should be shown.

abstract class _$ShowOSMLayer extends $Notifier<bool> {
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

/// Whether the selected country layers should be shown.

@ProviderFor(showCountryLayers)
final showCountryLayersProvider = ShowCountryLayersProvider._();

/// Whether the selected country layers should be shown.

final class ShowCountryLayersProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the selected country layers should be shown.
  ShowCountryLayersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showCountryLayersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showCountryLayersHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showCountryLayers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showCountryLayersHash() => r'693e1e9787f292cdb0dece26cdfa8015415ed2a8';

/// Whether the selected Sentinel layers should be shown.

@ProviderFor(showSentinelLayers)
final showSentinelLayersProvider = ShowSentinelLayersProvider._();

/// Whether the selected Sentinel layers should be shown.

final class ShowSentinelLayersProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the selected Sentinel layers should be shown.
  ShowSentinelLayersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showSentinelLayersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showSentinelLayersHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showSentinelLayers(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showSentinelLayersHash() =>
    r'83452dbdc13c80da5ce12ecbea0f17a4cebfd3df';

/// Whether the finished recorded path should be shown.

@ProviderFor(showFinishedPathLayer)
final showFinishedPathLayerProvider = ShowFinishedPathLayerProvider._();

/// Whether the finished recorded path should be shown.

final class ShowFinishedPathLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the finished recorded path should be shown.
  ShowFinishedPathLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showFinishedPathLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showFinishedPathLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showFinishedPathLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showFinishedPathLayerHash() =>
    r'bb8c6db1efab2d9fe9173cec9be4ae714b038f59';

/// Whether the currently recording path should be shown.

@ProviderFor(showPathRecordingLayer)
final showPathRecordingLayerProvider = ShowPathRecordingLayerProvider._();

/// Whether the currently recording path should be shown.

final class ShowPathRecordingLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the currently recording path should be shown.
  ShowPathRecordingLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showPathRecordingLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showPathRecordingLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showPathRecordingLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showPathRecordingLayerHash() =>
    r'd7e29a3a921824ae745b2f6fcebd9ce810efdd41';

/// Whether the editable recorded path should be shown.

@ProviderFor(showEditablePathLayer)
final showEditablePathLayerProvider = ShowEditablePathLayerProvider._();

/// Whether the editable recorded path should be shown.

final class ShowEditablePathLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the editable recorded path should be shown.
  ShowEditablePathLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showEditablePathLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showEditablePathLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showEditablePathLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showEditablePathLayerHash() =>
    r'5cf0983bc12c9fd4dafad02cf17de527bd324a46';

/// Whether the vehicle image drawing layer should be shown.

@ProviderFor(ShowVehicleDrawingLayer)
final showVehicleDrawingLayerProvider = ShowVehicleDrawingLayerProvider._();

/// Whether the vehicle image drawing layer should be shown.
final class ShowVehicleDrawingLayerProvider
    extends $NotifierProvider<ShowVehicleDrawingLayer, bool> {
  /// Whether the vehicle image drawing layer should be shown.
  ShowVehicleDrawingLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showVehicleDrawingLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showVehicleDrawingLayerHash();

  @$internal
  @override
  ShowVehicleDrawingLayer create() => ShowVehicleDrawingLayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showVehicleDrawingLayerHash() =>
    r'6b104dd0b7fb90e35b60673363d93416ac4c8cee';

/// Whether the vehicle image drawing layer should be shown.

abstract class _$ShowVehicleDrawingLayer extends $Notifier<bool> {
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

/// Whether the debugging layer for the vehicle should be shown.

@ProviderFor(showVehicleDebugLayer)
final showVehicleDebugLayerProvider = ShowVehicleDebugLayerProvider._();

/// Whether the debugging layer for the vehicle should be shown.

final class ShowVehicleDebugLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the debugging layer for the vehicle should be shown.
  ShowVehicleDebugLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showVehicleDebugLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showVehicleDebugLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showVehicleDebugLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showVehicleDebugLayerHash() =>
    r'04524f762eda34ef3491f1088fab15356a0fff13';

/// Whether the debugging layer for the Dubins path should be shown.

@ProviderFor(showDubinsPathDebugLayer)
final showDubinsPathDebugLayerProvider = ShowDubinsPathDebugLayerProvider._();

/// Whether the debugging layer for the Dubins path should be shown.

final class ShowDubinsPathDebugLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the debugging layer for the Dubins path should be shown.
  ShowDubinsPathDebugLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showDubinsPathDebugLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showDubinsPathDebugLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showDubinsPathDebugLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showDubinsPathDebugLayerHash() =>
    r'ca9d0d9434fdd33b6a41f81241d9d7949cd9c586';

/// Whether the layer for the path tracking should be shown.

@ProviderFor(showPathTrackingLayer)
final showPathTrackingLayerProvider = ShowPathTrackingLayerProvider._();

/// Whether the layer for the path tracking should be shown.

final class ShowPathTrackingLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the layer for the path tracking should be shown.
  ShowPathTrackingLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showPathTrackingLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showPathTrackingLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showPathTrackingLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showPathTrackingLayerHash() =>
    r'2517fe913ad66a204c59effd0df9d53e3477b82c';

/// Whether the layer for field should be shown.

@ProviderFor(showFieldLayer)
final showFieldLayerProvider = ShowFieldLayerProvider._();

/// Whether the layer for field should be shown.

final class ShowFieldLayerProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the layer for field should be shown.
  ShowFieldLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showFieldLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showFieldLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showFieldLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showFieldLayerHash() => r'1548f19a2b5051fa1fed449ccb0033d09f71f69b';

/// Whether the equipment drawing layer should be shown.

@ProviderFor(ShowEquipmentDrawingLayer)
final showEquipmentDrawingLayerProvider = ShowEquipmentDrawingLayerProvider._();

/// Whether the equipment drawing layer should be shown.
final class ShowEquipmentDrawingLayerProvider
    extends $NotifierProvider<ShowEquipmentDrawingLayer, bool> {
  /// Whether the equipment drawing layer should be shown.
  ShowEquipmentDrawingLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showEquipmentDrawingLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showEquipmentDrawingLayerHash();

  @$internal
  @override
  ShowEquipmentDrawingLayer create() => ShowEquipmentDrawingLayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showEquipmentDrawingLayerHash() =>
    r'69f5b2ebe80a727cdee1e0c75443cb8f7ddd6184';

/// Whether the equipment drawing layer should be shown.

abstract class _$ShowEquipmentDrawingLayer extends $Notifier<bool> {
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

/// Whether the debugging layer for the equipment should be shown.

@ProviderFor(showEquipmentDebugLayer)
final showEquipmentDebugLayerProvider = ShowEquipmentDebugLayerProvider._();

/// Whether the debugging layer for the equipment should be shown.

final class ShowEquipmentDebugLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the debugging layer for the equipment should be shown.
  ShowEquipmentDebugLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showEquipmentDebugLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showEquipmentDebugLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showEquipmentDebugLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showEquipmentDebugLayerHash() =>
    r'3448a8370f4e2f15602e23e224fa0d3a21bb7a2e';

/// Whether the layer for AB-tracking should be shown.

@ProviderFor(showABTrackingLayer)
final showABTrackingLayerProvider = ShowABTrackingLayerProvider._();

/// Whether the layer for AB-tracking should be shown.

final class ShowABTrackingLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the layer for AB-tracking should be shown.
  ShowABTrackingLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showABTrackingLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showABTrackingLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showABTrackingLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showABTrackingLayerHash() =>
    r'ebbfe2943c22b990d012d77186fae4b7330e952b';

/// Whether the map should show grid lines.

@ProviderFor(ShowGridLayer)
final showGridLayerProvider = ShowGridLayerProvider._();

/// Whether the map should show grid lines.
final class ShowGridLayerProvider
    extends $NotifierProvider<ShowGridLayer, bool> {
  /// Whether the map should show grid lines.
  ShowGridLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showGridLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showGridLayerHash();

  @$internal
  @override
  ShowGridLayer create() => ShowGridLayer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showGridLayerHash() => r'de914d52a808bb170bc84287961f3cfcd95a905e';

/// Whether the map should show grid lines.

abstract class _$ShowGridLayer extends $Notifier<bool> {
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

/// Whether the layer for selectable path should be shown.

@ProviderFor(showSelectablePathLayer)
final showSelectablePathLayerProvider = ShowSelectablePathLayerProvider._();

/// Whether the layer for selectable path should be shown.

final class ShowSelectablePathLayerProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether the layer for selectable path should be shown.
  ShowSelectablePathLayerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'showSelectablePathLayerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$showSelectablePathLayerHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return showSelectablePathLayer(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$showSelectablePathLayerHash() =>
    r'531d2d5f00726261acfa12203816c95fa9ac8e44';
