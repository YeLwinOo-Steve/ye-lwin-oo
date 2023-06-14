import 'package:flutter/material.dart';

import '../configs/configs.dart';

class AnimatedVerticalStick extends AnimatedWidget {
  const AnimatedVerticalStick({
    super.key,
    this.width = s2,
    required this.controller,
  }) : super(listenable: controller);

  final Animation<double> controller;
  final double width;
  Animation<double> get height => Tween<double>(begin: s0, end: s100).animate(
        CurvedAnimation(
          parent: controller,
          curve: Curves.easeInOut,
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height.value,
      color: kBlack,
    );
  }
}
