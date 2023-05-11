import 'package:dart_jts/dart_jts.dart' as jts;
import 'package:geobase/geobase.dart' as gb;
import 'package:latlong2/latlong.dart';

extension ProjectionExstention on LatLng {
  gb.Geographic get gbPosition => gb.Geographic(lon: longitude, lat: latitude);
  gb.Projected get gbProjected => gb.WGS84.webMercator.forward.project(
        gbPosition,
        to: gb.Projected.create,
      );

  jts.Coordinate get jtsCoordinate => jts.Coordinate(
        gbProjected.x.toDouble(),
        gbProjected.y.toDouble(),
      );
}

extension ProjectionExtension on jts.Coordinate {
  gb.Projected get gbProjected => gb.Projected(x: x, y: y);
  gb.Geographic get gbPosition => gb.WGS84.webMercator.inverse
      .project(gbProjected, to: gb.Geographic.create);

  LatLng get latLng => LatLng(gbPosition.lat, gbPosition.lon);
}
