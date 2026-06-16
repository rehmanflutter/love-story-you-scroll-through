import 'package:flutter/material.dart';
import '../theme.dart';

class NowPlayingBadge extends StatefulWidget {
  const NowPlayingBadge({super.key});

  @override
  State<NowPlayingBadge> createState() => _NowPlayingBadgeState();
}

class _NowPlayingBadgeState extends State<NowPlayingBadge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 54,
      left: 24,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
        decoration: BoxDecoration(
          color: AppColors.ink.withOpacity(0.4),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.gold.withOpacity(0.25)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ScaleTransition(
              scale: Tween(begin: 0.8, end: 1.15).animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
              ),
              child: Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.marigold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text.rich(
              TextSpan(
                style: AppText.display(
                  size: 13,
                  weight: FontWeight.w500,
                  italic: true,
                  color: AppColors.ivory.withOpacity(0.75),
                ),
                children: const [
                  TextSpan(text: 'the mood: '),
                  TextSpan(text: 'Aankhon Se Batana'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
