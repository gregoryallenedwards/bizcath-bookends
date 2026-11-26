// Copyright the BizCath contributors.

enum NoteAuthor { toast, cocoa }

/// A note one character leaves for the other.
class Note {
  const Note({required this.date, required this.from, required this.text});

  final DateTime date;
  final NoteAuthor from;
  final String text;
}
