// Copyright the BizCath contributors.
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../app/day_clock.dart';
import '../../app/today_state_machine.dart';
import '../../data/repositories/clock_repository.dart';
import '../../data/repositories/day_repository.dart';
import '../../data/repositories/line_repository.dart';
import '../../data/repositories/settings_repository.dart';
import '../../domain/content/words.dart';
import '../../domain/models/day_record.dart';
import '../../domain/models/feeling.dart';
import '../../domain/models/line.dart';
import '../../domain/models/note.dart';
import '../../domain/models/today_state.dart';

class TodayViewModel extends ChangeNotifier {
  TodayViewModel({
    required this._clock,
    required this._days,
    required this._lines,
    required this._settings,
    Duration tick = const Duration(seconds: 10),
  }) {
    for (final source in _sources) {
      source.addListener(notifyListeners);
    }
    _timer = Timer.periodic(tick, (_) => notifyListeners());
  }

  final ClockRepository _clock;
  final DayRepository _days;
  final LineRepository _lines;
  final SettingsRepository _settings;
  late final Timer _timer;

  List<Listenable> get _sources => [_clock, _days, _lines, _settings];

  DateTime get now => _clock.now();

  DateTime get _date => dayDateOf(now);

  DateTime get _yesterday => DateTime(_date.year, _date.month, _date.day - 1);

  DayRecord? get today => _days.dayFor(_date);

  TodayState get state => todayStateFor(
    now: now,
    eveningMinutes: _settings.current.eveningMinutes,
    today: today,
  );

  bool get isDark => state == TodayState.evening || state == TodayState.night;

  String get greeting => switch (now.hour) {
    < 12 => 'Good morning',
    < 17 => 'Good afternoon',
    _ => 'Good evening',
  };

  String get toastWords => wordsFor(_date, toastTodayWords);

  String get goodnight => wordsFor(_date, goodnightWords);

  int get daysShownUp => _days.daysShownUp;

  /// Last night's feeling with its strength.
  String? get lastNight {
    final checkIn = _days.dayFor(_yesterday)?.evening?.checkIn;
    return feelingLabel(checkIn?.feeling, checkIn?.strength);
  }

  /// The note Cocoa left last night.
  String? get noteFromCocoa =>
      _days.noteFor(_yesterday, NoteAuthor.cocoa)?.text;

  String? get noteForToast => _days.noteFor(_date, NoteAuthor.cocoa)?.text;

  Line? get line => _lines.byId(today?.morning?.lineId);

  Future<void> toggleSave() async {
    final current = line;
    if (current != null) await _lines.toggleFavourite(current.id);
  }

  Future<void> share() async {
    final current = line;
    if (current != null) await _lines.share(current);
  }

  /// Re-reads the clock, for example when the app returns to the foreground.
  void refresh() => notifyListeners();

  @override
  void dispose() {
    _timer.cancel();
    for (final source in _sources) {
      source.removeListener(notifyListeners);
    }
    super.dispose();
  }
}
