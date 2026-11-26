// Copyright the BizCath contributors.
import 'package:bookends/domain/models/today_state.dart';
import 'package:bookends/ui/debug/debug_view_model.dart';
import 'package:bookends/ui/today/today_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support.dart';

void main() {
  for (final hour in [2, 12, 23]) {
    test('each jump shows its Today state (real time $hour:00)', () async {
      final app = await TestApp.loaded(now: DateTime(2026, 11, 26, hour));
      addTearDown(app.deps.close);
      final debug = DebugViewModel(
        clock: app.deps.clock,
        days: app.deps.days,
        settings: app.deps.settings,
        data: app.deps.data,
      );
      final today = TodayViewModel(
        clock: app.deps.clock,
        days: app.deps.days,
        lines: app.deps.lines,
        settings: app.deps.settings,
      );
      addTearDown(debug.dispose);
      addTearDown(today.dispose);

      for (final state in [...TodayState.values, TodayState.beforeMorning]) {
        await debug.jumpTo(state);
        expect(today.state, state);
      }
      debug.moveToThisEvening();
      expect(today.state, TodayState.evening);
      debug.moveToNextMorning();
      expect(today.state, TodayState.beforeMorning);
      debug.useRealClock();
      expect(debug.now, app.time);
      await debug.clearAll();
      expect(today.daysShownUp, 0);
    });
  }
}
