// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
import '../common/flow_scaffold.dart';
import 'morning_steps.dart';
import 'morning_view_model.dart';

class MorningScreen extends StatefulWidget {
  const MorningScreen({super.key, required this.createViewModel});

  final MorningViewModel Function() createViewModel;

  @override
  State<MorningScreen> createState() => _MorningScreenState();
}

class _MorningScreenState extends State<MorningScreen> {
  late final MorningViewModel _viewModel = widget.createViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _back() {
    if (!_viewModel.back()) context.go(Routes.today);
  }

  Future<void> _finish() async {
    await _viewModel.finish();
    if (mounted) context.go(Routes.today);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) => FlowScaffold(
        stepLabel: 'Morning · ${_viewModel.step + 1} of 3',
        onBack: _back,
        children: switch (_viewModel.step) {
          0 => howAreYouStep(_viewModel),
          1 => smallThingStep(_viewModel),
          _ => lineStep(_viewModel, onDone: _finish),
        },
      ),
    );
  }
}
