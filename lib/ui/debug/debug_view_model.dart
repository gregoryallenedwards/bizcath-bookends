// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';

import '../../app/day_clock.dart';
import '../../data/repositories/clock_repository.dart';
import '../../data/repositories/data_repository.dart';
import '../../data/repositories/day_repository.dart';
import '../../data/repositories/settings_repository.dart';
import '../../domain/models/app_settings.dart';
import '../../domain/models/day_record.dart';
import '../../domain/models/feeling.dart';
import '../../domain/models/today_state.dart';

/// Debug builds only.
class DebugViewModel extends ChangeNotifier {
  DebugViewModel({
    required this._clock,
    required this._days,
    required this._settings,
    required this._data,
  }) {
    _clock.addListener(notifyListeners);
  }

  final ClockRepository _clock;
  final DayRepository _days;
  final SettingsRepository _settings;
  final DataRepository _data;

  DateTime get now => _clock.now();

  bool get isOverridden => _clock.isOverridden;

  void overrideClock(DateTime moment) => _clock.override(moment);

  void useRealClock() => _clock.clearOverride();

  /// Moves the clock and leaves the data alone.
  void moveToThisEvening() => _moveTo(0, 21, 45);

  void moveToNextMorning() => _moveTo(1, 7, 42);

  Future<void> clearAll() => _data.deleteEverything();

  Future<void> resetFirstRun() async {
    // Defaults have first run not done.
    await _settings.save(const AppSettings());
  }

  /// Sets both the clock and today's sample data so Today shows [state].
  Future<void> jumpTo(TodayState state) async {
    final date = dayDateOf(_clock.systemNow());
    final (hour, minute) = switch (state) {
      TodayState.beforeMorning => (7, 42),
      TodayState.duringDay => (13, 10),
      TodayState.evening => (21, 45),
      TodayState.night => (22, 30),
    };
    DateTime at(int hour, int minute) =>
        DateTime(date.year, date.month, date.day, hour, minute);
    _clock.override(at(hour, minute));

    // Yesterday evening, so "Last night you said" can be seen.
    final yesterday = DateTime(date.year, date.month, date.day - 1);
    if (_days.dayFor(yesterday) == null) {
      await _days.save(
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
      );
    }

    await _days.remove(date);
    if (state == TodayState.beforeMorning) return;
    await _days.save(
      DayRecord(
        date: date,
        morning: Morning(
          completedAt: at(7, 45),
          checkIn: const CheckIn(feeling: Feeling.hopeful),
          goal: 'a ten-minute walk',
          goalSource: GoalSource.suggested,
          lineId: 'toast-1',
        ),
        evening: state != TodayState.night
            ? null
            : Evening(
                completedAt: at(22, 15),
                checkIn: const CheckIn(feeling: Feeling.tired),
                outcome: GoalOutcome.partly,
                goodKind: GoodKind.outside,
              ),
      ),
    );
  }

  void _moveTo(int daysAhead, int hour, int minute) {
    final date = dayDateOf(now);
    _clock.override(
      DateTime(date.year, date.month, date.day + daysAhead, hour, minute),
    );
  }

  @override
  void dispose() {
    _clock.removeListener(notifyListeners);
    super.dispose();
  }
}
