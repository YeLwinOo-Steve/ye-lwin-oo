import 'package:flutter/material.dart';

import '../configs/configs.dart';

class AnimatedHorizontalStick extends AnimatedWidget {
  const AnimatedHorizontalStick({
    super.key,
    this.height = s2,
    required this.controller,
  }) : super(listenable: controller);

  final Animation<double> controller;
  final double height;
  Animation<double> get width => Tween<double>(begin: s0, end: s100).animate(
    CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width.value,
      color: kBlack,
    );
  }
}
