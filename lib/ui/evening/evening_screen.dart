// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
import '../common/flow_scaffold.dart';
import 'evening_steps.dart';
import 'evening_view_model.dart';

class EveningScreen extends StatefulWidget {
  const EveningScreen({super.key, required this.createViewModel});

  final EveningViewModel Function() createViewModel;

  @override
  State<EveningScreen> createState() => _EveningScreenState();
}

class _EveningScreenState extends State<EveningScreen> {
  late final EveningViewModel _viewModel = widget.createViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _back() {
    if (!_viewModel.back()) context.go(Routes.today);
  }

  Future<void> _close() async {
    await _viewModel.closeDay();
    if (mounted) context.go(Routes.today);
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) => FlowScaffold(
        stepLabel: 'Evening · ${_viewModel.step + 1} of 3',
        onBack: _back,
        children: switch (_viewModel.step) {
          0 => howNowStep(_viewModel),
          1 => theDayStep(_viewModel),
          _ => goodnightStep(
            _viewModel,
            onBreath: () => context.push(Routes.breath),
            onClose: _close,
          ),
        },
      ),
    );
  }
}
