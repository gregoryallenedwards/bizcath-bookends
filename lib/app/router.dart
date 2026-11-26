// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/common/placeholder_screen.dart';
import '../ui/debug/debug_screen.dart';
import '../ui/debug/debug_view_model.dart';
import '../ui/evening/evening_screen.dart';
import '../ui/evening/evening_view_model.dart';
import '../ui/first_run/first_run_screen.dart';
import '../ui/first_run/first_run_view_model.dart';
import '../ui/morning/morning_screen.dart';
import '../ui/morning/morning_view_model.dart';
import '../ui/settings/about_screen.dart';
import '../ui/settings/settings_screen.dart';
import '../ui/shell/shell_screen.dart';
import '../ui/today/today_screen.dart';
import '../ui/today/today_view_model.dart';
import 'dependencies.dart';
import 'routes.dart';
import 'theme.dart';

GoRouter buildRouter({
  required Dependencies dependencies,
  required TodayViewModel todayViewModel,
  required DebugViewModel debugViewModel,
  required bool debugMenuEnabled,
}) {
  GoRoute tab(String path, Widget screen) =>
      GoRoute(path: path, builder: (context, state) => screen);

  GoRoute placeholder(String path, String title, String milestone) =>
      tab(path, PlaceholderScreen(title: title, milestone: milestone));

  return GoRouter(
    initialLocation: Routes.today,
    // Until the first run is done there is nowhere else to go, apart from
    // the debug menu that can reset it.
    refreshListenable: dependencies.settings,
    redirect: (context, state) {
      final done = dependencies.settings.current.firstRunDone;
      final atFirstRun = state.matchedLocation == Routes.firstRun;
      if (!done && !atFirstRun) return Routes.firstRun;
      return null;
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => ShellScreen(
          navigationShell: navigationShell,
          todayViewModel: todayViewModel,
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.today,
                builder: (context, state) => ListenableBuilder(
                  listenable: todayViewModel,
                  builder: (context, _) => Theme(
                    data: todayViewModel.isDark ? eveningTheme : dayTheme,
                    child: TodayScreen(viewModel: todayViewModel),
                  ),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [placeholder(Routes.lookBack, 'Look back', '3')],
          ),
          StatefulShellBranch(
            routes: [placeholder(Routes.lines, 'Lines', '3')],
          ),
          StatefulShellBranch(
            routes: [tab(Routes.settings, const SettingsScreen())],
          ),
        ],
      ),
      tab(Routes.about, AboutScreen(debugMenuEnabled: debugMenuEnabled)),
      if (debugMenuEnabled)
        tab(Routes.debug, DebugScreen(viewModel: debugViewModel)),
      GoRoute(
        path: Routes.firstRun,
        builder: (context, state) => FirstRunScreen(
          createViewModel: () =>
              FirstRunViewModel(settings: dependencies.settings),
        ),
      ),
      GoRoute(
        path: Routes.morning,
        builder: (context, state) => MorningScreen(
          createViewModel: () => MorningViewModel(
            clock: dependencies.clock,
            days: dependencies.days,
            lines: dependencies.lines,
            settings: dependencies.settings,
          ),
        ),
      ),
      GoRoute(
        path: Routes.evening,
        builder: (context, state) => Theme(
          data: eveningTheme,
          child: EveningScreen(
            createViewModel: () => EveningViewModel(
              clock: dependencies.clock,
              days: dependencies.days,
              settings: dependencies.settings,
            ),
          ),
        ),
      ),
      placeholder(Routes.breath, 'One slow breath', '3'),
      placeholder(Routes.steady, 'Steady', '3'),
    ],
  );
}
