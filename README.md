# flutter

A new Flutter project.

## How "snap scroll" and "parallax" map to Flutter

There's no GSAP or scroll-snap CSS in Flutter, so this is rebuilt on
Flutter's own primitives, not translated line-by-line:

- **Snap scroll** → a vertical `PageView`. Each chapter is exactly one page,
  so swiping/wheel-scrolling always settles on a full scene, same as CSS
  `scroll-snap-type: y mandatory`.
- **Parallax** → the `PageController`'s fractional `page` value tells every
  scene how far it is from being "current" (-1 to 1). Glow blobs translate
  against that value, which lands at exactly the moments a CSS `ScrollTrigger`
  spanning `top bottom` → `bottom top` would fire, since one Flutter "page"
  transition covers the same scroll distance as one snapped section's
  entrance/exit.
- **Entrance reveal** → same `page` distance drives an opacity/translate
  fade-in per chapter, instead of `toggleActions: play none none reverse`.
- **Gold thread** → simplified. The web version draws it continuously across
  the entire document height as you scroll. Flutter's page-by-page model has
  no equivalent continuous scroll distance spanning multiple pages, so each
  scene paints its own fully-drawn thread segment — same look, just not a
  cross-page draw-in animation. Worth knowing if pixel-parity matters to you.
- **"Now playing" badge** is decorative/text-only here too — no audio file
  is bundled, since the actual track is copyrighted.

## Customizing

- Swap real photos: edit `imageSeed` in `lib/chapter_data.dart`, or replace
  the `Image.network` call in `lib/widgets/photo_card.dart` with
  `Image.asset(...)` and add the file under an `assets/` folder declared in
  `pubspec.yaml`.
- Rewrite the story: all six chapters live in `lib/chapter_data.dart`.
- Palette/type: `lib/theme.dart`.

## Heads up

This was written and reviewed for correctness but not compiled in this
environment (no Flutter SDK/pub.dev access here) — run `flutter pub get`
and `flutter analyze` first. If anything throws on first run, paste the
error back and I'll fix it.
