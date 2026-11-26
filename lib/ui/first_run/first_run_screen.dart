// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
import '../common/character.dart';
import 'first_run_view_model.dart';

const _gap = SizedBox(height: 16);

class FirstRunScreen extends StatefulWidget {
  const FirstRunScreen({super.key, required this.createViewModel});

  final FirstRunViewModel Function() createViewModel;

  @override
  State<FirstRunScreen> createState() => _FirstRunScreenState();
}

class _FirstRunScreenState extends State<FirstRunScreen> {
  late final FirstRunViewModel _viewModel = widget.createViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _pickTime(int minutes, ValueChanged<int> onPicked) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60),
    );
    if (picked != null) onPicked(picked.hour * 60 + picked.minute);
  }

  Widget _timeRow(String label, int minutes, ValueChanged<int> onPicked) {
    final time =
        '${(minutes ~/ 60).toString().padLeft(2, '0')}:'
        '${(minutes % 60).toString().padLeft(2, '0')}';
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      trailing: Text(time, style: Theme.of(context).textTheme.titleLarge),
      onTap: () => _pickTime(minutes, onPicked),
    );
  }

  List<Widget> _introduction() => [
    const CharacterSays(
      character: Character.toast,
      words:
          "I'm Toast, and I look after your mornings. "
          "Tell me how you are, and I'll carry one small thing for you.",
    ),
    _gap,
    const CharacterSays(
      character: Character.cocoa,
      words:
          "I'm Cocoa, and I look after your evenings. "
          "I'll ask how you are, and help you close the day.",
    ),
    _gap,
    FilledButton(onPressed: _viewModel.next, child: const Text('Next')),
  ];

  List<Widget> _times() => [
    const Text('When would you like each moment?'),
    _timeRow('Morning', _viewModel.morningMinutes, _viewModel.setMorning),
    _timeRow('Evening', _viewModel.eveningMinutes, _viewModel.setEvening),
    _gap,
    TextFormField(
      initialValue: _viewModel.firstName,
      maxLength: 40,
      onChanged: _viewModel.setFirstName,
      textCapitalization: TextCapitalization.words,
      decoration: const InputDecoration(
        labelText: 'Your first name (optional)',
        border: OutlineInputBorder(),
      ),
    ),
    _gap,
    FilledButton(onPressed: _viewModel.next, child: const Text('Next')),
  ];

  List<Widget> _notMedical() => [
    const Text('Bookends is not a medical or crisis service.'),
    _gap,
    FilledButton(
      onPressed: () async {
        await _viewModel.finish();
        if (mounted) context.go(Routes.today);
      },
      child: const Text('Go to Today'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) => PopScope(
        canPop: _viewModel.page == 0,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) _viewModel.back();
        },
        child: Scaffold(
          appBar: AppBar(
            leading: _viewModel.page == 0
                ? null
                : BackButton(onPressed: _viewModel.back),
            title: Text('Welcome · ${_viewModel.page + 1} of 3'),
          ),
          body: SafeArea(
            child: ListView(
              key: ValueKey(_viewModel.page),
              padding: const EdgeInsets.all(20),
              children: switch (_viewModel.page) {
                0 => _introduction(),
                1 => _times(),
                _ => _notMedical(),
              },
            ),
          ),
        ),
      ),
    );
  }
}
