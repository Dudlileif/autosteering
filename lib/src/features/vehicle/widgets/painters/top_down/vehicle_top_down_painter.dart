import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geobase/geobase.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:xml/xml.dart';

part 'tractor_top_down_painter.dart';

/// A dynamic vehicle painter for drawing a [Vehicle] in the correct position
/// and rotation on the [FlutterMap].
class VehicleTopDownPainter extends StatefulWidget {
  /// A dynamic vehicle painter for drawing a [Vehicle] in the correct position
  /// and rotation on the [FlutterMap].
  const VehicleTopDownPainter({
    required this.type,
    required this.colors,
    this.stretch = false,
    this.steeringAxleOffset,
    this.steeringAxleWidth,
    this.child,
    super.key,
  });

  /// The type of vehicle.
  final String type;

  /// The manufacturer colors for the vehicle.
  final ManufacturerColors colors;

  /// Whether the painting should be strecthed out from the original
  /// aspect ratio.
  final bool stretch;

  /// The offset from the front of the vehicle length to the steering axle.
  final double? steeringAxleOffset;

  /// The fractional width of the steering axle versus the vehicle width.
  final double? steeringAxleWidth;

  /// The child widget to paint over and get the size from.
  final Widget? child;

  @override
  State<VehicleTopDownPainter> createState() => _VehiclePainterState();
}

class _VehiclePainterState extends State<VehicleTopDownPainter> {
  _VehiclePainterState();

  final ValueNotifier<Map<String, Path>> pathMap = ValueNotifier({});

  double sourceWidth = 60;
  double sourceHeight = 108;

  @override
  void initState() {
    super.initState();

    rootBundle
        .loadString('assets/images/vehicle_types/top_view/tractor_top_view.svg')
        .then((value) async {
      final svg = XmlDocument.parse(value);

      sourceWidth = double.tryParse(
            svg.rootElement.getAttribute('width')?.split('mm').first ?? '',
          ) ??
          sourceWidth;
      sourceHeight = double.tryParse(
            svg.rootElement.getAttribute('height')?.split('mm').first ?? '',
          ) ??
          sourceHeight;

      final labels = switch (widget.type) {
        'Tractor' => [
            'Bonnet',
            'Bonnet center diamond',
            'Bonnet vents',
            'Front frame',
            'Fuel tank',
            'Grooves',
            'Inner fender',
            'Painted fender',
            'Roof',
            'Step',
          ],
        _ => <String>[],
      };

      for (final label in labels) {
        final element = XmlElementFinder.recursive(
          'inkscape:label',
          label,
          svg.rootElement,
        );
        final string = element?.getAttribute('d');
        if (string != null) {
          pathMap.value = pathMap.value
            ..update(
              label,
              (value) => parseSvgPath(string),
              ifAbsent: () => parseSvgPath(string),
            );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: pathMap,
        builder: (context, value, child) => CustomPaint(
          painter: switch (widget.type) {
            'Tractor' => _TractorTopDownPainter(
                pathMap: value,
                sourceWidth: sourceWidth,
                sourceHeight: sourceHeight,
                colors: widget.colors,
                stretch: widget.stretch,
                steeringAxleOffset: widget.steeringAxleOffset,
                steeringAxleWidth: widget.steeringAxleWidth,
              ),
            _ => null
          },
          child: widget.child,
        ),
      );
}

/// A dynamic vehicle painter for drawing a top-down view of a [Vehicle] in
/// the correct position and rotation on the [FlutterMap].
///
/// The method of rotating if copied from [RotatedOverlayImage] from
/// [FlutterMap], except that [MapCamera.latLngToScreenPoint] is used to get
/// the bounds points.
class MapVehicleTopDownPainter extends StatelessWidget {
  /// A dynamic vehicle painter for drawing a top-down view of a [Vehicle] in
  /// the correct position and rotation on the [FlutterMap].
  const MapVehicleTopDownPainter({
    required this.vehicle,
    super.key,
  });

  /// The vehicle to draw.
  final Vehicle vehicle;



  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);

    if (vehicle is ArticulatedTractor) {
      return const SizedBox.shrink();
    }

    final points = (vehicle as AxleSteeredVehicle).points;

    final pxTopLeft = camera.latLngToScreenPoint(points.first.latLng);
    final pxTopRight = camera.latLngToScreenPoint(points[1].latLng);
    final pxBottomRight = camera.latLngToScreenPoint(points[2].latLng);
    final pxBottomLeft = camera.latLngToScreenPoint(points[3].latLng);

    /// update/enlarge bounds so the new corner points fit within
    final bounds = Bounds<double>(pxTopLeft, pxBottomRight)
        .extend(pxTopRight)
        .extend(pxBottomLeft);

    final vectorX = (pxTopRight - pxTopLeft) / bounds.size.x;
    final vectorY = (pxBottomLeft - pxTopLeft) / bounds.size.y;
    final offset = pxTopLeft.subtract(bounds.topLeft);

    final a = vectorX.x;
    final b = vectorX.y;
    final c = vectorY.x;
    final d = vectorY.y;
    final tx = offset.x;
    final ty = offset.y;

    final axleLeftPosition = (vehicle as AxleSteeredVehicle)
        .steeringAxlePosition
        .rhumb
        .destinationPoint(
          distance: vehicle.width / 2,
          bearing: vehicle.bearing - 90,
        );
    final steeringAxleOffset =
        axleLeftPosition.rhumb.distanceTo(points.first) / vehicle.length;
    final steeringAxleWidth = vehicle.trackWidth / vehicle.width;

    return Positioned(
      left: bounds.topLeft.x,
      top: bounds.topLeft.y,
      width: bounds.size.x,
      height: bounds.size.y,
      child: Transform(
        transform: Matrix4(a, b, 0, 0, c, d, 0, 0, 0, 0, 1, 0, tx, ty, 0, 1),
        filterQuality: FilterQuality.low,
        child: VehicleTopDownPainter(
          type: switch (vehicle.runtimeType) {
            Tractor => 'Tractor',
            Harvester => 'Harvester',
            ArticulatedTractor => 'ArticulatedTractor',
            _ => 'Tractor',
          },
          colors: vehicle.manufacturerColors,
          stretch: true,
          steeringAxleOffset: steeringAxleOffset,
          steeringAxleWidth: steeringAxleWidth,
        ),
      ),
    );
  }
}
