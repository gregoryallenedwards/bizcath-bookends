// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

import '../../domain/models/day_record.dart';
import '../common/character.dart';
import '../common/check_in_form.dart';
import '../common/info_card.dart';
import 'evening_view_model.dart';

const _gap = SizedBox(height: 16);

/// Screen H.
List<Widget> howNowStep(EveningViewModel viewModel) {
  final morning = viewModel.thisMorning;
  return [
    CharacterSays(character: Character.cocoa, words: viewModel.question),
    _gap,
    InfoCard(
      title: morning == null ? 'No check-in this morning' : 'This morning',
      body: morning ?? '',
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
      child: const Text('Skip for tonight'),
    ),
  ];
}

/// Screen I.
List<Widget> theDayStep(EveningViewModel viewModel) {
  final goal = viewModel.goalInQuestion;
  return [
    CharacterSays(
      character: Character.cocoa,
      words: goal == null
          ? 'One good thing from today?'
          : 'Toast passed me your $goal. How did it go?',
    ),
    _gap,
    if (goal != null) ...[
      Wrap(
        spacing: 8,
        children: [
          for (final outcome in GoalOutcome.values)
            ChoiceChip(
              label: Text(outcome.label),
              selected: viewModel.outcome == outcome,
              onSelected: (selected) =>
                  viewModel.setOutcome(selected ? outcome : null),
            ),
        ],
      ),
      if (viewModel.outcome != null)
        const Text("Whatever happened, the day is done. That's fine."),
      _gap,
      const Text('One good thing from today?'),
    ],
    Wrap(
      spacing: 8,
      children: [
        for (final kind in GoodKind.values)
          ChoiceChip(
            label: Text(kind.label),
            selected: viewModel.goodKind == kind,
            onSelected: (selected) =>
                viewModel.setGoodKind(selected ? kind : null),
          ),
      ],
    ),
    if (viewModel.goodKind == GoodKind.own) ...[
      const SizedBox(height: 8),
      TextFormField(
        initialValue: viewModel.goodText,
        maxLength: 120,
        autofocus: true,
        onChanged: viewModel.setGoodText,
        decoration: const InputDecoration(
          labelText: 'Write it (optional)',
          border: OutlineInputBorder(),
        ),
      ),
    ],
    _gap,
    FilledButton(onPressed: viewModel.next, child: const Text('Next')),
    TextButton(onPressed: viewModel.skipDay, child: const Text('Skip')),
  ];
}

/// Screen J.
List<Widget> goodnightStep(
  EveningViewModel viewModel, {
  required VoidCallback onBreath,
  required VoidCallback onClose,
}) => [
  CharacterSays(character: Character.cocoa, words: viewModel.goodnight),
  _gap,
  TextFormField(
    initialValue: viewModel.note,
    minLines: 2,
    maxLines: null,
    onChanged: viewModel.editNote,
    decoration: const InputDecoration(
      labelText: 'A note for Toast',
      border: OutlineInputBorder(),
    ),
  ),
  _gap,
  OutlinedButton(onPressed: onBreath, child: const Text('One slow breath')),
  _gap,
  const Text('Bookends will stay quiet until morning.'),
  const SizedBox(height: 8),
  FilledButton(
    onPressed: viewModel.saving ? null : onClose,
    child: const Text('Close the day'),
  ),
];
