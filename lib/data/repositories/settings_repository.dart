// Copyright the BizCath contributors.
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/app_settings.dart';
import '../../domain/models/feeling.dart';
import '../services/database.dart';

class SettingsRepository extends ChangeNotifier {
  SettingsRepository(this._db);

  final AppDatabase _db;
  AppSettings _current = const AppSettings();

  AppSettings get current => _current;

  Future<void> load() async {
    final row = await _db.select(_db.settingsRows).getSingleOrNull();
    _current = row == null
        ? const AppSettings()
        : AppSettings(
            morningMinutes: row.morningMinutes,
            eveningMinutes: row.eveningMinutes,
            morningReminderOn: row.morningReminderOn,
            eveningReminderOn: row.eveningReminderOn,
            haptics: row.haptics,
            reducedMotion: ReducedMotion.values.byName(row.reducedMotion),
            hiddenFeelings: {
              for (final name in row.hiddenFeelings.split(','))
                ?Feeling.values.asNameMap()[name],
            },
            useMyLines: row.useMyLines,
            firstRunDone: row.firstRunDone,
            firstName: row.firstName,
          );
    notifyListeners();
  }

  Future<void> save(AppSettings settings) async {
    await _db
        .into(_db.settingsRows)
        .insertOnConflictUpdate(
          SettingsRowsCompanion.insert(
            id: const Value(0),
            morningMinutes: settings.morningMinutes,
            eveningMinutes: settings.eveningMinutes,
            morningReminderOn: settings.morningReminderOn,
            eveningReminderOn: settings.eveningReminderOn,
            haptics: settings.haptics,
            reducedMotion: settings.reducedMotion.name,
            hiddenFeelings: settings.hiddenFeelings
                .map((f) => f.name)
                .join(','),
            useMyLines: settings.useMyLines,
            firstRunDone: settings.firstRunDone,
            firstName: Value(settings.firstName),
          ),
        );
    _current = settings;
    notifyListeners();
  }
}
