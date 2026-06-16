import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/eyes_painter.dart';
import 'scene_background.dart';

class OutroScene extends StatelessWidget {
  final double parallax;
  final VoidCallback onReplay;

  const OutroScene({super.key, this.parallax = 0, required this.onReplay});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SceneBackground(glowAlignment: Alignment.center, parallax: parallax),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: width > 760 ? 280 : width * 0.7,
                  height: 90,
                  child: CustomPaint(painter: const EyesPainter(separation: 0.0)),
                ),
                const SizedBox(height: 24),
                Text(
                  'Likhi, par ankahi.',
                  textAlign: TextAlign.center,
                  style: AppText.display(size: clampSize(width, min: 30, max: 48), italic: true, weight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text('Written, yet unspoken.', style: AppText.body(size: 16, color: AppColors.ivory.withOpacity(0.8))),
                const SizedBox(height: 32),
                Text(
                  'A scroll story crafted in Flutter-grade detail\n'
                  'Native parallax · snap-scroll · zero noise\n'
                  'Built by DevSport — Flutter & creative web development',
                  textAlign: TextAlign.center,
                  style: AppText.label(size: 11),
                ),
                const SizedBox(height: 28),
                OutlinedButton(
                  onPressed: onReplay,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.gold),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  ),
                  child: Text('↺  WATCH IT AGAIN', style: AppText.label(size: 11, color: AppColors.gold)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
