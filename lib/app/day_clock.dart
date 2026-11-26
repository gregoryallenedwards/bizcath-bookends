// Copyright the BizCath contributors.

/// A day starts at 04:00 local time.
const int dayStartHour = 4;

/// Default evening time, in minutes after midnight (21:30).
const int defaultEveningMinutes = 21 * 60 + 30;

/// The date of the day that [now] belongs to.
DateTime dayDateOf(DateTime now) => now.hour < dayStartHour
    ? DateTime(now.year, now.month, now.day - 1)
    : DateTime(now.year, now.month, now.day);

/// Minutes since the day started, for a wall-clock time in minutes after
/// midnight.
int minutesIntoDay(int minutesAfterMidnight) =>
    (minutesAfterMidnight - dayStartHour * 60) % (24 * 60);
