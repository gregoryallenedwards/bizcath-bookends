// Copyright the BizCath contributors.
import 'package:flutter/material.dart';

import '../../domain/models/line.dart';

/// A line in a dashed-outline card, in italic, with Save and Share.
class LineCard extends StatelessWidget {
  const LineCard({
    super.key,
    required this.line,
    required this.onToggleSave,
    required this.onShare,
  });

  final Line line;
  final VoidCallback onToggleSave;
  final VoidCallback onShare;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomPaint(
          painter: _DashedBorderPainter(theme.colorScheme.outline),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
            child: Column(
              children: [
                Text(
                  line.text,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: onToggleSave,
                      icon: Icon(
                        line.favourite ? Icons.favorite : Icons.favorite_border,
                      ),
                      label: Text(line.favourite ? 'Saved' : 'Save'),
                    ),
                    TextButton.icon(
                      onPressed: onShare,
                      icon: const Icon(Icons.share_outlined),
                      label: const Text('Share'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(line.attribution, style: theme.textTheme.bodySmall),
      ],
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
