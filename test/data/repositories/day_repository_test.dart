// Copyright the BizCath contributors.
import 'package:bookends/data/repositories/day_repository.dart';
import 'package:bookends/data/services/database.dart';
import 'package:bookends/domain/models/day_record.dart';
import 'package:bookends/domain/models/feeling.dart';
import 'package:bookends/domain/models/note.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final date = DateTime(2026, 11, 26);
  late AppDatabase db;
  late DayRepository days;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    days = DayRepository(db);
  });
  tearDown(() => db.close());

  test('every answer and note comes back from the database', () async {
    await days.save(
      DayRecord(
        date: date,
        morning: Morning(
          completedAt: DateTime(2026, 11, 26, 8),
          checkIn: const CheckIn(
            feeling: Feeling.notSure,
            strength: Strength.aLot,
            why: 'rain',
          ),
          goal: 'open a window',
          goalSource: GoalSource.own,
          lineId: 'toast-2',
        ),
        evening: Evening(
          completedAt: DateTime(2026, 11, 26, 22),
          checkIn: const CheckIn(feeling: Feeling.calm),
          outcome: GoalOutcome.notToday,
          goodKind: GoodKind.own,
          goodText: 'soup',
        ),
      ),
      note: Note(date: date, from: NoteAuthor.cocoa, text: 'Be gentle.'),
    );

    final fresh = DayRepository(db);
    await fresh.load();
    final day = fresh.dayFor(date)!;
    expect(day.morning!.checkIn.feeling, Feeling.notSure);
    expect(day.morning!.checkIn.strength, Strength.aLot);
    expect(day.morning!.checkIn.why, 'rain');
    expect(day.morning!.goal, 'open a window');
    expect(day.morning!.goalSource, GoalSource.own);
    expect(day.morning!.lineId, 'toast-2');
    expect(day.evening!.checkIn.feeling, Feeling.calm);
    expect(day.evening!.outcome, GoalOutcome.notToday);
    expect(day.evening!.goodThing, 'soup');
    expect(fresh.noteFor(date, NoteAuthor.cocoa)!.text, 'Be gentle.');
    expect(fresh.lineIdsBefore(DateTime(2026, 11, 27)), {'toast-2'});
    expect(fresh.lineIdsBefore(DateTime(2026, 12, 11)), isEmpty);
  });

  test('counts days shown up, and removing a day drops its notes', () async {
    await days.save(
      DayRecord(
        date: date,
        evening: Evening(completedAt: date),
      ),
      note: Note(date: date, from: NoteAuthor.cocoa, text: 'x'),
    );
    await days.save(DayRecord(date: DateTime(2026, 11, 25)));
    expect(days.daysShownUp, 1);

    await days.remove(date);
    expect(days.daysShownUp, 0);
    expect(days.noteFor(date, NoteAuthor.cocoa), isNull);
  });
}
