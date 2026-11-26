// Copyright the BizCath contributors.
import 'package:bookends/domain/models/day_record.dart';
import 'package:bookends/domain/models/feeling.dart';
import 'package:bookends/domain/models/note.dart';
import 'package:bookends/ui/morning/morning_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support.dart';

void main() {
  late TestApp app;
  late MorningViewModel viewModel;
  final date = DateTime(2026, 11, 26);

  setUp(() async {
    app = await TestApp.loaded();
    viewModel = MorningViewModel(
      clock: app.deps.clock,
      days: app.deps.days,
      lines: app.deps.lines,
      settings: app.deps.settings,
    );
  });
  tearDown(() async {
    viewModel.dispose();
    await app.deps.close();
  });

  test('suggestions follow the feeling, one at a time', () {
    viewModel.setFeeling(Feeling.low);
    expect(viewModel.suggestion, 'open a window');
    viewModel.useSuggestion();
    expect(viewModel.goal, 'open a window');
    viewModel.another();
    expect(viewModel.suggestion, 'one shower');
    expect(viewModel.goal, isNull);
    viewModel.useSuggestion();
    viewModel.setFeeling(Feeling.tired);
    expect(viewModel.suggestion, 'one early night');
    expect(viewModel.goal, isNull);
  });

  test('saves the morning, the line and the note for Cocoa', () async {
    viewModel
      ..setFeeling(Feeling.hopeful)
      ..setStrength(Strength.aLot)
      ..next()
      ..writeOwn()
      ..setOwnGoal(' ring the plumber ')
      ..next();
    final line = viewModel.line.id;
    expect(app.deps.days.dayFor(date), isNull);

    await viewModel.finish();
    final morning = app.deps.days.dayFor(date)!.morning!;
    expect(morning.checkIn.strength, Strength.aLot);
    expect(morning.goal, 'ring the plumber');
    expect(morning.goalSource, GoalSource.own);
    expect(morning.lineId, line);
    expect(
      app.deps.days.noteFor(date, NoteAuthor.toast)!.text,
      contains('carrying ring the plumber'),
    );
  });

  test('skipping stores no feeling and no goal', () async {
    viewModel
      ..setFeeling(Feeling.calm)
      ..skipFeeling()
      ..noGoal();
    expect(viewModel.step, 2);
    await viewModel.finish();
    final morning = app.deps.days.dayFor(date)!.morning!;
    expect(morning.checkIn.feeling, isNull);
    expect(morning.goalSource, GoalSource.none);
  });

  test('back steps back and then leaves', () {
    viewModel.next();
    expect(viewModel.back(), isTrue);
    expect(viewModel.back(), isFalse);
  });
}
