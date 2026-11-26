// Copyright the BizCath contributors.
import 'package:bookends/data/repositories/day_repository.dart';
import 'package:bookends/domain/models/day_record.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('counts days with the morning or the evening done', () {
    final days = DayRepository()
      ..save(DayRecord(date: DateTime(2026, 11, 24), morningDone: true))
      ..save(DayRecord(date: DateTime(2026, 11, 25), eveningDone: true))
      ..save(DayRecord(date: DateTime(2026, 11, 26)));
    expect(days.daysShownUp, 2);

    days.remove(DateTime(2026, 11, 24));
    expect(days.daysShownUp, 1);
    expect(days.dayFor(DateTime(2026, 11, 24)), isNull);
  });
}
