// Copyright the BizCath contributors.
import '../domain/models/day_record.dart';
import '../domain/models/today_state.dart';
import 'day_clock.dart';

/// Decides which Today state to show from the clock and what is done today.
TodayState todayStateFor({
  required DateTime now,
  required int eveningMinutes,
  DayRecord? today,
}) {
  if (today?.eveningDone ?? false) return TodayState.night;
  final isEveningTime =
      minutesIntoDay(now.hour * 60 + now.minute) >=
      minutesIntoDay(eveningMinutes);
  if (isEveningTime) return TodayState.evening;
  if (today?.morningDone ?? false) return TodayState.duringDay;
  return TodayState.beforeMorning;
}
