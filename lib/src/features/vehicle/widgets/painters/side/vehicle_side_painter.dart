import 'package:autosteering/src/features/common/common.dart';
import 'package:autosteering/src/features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:svg_path_parser/svg_path_parser.dart';
import 'package:xml/xml.dart';

part 'tractor_side_painter.dart';

/// A widget drawing of the side view of a vehicle.
class VehicleSidePainter extends StatefulWidget {
  /// A widget drawing of the side view of a vehicle.
  const VehicleSidePainter({
    required this.type,
    required this.colors,
    this.stretch = false,
    this.child,
    super.key,
  });

  /// The type of vehicle to draw.
  final String type;

  /// The manufacturer colors for the widget.vehicle.
  final ManufacturerColor colors;

  /// Whether the painting should be strecthed out from the original
  /// aspect ratio.
  final bool stretch;

  /// The child widget to paint over and get the size from.
  final Widget? child;

  @override
  State<VehicleSidePainter> createState() => _VehicleSidePainterState();
}

class _VehicleSidePainterState extends State<VehicleSidePainter> {
  double sourceWidth = 108;
  double sourceHeight = 76;

  ValueNotifier<Map<String, Path>> pathMap = ValueNotifier({});

  @override
  void initState() {
    super.initState();

    rootBundle
        .loadString(
      'assets/images/vehicle_types/side_view/tractor_side_view.svg',
    )
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
            ...['Antenna cupola', 'Antenna stand'],
            'Ladder',
            ...[
              'Exhaust tip hole stroke',
              'Exhaust tip cutout',
              'Exhaust tip hole',
              'Exhaust pipe',
            ],
            ...[
              'Door handle',
              'Roof',
              'Cab frame',
              'Cab glass',
              'Door inner bar',
              'Floor',
              'Steering wheel',
              'Steering wheel column',
              'Dashboard',
            ],
            ...[
              'Rear lug nuts',
              'Rear center hub',
              'Rear ribs',
              'Rear rim',
              'Rear tyre',
            ],
            'Rear fender painted',
            'Rear inner fender',
            'Fuel tank',
            ...[
              'Front lug nuts',
              'Front center hub',
              'Front ribs',
              'Front rim',
              'Front tyre',
            ],
            ...['Front fender plastic', 'Front fender support'],
            ...['Bonnet branding stripe', 'Bonnet vent', 'Bonnet painted'],
            'Frame',
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
          painter: _TractorSidePainter(
            colors: widget.colors,
            pathMap: value,
            sourceHeight: sourceHeight,
            sourceWidth: sourceWidth,
            stretch: widget.stretch,
          ),
          child: widget.child,
        ),
      );
}
