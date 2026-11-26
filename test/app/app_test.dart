// Copyright the BizCath contributors.
import 'package:bookends/app/app.dart';
import 'package:bookends/data/services/clock_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Future<void> start(WidgetTester tester) => tester.pumpWidget(
    BookendsApp(
      clockService: ClockService(systemNow: () => DateTime(2026, 11, 26, 10)),
    ),
  );

  Future<void> openDebugMenu(WidgetTester tester) async {
    await tester.tap(find.text('Settings').last);
    await tester.pumpAndSettle();
    await tester.tap(find.text('About Bookends'));
    await tester.pumpAndSettle();
    await tester.longPress(find.text('Version 1.0.0'));
    await tester.pumpAndSettle();
  }

  testWidgets('the debug menu moves Today through all four states', (
    tester,
  ) async {
    await start(tester);
    expect(find.text('Start the day with Toast'), findsOneWidget);

    const expected = {
      'During the day': 'Toast is carrying',
      'Evening': 'Talk to Cocoa',
      'Night': 'Everything is exactly where it needs to be. Goodnight.',
      'Before the morning': 'Last night you said: calm',
    };
    for (final jump in expected.entries) {
      await openDebugMenu(tester);
      await tester.tap(find.widgetWithText(OutlinedButton, jump.key));
      await tester.pumpAndSettle();
      expect(find.text(jump.value), findsOneWidget, reason: jump.key);
      expect(find.text('Steady'), findsOneWidget);
    }
  });

  testWidgets('Today fits at 200% text size on a small phone', (tester) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearAllTestValues);

    await start(tester);
    expect(tester.takeException(), isNull);
  });
}
