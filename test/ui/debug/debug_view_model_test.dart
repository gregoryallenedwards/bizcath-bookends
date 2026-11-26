// Copyright the BizCath contributors.
import 'package:bookends/data/repositories/clock_repository.dart';
import 'package:bookends/data/repositories/day_repository.dart';
import 'package:bookends/data/services/clock_service.dart';
import 'package:bookends/domain/models/today_state.dart';
import 'package:bookends/ui/debug/debug_view_model.dart';
import 'package:bookends/ui/today/today_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final hour in [2, 12, 23]) {
    test('each jump shows its Today state (real time $hour:00)', () {
      final real = DateTime(2026, 11, 26, hour);
      final clock = ClockRepository(ClockService(systemNow: () => real));
      final days = DayRepository();
      final debug = DebugViewModel(clock: clock, days: days);
      final today = TodayViewModel(clock: clock, days: days);
      addTearDown(debug.dispose);
      addTearDown(today.dispose);

      for (final state in [...TodayState.values, TodayState.beforeMorning]) {
        debug.jumpTo(state);
        expect(today.state, state);
        expect(debug.isOverridden, isTrue);
      }
      debug.useRealClock();
      expect(debug.now, real);
    });
  }
}
