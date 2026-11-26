// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
import '../../domain/models/today_state.dart';
import '../common/date_labels.dart';
import 'debug_view_model.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({super.key, required this.viewModel});

  final DebugViewModel viewModel;

  static const _jumps = {
    TodayState.beforeMorning: 'Before the morning',
    TodayState.duringDay: 'During the day',
    TodayState.evening: 'Evening',
    TodayState.night: 'Night',
  };

  Future<void> _pickMoment(BuildContext context) async {
    final now = viewModel.now;
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 2),
      lastDate: DateTime(now.year + 2),
    );
    if (date == null || !context.mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );
    if (time == null) return;
    viewModel.overrideClock(
      DateTime(date.year, date.month, date.day, time.hour, time.minute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Debug menu')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              '${viewModel.isOverridden ? 'Overridden' : 'Real'} clock: '
              '${timeLabel(viewModel.now)} · ${dateLabel(viewModel.now)}',
            ),
            const SizedBox(height: 16),
            const Text('Jump to (replaces today with sample data)'),
            for (final jump in _jumps.entries)
              OutlinedButton(
                onPressed: () async {
                  await viewModel.jumpTo(jump.key);
                  if (context.mounted) context.go(Routes.today);
                },
                child: Text(jump.value),
              ),
            const SizedBox(height: 16),
            const Text('Move the clock only'),
            OutlinedButton(
              onPressed: () {
                viewModel.moveToThisEvening();
                context.go(Routes.today);
              },
              child: const Text('To this evening'),
            ),
            OutlinedButton(
              onPressed: () {
                viewModel.moveToNextMorning();
                context.go(Routes.today);
              },
              child: const Text('To next morning'),
            ),
            OutlinedButton(
              onPressed: () => _pickMoment(context),
              child: const Text('Pick a date and time'),
            ),
            OutlinedButton(
              onPressed: viewModel.isOverridden ? viewModel.useRealClock : null,
              child: const Text('Use the real clock'),
            ),
            const SizedBox(height: 16),
            const Text('Data'),
            OutlinedButton(
              onPressed: () async {
                await viewModel.clearAll();
                if (context.mounted) context.go(Routes.today);
              },
              child: const Text('Clear all data'),
            ),
            OutlinedButton(
              onPressed: () async {
                await viewModel.resetFirstRun();
                if (context.mounted) context.go(Routes.today);
              },
              child: const Text('Reset first run'),
            ),
          ],
        ),
      ),
    );
  }
}
