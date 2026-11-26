// Copyright the BizCath contributors.
//
// Section 9.2 of the spec.
import '../models/feeling.dart';

class FeelingReply {
  const FeelingReply(this.sentence, this.suggestions);

  final String sentence;
  final List<String> suggestions;
}

const _calm = FeelingReply("Lovely. Let's keep it gentle.", [
  'a ten-minute walk',
  'drink a glass of water now',
  'tidy one small surface',
]);

const _edgy = FeelingReply("Let's give the day one steady thing.", [
  'three slow breaths before each meeting',
  'write the worry down once',
  'a short walk',
]);

FeelingReply replyFor(Feeling? feeling) => switch (feeling) {
  Feeling.calm || Feeling.content => _calm,
  Feeling.hopeful => const FeelingReply(
    "Feeling hopeful? Here's something small to carry that along.",
    [
      "start the thing you've been putting off, for five minutes",
      'message someone you like',
      'step outside at lunch',
    ],
  ),
  Feeling.tired => const FeelingReply(
    "Tired is allowed. Let's keep it small.",
    ['one early night', 'a five-minute rest with eyes closed', 'one easy meal'],
  ),
  Feeling.anxious || Feeling.wired => _edgy,
  Feeling.low => const FeelingReply(
    'Thanks for telling me. Something very small, then.',
    ['open a window', 'one shower', 'one kind message to yourself'],
  ),
  Feeling.notSure || null => const FeelingReply(
    "That's fine. Here's an easy one.",
    ['a glass of water', 'a short walk', "one thing you'd like to finish"],
  ),
};
