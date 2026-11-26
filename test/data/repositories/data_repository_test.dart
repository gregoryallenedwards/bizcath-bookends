// Copyright the BizCath contributors.
import 'package:bookends/domain/models/app_settings.dart';
import 'package:bookends/domain/models/day_record.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support.dart';

void main() {
  test('delete everything wipes data and returns to first run', () async {
    final app = await TestApp.loaded();
    addTearDown(app.deps.close);
    final date = DateTime(2026, 11, 26);
    await app.deps.settings.save(const AppSettings(firstRunDone: true));
    await app.deps.days.save(
      DayRecord(
        date: date,
        evening: Evening(completedAt: date),
      ),
    );
    await app.deps.lines.toggleFavourite('toast-1');

    await app.deps.data.deleteEverything();
    expect(app.deps.settings.current.firstRunDone, isFalse);
    expect(app.deps.days.daysShownUp, 0);
    expect(app.deps.lines.byId('toast-1')!.favourite, isFalse);
  });
}
