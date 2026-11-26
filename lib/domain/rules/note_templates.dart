// Copyright the BizCath contributors.
//
// Section 9.4 of the spec.
import '../models/day_record.dart';
import '../models/feeling.dart';

String _name(String? firstName) {
  final name = firstName?.trim() ?? '';
  return name.isEmpty ? 'They' : name;
}

String _sentence(String text) =>
    RegExp(r'[.!?]$').hasMatch(text) ? text : '$text.';

String cocoaNote({
  required String? firstName,
  Feeling? feeling,
  String? goal,
  GoalOutcome? outcome,
  String? goodThing,
}) {
  final name = _name(firstName);
  final was = name == 'They' ? 'were' : 'was';
  // With no feeling the template has nothing to say after "was".
  var first = feeling == null
      ? '$name checked in tonight'
      : '$name $was ${feeling.label} tonight';
  if (goal != null && outcome != null) {
    final verb = switch (outcome) {
      GoalOutcome.did => 'did',
      GoalOutcome.partly => 'partly did',
      GoalOutcome.notToday => "didn't get to",
    };
    first = '$first and $verb $goal';
  }
  return [
    _sentence(first),
    if (goodThing != null) _sentence('They said $goodThing'),
    'Be gentle with them in the morning.',
  ].join(' ');
}

String toastNote({required String? firstName, Feeling? feeling, String? goal}) {
  final started = [
    '${_name(firstName)} started the day',
    if (feeling != null) feeling.label,
    'and ${_name(firstName) == 'They' ? 'are' : 'is'} carrying',
    goal ?? 'nothing in particular',
  ].join(' ');
  return '${_sentence(started)} Look after them tonight.';
}

/// "a ten-minute walk" → "ten-minute walk", to follow the word "your".
String goalAfterYour(String goal) =>
    goal.replaceFirst(RegExp(r'^(a|an) ', caseSensitive: false), '');
