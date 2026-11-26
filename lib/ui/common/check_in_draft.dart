// Copyright the BizCath contributors.
import '../../domain/models/day_record.dart';
import '../../domain/models/feeling.dart';

/// The answers to "how are you?" while a flow is open.
class CheckInDraft {
  Feeling? feeling;
  Strength? strength;
  String why = '';

  CheckIn toCheckIn() {
    final trimmed = why.trim();
    return CheckIn(
      feeling: feeling,
      strength: feeling == null ? null : strength,
      why: trimmed.isEmpty ? null : trimmed,
    );
  }

  void clear() {
    feeling = null;
    strength = null;
    why = '';
  }
}
