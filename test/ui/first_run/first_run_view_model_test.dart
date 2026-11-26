// Copyright the BizCath contributors.
import 'package:bookends/ui/first_run/first_run_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support.dart';

void main() {
  test('saves the times and the name', () async {
    final app = await TestApp.loaded();
    addTearDown(app.deps.close);
    final viewModel = FirstRunViewModel(settings: app.deps.settings);
    addTearDown(viewModel.dispose);
    viewModel
      ..next()
      ..setMorning(360)
      ..setEvening(1320)
      ..setFirstName(' Sam ');
    await viewModel.finish();

    final settings = app.deps.settings.current;
    expect(settings.firstRunDone, isTrue);
    expect(settings.morningMinutes, 360);
    expect(settings.eveningMinutes, 1320);
    expect(settings.firstName, 'Sam');
  });
}
