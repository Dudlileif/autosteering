part of 'vehicle_top_down_painter.dart';

class _TractorTopDownPainter extends CustomPainter {
  _TractorTopDownPainter({
    required this.pathMap,
    required this.colors,
    this.sourceWidth = 60,
    this.sourceHeight = 108,
    this.stretch = false,
    this.steeringAxleOffset,
    this.steeringAxleWidth,
  });

  final ManufacturerColor colors;

  final bool stretch;

  final double? steeringAxleOffset;
  final double? steeringAxleWidth;

  final Map<String, Path> pathMap;

  final double sourceWidth;
  final double sourceHeight;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = findScale(size);

    if (stretch) {
      canvas.scale(scale.x, scale.y);
    } else {
      canvas.scale(scale.min);
    }

    drawFrontFrame(canvas);
    drawSteeringAxle(canvas);
    drawFuelTank(canvas, Colors.grey.shade900);
    drawLadder(canvas, Colors.grey.shade600);
    drawBonnet(canvas);
    drawInnerFender(canvas, Colors.grey.shade800);
    drawPaintedFender(canvas);
    drawRoof(canvas);
  }

  ({double x, double y, double min}) findScale(Size size) {
    final scaleX = size.width / sourceWidth;
    final scaleY = size.height / sourceHeight;

    return (x: scaleX, y: scaleY, min: scaleX < scaleY ? scaleX : scaleY);
  }

  void drawSteeringAxle(
    Canvas canvas, {
    bool withStroke = true,
  }) {
    final rect = Rect.fromCenter(
      center:
          Offset(sourceWidth / 2, (steeringAxleOffset ?? 0.15) * sourceHeight),
      width: (steeringAxleWidth ?? 0.7) * sourceWidth,
      height: 6,
    );
    canvas.drawRect(
      rect,
      Paint()..color = colors.frame ?? Colors.grey.shade800,
    );
    if (withStroke) {
      canvas.drawRect(
        rect,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.stroke,
      );
    }
  }

  void drawPathFromMap(
    String key,
    Canvas canvas,
    Color color, {
    bool withStroke = true,
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
          ..style = PaintingStyle.stroke,
      );
    }
  }

  void drawFrontFrame(
    Canvas canvas,
  ) {
    drawPathFromMap(
      'Front frame',
      canvas,
      colors.frame ?? Colors.grey.shade800,
    );
  }

  void drawFuelTank(Canvas canvas, Color color) {
    drawPathFromMap('Fuel tank', canvas, color);
  }

  void drawLadder(Canvas canvas, Color color) {
    drawPathFromMap('Step', canvas, color);
    drawPathFromMap('Grooves', canvas, color);
  }

  void drawBonnet(Canvas canvas) {
    drawPathFromMap('Bonnet', canvas, colors.primary);
    drawPathFromMap('Bonnet vents', canvas, colors.primary.darken());
    drawPathFromMap('Bonnet center diamond', canvas, Colors.grey);
  }

  void drawInnerFender(Canvas canvas, Color color) {
    drawPathFromMap('Inner fender', canvas, color);
  }

  void drawPaintedFender(Canvas canvas) {
    drawPathFromMap('Painted fender', canvas, colors.primary);
  }

  void drawRoof(
    Canvas canvas,
  ) {
    drawPathFromMap('Roof', canvas, colors.roof ?? Colors.grey);
  }

  @override
  bool shouldRepaint(_TractorTopDownPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_TractorTopDownPainter oldDelegate) => false;
}
