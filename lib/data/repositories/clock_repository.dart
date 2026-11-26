// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';

import '../services/clock_service.dart';

class ClockRepository extends ChangeNotifier {
  ClockRepository(this._clock);

  final ClockService _clock;

  DateTime now() => _clock.now();

  /// The real time, ignoring any override.
  DateTime systemNow() => _clock.systemNow();

  bool get isOverridden => _clock.isOverridden;

  void override(DateTime moment) {
    _clock.override(moment);
    notifyListeners();
  }

  void clearOverride() {
    _clock.clearOverride();
    notifyListeners();
  }
}
