import 'package:flutter/material.dart';

import '../configs/configs.dart';

class OutlinedText extends StatelessWidget {
  const OutlinedText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.strokeColor,
    required this.textColor,
    this.fontWeight = FontWeight.normal,
  });
  final String text;
  final double fontSize;
  final Color strokeColor;
  final Color textColor;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
// Stroked text as border.
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = s4
              ..color = strokeColor,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ],
    );
  }
}
