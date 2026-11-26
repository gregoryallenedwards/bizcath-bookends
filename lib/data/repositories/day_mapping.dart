// Copyright the BizCath contributors.
import 'package:drift/drift.dart';

import '../../domain/models/day_record.dart';
import '../../domain/models/feeling.dart';
import '../services/database.dart';

String dateKey(DateTime date) =>
    '${date.year}-${date.month.toString().padLeft(2, '0')}-'
    '${date.day.toString().padLeft(2, '0')}';

DateTime dateFromKey(String key) => DateTime.parse(key);

T? _named<T extends Enum>(List<T> values, String? name) =>
    name == null ? null : values.asNameMap()[name];

DayRecord dayFromRow(Day row) {
  final morningAt = row.morningCompletedAt;
  final eveningAt = row.eveningCompletedAt;
  return DayRecord(
    date: dateFromKey(row.date),
    morning: morningAt == null
        ? null
        : Morning(
            completedAt: morningAt,
            checkIn: CheckIn(
              feeling: _named(Feeling.values, row.morningFeeling),
              strength: _named(Strength.values, row.morningStrength),
              why: row.morningWhy,
            ),
            goal: row.goalText,
            goalSource:
                _named(GoalSource.values, row.goalSource) ?? GoalSource.none,
            lineId: row.lineId,
          ),
    evening: eveningAt == null
        ? null
        : Evening(
            completedAt: eveningAt,
            checkIn: CheckIn(
              feeling: _named(Feeling.values, row.eveningFeeling),
              strength: _named(Strength.values, row.eveningStrength),
              why: row.eveningWhy,
            ),
            outcome: _named(GoalOutcome.values, row.goalOutcome),
            goodKind: _named(GoodKind.values, row.goodKind),
            goodText: row.goodText,
          ),
  );
}

DaysCompanion rowFromDay(DayRecord day) {
  final morning = day.morning;
  final evening = day.evening;
  return DaysCompanion(
    date: Value(dateKey(day.date)),
    morningFeeling: Value(morning?.checkIn.feeling?.name),
    morningStrength: Value(morning?.checkIn.strength?.name),
    morningWhy: Value(morning?.checkIn.why),
    goalText: Value(morning?.goal),
    goalSource: Value(morning?.goalSource.name),
    lineId: Value(morning?.lineId),
    morningCompletedAt: Value(morning?.completedAt),
    eveningFeeling: Value(evening?.checkIn.feeling?.name),
    eveningStrength: Value(evening?.checkIn.strength?.name),
    eveningWhy: Value(evening?.checkIn.why),
    goalOutcome: Value(evening?.outcome?.name),
    goodKind: Value(evening?.goodKind?.name),
    goodText: Value(evening?.goodText),
    eveningCompletedAt: Value(evening?.completedAt),
  );
}
