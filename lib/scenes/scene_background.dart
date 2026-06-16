import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/ember_field.dart';
import '../widgets/gold_thread.dart';

class SceneBackground extends StatelessWidget {
  final Alignment glowAlignment;
  final double parallax; // -1..1, distance from this page in the PageView

  const SceneBackground({
    super.key,
    this.glowAlignment = Alignment.topRight,
    this.parallax = 0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(-0.6, -0.6),
                    radius: 1.1,
                    colors: [AppColors.maroon, AppColors.ink],
                    stops: const [0, 0.55],
                  ),
                ),
              ),
            ),
            Align(
              alignment: glowAlignment,
              child: Transform.translate(
                offset: Offset(0, parallax * 50),
                child: Container(
                  width: constraints.maxWidth * 0.46,
                  height: constraints.maxWidth * 0.46,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(colors: [AppColors.marigold.withOpacity(0.35), Colors.transparent]),
                  ),
                ),
              ),
            ),
            const Positioned.fill(child: EmberField()),
            Positioned(
              left: constraints.maxWidth * 0.07,
              top: 0,
              bottom: 0,
              width: 40,
              child: const GoldThread(),
            ),
          ],
        );
      },
    );
  }
}
