// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
import '../../domain/content/words.dart';
import '../../domain/models/feeling.dart';
import '../common/character.dart';
import '../common/date_labels.dart';
import '../common/info_card.dart';
import '../common/line_card.dart';
import 'today_view_model.dart';

const _gap = SizedBox(height: 16);

Widget _dateLine(BuildContext context, DateTime now) => Text(
  '${timeLabel(now)} · ${dateLabel(now)}',
  style: Theme.of(context).textTheme.bodyMedium,
);

Widget _title(BuildContext context, String text) => Semantics(
  header: true,
  child: Text(text, style: Theme.of(context).textTheme.headlineMedium),
);

/// Screen A.
List<Widget> beforeMorning(BuildContext context, TodayViewModel viewModel) {
  final lastNight = viewModel.lastNight;
  final note = viewModel.noteFromCocoa;
  return [
    _dateLine(context, viewModel.now),
    _title(context, viewModel.greeting),
    _gap,
    CharacterSays(
      character: Character.toast,
      words: [
        if (note != null) 'Cocoa left a note: “$note”',
        viewModel.toastWords,
      ].join('\n\n'),
    ),
    _gap,
    FilledButton(
      onPressed: () => context.push(Routes.morning),
      child: const Text('Start the day with Toast'),
    ),
    _gap,
    if (lastNight != null) ...[Text('Last night you said: $lastNight'), _gap],
    InfoCard(
      title: 'Days you showed up: ${viewModel.daysShownUp}',
      body: 'never resets',
    ),
  ];
}

/// Screen E.
List<Widget> duringDay(BuildContext context, TodayViewModel viewModel) {
  final morning = viewModel.today?.morning;
  final line = viewModel.line;
  final goal = morning?.goal;
  final feeling = morning?.checkIn.feeling?.label;
  return [
    _dateLine(context, viewModel.now),
    _title(context, 'Today'),
    _gap,
    if (line != null) ...[
      LineCard(
        line: line,
        onToggleSave: viewModel.toggleSave,
        onShare: viewModel.share,
      ),
      _gap,
    ],
    InfoCard(
      title: 'Toast is carrying',
      body: [
        goal ?? 'No goal today',
        if (feeling != null) '$feeling this morning',
      ].join(' · '),
    ),
    if (goal != null) ...[
      const SizedBox(height: 8),
      Text(
        'Cocoa will ask how it went this evening.',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
    _gap,
    InfoCard(
      title: 'Need a moment?',
      body: 'Breathe, ground yourself, or refocus',
      onTap: () => context.push(Routes.steady),
    ),
  ];
}

List<Widget> eveningState(BuildContext context, TodayViewModel viewModel) => [
  _dateLine(context, viewModel.now),
  _gap,
  const CharacterSays(character: Character.cocoa, words: cocoaEveningToday),
  _gap,
  FilledButton(
    onPressed: () => context.push(Routes.evening),
    child: const Text('Talk to Cocoa'),
  ),
];

List<Widget> nightState(BuildContext context, TodayViewModel viewModel) {
  final morning = viewModel.today?.morning;
  final evening = viewModel.today?.evening;
  final goal = morning?.goal;
  final outcome = evening?.outcome;
  final goodThing = evening?.goodThing;
  final note = viewModel.noteForToast;
  String told(Feeling? feeling) => feeling?.label ?? 'no check-in';
  return [
    _dateLine(context, viewModel.now),
    _gap,
    CharacterSays(character: Character.cocoa, words: viewModel.goodnight),
    _gap,
    InfoCard(
      title: 'Today',
      body: [
        '${told(morning?.checkIn.feeling)} → ${told(evening?.checkIn.feeling)}',
        if (goal != null)
          'Goal: $goal${outcome == null ? '' : ' · ${outcome.label}'}',
        if (goodThing != null) 'Good thing: $goodThing',
        if (note != null) 'Note for Toast: $note',
      ].join('\n'),
    ),
  ];
}
