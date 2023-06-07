import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

class CustomPageTransition extends AnimatedWidget {
  const CustomPageTransition({
    Key? key,
    required this.controller,
    this.index = 0,
    required this.height,
    required this.width,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.boxColor = Colors.black,
    this.coverColor = Colors.transparent,
    required this.interval,
    this.visibleBoxCurve = Curves.fastOutSlowIn,
    this.invisibleBoxCurve = Curves.fastOutSlowIn,
  }) : super(key: key, listenable: controller);

  final AnimationController controller;
  final double height;
  final int index;
  final double width;
  final Color boxColor;
  final Color coverColor;
  final Curve visibleBoxCurve;
  final Curve invisibleBoxCurve;
  final Interval interval;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;

  Animation<double> get visibleAnimation =>
      visibleBoxAnimation ??
      Tween<double>(begin: 0, end: height).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            interval.begin,
            interval.end,
            curve: visibleBoxCurve,
          ),
        ),
      );

  Animation<double> get invisibleAnimation =>
      Tween<double>(begin: 0, end: height).animate(
        CurvedAnimation(
          parent: controller,
          curve: Interval(
            interval.end,
            1,
            curve: invisibleBoxCurve,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return [
      Positioned(
        child: Container(
          height: visibleAnimation.value,
          width: width,
          decoration: BoxDecoration(
            color: boxColor,
            border: const Border.fromBorderSide(
              BorderSide.none,
            ),
          ),
        ),
      ),
      Positioned(
        child: Container(
          height: invisibleAnimation.value,
          decoration: BoxDecoration(
            color: coverColor,
            border: const Border.fromBorderSide(
              BorderSide.none,
            ),
          ),
          width: width,

        ),
      ),
    ].addStack().addSizedBox(
          width: width,
          height: height,
        );
  }
}
