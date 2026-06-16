import 'package:flutter/material.dart';
import '../theme.dart';

/// Decorative wavy gold line, the recurring "thread" motif.
/// Note: in the web version this draws progressively across the entire
/// page's scroll height. In Flutter's page-by-page model there's no
/// equivalent continuous scroll distance, so each scene renders its own
/// fully-drawn segment — visually consistent, just not cross-page animated.
class GoldThread extends StatelessWidget {
  const GoldThread({super.key});

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: CustomPaint(size: Size.infinite, painter: _ThreadPainter()),
    );
  }
}

class _ThreadPainter extends CustomPainter {
  const _ThreadPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.gold.withOpacity(0.45)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4;

    final w = size.width;
    final h = size.height;
    final path = Path()
      ..moveTo(w * 0.5, 0)
      ..cubicTo(w * 0.1, h * 0.18, w * 0.9, h * 0.32, w * 0.5, h * 0.5)
      ..cubicTo(w * 0.1, h * 0.68, w * 0.9, h * 0.82, w * 0.5, h);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _ThreadPainter oldDelegate) => false;
}
