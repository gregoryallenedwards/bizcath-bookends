// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme.dart';
import '../today/today_view_model.dart';

/// Bottom navigation around the four tabs. The Today tab, including the bar,
/// is dark in the evening and at night.
class ShellScreen extends StatelessWidget {
  const ShellScreen({
    super.key,
    required this.navigationShell,
    required this.todayViewModel,
  });

  final StatefulNavigationShell navigationShell;
  final TodayViewModel todayViewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: todayViewModel,
      builder: (context, _) {
        final dark = navigationShell.currentIndex == 0 && todayViewModel.isDark;
        return Theme(
          data: dark ? eveningTheme : dayTheme,
          child: Scaffold(
            body: navigationShell,
            bottomNavigationBar: NavigationBar(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.today_outlined),
                  label: 'Today',
                ),
                NavigationDestination(
                  icon: Icon(Icons.calendar_month_outlined),
                  label: 'Look back',
                ),
                NavigationDestination(
                  icon: Icon(Icons.notes_outlined),
                  label: 'Lines',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
