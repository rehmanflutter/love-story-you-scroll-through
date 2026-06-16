import 'dart:math';
import 'package:flutter/material.dart';
import '../theme.dart';

class EmberField extends StatefulWidget {
  final int count;
  const EmberField({super.key, this.count = 8});

  @override
  State<EmberField> createState() => _EmberFieldState();
}

class _EmberFieldState extends State<EmberField> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Ember> _embers = [];
  final _rand = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 14))..repeat();
    for (int i = 0; i < widget.count; i++) {
      _embers.add(
        _Ember(
          left: _rand.nextDouble(),
          delay: _rand.nextDouble(),
          drift: (_rand.nextDouble() * 60) - 30,
          size: 3 + _rand.nextDouble() * 3,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    if (reduceMotion) return const SizedBox.shrink();

    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return Stack(
                children: _embers.map((e) {
                  final t = (_controller.value + e.delay) % 1.0;
                  final top = constraints.maxHeight * (1 - t);
                  final opacity = sin(t * pi).clamp(0.0, 1.0);
                  return Positioned(
                    left: (constraints.maxWidth * e.left + e.drift * t).clamp(0.0, constraints.maxWidth),
                    top: top,
                    child: Opacity(
                      opacity: opacity * 0.7,
                      child: Container(
                        width: e.size,
                        height: e.size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.gold,
                          boxShadow: [
                            BoxShadow(color: AppColors.marigold.withOpacity(0.7), blurRadius: 6, spreadRadius: 1),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}

class _Ember {
  final double left;
  final double delay;
  final double drift;
  final double size;
  _Ember({required this.left, required this.delay, required this.drift, required this.size});
}
