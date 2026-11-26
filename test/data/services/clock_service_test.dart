// Copyright the BizCath contributors.
import 'package:bookends/data/services/clock_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('an overridden clock keeps running and can be cleared', () {
    var real = DateTime(2026, 11, 26, 10);
    final clock = ClockService(systemNow: () => real);

    clock.override(DateTime(2026, 11, 26, 22));
    real = real.add(const Duration(minutes: 5));
    expect(clock.now(), DateTime(2026, 11, 26, 22, 5));

    clock.clearOverride();
    expect(clock.now(), real);
    expect(clock.isOverridden, isFalse);
  });
}
