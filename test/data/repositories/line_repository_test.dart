// Copyright the BizCath contributors.
import 'package:flutter_test/flutter_test.dart';

import '../../support.dart';

void main() {
  test('has the placeholder lines, keeps favourites and shares', () async {
    final app = await TestApp.loaded();
    addTearDown(app.deps.close);
    final lines = app.deps.lines;
    expect(lines.all, hasLength(21));

    await lines.toggleFavourite('toast-1');
    await lines.load();
    expect(lines.byId('toast-1')!.favourite, isTrue);
    expect(lines.all, hasLength(21));

    await lines.share(lines.byId('found-1')!);
    expect(app.share.shared.single, endsWith('— Author, Work, Year'));
  });
}
