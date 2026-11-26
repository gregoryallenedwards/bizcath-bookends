// Copyright the BizCath contributors.
import 'package:bookends/domain/models/day_record.dart';
import 'package:bookends/domain/models/feeling.dart';
import 'package:bookends/domain/models/note.dart';
import 'package:bookends/domain/models/today_state.dart';
import 'package:bookends/ui/today/today_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support.dart';

void main() {
  test('greets by the time of day', () async {
    final app = await TestApp.loaded();
    addTearDown(app.deps.close);
    final viewModel = TodayViewModel(
      clock: app.deps.clock,
      days: app.deps.days,
      lines: app.deps.lines,
      settings: app.deps.settings,
    );
    addTearDown(viewModel.dispose);
    String at(int hour, int minute) {
      app.time = DateTime(2026, 11, 26, hour, minute);
      return viewModel.greeting;
    }

    expect(at(11, 59), 'Good morning');
    expect(at(12, 0), 'Good afternoon');
    expect(at(16, 59), 'Good afternoon');
    expect(at(17, 0), 'Good evening');
    expect(viewModel.state, TodayState.beforeMorning);
    expect(at(21, 30), 'Good evening');
    expect(viewModel.state, TodayState.evening);
  });

  test('shows last night and the note Cocoa left', () async {
    final app = await TestApp.loaded();
    addTearDown(app.deps.close);
    final viewModel = TodayViewModel(
      clock: app.deps.clock,
      days: app.deps.days,
      lines: app.deps.lines,
      settings: app.deps.settings,
    );
    addTearDown(viewModel.dispose);
    expect(viewModel.lastNight, isNull);

    final yesterday = DateTime(2026, 11, 25);
    await app.deps.days.save(
      DayRecord(
        date: yesterday,
        evening: Evening(
          completedAt: yesterday,
          checkIn: const CheckIn(
            feeling: Feeling.calm,
            strength: Strength.aLittle,
          ),
        ),
      ),
      note: Note(date: yesterday, from: NoteAuthor.cocoa, text: 'Hello.'),
    );
    expect(viewModel.lastNight, 'calm · a little');
    expect(viewModel.noteFromCocoa, 'Hello.');
    expect(viewModel.daysShownUp, 1);
  });
}
