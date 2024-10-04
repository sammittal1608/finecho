import 'package:flutter/material.dart';

class CurvedNavigationBarPainter extends CustomPainter {
  final Color backgroundColor;
  final double curveHeight;

  CurvedNavigationBarPainter({
    required this.backgroundColor,
    this.curveHeight = 30,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final path = Path();
    final midPointX = size.width / 2;
    final controlPointY = curveHeight * 1.7; // Increase depth slightly to enhance the curve

    // Create the "U" shape path with a narrower width
    path.moveTo(0, 0);
    path.lineTo(midPointX - 40, 0); // Reduce width slightly
    path.quadraticBezierTo(midPointX, controlPointY, midPointX + 40, 0); // Adjust for a narrower curve
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Draw the curved area
    canvas.drawPath(path, paint);

    // Draw the gradient line along the curve with rounded corners
    final gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: [Colors.red.withOpacity(0.5), Colors.blue.withOpacity(0.5)], // Slightly lighter colors
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(Rect.fromLTWH(midPointX - 40, 0, 80, 1)) // Follow the narrower curve width
      ..strokeWidth = 1.2 // Thinner line
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round; // Rounded ends

    // Draw the gradient line following the curve with a border radius effect
    final curvePath = Path()
      ..moveTo(midPointX - 40, 0)
      ..quadraticBezierTo(midPointX, controlPointY, midPointX + 40, 0);

    // Draw the curve line with the gradient paint
    canvas.drawPath(curvePath, gradientPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
