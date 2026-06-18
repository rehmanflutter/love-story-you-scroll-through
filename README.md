https://love-story-you-scroll-through.vercel.app/

# flutter

A new Flutter project.


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
