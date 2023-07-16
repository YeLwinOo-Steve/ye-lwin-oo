import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import 'animated_text_slide_box_transition.dart';

class IconLabel extends StatelessWidget {
  IconLabel({
    super.key,
    required this.icon,
    required this.controller,
    required this.label,
    required this.coverColor,
    this.textStyle,
  }) : _fadeAnimation = Tween<double>(begin: s0, end: s1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        );
  final IconData icon;
  final AnimationController controller;
  final Animation<double> _fadeAnimation;
  final String label;
  final Color coverColor;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      FadeTransition(opacity: _fadeAnimation, child: Icon(icon,size: context.adaptive(s18, s24),)),
      horizontalSpaceMassive,
      AnimatedTextSlideBoxTransition(
        controller: controller,
        text: label,
        coverColor: coverColor,
        textStyle: textStyle,
      ),
    ].addRow(
      mainAxisSize: MainAxisSize.min,
    );
  }
}
