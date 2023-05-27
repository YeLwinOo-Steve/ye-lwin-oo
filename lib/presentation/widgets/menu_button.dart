import 'dart:math';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onPressed,
    this.hasMenuTapped = false,
  }) : super(key: key);
  final VoidCallback onPressed;
  final bool hasMenuTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: IconButton(
            padding: const EdgeInsets.all(4.0),
            onPressed: onPressed,
            iconSize: 40.0,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: Curves.easeInOut,
              switchOutCurve: Curves.easeInOut,
              reverseDuration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: child,
                );
              },
              child: Icon(
                key: ValueKey<bool>(hasMenuTapped),
                hasMenuTapped ? Atlas.xmark_circle : Atlas.two_line_bold,
              ),
            ),
          )),
    );
  }
}
