// Copyright the BizCath contributors.

enum Feeling {
  calm('calm'),
  hopeful('hopeful'),
  content('content'),
  tired('tired'),
  anxious('anxious'),
  low('low'),
  wired('wired'),
  notSure('not sure');

  const Feeling(this.label);

  final String label;
}

enum Strength {
  aLittle('a little'),
  some('some'),
  aLot('a lot');

  const Strength(this.label);

  final String label;
}

/// "calm", "calm · a little", or null when there is no feeling.
String? feelingLabel(Feeling? feeling, Strength? strength) {
  if (feeling == null) return null;
  return strength == null
      ? feeling.label
      : '${feeling.label} · ${strength.label}';
}
