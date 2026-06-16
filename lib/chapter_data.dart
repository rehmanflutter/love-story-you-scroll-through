class Chapter {
  final String hindiLabel;
  final String englishLabel;
  final String title;
  final String caption;
  final String photoTag;
  final String imageSeed;
  final bool photoOnRight;

  const Chapter({
    required this.hindiLabel,
    required this.englishLabel,
    required this.title,
    required this.caption,
    required this.photoTag,
    required this.imageSeed,
    required this.photoOnRight,
  });
}

const List<Chapter> chapters = [
  Chapter(
    hindiLabel: '✨ First Glance',
    englishLabel: 'chapter one',
    title: 'The First Glance',
    caption:
        'Across a room full of noise, two pairs of eyes found the only quiet spot in it.',
    photoTag: 'a glance held a second too long',
    imageSeed: 'ankaha1',
    photoOnRight: true,
  ),
  Chapter(
    hindiLabel: '✨ First Words',
    englishLabel: 'chapter two',
    title: 'The First Words',
    caption: 'Words finally caught up to what the eyes had already said.',
    photoTag: 'hello, said like it mattered',
    imageSeed: 'ankaha2',
    photoOnRight: false,
  ),
  Chapter(
    hindiLabel: '✨ The Heart\'s Whisper',
    englishLabel: 'chapter three',
    title: 'Falling, Quietly',
    caption:
        'No grand gestures. Just small days, quietly becoming a favourite habit.',
    photoTag: 'ordinary afternoons, underlined',
    imageSeed: 'ankaha3',
    photoOnRight: true,
  ),
  Chapter(
    hindiLabel: '✨ The Distance',
    englishLabel: 'chapter four',
    title: 'The Distance',
    caption:
        'Cities got between them before courage did. Some chapters are written from far away.',
    photoTag: 'a glance, kept on a screen',
    imageSeed: 'ankaha4',
    photoOnRight: false,
  ),
  Chapter(
    hindiLabel: '✨ The Way Back Home',
    englishLabel: 'chapter five',
    title: 'Finding the Way Back',
    caption:
        'Distance is just a draft. They rewrote it — one flight, one message, one decision at a time.',
    photoTag: 'the return, finally',
    imageSeed: 'ankaha5',
    photoOnRight: true,
  ),
  Chapter(
    hindiLabel: '✨ Forever, Unspoken',
    englishLabel: 'chapter six',
    title: 'Forever, Unspoken',
    caption: 'Some say it with their eyes. I said it by building this.',
    photoTag: 'the last word, never spoken aloud',
    imageSeed: 'ankaha6',
    photoOnRight: false,
  ),
];
