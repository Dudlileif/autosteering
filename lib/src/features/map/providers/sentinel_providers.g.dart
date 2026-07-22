// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sentinel_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider for the Sentinel Dataspace instance id.

@ProviderFor(CopernicusInstanceId)
final copernicusInstanceIdProvider = CopernicusInstanceIdProvider._();

/// A provider for the Sentinel Dataspace instance id.
final class CopernicusInstanceIdProvider
    extends $NotifierProvider<CopernicusInstanceId, String?> {
  /// A provider for the Sentinel Dataspace instance id.
  CopernicusInstanceIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'copernicusInstanceIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$copernicusInstanceIdHash();

  @$internal
  @override
  CopernicusInstanceId create() => CopernicusInstanceId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$copernicusInstanceIdHash() =>
    r'aa03e8e534f7413e9dc5c9fac7186ef08f6fb305';

/// A provider for the Sentinel Dataspace instance id.

abstract class _$CopernicusInstanceId extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the available Sentinel layers.

@ProviderFor(AvailableSentinelLayers)
final availableSentinelLayersProvider = AvailableSentinelLayersProvider._();

/// A provider for the available Sentinel layers.
final class AvailableSentinelLayersProvider
    extends $NotifierProvider<AvailableSentinelLayers, List<SentinelLayer>> {
  /// A provider for the available Sentinel layers.
  AvailableSentinelLayersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'availableSentinelLayersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$availableSentinelLayersHash();

  @$internal
  @override
  AvailableSentinelLayers create() => AvailableSentinelLayers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SentinelLayer> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SentinelLayer>>(value),
    );
  }
}

String _$availableSentinelLayersHash() =>
    r'6b2ad21f194a8e303caf59f029d1b057cd050a49';

/// A provider for the available Sentinel layers.

abstract class _$AvailableSentinelLayers
    extends $Notifier<List<SentinelLayer>> {
  List<SentinelLayer> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<SentinelLayer>, List<SentinelLayer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<SentinelLayer>, List<SentinelLayer>>,
              List<SentinelLayer>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A provider for the max level of cloud coverage that the Sentinel layers
/// should query for.

@ProviderFor(SentinelMaxCloudCoveragePercent)
final sentinelMaxCloudCoveragePercentProvider =
    SentinelMaxCloudCoveragePercentProvider._();

/// A provider for the max level of cloud coverage that the Sentinel layers
/// should query for.
final class SentinelMaxCloudCoveragePercentProvider
    extends $NotifierProvider<SentinelMaxCloudCoveragePercent, double> {
  /// A provider for the max level of cloud coverage that the Sentinel layers
  /// should query for.
  SentinelMaxCloudCoveragePercentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sentinelMaxCloudCoveragePercentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sentinelMaxCloudCoveragePercentHash();

  @$internal
  @override
  SentinelMaxCloudCoveragePercent create() => SentinelMaxCloudCoveragePercent();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$sentinelMaxCloudCoveragePercentHash() =>
    r'54b218d65d464f834efaa6dacf6d61ea15343629';

/// A provider for the max level of cloud coverage that the Sentinel layers
/// should query for.

abstract class _$SentinelMaxCloudCoveragePercent extends $Notifier<double> {
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

/// A provider for the set of selected Sentinel layers.

@ProviderFor(EnabledSentinelLayers)
final enabledSentinelLayersProvider = EnabledSentinelLayersProvider._();

/// A provider for the set of selected Sentinel layers.
final class EnabledSentinelLayersProvider
    extends $NotifierProvider<EnabledSentinelLayers, Set<SentinelLayer>> {
  /// A provider for the set of selected Sentinel layers.
  EnabledSentinelLayersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enabledSentinelLayersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enabledSentinelLayersHash();

  @$internal
  @override
  EnabledSentinelLayers create() => EnabledSentinelLayers();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<SentinelLayer> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<SentinelLayer>>(value),
    );
  }
}

String _$enabledSentinelLayersHash() =>
    r'312babaa81e99bf0139c2631fef29332c06eb66a';

/// A provider for the set of selected Sentinel layers.

abstract class _$EnabledSentinelLayers extends $Notifier<Set<SentinelLayer>> {
  Set<SentinelLayer> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Set<SentinelLayer>, Set<SentinelLayer>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<SentinelLayer>, Set<SentinelLayer>>,
              Set<SentinelLayer>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

/// A map for the Sentinel layers and their opacities, which can be specified.

@ProviderFor(SentinelLayerOpacities)
final sentinelLayerOpacitiesProvider = SentinelLayerOpacitiesProvider._();

/// A map for the Sentinel layers and their opacities, which can be specified.
final class SentinelLayerOpacitiesProvider
    extends
        $NotifierProvider<
          SentinelLayerOpacities,
          Map<SentinelLayerType, double>
        > {
  /// A map for the Sentinel layers and their opacities, which can be specified.
  SentinelLayerOpacitiesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sentinelLayerOpacitiesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sentinelLayerOpacitiesHash();

  @$internal
  @override
  SentinelLayerOpacities create() => SentinelLayerOpacities();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<SentinelLayerType, double> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<SentinelLayerType, double>>(
        value,
      ),
    );
  }
}

String _$sentinelLayerOpacitiesHash() =>
    r'a3a95d29e07074aaeb27f537f2b9895cdb9b007d';

/// A map for the Sentinel layers and their opacities, which can be specified.

abstract class _$SentinelLayerOpacities
    extends $Notifier<Map<SentinelLayerType, double>> {
  Map<SentinelLayerType, double> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              Map<SentinelLayerType, double>,
              Map<SentinelLayerType, double>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                Map<SentinelLayerType, double>,
                Map<SentinelLayerType, double>
              >,
              Map<SentinelLayerType, double>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
