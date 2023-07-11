import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../../../configs/configs.dart';

class ThreeDFlip extends AnimatedWidget {
  const ThreeDFlip({
    super.key,
    required this.animation,
    required this.child,
    required this.start,
    required this.end,
  }) : super(
          listenable: animation,
        );
  final Animation<double> animation;
  final Widget child;
  final double start;
  final double end;

  Animation<double> get transformAnimation =>
      Tween<double>(begin: 1.5, end: s0).animate(
        animation,
      );
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.0015)
        ..rotateX(
          transformAnimation.value,
        ),
      child: child,
    ).addOpacity(opacity: animation.value);
  }
}
