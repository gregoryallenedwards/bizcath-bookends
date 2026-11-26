// Copyright the BizCath contributors.
import 'package:bookends/domain/models/day_record.dart';
import 'package:bookends/domain/models/feeling.dart';
import 'package:bookends/domain/models/note.dart';
import 'package:bookends/ui/evening/evening_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support.dart';

void main() {
  final date = DateTime(2026, 11, 26);

  Future<(TestApp, EveningViewModel)> start({String? goal}) async {
    final app = await TestApp.loaded(now: DateTime(2026, 11, 26, 22));
    addTearDown(app.deps.close);
    await app.deps.days.save(
      DayRecord(
        date: date,
        morning: Morning(
          completedAt: date,
          checkIn: const CheckIn(feeling: Feeling.hopeful),
          goal: goal,
        ),
      ),
    );
    final viewModel = EveningViewModel(
      clock: app.deps.clock,
      days: app.deps.days,
      settings: app.deps.settings,
    );
    addTearDown(viewModel.dispose);
    return (app, viewModel);
  }

  test('shows the morning and saves the evening and note', () async {
    final (app, viewModel) = await start(goal: 'a short walk');
    expect(viewModel.thisMorning, 'hopeful');
    expect(viewModel.goalInQuestion, 'short walk');
    viewModel
      ..setFeeling(Feeling.tired)
      ..setOutcome(GoalOutcome.did)
      ..setGoodKind(GoodKind.rest);
    expect(viewModel.note, startsWith('They were tired tonight and did a'));
    viewModel.editNote('My words.');

    await viewModel.closeDay();
    final day = app.deps.days.dayFor(date)!;
    expect(day.morning!.goal, 'a short walk');
    expect(day.evening!.outcome, GoalOutcome.did);
    expect(day.evening!.goodThing, 'rest');
    expect(app.deps.days.noteFor(date, NoteAuthor.cocoa)!.text, 'My words.');
  });

  test('with no goal and everything skipped, the day still closes', () async {
    final (app, viewModel) = await start();
    expect(viewModel.goal, isNull);
    viewModel
      ..skipFeeling()
      ..skipDay();
    await viewModel.closeDay();
    final evening = app.deps.days.dayFor(date)!.evening!;
    expect(evening.checkIn.feeling, isNull);
    expect(evening.outcome, isNull);
    expect(evening.goodThing, isNull);
  });

  test('a day closed after 04:00 stays with the day it started', () async {
    final (app, viewModel) = await start();
    app.time = DateTime(2026, 11, 27, 4, 5);
    await viewModel.closeDay();
    expect(app.deps.days.dayFor(date)!.eveningDone, isTrue);
  });
}
