// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';

import '../../app/day_clock.dart';
import '../../data/repositories/clock_repository.dart';
import '../../data/repositories/day_repository.dart';
import '../../data/repositories/line_repository.dart';
import '../../data/repositories/settings_repository.dart';
import '../../domain/content/suggestions.dart';
import '../../domain/content/words.dart';
import '../../domain/models/day_record.dart';
import '../../domain/models/feeling.dart';
import '../../domain/models/line.dart';
import '../../domain/models/note.dart';
import '../../domain/rules/line_choice.dart';
import '../../domain/rules/note_templates.dart';
import '../common/check_in_draft.dart';

enum GoalChoice { none, suggestion, own }

/// Screens B, C and D. Nothing is stored until [finish].
class MorningViewModel extends ChangeNotifier {
  MorningViewModel({
    required this._clock,
    required this._days,
    required this._lines,
    required this._settings,
  }) : date = dayDateOf(_clock.now()) {
    _lines.addListener(notifyListeners);
  }

  final ClockRepository _clock;
  final DayRepository _days;
  final LineRepository _lines;
  final SettingsRepository _settings;

  /// The day this morning belongs to, fixed when the flow opens.
  final DateTime date;

  final CheckInDraft checkIn = CheckInDraft();
  int _step = 0;
  int _suggestion = 0;
  GoalChoice _choice = GoalChoice.none;
  String _ownGoal = '';
  bool _saving = false;

  int get step => _step;
  GoalChoice get choice => _choice;
  String get ownGoal => _ownGoal;
  bool get saving => _saving;

  List<Feeling> get feelings => _settings.current.visibleFeelings;

  String get question => wordsFor(date, toastQuestions);

  String? get noteFromCocoa => _days
      .noteFor(DateTime(date.year, date.month, date.day - 1), NoteAuthor.cocoa)
      ?.text;

  FeelingReply get reply => replyFor(checkIn.feeling);

  String get suggestion =>
      reply.suggestions[_suggestion % reply.suggestions.length];

  String? get goal => switch (_choice) {
    GoalChoice.none => null,
    GoalChoice.suggestion => suggestion,
    GoalChoice.own => _ownGoal.trim().isEmpty ? null : _ownGoal.trim(),
  };

  late final String _lineId = chooseLine(
    date: date,
    lines: _lines.all,
    recentIds: _days.lineIdsBefore(date),
    useMyLines: _settings.current.useMyLines,
  ).id;

  Line get line => _lines.byId(_lineId)!;

  void setFeeling(Feeling? feeling) {
    if (feeling == checkIn.feeling) return;
    checkIn.feeling = feeling;
    // A different feeling brings different suggestions.
    _suggestion = 0;
    if (_choice == GoalChoice.suggestion) _choice = GoalChoice.none;
    notifyListeners();
  }

  void setStrength(Strength strength) {
    checkIn.strength = strength;
    notifyListeners();
  }

  void setWhy(String why) => checkIn.why = why;

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
    setFeeling(null);
    checkIn.clear();
    next();
  }

  void useSuggestion() => _choose(GoalChoice.suggestion);

  void writeOwn() => _choose(GoalChoice.own);

  void another() {
    _suggestion++;
    _choice = GoalChoice.none;
    notifyListeners();
  }

  void setOwnGoal(String text) => _ownGoal = text;

  void noGoal() {
    _choice = GoalChoice.none;
    next();
  }

  Future<void> toggleSave() => _lines.toggleFavourite(_lineId);

  Future<void> share() => _lines.share(line);

  /// Saves the morning and the note Toast leaves for Cocoa.
  Future<void> finish() async {
    if (_saving) return;
    _saving = true;
    notifyListeners();
    final chosen = goal;
    await _days.save(
      DayRecord(
        date: date,
        morning: Morning(
          completedAt: _clock.now(),
          checkIn: checkIn.toCheckIn(),
          goal: chosen,
          goalSource: chosen == null
              ? GoalSource.none
              : _choice == GoalChoice.own
              ? GoalSource.own
              : GoalSource.suggested,
          lineId: _lineId,
        ),
        evening: _days.dayFor(date)?.evening,
      ),
      note: Note(
        date: date,
        from: NoteAuthor.toast,
        text: toastNote(
          firstName: _settings.current.firstName,
          feeling: checkIn.feeling,
          goal: chosen,
        ),
      ),
    );
  }

  void _choose(GoalChoice choice) {
    _choice = choice;
    notifyListeners();
  }

  @override
  void dispose() {
    _lines.removeListener(notifyListeners);
    super.dispose();
  }
}
