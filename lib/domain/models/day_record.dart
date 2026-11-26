// Copyright the BizCath contributors.
import 'feeling.dart';

enum GoalSource { suggested, own, none }

enum GoalOutcome {
  did('Did it'),
  partly('Partly'),
  notToday('Not today');

  const GoalOutcome(this.label);

  final String label;
}

enum GoodKind {
  people('people'),
  rest('rest'),
  outside('outside'),
  smallWin('a small win'),
  work('work'),
  own('write my own');

  const GoodKind(this.label);

  final String label;
}

/// How someone was at one of the two moments.
class CheckIn {
  const CheckIn({this.feeling, this.strength, this.why});

  final Feeling? feeling;
  final Strength? strength;
  final String? why;
}

class Morning {
  const Morning({
    required this.completedAt,
    this.checkIn = const CheckIn(),
    this.goal,
    this.goalSource = GoalSource.none,
    this.lineId,
  });

  final DateTime completedAt;
  final CheckIn checkIn;
  final String? goal;
  final GoalSource goalSource;
  final String? lineId;
}

class Evening {
  const Evening({
    required this.completedAt,
    this.checkIn = const CheckIn(),
    this.outcome,
    this.goodKind,
    this.goodText,
  });

  final DateTime completedAt;
  final CheckIn checkIn;
  final GoalOutcome? outcome;
  final GoodKind? goodKind;
  final String? goodText;

  /// The good thing in words: the typed text, or the chip that was tapped.
  String? get goodThing => switch (goodKind) {
    null => null,
    GoodKind.own => goodText,
    final kind => kind.label,
  };
}

/// What has been recorded for one day. A day runs from 04:00 to 03:59.
class DayRecord {
  const DayRecord({required this.date, this.morning, this.evening});

  /// Calendar date (midnight) on which the day started.
  final DateTime date;
  final Morning? morning;
  final Evening? evening;

  bool get morningDone => morning != null;
  bool get eveningDone => evening != null;
  bool get showedUp => morningDone || eveningDone;
}
