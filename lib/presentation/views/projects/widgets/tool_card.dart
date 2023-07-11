import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../../../configs/configs.dart';

class ToolCard extends AnimatedWidget {
  const ToolCard({
    super.key,
    required this.animation,
    required this.bgAnimation,
    required this.size,
    required this.index,
    required this.tool,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final Animation<double> bgAnimation;
  final double size;
  final int index;
  final String tool;

  Animation<double> get paddingAnimation =>
      Tween<double>(begin: s0, end: size * 0.7 * index)
          .animate(curvedAnimation);
  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      tool,
      semanticsLabel: tool,
      width: size * 0.5,
      height: size * 0.5,
    )
        .addCenter()
        .addContainer(
          width: size,
          height: size,
          margin: context.padding(
            l: paddingAnimation.value,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(s28),
            color: kToolColors[index],
          ),
        )
        .addOpacity(opacity: bgAnimation.value);
  }
}
