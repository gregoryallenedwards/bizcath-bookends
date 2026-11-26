// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';

/// Only the way to About exists so far; milestone 3 builds the rest.
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('About Bookends'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(Routes.about),
          ),
        ],
      ),
    );
  }
}
