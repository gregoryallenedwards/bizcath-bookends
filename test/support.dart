// Copyright the BizCath contributors.
import 'package:bookends/app/dependencies.dart';
import 'package:bookends/data/services/clock_service.dart';
import 'package:bookends/data/services/database.dart';
import 'package:bookends/data/services/share_service.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

class FakeShareService implements ShareService {
  final List<String> shared = [];

  @override
  Future<void> shareText(String text) async => shared.add(text);
}

/// An app on an in-memory database with a clock the test sets.
class TestApp {
  TestApp({DateTime? now, QueryExecutor? executor})
    : time = now ?? DateTime(2026, 11, 26, 8) {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    deps = Dependencies(
      database: AppDatabase(executor ?? NativeDatabase.memory()),
      clockService: ClockService(systemNow: () => time),
      shareService: share,
    );
  }

  DateTime time;
  final FakeShareService share = FakeShareService();
  late final Dependencies deps;

  static Future<TestApp> loaded({DateTime? now}) async {
    final app = TestApp(now: now);
    await app.deps.load();
    return app;
  }
}
