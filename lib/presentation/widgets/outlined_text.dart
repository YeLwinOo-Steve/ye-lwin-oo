import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.strokeColor,
    required this.textColor,
    this.strokeWidth = s4,
    this.letterSpacing = s1,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final double fontSize;
  final double letterSpacing;
  final Color strokeColor;
  final Color textColor;
  final double strokeWidth;
  final FontWeight fontWeight;
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
            ..color = strokeColor,
        ),
        textScaleFactor: context.textScaleFactor(),
      ),
      Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing,
          color: textColor,
        ),
        textScaleFactor: context.textScaleFactor(),
      ),
    ].addStack();
  }
}
