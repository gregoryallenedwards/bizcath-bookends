// Copyright the BizCath contributors.
import 'package:bookends/data/repositories/clock_repository.dart';
import 'package:bookends/data/repositories/day_repository.dart';
import 'package:bookends/data/services/clock_service.dart';
import 'package:bookends/domain/models/day_record.dart';
import 'package:bookends/domain/models/today_state.dart';
import 'package:bookends/ui/today/today_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('follows the clock and the stored days', () {
    final real = DateTime(2026, 11, 26, 8);
    final clock = ClockRepository(ClockService(systemNow: () => real));
    final days = DayRepository();
    final viewModel = TodayViewModel(clock: clock, days: days);
    addTearDown(viewModel.dispose);
    var changes = 0;
    viewModel.addListener(() => changes++);

    expect(viewModel.state, TodayState.beforeMorning);
    expect(viewModel.lastNightFeeling, isNull);

    days.save(
      DayRecord(
        date: DateTime(2026, 11, 25),
        eveningDone: true,
        eveningFeeling: 'calm',
      ),
    );
    expect(viewModel.lastNightFeeling, 'calm');
    expect(viewModel.daysShownUp, 1);

    clock.override(DateTime(2026, 11, 26, 22));
    expect(viewModel.state, TodayState.evening);
    expect(viewModel.isDark, isTrue);
    expect(changes, 2);
  });
}
