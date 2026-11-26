// Copyright the BizCath contributors.
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

import '../../domain/content/lines.dart';
import '../../domain/models/line.dart' as model;
import '../services/database.dart';
import '../services/share_service.dart';

/// Source of truth for lines. The placeholder lines are added on first load.
class LineRepository extends ChangeNotifier {
  LineRepository(this._db, this._share);

  final AppDatabase _db;
  final ShareService _share;
  final Map<String, model.Line> _lines = {};

  Future<void> load() async {
    await _db.batch(
      (batch) => batch.insertAll(
        _db.lines,
        placeholderLines.map(_row),
        mode: InsertMode.insertOrIgnore,
      ),
    );
    _lines.clear();
    for (final row in await _db.select(_db.lines).get()) {
      _lines[row.id] = model.Line(
        id: row.id,
        text: row.body,
        source: model.LineSource.values.byName(row.source),
        author: row.author,
        work: row.work,
        year: row.year,
        checkedSource: row.checkedSource,
        favourite: row.favourite,
        createdAt: row.createdAt,
      );
    }
    notifyListeners();
  }

  List<model.Line> get all => List.unmodifiable(_lines.values);

  model.Line? byId(String? id) => id == null ? null : _lines[id];

  Future<void> toggleFavourite(String id) async {
    final line = _lines[id];
    if (line == null) return;
    final changed = line.withFavourite(!line.favourite);
    await _db.into(_db.lines).insertOnConflictUpdate(_row(changed));
    _lines[id] = changed;
    notifyListeners();
  }

  Future<void> share(model.Line line) => _share.shareText(line.shareText);

  LinesCompanion _row(model.Line line) => LinesCompanion.insert(
    id: line.id,
    body: line.text,
    source: line.source.name,
    author: Value(line.author),
    work: Value(line.work),
    year: Value(line.year),
    checkedSource: Value(line.checkedSource),
    favourite: Value(line.favourite),
    createdAt: line.createdAt,
  );
}
