import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

class RoundedImageContainer extends StatelessWidget {
  RoundedImageContainer({
    Key? key,
    required this.width,
    this.color = kBlack,
    this.borderRadius = s18,
    this.margin = s5,
    this.beginAlignment = Alignment.centerLeft,
    this.endAlignment = Alignment.centerRight,
    required this.animation,
    this.labelStyle,
    required this.index,
  })  : alignAnimation = Tween<AlignmentGeometry>(
          begin: beginAlignment,
          end: endAlignment,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        super(key: key);
  final double width;
  final Color color;
  final double borderRadius;
  final double margin;
  final Alignment beginAlignment;
  final Alignment endAlignment;
  final Animation<AlignmentGeometry> alignAnimation;
  final Animation<double> animation;
  TextStyle? labelStyle;
  final int index;

  @override
  Widget build(BuildContext context) {
    String label = '$index'.prefixZero();
    labelStyle = labelStyle ??
        context.headlineMedium.copyWith(
          color: kBlack,
        );
    Size labelSize = label.textSize(
      style: labelStyle,
    );
    return AlignTransition(
      alignment: alignAnimation,
      child: [
        Container(
          width: width,
          margin: EdgeInsets.all(margin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: kBlue100,
          ),
        ),
        Positioned(
          bottom: 0,
          left: s20,
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
      ].addStack(),
    ).addExpanded();
  }
}
