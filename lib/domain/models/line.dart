// Copyright the BizCath contributors.

enum LineSource { toast, found, own }

class Line {
  const Line({
    required this.id,
    required this.text,
    required this.source,
    required this.createdAt,
    this.author,
    this.work,
    this.year,
    this.checkedSource,
    this.favourite = false,
  });

  final String id;
  final String text;
  final LineSource source;
  final String? author;
  final String? work;
  final String? year;

  /// Where a found quote was checked.
  final String? checkedSource;
  final bool favourite;
  final DateTime createdAt;

  /// Shown under the line. A found quote reads "Author, Work, Year".
  String get attribution => switch (source) {
    LineSource.toast => 'From Toast',
    LineSource.own => 'Your own line',
    LineSource.found => '$author, $work, $year',
  };

  String get shareText => '$text\n— $attribution';

  Line withFavourite(bool value) => Line(
    id: id,
    text: text,
    source: source,
    author: author,
    work: work,
    year: year,
    checkedSource: checkedSource,
    favourite: value,
    createdAt: createdAt,
  );
}
