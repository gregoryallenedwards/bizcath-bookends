// Copyright the BizCath contributors.

/// What has been recorded for one day. A day runs from 04:00 to 03:59.
class DayRecord {
  const DayRecord({
    required this.date,
    this.morningDone = false,
    this.eveningDone = false,
    this.morningFeeling,
    this.eveningFeeling,
    this.goal,
    this.line,
  });

  /// Calendar date (midnight) on which the day started.
  final DateTime date;
  final bool morningDone;
  final bool eveningDone;
  final String? morningFeeling;
  final String? eveningFeeling;
  final String? goal;
  final String? line;

  bool get showedUp => morningDone || eveningDone;
}
