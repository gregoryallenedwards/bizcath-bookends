// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';
import '../../domain/models/today_state.dart';
import 'today_states.dart';
import 'today_view_model.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key, required this.viewModel});

  final TodayViewModel viewModel;

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onResume: widget.viewModel.refresh);
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) => AnnotatedRegion<SystemUiOverlayStyle>(
        // With no app bar, the status bar icons have to be set here.
        value: viewModel.isDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: SafeArea(
            child: ListView(
              // Room at the bottom so the Steady button never covers content.
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 96),
              children: switch (viewModel.state) {
                TodayState.beforeMorning => beforeMorning(context, viewModel),
                TodayState.duringDay => duringDay(context, viewModel),
                TodayState.evening => eveningState(context, viewModel),
                TodayState.night => nightState(context, viewModel),
              },
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => context.push(Routes.steady),
            label: const Text('Steady'),
          ),
        ),
      ),
    );
  }
}
