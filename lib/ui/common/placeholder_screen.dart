// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

/// Stands in for a screen that a later milestone builds.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.milestone,
  });

  final String title;
  final String milestone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Text(
            'Built in milestone $milestone.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
