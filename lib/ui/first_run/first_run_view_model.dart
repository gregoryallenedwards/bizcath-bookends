// Copyright the BizCath contributors.
import 'package:flutter/foundation.dart';

import '../../data/repositories/settings_repository.dart';

class FirstRunViewModel extends ChangeNotifier {
  FirstRunViewModel({required this._settings})
    : _morningMinutes = _settings.current.morningMinutes,
      _eveningMinutes = _settings.current.eveningMinutes;

  final SettingsRepository _settings;
  int _page = 0;
  int _morningMinutes;
  int _eveningMinutes;
  String _firstName = '';

  int get page => _page;
  int get morningMinutes => _morningMinutes;
  int get eveningMinutes => _eveningMinutes;
  String get firstName => _firstName;

  void setMorning(int minutes) {
    _morningMinutes = minutes;
    notifyListeners();
  }

  void setEvening(int minutes) {
    _eveningMinutes = minutes;
    notifyListeners();
  }

  void setFirstName(String name) => _firstName = name;

  void next() {
    _page++;
    notifyListeners();
  }

  void back() {
    if (_page == 0) return;
    _page--;
    notifyListeners();
  }

  Future<void> finish() {
    final name = _firstName.trim();
    return _settings.save(
      _settings.current.afterFirstRun(
        morningMinutes: _morningMinutes,
        eveningMinutes: _eveningMinutes,
        firstName: name.isEmpty ? null : name,
      ),
    );
  }
}
