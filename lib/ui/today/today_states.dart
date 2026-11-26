// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
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
  final lastNight = viewModel.lastNightFeeling;
  return [
    _dateLine(context, viewModel.now),
    _title(context, 'Good morning'),
    _gap,
    const CharacterSays(
      character: Character.toast,
      words: "Ready when you are. Today's going to go well.",
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
  final today = viewModel.today;
  final line = today?.line;
  final goal = today?.goal;
  final feeling = today?.morningFeeling;
  return [
    _dateLine(context, viewModel.now),
    _title(context, 'Today'),
    _gap,
    if (line != null) ...[LineCard(line: line), _gap],
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
  const CharacterSays(character: Character.cocoa, words: 'How are you now?'),
  _gap,
  FilledButton(
    onPressed: () => context.push(Routes.evening),
    child: const Text('Talk to Cocoa'),
  ),
];

List<Widget> nightState(BuildContext context, TodayViewModel viewModel) {
  final today = viewModel.today;
  return [
    _dateLine(context, viewModel.now),
    _gap,
    const CharacterSays(
      character: Character.cocoa,
      words: 'Everything is exactly where it needs to be. Goodnight.',
    ),
    _gap,
    InfoCard(
      title: 'Today',
      body: [
        'This morning: ${today?.morningFeeling ?? 'no check-in'}',
        'This evening: ${today?.eveningFeeling ?? 'no check-in'}',
        if (today?.goal != null) 'Carried: ${today!.goal}',
      ].join('\n'),
    ),
  ];
}
