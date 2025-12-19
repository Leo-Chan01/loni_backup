import 'package:flutter/material.dart';

class TextureOverlay extends StatelessWidget {
  const TextureOverlay({super.key, this.opacity = 0.03});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Positioned.fill(
      child: Opacity(
        opacity: opacity,
        child: CustomPaint(
          painter: _TexturePatternPainter(color: colorScheme.primary),
        ),
      ),
    );
  }
}

class _TexturePatternPainter extends CustomPainter {
  final Color color;

  _TexturePatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    const patternSize = 60.0;

    for (double x = 0; x < size.width; x += patternSize) {
      for (double y = 0; y < size.height; y += patternSize) {
        // Draw small crosses pattern
        canvas.drawRect(Rect.fromLTWH(x + 34, y + 32, 4, 2), paint);
        canvas.drawRect(Rect.fromLTWH(x + 36, y + 30, 2, 4), paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
