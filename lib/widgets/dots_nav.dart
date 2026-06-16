import 'package:flutter/material.dart';
import '../theme.dart';

class DotsNav extends StatelessWidget {
  final int count;
  final double currentPage;
  final void Function(int) onTap;

  const DotsNav({
    super.key,
    required this.count,
    required this.currentPage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 18,
      top: 0,
      bottom: 0,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(count, (i) {
            final active = currentPage.round() == i;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Tooltip(
                message: 'Go to section ${i + 1}',
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => onTap(i),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: active ? AppColors.gold : Colors.transparent,
                          border: Border.all(
                            color: active
                                ? AppColors.gold
                                : AppColors.ivory.withOpacity(0.4),
                          ),
                          boxShadow: active
                              ? [
                                  BoxShadow(
                                    color: AppColors.gold.withOpacity(0.6),
                                    blurRadius: 6,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : [],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
