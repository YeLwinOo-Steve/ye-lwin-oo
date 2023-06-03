import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

class FooterPath extends StatelessWidget {
  const FooterPath({
    super.key,
    required this.color,
    required this.animation,
  });
  final Color color;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AnimatedPathPainter(
        animation,
        color: color,
      ),
    );
  }
}

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color color;
  final double strokeWidth;
  AnimatedPathPainter(
    this._animation, {
    required this.color,
    this.strokeWidth = 5.0,
  }) : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    double height = size.height;
    double width = size.width;
    return Path()
      ..moveTo(0, height * 0.5)
      ..quadraticBezierTo(width / 2, height, width / 2 - 30, height * 0.5)
      ..quadraticBezierTo(width / 2 - 30, 0, width * 0.95, height * 0.3);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;
    final path = _createAnyPath(size).createAnimatedPath(animationPercent);

    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
