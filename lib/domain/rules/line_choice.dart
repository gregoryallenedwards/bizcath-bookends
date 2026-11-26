// Copyright the BizCath contributors.
import 'dart:math';

import '../models/line.dart';

/// Chooses the line for [date] (section 9.3). The same inputs give the same
/// line, so it does not change while the morning is open.
Line chooseLine({
  required DateTime date,
  required List<Line> lines,
  required Set<String> recentIds,
  required bool useMyLines,
}) {
  final random = Random(date.year * 10000 + date.month * 100 + date.day);
  List<Line> fresh(bool Function(Line) test) => [
    for (final line in lines)
      if (test(line) && !recentIds.contains(line.id)) line,
  ];

  final mine = fresh((line) => line.source == LineSource.own);
  final others = fresh((line) => line.source != LineSource.own);
  // One in five mornings may use one of the user's own lines.
  final myTurn = useMyLines && random.nextInt(5) == 0;
  var pool = myTurn && mine.isNotEmpty ? mine : others;
  if (pool.isEmpty) {
    pool = [
      for (final line in lines)
        if (line.source != LineSource.own) line,
    ];
  }
  return pool[random.nextInt(pool.length)];
}
