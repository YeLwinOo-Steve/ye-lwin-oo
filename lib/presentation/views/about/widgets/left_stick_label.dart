import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

class LeftStickLabel extends StatelessWidget {
  const LeftStickLabel(
      {super.key, required this.textController, required this.stickController});
  final AnimationController textController;
  final AnimationController stickController;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      RotatedBox(
        quarterTurns: 3,
        child: AnimatedTextSlideBoxTransition(
          text: ksAboutMe.toUpperCase(),
          controller: textController,
          coverColor: kPrimary,
          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ).addPadding(
        edgeInsets: context.symmetricPadding(
          h: context.adaptive(s20, s40),
          v: s20,
        ),
      ),
      AnimatedSlideBox(
        controller: stickController,
        height: context.percentHeight(s40),
        isVertical: true,
        coverColor: kPrimary,
        visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
        width: s6,
      ),
    ].addColumn();
  }
}