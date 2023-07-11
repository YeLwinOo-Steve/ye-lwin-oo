import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class AnimatedStrokeText extends AnimatedWidget {
  const AnimatedStrokeText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.textColor,
    required this.animation,
    this.strokeWidth = s4,
    this.letterSpacing = s1,
    this.fontWeight = FontWeight.normal,
  }) : super(listenable: animation);
  final String text;
  final double fontSize;
  final double letterSpacing;
  final double strokeWidth;
  final FontWeight fontWeight;
  final Color textColor;
  final Animation<Color?> animation;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // Stroked text as border.
      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = strokeWidth
            ..color = animation.value!,
        ),
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: textColor,
        ),
      ),
    ].addStack();
  }
}
