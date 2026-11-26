// Copyright the BizCath contributors.
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

/// One row per day; [date] is "yyyy-mm-dd".
class Days extends Table {
  TextColumn get date => text()();
  TextColumn get morningFeeling => text().nullable()();
  TextColumn get morningStrength => text().nullable()();
  TextColumn get morningWhy => text().nullable()();
  TextColumn get goalText => text().nullable()();
  TextColumn get goalSource => text().nullable()();
  TextColumn get lineId => text().nullable()();
  DateTimeColumn get morningCompletedAt => dateTime().nullable()();
  TextColumn get eveningFeeling => text().nullable()();
  TextColumn get eveningStrength => text().nullable()();
  TextColumn get eveningWhy => text().nullable()();
  TextColumn get goalOutcome => text().nullable()();
  TextColumn get goodKind => text().nullable()();
  TextColumn get goodText => text().nullable()();
  DateTimeColumn get eveningCompletedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {date};
}

@DataClassName('LineRow')
class Lines extends Table {
  TextColumn get id => text()();
  TextColumn get body => text()();
  TextColumn get source => text()();
  TextColumn get author => text().nullable()();
  TextColumn get work => text().nullable()();
  TextColumn get year => text().nullable()();
  TextColumn get checkedSource => text().nullable()();
  BoolColumn get favourite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('NoteRow')
class Notes extends Table {
  TextColumn get dayDate => text()();
  TextColumn get author => text()();
  TextColumn get body => text()();

  @override
  Set<Column> get primaryKey => {dayDate, author};
}

/// Written from milestone 3.
class SteadySessions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get kind => text()();
  IntColumn get lengthMinutes => integer()();
  DateTimeColumn get startedAt => dateTime()();
  BoolColumn get completed => boolean()();
}

/// A single row with id 0.
class SettingsRows extends Table {
  IntColumn get id => integer()();
  IntColumn get morningMinutes => integer()();
  IntColumn get eveningMinutes => integer()();
  BoolColumn get morningReminderOn => boolean()();
  BoolColumn get eveningReminderOn => boolean()();
  BoolColumn get haptics => boolean()();
  TextColumn get reducedMotion => text()();

  /// Comma-separated feeling names.
  TextColumn get hiddenFeelings => text()();
  BoolColumn get useMyLines => boolean()();
  BoolColumn get firstRunDone => boolean()();
  TextColumn get firstName => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Days, Lines, Notes, SteadySessions, SettingsRows])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'bookends'));

  @override
  int get schemaVersion => 1;

  Future<void> wipe() => transaction(() async {
    for (final table in allTables) {
      await delete(table).go();
    }
  });
}
