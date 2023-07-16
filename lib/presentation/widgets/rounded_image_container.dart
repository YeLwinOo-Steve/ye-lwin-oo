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
    return context.adaptive(
      projectImageWidget(context),
      projectImageWidget(context).addExpanded(),
    );
  }

  Widget projectImageWidget(BuildContext context) {
    final imageHeight = context.percentHeight(s24);
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
          height: context.adaptive(imageHeight, null),
          decoration: BoxDecoration(
            color: kSecondary,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        Positioned(
          right: -s20,
          bottom: -s30,
          width: width * 0.6,
          child: Hero(
            tag: tag,
            child:
                AspectRatio(aspectRatio: 11 / 9, child: Image.asset(imageUrl))
                    .addOpacity(opacity: s05),
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
    ).addPadding(
      edgeInsets: context.allPadding(p: margin),
    );
  }
}
