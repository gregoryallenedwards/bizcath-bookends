// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/repositories/clock_repository.dart';
import '../data/repositories/day_repository.dart';
import '../data/services/clock_service.dart';
import '../ui/debug/debug_view_model.dart';
import '../ui/today/today_view_model.dart';
import 'router.dart';
import 'theme.dart';

class BookendsApp extends StatefulWidget {
  const BookendsApp({super.key, this.clockService});

  /// Tests pass a fixed clock.
  final ClockService? clockService;

  @override
  State<BookendsApp> createState() => _BookendsAppState();
}

class _BookendsAppState extends State<BookendsApp> {
  late final ClockRepository _clock = ClockRepository(
    widget.clockService ?? ClockService(),
  );
  final DayRepository _days = DayRepository();
  late final TodayViewModel _today = TodayViewModel(clock: _clock, days: _days);
  late final DebugViewModel _debug = DebugViewModel(clock: _clock, days: _days);
  late final GoRouter _router = buildRouter(
    todayViewModel: _today,
    debugViewModel: _debug,
    debugMenuEnabled: kDebugMode,
  );

  @override
  void dispose() {
    _router.dispose();
    _debug.dispose();
    _today.dispose();
    _days.dispose();
    _clock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BizCath Bookends',
      theme: dayTheme,
      routerConfig: _router,
    );
  }
}
