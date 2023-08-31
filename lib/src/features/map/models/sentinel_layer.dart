import 'package:agopengps_flutter/src/features/map/map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentinel_layer.freezed.dart';
part 'sentinel_layer.g.dart';

/// A class that stores information for a Copernicus Sentinel-2 map layer.
@freezed
class SentinelLayer with _$SentinelLayer {
  /// A class that stores information for a Copernicus Sentinel-2 map layer.
  ///
  /// Enter a Coperincus dataspace [instanceId] api-key.
  /// Register a user at [https://dataspace.copernicus.eu/],
  /// go to [https://shapps.dataspace.copernicus.eu/dashboard/#/configurations]
  /// and create a new configuration, and copy the Id.
  ///
  /// The [layerType] is which layer type this layer represents.
  const factory SentinelLayer({
    /// The Coperincus dataspace instanceId api-key.
    /// Register a user at [https://dataspace.copernicus.eu/],
    /// go to [https://shapps.dataspace.copernicus.eu/dashboard/#/configurations]
    /// and create a new configuration, and copy the Id.
    required String instanceId,

    /// Which layer type this layer should contain info about.
    required SentinelLayerType layerType,
  }) = _SentinelLayer;
  const SentinelLayer._();

  /// Creates a [SentinelLayer] from a [json] object.
  factory SentinelLayer.fromJson(Map<String, Object?> json) =>
      _$SentinelLayerFromJson(json);

  /// The name of the layer type.
  String get name => layerType.name;

  /// A layer data object to simplify the caching process.
  TileLayerData get layerData =>
      TileLayerData(name: name, folderName: 'Sentinel');

  /// The url template for getting map tiles for this layer.
  String urlTemplate(double maxCloudCoveragePercent) => layerType.urlTemplate(
        instanceId: instanceId,
        maxCloudCoveragePercent: maxCloudCoveragePercent,
      );
}

/// An enumeration class for useful Copernicus Sentinel-2 layers.
///
/// These layers can be used to get up-to-date (1-2 times a week) views
/// of the world. The resolution is quite low though, ~20 m / pixel.
enum SentinelLayerType {
  /// Normal orthographic satellite imagery.
  trueColor('TRUE_COLOR'),

  /// Special combination of bands that is useful for agricultural use.
  agriculture('AGRICULTURE'),

  /// An index that shows how much vegetation there is.
  ndvi('VEGETATION_INDEX');

  const SentinelLayerType(this.id);

  /// The Copernicus Dataspace id for the layer.
  final String id;

  /// A friendlier name that only has the first letter capitalized.
  String get name =>
      id.replaceAll('_', ' ').toLowerCase().replaceRange(0, 1, id[0]);

  /// The url template for getting map tiles for this layer.
  String urlTemplate({
    required String instanceId,
    double maxCloudCoveragePercent = 20,
  }) =>
      'https://sh.dataspace.copernicus.eu/ogc/wmts/$instanceId?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&format=image/png&layer=$id&MaxCC=${maxCloudCoveragePercent.toStringAsFixed(1)}&TileMatrixSet=PopularWebMercator256&tileMatrix={z}&tileRow={y}&tileCol={x}';
}
