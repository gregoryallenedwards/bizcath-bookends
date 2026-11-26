// Copyright the BizCath contributors.
import 'package:bookends/data/repositories/settings_repository.dart';
import 'package:bookends/data/services/database.dart';
import 'package:bookends/domain/models/app_settings.dart';
import 'package:bookends/domain/models/feeling.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('starts with the defaults and keeps what is saved', () async {
    final db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    final settings = SettingsRepository(db);
    await settings.load();
    expect(settings.current.firstRunDone, isFalse);
    expect(settings.current.morningMinutes, 450);
    expect(settings.current.eveningMinutes, 1290);

    await settings.save(
      const AppSettings(
        eveningMinutes: 1200,
        hiddenFeelings: {Feeling.wired},
        reducedMotion: ReducedMotion.on,
        firstRunDone: true,
        firstName: 'Sam',
      ),
    );
    final fresh = SettingsRepository(db);
    await fresh.load();
    expect(fresh.current.eveningMinutes, 1200);
    expect(fresh.current.visibleFeelings, isNot(contains(Feeling.wired)));
    expect(fresh.current.reducedMotion, ReducedMotion.on);
    expect(fresh.current.firstName, 'Sam');
  });
}
