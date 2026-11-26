// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/debug/debug_view_model.dart';
import '../ui/today/today_view_model.dart';
import 'dependencies.dart';
import 'router.dart';
import 'theme.dart';

class BookendsApp extends StatefulWidget {
  const BookendsApp({super.key, required this.dependencies});

  /// Already loaded.
  final Dependencies dependencies;

  @override
  State<BookendsApp> createState() => _BookendsAppState();
}

class _BookendsAppState extends State<BookendsApp> {
  late final Dependencies _deps = widget.dependencies;
  late final TodayViewModel _today = TodayViewModel(
    clock: _deps.clock,
    days: _deps.days,
    lines: _deps.lines,
    settings: _deps.settings,
  );
  late final DebugViewModel _debug = DebugViewModel(
    clock: _deps.clock,
    days: _deps.days,
    settings: _deps.settings,
    data: _deps.data,
  );
  late final GoRouter _router = buildRouter(
    dependencies: _deps,
    todayViewModel: _today,
    debugViewModel: _debug,
    debugMenuEnabled: kDebugMode,
  );

  @override
  void dispose() {
    _router.dispose();
    _debug.dispose();
    _today.dispose();
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
