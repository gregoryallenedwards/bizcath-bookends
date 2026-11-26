// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';

import '../../app/day_clock.dart';
import '../../data/repositories/clock_repository.dart';
import '../../data/repositories/day_repository.dart';
import '../../data/repositories/settings_repository.dart';
import '../../domain/content/words.dart';
import '../../domain/models/day_record.dart';
import '../../domain/models/feeling.dart';
import '../../domain/models/note.dart';
import '../../domain/rules/note_templates.dart';
import '../common/check_in_draft.dart';

/// Screens H, I and J. Nothing is stored until [closeDay].
class EveningViewModel extends ChangeNotifier {
  EveningViewModel({
    required this._clock,
    required this._days,
    required this._settings,
  }) : date = dayDateOf(_clock.now());

  final ClockRepository _clock;
  final DayRepository _days;
  final SettingsRepository _settings;

  /// The day this evening belongs to, fixed when the flow opens.
  final DateTime date;

  final CheckInDraft checkIn = CheckInDraft();
  int _step = 0;
  GoalOutcome? _outcome;
  GoodKind? _goodKind;
  String _goodText = '';
  String? _editedNote;
  bool _saving = false;

  int get step => _step;
  GoalOutcome? get outcome => _outcome;
  GoodKind? get goodKind => _goodKind;
  String get goodText => _goodText;
  bool get saving => _saving;

  List<Feeling> get feelings => _settings.current.visibleFeelings;

  String get question => wordsFor(date, cocoaQuestions);

  String get goodnight => wordsFor(date, goodnightWords);

  String? get goal => _days.dayFor(date)?.morning?.goal;

  /// The goal without an article, to follow "your".
  String? get goalInQuestion {
    final value = goal;
    return value == null ? null : goalAfterYour(value);
  }

  /// "hopeful · a little", or null with no morning check-in.
  String? get thisMorning {
    final checkIn = _days.dayFor(date)?.morning?.checkIn;
    return feelingLabel(checkIn?.feeling, checkIn?.strength);
  }

  String? get _goodThing {
    final text = _goodText.trim();
    return switch (_goodKind) {
      null => null,
      GoodKind.own => text.isEmpty ? null : text,
      final kind => kind.label,
    };
  }

  /// The note for Toast: the user's wording if they changed it.
  String get note =>
      _editedNote ??
      cocoaNote(
        firstName: _settings.current.firstName,
        feeling: checkIn.feeling,
        goal: goal,
        outcome: _outcome,
        goodThing: _goodThing,
      );

  void setFeeling(Feeling? feeling) {
    checkIn.feeling = feeling;
    _changed();
  }

  void setStrength(Strength strength) {
    checkIn.strength = strength;
    notifyListeners();
  }

  void setWhy(String why) => checkIn.why = why;

  void setOutcome(GoalOutcome? outcome) {
    _outcome = outcome;
    _changed();
  }

  void setGoodKind(GoodKind? kind) {
    _goodKind = kind;
    _changed();
  }

  void setGoodText(String text) {
    _goodText = text;
    _editedNote = null;
  }

  void editNote(String text) => _editedNote = text;

  void next() {
    _step++;
    notifyListeners();
  }

  /// Returns false on the first step, where back leaves the flow.
  bool back() {
    if (_step == 0) return false;
    _step--;
    notifyListeners();
    return true;
  }

  void skipFeeling() {
    checkIn.clear();
    _editedNote = null;
    next();
  }

  void skipDay() {
    _outcome = null;
    _goodKind = null;
    _goodText = '';
    _editedNote = null;
    next();
  }

  /// Saves the evening and the note Cocoa leaves for Toast.
  Future<void> closeDay() async {
    if (_saving) return;
    _saving = true;
    notifyListeners();
    final text = note.trim();
    final goodThing = _goodThing;
    await _days.save(
      DayRecord(
        date: date,
        morning: _days.dayFor(date)?.morning,
        evening: Evening(
          completedAt: _clock.now(),
          checkIn: checkIn.toCheckIn(),
          outcome: goal == null ? null : _outcome,
          goodKind: goodThing == null ? null : _goodKind,
          goodText: _goodKind == GoodKind.own ? goodThing : null,
        ),
      ),
      note: text.isEmpty
          ? null
          : Note(date: date, from: NoteAuthor.cocoa, text: text),
    );
  }

  /// An answer changed, so the note is rebuilt from the answers.
  void _changed() {
    _editedNote = null;
    notifyListeners();
  }
}
