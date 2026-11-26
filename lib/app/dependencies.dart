// Copyright the BizCath contributors.
import '../data/repositories/clock_repository.dart';
import '../data/repositories/data_repository.dart';
import '../data/repositories/day_repository.dart';
import '../data/repositories/line_repository.dart';
import '../data/repositories/settings_repository.dart';
import '../data/services/clock_service.dart';
import '../data/services/database.dart';
import '../data/services/share_service.dart';

/// The repositories the app is built from.
class Dependencies {
  Dependencies({
    AppDatabase? database,
    ClockService? clockService,
    ShareService? shareService,
  }) : _database = database ?? AppDatabase(),
       clock = ClockRepository(clockService ?? ClockService()) {
    days = DayRepository(_database);
    lines = LineRepository(_database, shareService ?? ShareService());
    settings = SettingsRepository(_database);
    data = DataRepository(_database, days, lines, settings);
  }

  final AppDatabase _database;
  final ClockRepository clock;
  late final DayRepository days;
  late final LineRepository lines;
  late final SettingsRepository settings;
  late final DataRepository data;

  Future<void> load() => data.loadAll();

  Future<void> close() async {
    clock.dispose();
    days.dispose();
    lines.dispose();
    settings.dispose();
    await _database.close();
  }
}
