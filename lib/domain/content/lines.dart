// Copyright the BizCath contributors.
//
// Section 9.3 of the spec.
import '../models/line.dart';

const _toastLines = [
  'Here is a fine place to start.',
  'Small steps still count.',
  "Today doesn't have to be perfect to be good.",
  "You've done hard days before.",
  'One thing at a time.',
  'Kindness counts, especially to yourself.',
  'The day is still wide open.',
  'Slow is still moving.',
  "You're allowed to take up space.",
  'Good things can be small.',
  'Rest is part of the work.',
  'Notice one nice thing today.',
  "You don't have to carry it all at once.",
  'Let today be simple.',
  'Breathe first, then decide.',
  'You can start again at lunch.',
  "It's fine to ask for help.",
  'Finished is good enough today.',
  'Today, just show up.',
  'Something good is on its way.',
];

final List<Line> placeholderLines = [
  for (var i = 0; i < _toastLines.length; i++)
    Line(
      id: 'toast-${i + 1}',
      text: _toastLines[i],
      source: LineSource.toast,
      createdAt: DateTime(2026, 11, 26),
    ),
  Line(
    id: 'found-1',
    text: '[found quote placeholder — to be sourced and checked]',
    source: LineSource.found,
    author: 'Author',
    work: 'Work',
    year: 'Year',
    createdAt: DateTime(2026, 11, 26),
  ),
];
