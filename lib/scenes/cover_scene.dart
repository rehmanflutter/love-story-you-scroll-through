import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/eyes_painter.dart';
import 'scene_background.dart';

class CoverScene extends StatelessWidget {
  final double parallax;
  const CoverScene({super.key, this.parallax = 0});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final titleSize = clampSize(width, min: 48, max: 104, basis: 1100);

    return Stack(
      children: [
        SceneBackground(glowAlignment: const Alignment(0.4, -0.6), parallax: parallax),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: width > 760 ? 380 : width * 0.8,
                  height: 110,
                  child: CustomPaint(painter: const EyesPainter(separation: 1.0)),
                ),
                const SizedBox(height: 24),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [AppColors.ivory, AppColors.gold, AppColors.marigold],
                  ).createShader(bounds),
                  child: Text(
                    'Ankaha',
                    style: AppText.display(size: titleSize, italic: true, weight: FontWeight.w600, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 14),
                Text('a love story, told one scroll at a time', style: AppText.body(size: 16, color: AppColors.rose)),
                const SizedBox(height: 48),
                Text('SCROLL TO BEGIN ↓', style: AppText.label(size: 11, color: AppColors.ivory.withOpacity(0.55))),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
