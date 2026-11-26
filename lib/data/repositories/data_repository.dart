// Copyright the BizCath contributors.
import '../services/database.dart';
import 'day_repository.dart';
import 'line_repository.dart';
import 'settings_repository.dart';

/// Acts on everything stored at once.
class DataRepository {
  DataRepository(this._db, this._days, this._lines, this._settings);

  final AppDatabase _db;
  final DayRepository _days;
  final LineRepository _lines;
  final SettingsRepository _settings;

  Future<void> loadAll() async {
    await _settings.load();
    await _lines.load();
    await _days.load();
  }

  Future<void> deleteEverything() async {
    await _db.wipe();
    await loadAll();
  }
}
