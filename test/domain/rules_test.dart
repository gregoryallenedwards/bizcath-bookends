// Copyright the BizCath contributors.
import 'package:bookends/domain/content/lines.dart';
import 'package:bookends/domain/content/words.dart';
import 'package:bookends/domain/models/day_record.dart';
import 'package:bookends/domain/models/feeling.dart';
import 'package:bookends/domain/models/line.dart';
import 'package:bookends/domain/rules/line_choice.dart';
import 'package:bookends/domain/rules/note_templates.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('rotating words never repeat on consecutive days', () {
    for (final choices in [
      toastTodayWords,
      toastQuestions,
      cocoaQuestions,
      goodnightWords,
    ]) {
      var date = DateTime(2026, 1, 1);
      for (var i = 0; i < 400; i++) {
        final next = DateTime(date.year, date.month, date.day + 1);
        expect(wordsFor(date, choices), isNot(wordsFor(next, choices)));
        date = next;
      }
    }
  });

  test('a line does not repeat within 14 days', () {
    final used = <String>[];
    for (var i = 0; i < 100; i++) {
      final line = chooseLine(
        date: DateTime(2026, 1, 1 + i),
        lines: placeholderLines,
        recentIds: used.reversed.take(14).toSet(),
        useMyLines: false,
      );
      expect(used.reversed.take(14), isNot(contains(line.id)));
      used.add(line.id);
    }
  });

  test("the user's own lines appear some mornings, only when allowed", () {
    final lines = [
      ...placeholderLines,
      Line(
        id: 'mine',
        text: 'mine',
        source: LineSource.own,
        createdAt: DateTime(2026),
      ),
    ];
    int count(bool useMyLines) => [
      for (var i = 0; i < 500; i++)
        chooseLine(
          date: DateTime(2026, 1, 1 + i),
          lines: lines,
          recentIds: {},
          useMyLines: useMyLines,
        ),
    ].where((line) => line.id == 'mine').length;

    expect(count(false), 0);
    expect(count(true), inInclusiveRange(60, 140));
  });

  test("Cocoa's note follows the answers", () {
    expect(
      cocoaNote(
        firstName: null,
        feeling: Feeling.tired,
        goal: 'a short walk',
        outcome: GoalOutcome.notToday,
        goodThing: 'outside',
      ),
      "They were tired tonight and didn't get to a short walk. "
      'They said outside. Be gentle with them in the morning.',
    );
    expect(
      cocoaNote(firstName: 'Sam', feeling: Feeling.calm, goal: 'a short walk'),
      'Sam was calm tonight. Be gentle with them in the morning.',
    );
    expect(
      cocoaNote(firstName: ' ', goodThing: 'Soup!'),
      'They checked in tonight. They said Soup! '
      'Be gentle with them in the morning.',
    );
  });

  test("Toast's note follows the morning", () {
    expect(
      toastNote(firstName: 'Sam', feeling: Feeling.low, goal: 'one shower'),
      'Sam started the day low and is carrying one shower. '
      'Look after them tonight.',
    );
    expect(
      toastNote(firstName: null),
      'They started the day and are carrying nothing in particular. '
      'Look after them tonight.',
    );
  });
}
