// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';

import '../../domain/models/day_record.dart';
import '../../domain/models/note.dart';
import '../services/database.dart';
import 'day_mapping.dart';

/// Source of truth for days and the notes left on them. Everything is read
/// into memory by [load]; writes go to the database first.
class DayRepository extends ChangeNotifier {
  DayRepository(this._db);

  final AppDatabase _db;
  final Map<DateTime, DayRecord> _days = {};
  final Map<(DateTime, NoteAuthor), Note> _notes = {};

  Future<void> load() async {
    _days.clear();
    _notes.clear();
    for (final row in await _db.select(_db.days).get()) {
      final record = dayFromRow(row);
      _days[record.date] = record;
    }
    for (final row in await _db.select(_db.notes).get()) {
      final note = Note(
        date: dateFromKey(row.dayDate),
        from: NoteAuthor.values.byName(row.author),
        text: row.body,
      );
      _notes[(note.date, note.from)] = note;
    }
    notifyListeners();
  }

  DayRecord? dayFor(DateTime date) => _days[date];

  Note? noteFor(DateTime date, NoteAuthor from) => _notes[(date, from)];

  /// Days with the morning or the evening done.
  int get daysShownUp => _days.values.where((day) => day.showedUp).length;

  /// Line ids used on the [days] days before [date].
  Set<String> lineIdsBefore(DateTime date, {int days = 14}) => {
    for (var back = 1; back <= days; back++)
      ?_days[DateTime(date.year, date.month, date.day - back)]?.morning?.lineId,
  };

  /// Saves a day and, with it, any note written at the same moment.
  Future<void> save(DayRecord record, {Note? note}) async {
    await _db.transaction(() async {
      await _db.into(_db.days).insertOnConflictUpdate(rowFromDay(record));
      if (note != null) {
        await _db
            .into(_db.notes)
            .insertOnConflictUpdate(
              NotesCompanion.insert(
                dayDate: dateKey(note.date),
                author: note.from.name,
                body: note.text,
              ),
            );
      }
    });
    _days[record.date] = record;
    if (note != null) _notes[(note.date, note.from)] = note;
    notifyListeners();
  }

  Future<void> remove(DateTime date) async {
    await _db.transaction(() async {
      final key = dateKey(date);
      await (_db.delete(_db.days)..where((t) => t.date.equals(key))).go();
      await (_db.delete(_db.notes)..where((t) => t.dayDate.equals(key))).go();
    });
    _days.remove(date);
    _notes.removeWhere((key, _) => key.$1 == date);
    notifyListeners();
  }
}
