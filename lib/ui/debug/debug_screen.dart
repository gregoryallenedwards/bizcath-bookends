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
                onPressed: () {
                  viewModel.jumpTo(jump.key);
                  context.go(Routes.today);
                },
                child: Text(jump.value),
              ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () => _pickMoment(context),
              child: const Text('Pick a date and time'),
            ),
            OutlinedButton(
              onPressed: viewModel.isOverridden ? viewModel.useRealClock : null,
              child: const Text('Use the real clock'),
            ),
          ],
        ),
      ),
    );
  }
}
