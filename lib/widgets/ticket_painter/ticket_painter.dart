import 'dart:math';

import 'package:flutter/material.dart';
import 'package:travel_buddy/constants/color_constants.dart';

class TicketPainter extends CustomPainter {
  final double cornerRadius;
  final double arcRadius;

  TicketPainter({
    this.cornerRadius = 16.0,
    this.arcRadius = 20.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint borderPaint = Paint()
      ..color = ColorConstants.lightGrey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();

    path.moveTo(0.0, cornerRadius);
    path.lineTo(0, (size.height / 2.6) - arcRadius);
    path.addArc(
      Rect.fromCircle(
        center: Offset(0.0, size.height / 2.6),
        radius: arcRadius,
      ),
      1.5 * pi,
      pi,
    );
    path.lineTo(0, size.height - cornerRadius);
    path.quadraticBezierTo(0.0, size.height, cornerRadius, size.height);
    path.lineTo(size.width - cornerRadius, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - cornerRadius);
    path.lineTo(size.width, (size.height / 2.6) + arcRadius);
    path.addArc(
      Rect.fromCircle(
        center: Offset(size.width, size.height / 2.6),
        radius: arcRadius,
      ),
      0.5 * pi,
      pi,
    );
    path.lineTo(size.width, cornerRadius);
    path.quadraticBezierTo(size.width, 0.0, size.width - cornerRadius, 0.0);
    path.lineTo(cornerRadius, 0.0);
    path.quadraticBezierTo(0.0, 0.0, 0.0, cornerRadius);

    final Paint paintLine = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 2;

    _drawDashedLine(canvas, size, paintLine);

    canvas.drawPath(path, borderPaint);
  }

  void _drawDashedLine(Canvas canvas, Size size, Paint paint) {
    const int dashWidth = 6;
    const int dashSpace = 6;

    // Start to draw from left size.
    // Of course, you can change it to match your requirement.
    double startX = 0;
    double y = size.height / 2.6;

    // Repeat drawing until we reach the right edge.
    while (startX < size.width) {
      // Draw a small line.
      canvas.drawLine(Offset(startX, y), Offset(startX + dashWidth, y), paint);

      // Update the starting X
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TicketClipper extends CustomClipper<Path> {
  final double arcRadius;

  TicketClipper({
    this.arcRadius = 20.0,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addArc(
      Rect.fromCircle(
        center: Offset(0.0, size.height / 2.6),
        radius: arcRadius,
      ),
      1.5 * pi,
      pi,
    );
    path.addArc(
      Rect.fromCircle(
        center: Offset(size.width, size.height / 2.6),
        radius: arcRadius,
      ),
      0.5 * pi,
      pi,
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
