// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

import '../../domain/models/feeling.dart';
import '../common/character.dart';
import '../common/check_in_form.dart';
import '../common/info_card.dart';
import '../common/line_card.dart';
import 'morning_view_model.dart';

const _gap = SizedBox(height: 16);

/// Screen B.
List<Widget> howAreYouStep(MorningViewModel viewModel) {
  final note = viewModel.noteFromCocoa;
  return [
    CharacterSays(
      character: Character.toast,
      words: [
        if (note != null) 'Cocoa left a note: “$note”',
        viewModel.question,
      ].join('\n\n'),
    ),
    _gap,
    CheckInForm(
      feelings: viewModel.feelings,
      feeling: viewModel.checkIn.feeling,
      strength: viewModel.checkIn.strength,
      why: viewModel.checkIn.why,
      onFeeling: viewModel.setFeeling,
      onStrength: viewModel.setStrength,
      onWhy: viewModel.setWhy,
    ),
    _gap,
    FilledButton(onPressed: viewModel.next, child: const Text('Next')),
    TextButton(
      onPressed: viewModel.skipFeeling,
      child: const Text('Skip for today'),
    ),
  ];
}

/// Screen C.
List<Widget> smallThingStep(MorningViewModel viewModel) => [
  CharacterSays(character: Character.toast, words: viewModel.reply.sentence),
  _gap,
  InfoCard(
    title: viewModel.suggestion,
    body: viewModel.checkIn.feeling == null
        ? 'a suggestion'
        : 'suggested for ${viewModel.checkIn.feeling!.label} mornings',
  ),
  const SizedBox(height: 8),
  Wrap(
    spacing: 8,
    children: [
      ChoiceChip(
        label: const Text('Use this'),
        selected: viewModel.choice == GoalChoice.suggestion,
        onSelected: (_) => viewModel.useSuggestion(),
      ),
      ActionChip(label: const Text('Another'), onPressed: viewModel.another),
      ChoiceChip(
        label: const Text('Write my own'),
        selected: viewModel.choice == GoalChoice.own,
        onSelected: (_) => viewModel.writeOwn(),
      ),
    ],
  ),
  if (viewModel.choice == GoalChoice.own) ...[
    const SizedBox(height: 8),
    TextFormField(
      initialValue: viewModel.ownGoal,
      maxLength: 60,
      autofocus: true,
      onChanged: viewModel.setOwnGoal,
      decoration: const InputDecoration(
        labelText: 'One small thing',
        border: OutlineInputBorder(),
      ),
    ),
  ],
  _gap,
  OutlinedButton(
    onPressed: viewModel.noGoal,
    child: const Text("No goal today — that's fine"),
  ),
  _gap,
  FilledButton(onPressed: viewModel.next, child: const Text('Next')),
];

/// Screen D.
List<Widget> lineStep(
  MorningViewModel viewModel, {
  required VoidCallback onDone,
}) {
  final checkIn = viewModel.checkIn.toCheckIn();
  return [
    const CharacterSays(character: Character.toast, words: 'One for the road.'),
    _gap,
    LineCard(
      line: viewModel.line,
      onToggleSave: viewModel.toggleSave,
      onShare: viewModel.share,
    ),
    _gap,
    InfoCard(
      title: 'Today',
      body: [
        feelingLabel(checkIn.feeling, checkIn.strength) ?? 'no check-in',
        viewModel.goal ?? 'no goal',
      ].join(' · '),
    ),
    _gap,
    FilledButton(
      onPressed: viewModel.saving ? null : onDone,
      child: const Text('Have a good day'),
    ),
  ];
}
