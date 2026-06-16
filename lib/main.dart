import 'package:flutter/material.dart';
import 'theme.dart';
import 'chapter_data.dart';
import 'widgets/dots_nav.dart';
import 'widgets/now_playing_badge.dart';
import 'scenes/cover_scene.dart';
import 'scenes/chapter_scene.dart';
import 'scenes/outro_scene.dart';

void main() {
  runApp(const AnkahaApp());
}

class AnkahaApp extends StatelessWidget {
  const AnkahaApp({super.key});
  // rehmanflutter
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ankaha — a love story you scroll through',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: AppColors.ink),
      home: const LoveStoryPage(),
    );
  }
}

class LoveStoryPage extends StatefulWidget {
  const LoveStoryPage({super.key});

  @override
  State<LoveStoryPage> createState() => _LoveStoryPageState();
}

class _LoveStoryPageState extends State<LoveStoryPage> {
  late final PageController _controller;
  double _page = 0;
  late final int _pageCount;

  @override
  void initState() {
    super.initState();
    _pageCount = chapters.length + 2; // cover + 6 chapters + outro
    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        _page = _controller.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // How far this page is from the current scroll position, -1..1.
  // Mirrors the web version's ScrollTrigger range (top bottom -> bottom top),
  // since each "page" here occupies exactly one viewport just like a snapped section.
  double _parallaxFor(int index) => (_page - index).clamp(-1.0, 1.0);

  // Fades/slides content in as its page becomes current, reverses as it leaves.
  double _revealFor(int index) {
    final distance = (_page - index).abs();
    return (1 - (distance * 2.2)).clamp(0.0, 1.0);
  }

  void _goTo(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ink,
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            itemCount: _pageCount,
            itemBuilder: (context, index) {
              final parallax = _parallaxFor(index);
              final reveal = _revealFor(index);

              if (index == 0) {
                return CoverScene(parallax: parallax);
              }
              if (index == _pageCount - 1) {
                return OutroScene(parallax: parallax, onReplay: () => _goTo(0));
              }
              return ChapterScene(
                chapter: chapters[index - 1],
                parallax: parallax,
                reveal: reveal,
              );
            },
          ),
          const NowPlayingBadge(),
          DotsNav(count: _pageCount, currentPage: _page, onTap: _goTo),
        ],
      ),
    );
  }
}
