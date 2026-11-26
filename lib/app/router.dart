// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/common/placeholder_screen.dart';
import '../ui/debug/debug_screen.dart';
import '../ui/debug/debug_view_model.dart';
import '../ui/settings/about_screen.dart';
import '../ui/settings/settings_screen.dart';
import '../ui/shell/shell_screen.dart';
import '../ui/today/today_screen.dart';
import '../ui/today/today_view_model.dart';
import 'routes.dart';
import 'theme.dart';

GoRouter buildRouter({
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
      placeholder(Routes.morning, 'Morning', '2'),
      placeholder(Routes.evening, 'Evening', '2'),
      placeholder(Routes.steady, 'Steady', '3'),
    ],
  );
}
