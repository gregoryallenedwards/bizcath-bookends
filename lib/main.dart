// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dependencies = Dependencies();
  await dependencies.load();
  runApp(BookendsApp(dependencies: dependencies));
}
