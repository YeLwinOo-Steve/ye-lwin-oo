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
    required this.imageUrl,
    required this.tag,
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
  final String imageUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    String label = '$index'.prefixZero();
    labelStyle = labelStyle ??
        context.headlineMedium.copyWith(
          color: kBlack,
        );
    return AlignTransition(
      alignment: alignAnimation,
      child: <Widget>[
        Container(
          width: width,
          decoration: BoxDecoration(
            color: kSecondary,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        Positioned(
          right: -s20,
          bottom: -s30,
          width: width * 0.7,
          child: Hero(
            tag: tag,
            child:
                AspectRatio(aspectRatio: 12 / 9, child: Image.asset(imageUrl)),
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
    ).addPadding(edgeInsets: context.allPadding(p: margin)).addExpanded();
  }
}
