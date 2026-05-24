import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:move_delivery/theme/app_colors.dart';

class MapBackdrop extends StatelessWidget {
  const MapBackdrop({
    super.key,
    this.blur = false,
    this.cornerRadius = 26,
    this.height,
    this.showCenterPin = true,
  });

  final bool blur;
  final double cornerRadius;
  final double? height;
  final bool showCenterPin;

  @override
  Widget build(BuildContext context) {
    final base = ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius),
      child: SizedBox(
        height: height,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF6F6F6),
                Color(0xFFE9E9E9),
              ],
            ),
          ),
          child: CustomPaint(
            painter: _MapPainter(),
            child: Stack(
              children: [
                if (showCenterPin)
                  Align(
                    alignment: const Alignment(0.10, 0.05),
                    child: _Pin(),
                  ),
                Align(
                  alignment: const Alignment(0.12, 0.30),
                  child: _ParcelBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (!blur) return base;

    return ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius),
      child: Stack(
        children: [
          base,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(color: Colors.white.withValues(alpha: 0.06)),
            ),
          ),
        ],
      ),
    );
  }
}

class _Pin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: const Icon(Icons.location_on_rounded,
          size: 18, color: AppColors.white),
    );
  }
}

class _ParcelBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 62,
      height: 46,
      decoration: BoxDecoration(
        color: AppColors.yellow,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.16),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintGrid = Paint()
      ..color = const Color(0xFFDBDBDB)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const step = 28.0;
    for (double x = -step; x < size.width + step; x += step) {
      canvas.drawLine(
          Offset(x, 0), Offset(x + size.height * 0.2, size.height), paintGrid);
    }
    for (double y = -step; y < size.height + step; y += step) {
      canvas.drawLine(
          Offset(0, y), Offset(size.width, y - size.width * 0.1), paintGrid);
    }

    final route = Paint()
      ..color = AppColors.yellow
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width * 0.15, size.height * 0.25)
      ..lineTo(size.width * 0.62, size.height * 0.25)
      ..lineTo(size.width * 0.62, size.height * 0.58)
      ..lineTo(size.width * 0.30, size.height * 0.58);

    final routeShadow = Paint()
      ..color = Colors.black.withValues(alpha: 0.08)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, routeShadow);
    canvas.drawPath(path, route);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
