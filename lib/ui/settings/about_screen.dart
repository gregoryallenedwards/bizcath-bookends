// Copyright the BizCath contributors.
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/routes.dart';

/// Name, version and the way into the debug menu; milestone 3 builds the rest.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key, required this.debugMenuEnabled});

  final bool debugMenuEnabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        children: [
          const ListTile(title: Text('BizCath Bookends')),
          ListTile(
            title: const Text('Version 1.0.0'),
            subtitle: Text(debugMenuEnabled ? 'debug' : 'official'),
            onLongPress: debugMenuEnabled
                ? () => context.push(Routes.debug)
                : null,
          ),
          const ListTile(
            title: Text('Bookends is not a medical or crisis service.'),
          ),
        ],
      ),
    );
  }
}
