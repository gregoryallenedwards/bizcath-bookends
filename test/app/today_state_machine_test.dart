// Copyright the BizCath contributors.
import 'package:bookends/app/day_clock.dart';
import 'package:bookends/app/today_state_machine.dart';
import 'package:bookends/domain/models/day_record.dart';
import 'package:bookends/domain/models/today_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final date = DateTime(2026, 11, 26);
  final morning = DayRecord(date: date, morningDone: true);
  final closed = DayRecord(date: date, eveningDone: true);

  TodayState at(int hour, int minute, [DayRecord? today]) => todayStateFor(
    now: DateTime(2026, 11, 26, hour, minute),
    eveningMinutes: defaultEveningMinutes,
    today: today,
  );

  test('before and during the day depend on the morning', () {
    expect(at(7, 0), TodayState.beforeMorning);
    expect(at(21, 29), TodayState.beforeMorning);
    expect(at(13, 0, morning), TodayState.duringDay);
  });

  test('evening starts at the evening time, morning done or not', () {
    expect(at(21, 30), TodayState.evening);
    expect(at(21, 30, morning), TodayState.evening);
  });

  test('after midnight is still the evening, until 04:00', () {
    expect(at(0, 30), TodayState.evening);
    expect(at(3, 59), TodayState.evening);
    expect(at(4, 0), TodayState.beforeMorning);
  });

  test('a closed evening means night', () {
    expect(at(22, 0, closed), TodayState.night);
    expect(at(2, 0, closed), TodayState.night);
  });

  test('an evening time after midnight is honoured', () {
    TodayState lateAt(int hour) =>
        todayStateFor(now: DateTime(2026, 11, 26, hour), eveningMinutes: 30);
    expect(lateAt(23), TodayState.beforeMorning);
    expect(lateAt(1), TodayState.evening);
  });

  test('a day runs from 04:00 to 03:59', () {
    expect(dayDateOf(DateTime(2026, 11, 26, 3, 59)), DateTime(2026, 11, 25));
    expect(dayDateOf(DateTime(2026, 11, 26, 4)), date);
    expect(dayDateOf(DateTime(2026, 12, 1, 1)), DateTime(2026, 11, 30));
  });
}
