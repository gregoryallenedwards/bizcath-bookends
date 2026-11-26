// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

import '../../domain/models/feeling.dart';

/// Feeling chips, strength slider and the optional why field (screens B, H).
class CheckInForm extends StatelessWidget {
  const CheckInForm({
    super.key,
    required this.feelings,
    required this.feeling,
    required this.strength,
    required this.why,
    required this.onFeeling,
    required this.onStrength,
    required this.onWhy,
  });

  final List<Feeling> feelings;
  final Feeling? feeling;
  final Strength? strength;
  final String why;
  final ValueChanged<Feeling?> onFeeling;
  final ValueChanged<Strength> onStrength;
  final ValueChanged<String> onWhy;

  @override
  Widget build(BuildContext context) {
    void setStrength(double value) =>
        onStrength(Strength.values[value.round()]);
    // The thumb rests in the middle until a strength is chosen.
    final position = (strength ?? Strength.some).index.toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: 8,
          children: [
            for (final option in feelings)
              ChoiceChip(
                label: Text(option.label),
                selected: feeling == option,
                onSelected: (selected) => onFeeling(selected ? option : null),
              ),
          ],
        ),
        const SizedBox(height: 16),
        Text('How strongly? ${strength?.label ?? '(optional)'}'),
        Slider(
          value: position,
          max: 2,
          divisions: 2,
          onChangeStart: setStrength,
          onChanged: setStrength,
          semanticFormatterCallback: (value) =>
              Strength.values[value.round()].label,
        ),
        const Row(
          children: [
            Expanded(child: Text('a little')),
            Expanded(child: Text('a lot', textAlign: TextAlign.end)),
          ],
        ),
        const SizedBox(height: 16),
        TextFormField(
          initialValue: why,
          maxLength: 80,
          onChanged: onWhy,
          decoration: const InputDecoration(
            labelText: 'A word about why (optional)',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
