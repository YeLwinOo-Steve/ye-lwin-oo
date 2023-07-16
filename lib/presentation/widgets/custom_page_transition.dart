import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

class CustomPageTransition extends AnimatedWidget {
  const CustomPageTransition({
    Key? key,
    required this.startController,
    this.index = 0,
    required this.height,
    required this.width,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.boxColor = kBlack,
    this.coverColor = kWhite,
    required this.slideInterval,
    this.visibleBoxCurve = Curves.easeInOut,
    this.invisibleBoxCurve = Curves.easeInOut,
  }) : super(key: key, listenable: startController);

  final AnimationController startController;
  final double height;
  final int index;
  final double width;
  final Color boxColor;
  final Color coverColor;
  final Curve visibleBoxCurve;
  final Curve invisibleBoxCurve;
  final Interval slideInterval;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;

  Animation<double> get visibleAnimation =>
      visibleBoxAnimation ??
      Tween<double>(begin: 0, end: height).animate(
        CurvedAnimation(
          parent: startController,
          curve: Interval(
            slideInterval.begin,
            slideInterval.end,
            curve: visibleBoxCurve,
          ),
        ),
      );

  Animation<double> get invisibleAnimation =>
      Tween<double>(begin: 0, end: height).animate(
        CurvedAnimation(
          parent: startController,
          curve: Interval(
            slideInterval.end,
            1,
            curve: invisibleBoxCurve,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Container(
        height: visibleAnimation.value,
        width: width,
        decoration: BoxDecoration(
          color: boxColor,
          border: const Border(),
        ),
      ),
      Container(
        height: invisibleAnimation.value,
        decoration: BoxDecoration(
          color: coverColor,
          border: Border.all(
              color: coverColor, strokeAlign: BorderSide.strokeAlignInside),
        ),
        width: width,
      ),
    ].addStack().addSizedBox(
          width: width,
          height: height,
        );
  }
}
