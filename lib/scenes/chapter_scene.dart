import 'package:flutter/material.dart';
import '../theme.dart';
import '../chapter_data.dart';
import '../widgets/photo_card.dart';
import 'scene_background.dart';

class ChapterScene extends StatelessWidget {
  final Chapter chapter;
  final double parallax; // -1..1
  final double reveal; // 0..1 entrance progress

  const ChapterScene({
    super.key,
    required this.chapter,
    this.parallax = 0,
    this.reveal = 1,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 760;
        final titleSize = clampSize(constraints.maxWidth, min: 30, max: 56);

        final textBlock = Padding(
          padding: EdgeInsets.symmetric(horizontal: isWide ? 0 : 16),
          child: Column(
            crossAxisAlignment: isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                chapter.hindiLabel,
                textAlign: isWide ? TextAlign.left : TextAlign.center,
                style: AppText.display(size: 28, italic: true, weight: FontWeight.w500, color: AppColors.gold),
              ),
              const SizedBox(height: 4),
              Text(chapter.englishLabel.toUpperCase(), style: AppText.label(size: 10)),
              const SizedBox(height: 16),
              Text(
                chapter.title,
                textAlign: isWide ? TextAlign.left : TextAlign.center,
                style: AppText.display(size: titleSize, weight: FontWeight.w600),
              ),
              const SizedBox(height: 22),
              Container(width: 64, height: 1, color: AppColors.gold.withOpacity(0.6)),
              const SizedBox(height: 22),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 360),
                child: Text(
                  chapter.caption,
                  textAlign: isWide ? TextAlign.left : TextAlign.center,
                  style: AppText.body(size: 16),
                ),
              ),
            ],
          ),
        );

        final photo = Center(
          child: PhotoCard(
            imageSeed: chapter.imageSeed,
            tag: chapter.photoTag,
            tiltRight: chapter.photoOnRight,
            width: isWide ? 280 : constraints.maxWidth * 0.62,
          ),
        );

        final content = isWide
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: chapter.photoOnRight
                    ? [Expanded(child: textBlock), const SizedBox(width: 64), photo]
                    : [photo, const SizedBox(width: 64), Expanded(child: textBlock)],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [photo, const SizedBox(height: 32), textBlock],
              );

        return Stack(
          children: [
            SceneBackground(
              glowAlignment: chapter.photoOnRight ? const Alignment(-0.5, 0.4) : const Alignment(0.6, -0.4),
              parallax: parallax,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isWide ? 48 : 24, vertical: 32),
                child: Opacity(
                  opacity: reveal,
                  child: Transform.translate(
                    offset: Offset(0, (1 - reveal) * 24),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1100),
                      child: content,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
