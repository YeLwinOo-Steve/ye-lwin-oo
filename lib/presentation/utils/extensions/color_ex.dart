import 'package:flutter/material.dart';

extension ColorEx on String {
  Color toColor() {
    if (isEmpty) return Colors.white;
    if (startsWith('#') && length == 7) {
      return Color(int.parse('0xff${substring(1)}'));
    } else if (length == 6) {
      return Color(int.parse('0xff$this'));
    } else if (startsWith('0xff') || startsWith('0xFF')) {
      return Color(int.parse(this));
    }
    return Colors.white;
  }
}
