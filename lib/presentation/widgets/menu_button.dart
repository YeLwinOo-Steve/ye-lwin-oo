import 'dart:math';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/context_ex.dart';

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
      padding: context.symmetricPadding(h: 30, v: 5),
      child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(pi),
          child: IconButton(
            padding: context.allPadding(p: 8.0),
            onPressed: onPressed,
            iconSize: 40.0,
            alignment: Alignment.center,
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
