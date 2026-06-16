import 'package:flutter/material.dart';
import '../theme.dart';

class PhotoCard extends StatelessWidget {
  final String imageSeed;
  final String tag;
  final bool tiltRight;
  final double width;

  const PhotoCard({
    super.key,
    required this.imageSeed,
    required this.tag,
    this.tiltRight = false,
    this.width = 280,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: tiltRight ? 0.05 : -0.05,
      child: SizedBox(
        width: width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.ivory,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 30, offset: const Offset(0, 18)),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 5,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(AppColors.maroon.withOpacity(0.22), BlendMode.multiply),
                      child: Image.network(
                        'https://picsum.photos/seed/$imageSeed/600/750',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return Container(color: AppColors.maroon.withOpacity(0.3));
                        },
                        errorBuilder: (context, error, stack) => Container(color: AppColors.maroon),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    tag,
                    textAlign: TextAlign.center,
                    style: AppText.display(size: 14, weight: FontWeight.w500, italic: true, color: AppColors.maroon),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
            Positioned(
              top: -7,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gold,
                    boxShadow: [BoxShadow(color: AppColors.gold.withOpacity(0.7), blurRadius: 8, spreadRadius: 2)],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
