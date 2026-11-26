// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

/// One step of a guided flow: a step label, a back control and the content.
/// The system back gesture does the same as the back control.
class FlowScaffold extends StatelessWidget {
  const FlowScaffold({
    super.key,
    required this.stepLabel,
    required this.onBack,
    required this.children,
  });

  final String stepLabel;
  final VoidCallback onBack;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) onBack();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: onBack),
          title: Text(stepLabel),
        ),
        body: SafeArea(
          child: ListView(
            // A new list for each step, so each starts at the top.
            key: ValueKey(stepLabel),
            padding: const EdgeInsets.all(20),
            children: children,
          ),
        ),
      ),
    );
  }
}
