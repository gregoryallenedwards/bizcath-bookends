// Copyright the BizCath contributors.
import 'dart:io';

import 'package:bookends/app/app.dart';
import 'package:bookends/domain/models/app_settings.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support.dart';

void main() {
  /// Scrolls to [finder] if need be, taps it and waits.
  Future<void> tap(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> tapText(WidgetTester tester, String text) =>
      tap(tester, find.text(text));

  /// Starts the app as the phone would: from what is in the database file.
  Future<TestApp> launch(WidgetTester tester, File file, DateTime now) async {
    final app = TestApp(now: now, executor: NativeDatabase(file));
    await tester.runAsync(app.deps.load);
    await tester.pumpWidget(
      BookendsApp(key: UniqueKey(), dependencies: app.deps),
    );
    await tester.pumpAndSettle();
    return app;
  }

  Future<void> quit(WidgetTester tester, TestApp app) async {
    await tester.pumpWidget(const SizedBox());
    await tester.runAsync(app.deps.close);
  }

  testWidgets('first run, a morning, an evening and the note next morning', (
    tester,
  ) async {
    final folder = Directory.systemTemp.createTempSync('bookends');
    addTearDown(() => folder.deleteSync(recursive: true));
    final file = File('${folder.path}/test.sqlite');

    var app = await launch(tester, file, DateTime(2026, 11, 26, 8));
    await tapText(tester, 'Next');
    await tester.enterText(find.byType(TextFormField), 'Sam');
    await tapText(tester, 'Next');
    await tapText(tester, 'Go to Today');

    // Morning.
    await tapText(tester, 'Start the day with Toast');
    expect(find.text('Morning · 1 of 3'), findsOneWidget);
    await tapText(tester, 'tired');
    await tapText(tester, 'Next');
    await tapText(tester, 'Use this');
    await tapText(tester, 'Next');
    await tapText(tester, 'Save');
    await tapText(tester, 'Share');
    expect(app.share.shared, hasLength(1));
    await tapText(tester, 'Have a good day');
    expect(find.text('Toast is carrying'), findsOneWidget);

    // Restart: the morning is still there.
    await quit(tester, app);
    app = await launch(tester, file, DateTime(2026, 11, 26, 22));
    expect(find.text("Cocoa's here. How are you now?"), findsOneWidget);

    // Evening.
    await tapText(tester, 'Talk to Cocoa');
    expect(find.text('tired'), findsNWidgets(2));
    await tapText(tester, 'calm');
    await tapText(tester, 'Next');
    expect(find.textContaining('your one early night'), findsOneWidget);
    await tapText(tester, 'Partly');
    expect(find.textContaining('the day is done'), findsOneWidget);
    await tapText(tester, 'outside');
    await tapText(tester, 'Next');
    await tapText(tester, 'One slow breath');
    await tester.pageBack();
    await tester.pumpAndSettle();
    await tapText(tester, 'Close the day');
    expect(find.textContaining('tired → calm'), findsOneWidget);
    expect(find.textContaining('Good thing: outside'), findsOneWidget);

    // Next morning, after another restart.
    await quit(tester, app);
    app = await launch(tester, file, DateTime(2026, 11, 27, 8));
    const note = 'Sam was calm tonight and partly did one early night.';
    expect(find.textContaining(note), findsOneWidget);
    expect(find.text('Last night you said: calm'), findsOneWidget);
    await tapText(tester, 'Start the day with Toast');
    expect(find.textContaining(note), findsOneWidget);
    await quit(tester, app);
  });

  testWidgets('the debug menu moves Today through all four states', (
    tester,
  ) async {
    final app = TestApp(now: DateTime(2026, 11, 26, 10));
    await tester.runAsync(() async {
      await app.deps.load();
      await app.deps.settings.save(const AppSettings(firstRunDone: true));
    });
    await tester.pumpWidget(BookendsApp(dependencies: app.deps));
    await tester.pumpAndSettle();

    const expected = {
      'During the day': 'Toast is carrying',
      'Evening': 'Talk to Cocoa',
      'Night': 'Good thing: outside',
      'Before the morning': 'Last night you said: calm · a little',
    };
    for (final jump in expected.entries) {
      await tap(tester, find.text('Settings').last);
      await tapText(tester, 'About Bookends');
      await tester.longPress(find.text('Version 1.0.0'));
      await tester.pumpAndSettle();
      await tap(tester, find.widgetWithText(OutlinedButton, jump.key));
      expect(find.textContaining(jump.value), findsOneWidget);
      expect(find.text('Steady'), findsOneWidget);
    }
    await quit(tester, app);
  });

  testWidgets('both flows fit at 200% text size', (tester) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.textScaleFactorTestValue = 2;
    addTearDown(tester.view.reset);
    addTearDown(tester.platformDispatcher.clearAllTestValues);

    final app = TestApp(now: DateTime(2026, 11, 26, 8));
    await tester.runAsync(app.deps.load);
    await tester.pumpWidget(BookendsApp(dependencies: app.deps));
    await tester.pumpAndSettle();

    Future<void> scrollTap(String text) async {
      await tester.scrollUntilVisible(
        find.text(text),
        150,
        scrollable: find.byType(Scrollable).first,
      );
      await tapText(tester, text);
    }

    await scrollTap('Next');
    await scrollTap('Next');
    await scrollTap('Go to Today');
    await scrollTap('Start the day with Toast');
    await scrollTap('Next');
    await scrollTap('Next');
    await scrollTap('Have a good day');
    app.time = DateTime(2026, 11, 26, 22);
    app.deps.clock.clearOverride();
    await tester.pumpAndSettle();
    await scrollTap('Talk to Cocoa');
    await scrollTap('Next');
    await scrollTap('Next');
    await scrollTap('Close the day');
    expect(tester.takeException(), isNull);
    await quit(tester, app);
  });
}
