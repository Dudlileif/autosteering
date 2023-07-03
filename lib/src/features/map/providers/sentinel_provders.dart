import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sentinel_provders.g.dart';

/// A provider for the Sentinel Dataspace instance id.
@Riverpod(keepAlive: true)
class SentinelInstanceId extends _$SentinelInstanceId {
  @override
  String? build() => null;

  void update(String? value) => Future(() => state = value);
}

/// A provider for the available Sentinel layers.
@Riverpod(keepAlive: true)
class AvailableSentinelLayers extends _$AvailableSentinelLayers {
  @override
  List<SentinelLayer> build() {
    final instanceId = ref.watch(sentinelInstanceIdProvider);
    if (instanceId != null) {
      return SentinelLayerType.values
          .map(
            (layerType) => SentinelLayer(
              instanceId: instanceId,
              layerType: layerType,
            ),
          )
          .toList();
    }
    return [];
  }

  void reorder(int oldIndex, int newIndex) => Future(() {
        var moveTo = newIndex;
        if (oldIndex < newIndex) {
          moveTo -= 1;
        }
        final layer = state.removeAt(oldIndex);
        state = state..insert(moveTo, layer);
      });

  @override
  bool updateShouldNotify(
    List<SentinelLayer> previous,
    List<SentinelLayer> next,
  ) =>
      true;
}

/// A provider for the max level of cloud coverage that the Sentinel layers
/// should query for.
@Riverpod(keepAlive: true)
class SentinelMaxCloudCoveragePercent
    extends _$SentinelMaxCloudCoveragePercent {
  @override
  double build() => 20;

  void update(double value) => Future(() => state = value);
}

/// A provider for the set of selected Sentinel layers.
@Riverpod(keepAlive: true)
class EnabledSentinelLayers extends _$EnabledSentinelLayers {
  @override
  Set<SentinelLayer> build() => <SentinelLayer>{};

  void add(SentinelLayer layer) => Future(
        () => state = state..add(layer),
      );
  void remove(SentinelLayer layer) => Future(
        () => state = state
          ..removeWhere((element) => element.layerType == layer.layerType),
      );

  void toggle(SentinelLayer layer) {
    final layerExists =
        state.any((element) => element.layerType == layer.layerType);
    if (layerExists) {
      remove(layer);
    } else {
      add(layer);
    }
  }

  void clear() => Future(() => state = state..clear());

  @override
  bool updateShouldNotify(
    Set<SentinelLayer> previous,
    Set<SentinelLayer> next,
  ) =>
      true;
}

/// A map for the Sentinel layers and their opacities, which can be specified.
@Riverpod(keepAlive: true)
class SentinelLayerOpacities extends _$SentinelLayerOpacities {
  @override
  Map<SentinelLayerType, double> build() =>
      {for (var layer in SentinelLayerType.values) layer: 0.5};

  void update(SentinelLayerType layer, double opacity) => Future(
        () => state = state..update(layer, (value) => opacity),
      );

  void reset() => ref.invalidateSelf();

  @override
  bool updateShouldNotify(
    Map<SentinelLayerType, double> previous,
    Map<SentinelLayerType, double> next,
  ) =>
      true;
}
