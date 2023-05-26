import 'dart:math';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationY(pi),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Atlas.two_line_bold,
          size: 50.0,
        ),
      ),
    );
  }
}
