import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

class CustomPageTransition extends AnimatedWidget {
  const CustomPageTransition({
    Key? key,
    required this.controller,
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
      Tween<double>(begin: 0, end: height)
          .animate(
            CurvedAnimation(
              parent: controller,
              curve: Interval(0.0, 0.5, curve: visibleBoxCurve),
            ),
          );

  Animation<double> get invisibleAnimation =>
      Tween<double>(begin: 0, end: height)
          .chain(
            CurveTween(
              curve: interval,
            ),
          )
          .animate(
            CurvedAnimation(
              parent: controller,
              curve: invisibleBoxCurve,
            ),
          );

  @override
  Widget build(BuildContext context) {
    return [
      Positioned(
        child: Container(
          height: visibleAnimation.value,
          width: width,
          color: boxColor,
        ),
      ),
      Positioned(
        top: 0,
        child: Container(
          height: invisibleAnimation.value,
          width: width,
          color: coverColor,
        ),
      ),
    ].addStack().addSizedBox(
          width: width,
          height: height,
        );
  }
}
