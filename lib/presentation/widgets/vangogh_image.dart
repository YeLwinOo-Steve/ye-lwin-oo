import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class VanGoghImage extends StatelessWidget {
  VanGoghImage({
    Key? key,
    required this.hoveredIndex,
    required this.animation,
    required this.images,
    required this.coloredBoxAnimation,
  })  : _slideLeftAnimation = Tween<Offset>(
          begin: const Offset(1.3, 0),
          end: const Offset(0.2, 0),
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        super(key: key);
  final int hoveredIndex;
  final Animation<double> animation;
  final Animation<double> coloredBoxAnimation;
  final Animation<Offset> _slideLeftAnimation;
  final List<Image> images;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      SlideTransition(
        position: _slideLeftAnimation,
        child: <Widget>[
          Positioned(
            left: s0,
            bottom: s0,
            child: hoveredIndex < 0
                ? noSpace
                : AnimatedBox(
                    animation: coloredBoxAnimation,
                    color: kMenuColors[hoveredIndex],
                    targetWidth: context.percentWidth(s30),
                  ),
          ),
          Positioned(
            left: context.percentWidth(s5),
            bottom: context.percentHeight(s5),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(0.4),
              alignment: Alignment.centerLeft,
              child: hoveredIndex < 0
                  ? noSpace
                  : Container(
                      height: context.percentHeight(s40),
                      width: context.adaptive<double>(
                        context.percentWidth(s60),
                        context.percentWidth(s30),
                        md: context.percentWidth(s40),
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: images[hoveredIndex].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
            ),
          ),
        ].addStack().addSizedBox(
              width: context.adaptive<double>(
                  context.percentWidth(s80), context.percentWidth(s50)),
              height: context.percentHeight(s50),
            ),
      ),
    ].addStack();
  }
}

class AnimatedBox extends AnimatedWidget {
  const AnimatedBox({
    super.key,
    required this.animation,
    required this.targetWidth,
    required this.color,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final double targetWidth;
  final Color color;

  Animation<double> get widthAnimation => Tween<double>(
        begin: s0,
        end: targetWidth,
      ).animate(curvedAnimation);
  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      width: widthAnimation.value,
      height: context.percentHeight(s30),
      color: color,
    );
  }
}
