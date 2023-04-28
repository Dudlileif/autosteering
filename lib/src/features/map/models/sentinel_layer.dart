import 'package:freezed_annotation/freezed_annotation.dart';

part 'sentinel_layer.freezed.dart';
part 'sentinel_layer.g.dart';

@freezed
class SentinelLayer with _$SentinelLayer {
  const factory SentinelLayer({
    /// The Coperincus dataspace instanceId api-key.
    /// Register a user at [https://dataspace.copernicus.eu/],
    /// go to [https://shapps.dataspace.copernicus.eu/dashboard/#/configurations]
    /// and create a new configuration, and copy the Id.
    required String instanceId,
    required SentinelLayerType layerType,
  }) = _SentinelLayer;
  const SentinelLayer._();

  factory SentinelLayer.fromJson(Map<String, Object?> json) =>
      _$SentinelLayerFromJson(json);

  String get name => layerType.name;

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
  trueColor('TRUE_COLOR'),
  agriculture('AGRICULTURE'),
  ndvi('VEGETATION_INDEX');

  const SentinelLayerType(this.id);

  final String id;

  String get name =>
      id.replaceAll('_', ' ').toLowerCase().replaceRange(0, 1, id[0]);

  String urlTemplate({
    required String instanceId,
    double maxCloudCoveragePercent = 20,
  }) =>
      'https://sh.dataspace.copernicus.eu/ogc/wmts/$instanceId?SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&format=image/png&layer=$id&MaxCC=${maxCloudCoveragePercent.toStringAsFixed(1)}&TileMatrixSet=PopularWebMercator256&tileMatrix={z}&tileRow={y}&tileCol={x}';
}
