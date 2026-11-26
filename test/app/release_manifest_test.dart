// Copyright the BizCath contributors.
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('the main manifest asks for no INTERNET permission', () {
    final manifest = File('android/app/src/main/AndroidManifest.xml')
        .readAsStringSync();
    expect(manifest, isNot(contains('android.permission.INTERNET')));
  });
}
