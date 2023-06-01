import 'package:flutter/material.dart';

extension StringEx on String {
  Size textSize({
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: this, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  String prefixZero() {
    return '0$this';
  }
  String addDoubleQuote(){
    return "“$this”";
  }
}
