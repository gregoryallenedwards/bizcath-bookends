// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

enum Character {
  toast('TOAST', 'Toast, the morning character'),
  cocoa('COCOA', 'Cocoa, the evening character');

  const Character(this.label, this.announcement);

  final String label;
  final String announcement;
}

/// A wireframe character with its words in a plain speech bubble.
class CharacterSays extends StatelessWidget {
  const CharacterSays({
    super.key,
    required this.character,
    required this.words,
  });

  final Character character;
  final String words;

  @override
  Widget build(BuildContext context) {
    final outline = Theme.of(context).colorScheme.outline;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CharacterFigure(character: character),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: outline),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(words),
          ),
        ),
      ],
    );
  }
}

/// Toast is an outlined circle; Cocoa an outlined crescent. No faces.
class CharacterFigure extends StatelessWidget {
  const CharacterFigure({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final colour = Theme.of(context).colorScheme.onSurface;
    return Semantics(
      label: character.announcement,
      image: true,
      excludeSemantics: true,
      child: SizedBox(
        width: 64,
        child: character == Character.toast
            // Toast's name sits inside the circle, Cocoa's under the crescent.
            ? _shape(
                colour,
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(child: _name()),
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [_shape(colour, null), _name()],
              ),
      ),
    );
  }

  Widget _shape(Color colour, Widget? child) => SizedBox.square(
    dimension: 64,
    child: CustomPaint(
      painter: _FigurePainter(character, colour),
      child: child,
    ),
  );

  Widget _name() =>
      FittedBox(fit: BoxFit.scaleDown, child: Text(character.label));
}

class _FigurePainter extends CustomPainter {
  const _FigurePainter(this.character, this.colour);

  final Character character;
  final Color colour;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colour
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    final bounds = (Offset.zero & size).deflate(1);
    final disc = Path()..addOval(bounds);
    if (character == Character.toast) {
      canvas.drawPath(disc, paint);
      return;
    }
    final bite = Path()
      ..addOval(bounds.shift(Offset(size.width * 0.34, -size.height * 0.12)));
    canvas.drawPath(Path.combine(PathOperation.difference, disc, bite), paint);
  }

  @override
  bool shouldRepaint(_FigurePainter old) =>
      old.character != character || old.colour != colour;
}
