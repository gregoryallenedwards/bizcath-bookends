// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';

import '../../app/day_clock.dart';
import '../../data/repositories/clock_repository.dart';
import '../../data/repositories/day_repository.dart';
import '../../domain/models/day_record.dart';
import '../../domain/models/today_state.dart';

/// Debug builds only.
class DebugViewModel extends ChangeNotifier {
  DebugViewModel({required this._clock, required this._days}) {
    _clock.addListener(notifyListeners);
  }

  final ClockRepository _clock;
  final DayRepository _days;

  DateTime get now => _clock.now();

  bool get isOverridden => _clock.isOverridden;

  void overrideClock(DateTime moment) => _clock.override(moment);

  void useRealClock() => _clock.clearOverride();

  /// Sets both the clock and today's sample data so Today shows [state].
  void jumpTo(TodayState state) {
    final date = dayDateOf(_clock.systemNow());
    final (hour, minute) = switch (state) {
      TodayState.beforeMorning => (7, 42),
      TodayState.duringDay => (13, 10),
      TodayState.evening => (21, 45),
      TodayState.night => (22, 30),
    };
    _clock.override(DateTime(date.year, date.month, date.day, hour, minute));

    // Yesterday evening, so "Last night you said" can be seen.
    final yesterday = DateTime(date.year, date.month, date.day - 1);
    _days.save(
      DayRecord(date: yesterday, eveningDone: true, eveningFeeling: 'calm'),
    );

    if (state == TodayState.beforeMorning) {
      _days.remove(date);
      return;
    }
    final night = state == TodayState.night;
    _days.save(
      DayRecord(
        date: date,
        morningDone: true,
        morningFeeling: 'hopeful',
        goal: 'a ten-minute walk',
        line: 'Here is a fine place to start.',
        eveningDone: night,
        eveningFeeling: night ? 'tired' : null,
      ),
    );
  }

  @override
  void dispose() {
    _clock.removeListener(notifyListeners);
    super.dispose();
  }
}
