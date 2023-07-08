import 'package:flutter/material.dart';

import '../../../configs/configs.dart';

class AnimatedBackgroundCircle extends AnimatedWidget {
  const AnimatedBackgroundCircle({
    super.key,
    required this.animation,
    required this.targetWidth,
    required this.targetHeight,
  }) : super(
    listenable: animation,
  );
  final double targetWidth;
  final double targetHeight;
  final Animation<double> animation;

  double get largerSide => targetWidth > targetHeight ? targetWidth : targetHeight;
  Animation<double> get widthAnimation =>
      Tween<double>(begin: s150, end: largerSide).animate(curvedAnimation);
  Animation<double> get heightAnimation =>
      Tween<double>(begin: s150, end: largerSide).animate(curvedAnimation);
  Animation<double> get radiusAnimation =>
      Tween<double>(begin: widthAnimation.value * 0.5, end: 0).animate(curvedAnimation);

  Animation<double> get delayedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn);
  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnimation.value,
      height: heightAnimation.value,
      decoration: BoxDecoration(
        color: kSecondary,
        borderRadius: BorderRadius.circular(radiusAnimation.value),
      ),
    );
  }
}