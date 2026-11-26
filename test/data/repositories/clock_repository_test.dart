// Copyright the BizCath contributors.
import 'package:bookends/data/repositories/clock_repository.dart';
import 'package:bookends/data/services/clock_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('tells listeners when the override changes', () {
    final real = DateTime(2026, 11, 26, 10);
    final clock = ClockRepository(ClockService(systemNow: () => real));
    var changes = 0;
    clock.addListener(() => changes++);

    clock.override(DateTime(2026, 11, 26, 22));
    expect(clock.now().hour, 22);
    expect(clock.systemNow(), real);
    clock.clearOverride();
    expect(clock.now(), real);
    expect(changes, 2);
  });
}
