import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';

class CustomSlider extends AnimatedWidget {
  CustomSlider({
    Key? key,
    required this.width,
    required this.height,
    required this.animation,
    this.color = kBlack,
    this.isForward = true,
    required this.interval,
  })  : forward = Tween<double>(begin: 0, end: width)
            .chain(
              CurveTween(
                curve: interval,
              ),
            )
            .animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
            ),
        backward = Tween<double>(begin: width, end: 0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        super(key: key, listenable: animation);
  final Animation<double> animation;
  final Interval interval;
  final double width;
  final double height;
  final Color color;
  final bool isForward;

  final Animation<double> forward;
  final Animation<double> backward;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isForward ? forward.value : backward.value,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: color,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
    );
  }
}
