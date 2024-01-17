part of 'vehicle_side_painter.dart';

class _TractorSidePainter extends CustomPainter {
  _TractorSidePainter({
    required this.colors,
    required this.pathMap,
    this.sourceWidth = 108,
    this.sourceHeight = 76,
    this.stretch = false,
  });

  final Map<String, Path> pathMap;
  final ManufacturerColors colors;

  final double sourceWidth;
  final double sourceHeight;

  final bool stretch;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = findScale(size);

    if (stretch) {
      canvas.scale(scale.x, scale.y);
    } else {
      canvas.scale(scale.min, scale.min);
    }
    // Some compensation to fit into the top left corner.
    canvas.translate(-14.5, -18.5);

    drawFrame(canvas);
    drawBonnet(canvas);
    drawFrontFender(canvas, Colors.grey.shade900);
    drawFrontWheel(canvas);
    drawFuelTank(canvas, Colors.grey.shade900);
    drawRearFender(canvas);
    drawRearWheel(canvas);
    drawCab(canvas);
    drawExhaust(canvas);
    drawLadder(canvas, Colors.grey.shade800);
    drawAntenna(canvas, Colors.white);
  }

  ({double x, double y, double min}) findScale(Size size) {
    final scaleX = size.width / sourceWidth;
    final scaleY = size.height / sourceHeight;

    return (x: scaleX, y: scaleY, min: scaleX < scaleY ? scaleX : scaleY);
  }

  void drawPathFromMap(
    String key,
    Canvas canvas,
    Color color, {
    bool withStroke = true,
    double strokeWidth = 0.5,
  }) {
    final path = pathMap[key] ?? Path();

    canvas.drawPath(
      path,
      Paint()..color = color,
    );
    if (withStroke) {
      canvas.drawPath(
        path,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth,
      );
    }
  }

  void drawFrame(Canvas canvas) {
    drawPathFromMap('Frame', canvas, colors.frame ?? Colors.grey.shade800);
  }

  void drawBonnet(Canvas canvas) {
    drawPathFromMap('Bonnet painted', canvas, colors.primary);
    drawPathFromMap('Bonnet vent', canvas, Colors.grey.shade900);
    drawPathFromMap('Bonnet branding stripe', canvas, colors.secondary);
  }

  void drawFrontFender(Canvas canvas, Color color) {
    drawPathFromMap('Front fender support', canvas, Colors.grey.shade800);
    drawPathFromMap('Front fender plastic', canvas, color);
  }

  void drawFrontWheel(Canvas canvas) {
    drawPathFromMap('Front tyre', canvas, Colors.grey.shade900);
    drawPathFromMap('Front rim', canvas, colors.rims ?? colors.secondary);
    drawPathFromMap('Front ribs', canvas, Colors.grey.shade700);
    drawPathFromMap('Front center hub', canvas, Colors.grey.shade800);
    drawPathFromMap('Front lug nuts', canvas, Colors.grey.shade900);
  }

  void drawFuelTank(Canvas canvas, Color color) {
    drawPathFromMap('Fuel tank', canvas, Colors.grey.shade900);
  }

  void drawRearFender(Canvas canvas) {
    drawPathFromMap('Rear inner fender', canvas, Colors.grey.shade800);
    drawPathFromMap('Rear fender painted', canvas, colors.primary);
  }

  void drawRearWheel(Canvas canvas) {
    drawPathFromMap('Rear tyre', canvas, Colors.grey.shade900);
    drawPathFromMap('Rear rim', canvas, colors.rims ?? colors.secondary);
    drawPathFromMap('Rear ribs', canvas, Colors.grey.shade700);
    drawPathFromMap('Rear center hub', canvas, Colors.grey.shade800);
    drawPathFromMap('Rear lug nuts', canvas, Colors.grey.shade900);
  }

  void drawCab(Canvas canvas) {
    drawPathFromMap('Dashboard', canvas, Colors.brown.shade600);
    drawPathFromMap('Steering wheel column', canvas, Colors.brown.shade600);
    drawPathFromMap('Steering wheel', canvas, Colors.grey.shade800);
    drawPathFromMap('Floor', canvas, Colors.grey.shade800);
    drawPathFromMap('Door inner bar', canvas, Colors.grey.shade900);
    drawPathFromMap(
      'Cab glass',
      canvas,
      Colors.lightBlue.shade200.withOpacity(0.2),
    );
    drawPathFromMap('Door handle', canvas, Colors.grey.shade800);
    drawPathFromMap('Cab frame', canvas, colors.cabFrame ?? Colors.grey);
    drawPathFromMap('Roof', canvas, colors.roof ?? Colors.grey);
  }

  void drawExhaust(Canvas canvas) {
    drawPathFromMap('Exhaust pipe', canvas, Colors.grey.shade900);
    drawPathFromMap(
      'Exhaust tip hole',
      canvas,
      Colors.grey.shade600,
      withStroke: false,
    );
    drawPathFromMap('Exhaust tip cutout', canvas, Colors.grey.shade900);
    drawPathFromMap('Exhaust tip hole stroke', canvas, Colors.grey.shade900);
  }

  void drawLadder(Canvas canvas, Color color) {
    drawPathFromMap('Ladder', canvas, color);
  }

  void drawAntenna(Canvas canvas, Color color) {
    drawPathFromMap('Antenna stand', canvas, Colors.grey.shade900);
    drawPathFromMap('Antenna cupola', canvas, color);
  }

  @override
  bool shouldRepaint(_TractorSidePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_TractorSidePainter oldDelegate) => false;
}
