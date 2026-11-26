// Copyright the BizCath contributors.
import 'feeling.dart';

enum ReducedMotion { system, on, off }

/// Times are minutes after midnight.
class AppSettings {
  const AppSettings({
    this.morningMinutes = 7 * 60 + 30,
    this.eveningMinutes = 21 * 60 + 30,
    this.morningReminderOn = true,
    this.eveningReminderOn = true,
    this.haptics = true,
    this.reducedMotion = ReducedMotion.system,
    this.hiddenFeelings = const {},
    this.useMyLines = true,
    this.firstRunDone = false,
    this.firstName,
  });

  final int morningMinutes;
  final int eveningMinutes;
  final bool morningReminderOn;
  final bool eveningReminderOn;
  final bool haptics;
  final ReducedMotion reducedMotion;
  final Set<Feeling> hiddenFeelings;
  final bool useMyLines;
  final bool firstRunDone;
  final String? firstName;

  List<Feeling> get visibleFeelings => [
    for (final feeling in Feeling.values)
      if (!hiddenFeelings.contains(feeling)) feeling,
  ];

  /// What the first run asks for.
  AppSettings afterFirstRun({
    required int morningMinutes,
    required int eveningMinutes,
    String? firstName,
  }) => AppSettings(
    morningMinutes: morningMinutes,
    eveningMinutes: eveningMinutes,
    morningReminderOn: morningReminderOn,
    eveningReminderOn: eveningReminderOn,
    haptics: haptics,
    reducedMotion: reducedMotion,
    hiddenFeelings: hiddenFeelings,
    useMyLines: useMyLines,
    firstRunDone: true,
    firstName: firstName,
  );
}
