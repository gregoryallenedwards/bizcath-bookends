// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';

import '../../domain/models/day_record.dart';

/// Source of truth for days. Held in memory in milestone 1; milestone 2 moves
/// it to the database.
class DayRepository extends ChangeNotifier {
  final Map<DateTime, DayRecord> _days = {};

  DayRecord? dayFor(DateTime date) => _days[date];

  /// Days with the morning or the evening done.
  int get daysShownUp => _days.values.where((day) => day.showedUp).length;

  void save(DayRecord record) {
    _days[record.date] = record;
    notifyListeners();
  }

  void remove(DateTime date) {
    _days.remove(date);
    notifyListeners();
  }
}
