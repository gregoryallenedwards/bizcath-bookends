// Copyright the BizCath contributors.
//
// Placeholder words from docs/SPEC.md sections 9 and 14.

const toastTodayWords = [
  "Ready when you are. Today's going to go well.",
  'Morning! Something good is on its way.',
  'Here we go. A fresh day.',
  "Good to see you. Let's start gently.",
  'Today has room for you.',
];

const toastQuestions = [
  'Morning! How are you feeling?',
  'How are you, this morning?',
  'Before we start: how are you?',
  "How's the start of your day?",
];

const cocoaQuestions = [
  'Evening. How are you feeling now?',
  'There you are. How are you now?',
  "The day's nearly done. How are you?",
  'Come and sit. How are you feeling?',
];

const goodnightWords = [
  'Everything is exactly where it needs to be. Goodnight.',
  "The day is done, and that's enough. Goodnight.",
  'Nothing left to do tonight. Rest well.',
  'It all counts. Sleep well.',
  'You can put the day down now. Goodnight.',
];

const cocoaEveningToday = "Cocoa's here. How are you now?";

/// One per day, never the same as the day before.
String wordsFor(DateTime date, List<String> choices) {
  final day =
      DateTime.utc(date.year, date.month, date.day).millisecondsSinceEpoch ~/
      Duration.millisecondsPerDay;
  return choices[day % choices.length];
}
