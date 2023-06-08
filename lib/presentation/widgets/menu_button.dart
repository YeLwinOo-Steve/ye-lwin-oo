import 'dart:math';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

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
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(s50),
        child: Icon(
          hasMenuTapped ? Atlas.xmark_circle : Atlas.two_line_bold,
          size: s40,
          color: kBlack,
        ).addCenter().addContainer(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              width: s65,
              height: s65,
            ),
      ),
    );
  }
}
