import 'package:flutter/material.dart';
import '../theme.dart';

/// Two almond eye shapes. [separation] = 1 means fully apart (cover),
/// 0 means fully merged into one (outro) — the story's visual bookend.
class EyesPainter extends CustomPainter {
  final double separation;
  const EyesPainter({this.separation = 1.0});

  @override
  void paint(Canvas canvas, Size size) {
    final strokePaint = Paint()
      ..color = AppColors.gold.withOpacity(0.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    final cy = size.height / 2;
    final rx = size.width * 0.22;
    final ry = size.height * 0.28;
    final gap = size.width * 0.18 * separation;
    final cxLeft = size.width / 2 - gap / 2 - rx * 0.4;
    final cxRight = size.width / 2 + gap / 2 + rx * 0.4;

    final showTwo = separation > 0.05;

    canvas.drawOval(
      Rect.fromCenter(center: Offset(showTwo ? cxLeft : size.width / 2, cy), width: rx * 2, height: ry * 2),
      strokePaint,
    );
    if (showTwo) {
      canvas.drawOval(
        Rect.fromCenter(center: Offset(cxRight, cy), width: rx * 2, height: ry * 2),
        strokePaint,
      );
    }

    final pupilPaint = Paint()
      ..color = AppColors.marigold
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    canvas.drawCircle(Offset(size.width / 2, cy), 9 + (1 - separation) * 3, pupilPaint);
  }

  @override
  bool shouldRepaint(covariant EyesPainter oldDelegate) => oldDelegate.separation != separation;
}
