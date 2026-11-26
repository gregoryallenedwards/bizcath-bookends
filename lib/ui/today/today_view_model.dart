// Copyright the BizCath contributors.
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../app/day_clock.dart';
import '../../app/today_state_machine.dart';
import '../../data/repositories/clock_repository.dart';
import '../../data/repositories/day_repository.dart';
import '../../domain/models/day_record.dart';
import '../../domain/models/today_state.dart';

class TodayViewModel extends ChangeNotifier {
  TodayViewModel({
    required this._clock,
    required this._days,
    this._eveningMinutes = defaultEveningMinutes,
    Duration tick = const Duration(seconds: 10),
  }) {
    _clock.addListener(notifyListeners);
    _days.addListener(notifyListeners);
    _timer = Timer.periodic(tick, (_) => notifyListeners());
  }

  final ClockRepository _clock;
  final DayRepository _days;
  final int _eveningMinutes;
  late final Timer _timer;

  DateTime get now => _clock.now();

  DayRecord? get today => _days.dayFor(dayDateOf(now));

  TodayState get state =>
      todayStateFor(now: now, eveningMinutes: _eveningMinutes, today: today);

  bool get isDark => state == TodayState.evening || state == TodayState.night;

  int get daysShownUp => _days.daysShownUp;

  String? get lastNightFeeling {
    final date = dayDateOf(now);
    final yesterday = DateTime(date.year, date.month, date.day - 1);
    return _days.dayFor(yesterday)?.eveningFeeling;
  }

  /// Re-reads the clock, for example when the app returns to the foreground.
  void refresh() => notifyListeners();

  @override
  void dispose() {
    _timer.cancel();
    _clock.removeListener(notifyListeners);
    _days.removeListener(notifyListeners);
    super.dispose();
  }
}
