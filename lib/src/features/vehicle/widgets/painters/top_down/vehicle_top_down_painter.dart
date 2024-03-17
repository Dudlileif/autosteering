import 'dart:async';
import 'dart:ui' as ui;

import 'package:autosteering/src/features/theme/theme.dart';
import 'package:autosteering/src/features/vehicle/vehicle.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    this.size = Size.zero,
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

  /// The size that this widget should aim for.
  final Size size;

  /// The child widget to paint over and get the size from.
  final Widget? child;

  @override
  State<VehicleTopDownPainter> createState() => _VehiclePainterState();
}

class _VehiclePainterState extends State<VehicleTopDownPainter> {
  _VehiclePainterState();

  final ValueNotifier<ui.Picture?> svgPicture = ValueNotifier(null);

  double sourceWidth = 60;
  double sourceHeight = 108;

  late ManufacturerColors _oldColors = widget.colors;

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

      unawaited(
        vg
            .loadPicture(
              SvgAssetLoader(
                'assets/images/vehicle_types/top_view/tractor_top_view.svg',
                colorMapper: _VehicleTopColorMapper(widget.colors),
              ),
              context,
            )
            .then((value) => svgPicture.value = value.picture),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_oldColors != widget.colors) {
      _oldColors = widget.colors;
      unawaited(
        vg
            .loadPicture(
              SvgAssetLoader(
                'assets/images/vehicle_types/top_view/tractor_top_view.svg',
                colorMapper: _VehicleTopColorMapper(widget.colors),
              ),
              context,
            )
            .then((value) => svgPicture.value = value.picture),
      );
    }

    return ValueListenableBuilder(
      valueListenable: svgPicture,
      builder: (context, value, child) => svgPicture.value != null
          ? CustomPaint(
              painter: switch (widget.type) {
                'Tractor' => _TractorTopDownPainter(
                    svgPicture: svgPicture.value!,
                    sourceWidth: sourceWidth,
                    sourceHeight: sourceHeight,
                    colors: widget.colors,
                    stretch: widget.stretch,
                    steeringAxleOffset: widget.steeringAxleOffset,
                    steeringAxleWidth: widget.steeringAxleWidth,
                  ),
                _ => null
              },
              size: widget.size,
              child: widget.child,
            )
          : const SizedBox.shrink(),
    );
  }
}

class _VehicleTopColorMapper extends ColorMapper {
  const _VehicleTopColorMapper(this.manufacturerColors);
  final ManufacturerColors manufacturerColors;

  @override
  Color substitute(
    String? id,
    String elementName,
    String attributeName,
    Color color,
  ) {
    if (id != null) {
      if (id.contains('Color gradient bonnet paint')) {
        if (id.contains('start')) {
          return manufacturerColors.primary.darken(5);
        } else if (id.contains('end')) {
          return manufacturerColors.primary;
        }
      } else if (id.contains('Color gradient fender paint')) {
        if (id.contains('start')) {
          return manufacturerColors.primary.darken();
        } else if (id.contains('center')) {
          return manufacturerColors.primary;
        } else if (id.contains('end')) {
          return manufacturerColors.primary.darken();
        }
      } else if (id.contains('Color gradient roof paint ')) {
        if (id.contains('start')) {
          return manufacturerColors.roof?.darken() ?? color;
        } else if (id.contains('center')) {
          return manufacturerColors.roof ?? color;
        } else if (id.contains('end')) {
          return manufacturerColors.roof?.darken() ?? color;
        }
      } else if (id.contains('Bonnet vents') && attributeName == 'fill') {
        return manufacturerColors.primary.darken();
      } else if (id.contains('Front frame') && attributeName == 'fill') {
        return manufacturerColors.frame ?? color;
      }
    }
    return color;
  }
}
