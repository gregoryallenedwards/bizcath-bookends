// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

/// A line in a dashed-outline card, in italic.
class LineCard extends StatelessWidget {
  const LineCard({super.key, required this.line});

  final String line;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomPaint(
      painter: _DashedBorderPainter(theme.colorScheme.outline),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          line,
          textAlign: TextAlign.center,
          style: theme.textTheme.titleMedium?.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  const _DashedBorderPainter(this.colour);

  final Color colour;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = colour
      ..style = PaintingStyle.stroke;
    final outline = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(12)),
      );
    for (final metric in outline.computeMetrics()) {
      for (var start = 0.0; start < metric.length; start += 10) {
        canvas.drawPath(metric.extractPath(start, start + 6), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashedBorderPainter old) => old.colour != colour;
}
