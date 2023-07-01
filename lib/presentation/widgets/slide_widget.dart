import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/route/route_transitions.dart';

class SlideWidget extends AnimatedWidget {
  const SlideWidget(
    this.widget, {
    super.key,
    required this.animation,
    this.slidePosition = SlidePosition.left,
  }) : super(
          listenable: animation,
        );
  final Widget widget;
  final SlidePosition slidePosition;
  final Animation<double> animation;

  Animation<Offset> get topSlide =>
      Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero)
          .animate(curvedAnimation);
  Animation<Offset> get leftSlide =>
      Tween<Offset>(begin: const Offset(-0.5, 0), end: Offset.zero)
          .animate(curvedAnimation);
  Animation<Offset> get rightSlide =>
      Tween<Offset>(begin: const Offset(0.5, 0), end: Offset.zero)
          .animate(curvedAnimation);
  Animation<Offset> get bottomSlide =>
      Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero)
          .animate(curvedAnimation);

  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);

  bool get isLeftSlide => slidePosition == SlidePosition.left;
  bool get isRightSlide => slidePosition == SlidePosition.right;
  bool get isTopSlide => slidePosition == SlidePosition.top;

  Animation<Offset> get slideAnimation => isLeftSlide
      ? leftSlide
      : isRightSlide
          ? rightSlide
          : isTopSlide
              ? topSlide
              : bottomSlide;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: curvedAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: widget,
      ),
    );
  }
}
