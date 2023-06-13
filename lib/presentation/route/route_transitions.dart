import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/constant_sizes.dart';

enum SlidePosition { left, right, bottom, top }

class SlideRouteTransition extends PageRouteBuilder {
  final Widget enterWidget;
  final SlidePosition position;
  SlideRouteTransition({
    required this.enterWidget,
    this.position = SlidePosition.top,
    super.settings,
  }) : super(
            transitionDuration:
                position == SlidePosition.top ? duration500 : duration2000,
            reverseTransitionDuration: position == SlidePosition.top ? duration500 : duration2000,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return enterWidget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              Offset offset = Offset.zero;
              if (position == SlidePosition.top) {
                offset = const Offset(0.0, -1.0);
              } else if (position == SlidePosition.bottom) {
                offset = const Offset(0.0, 1.0);
              } else if (position == SlidePosition.left) {
                offset = const Offset(-1.0, 0.0);
              } else {
                offset = const Offset(1.0, 0.0);
              }
              return SlideTransition(
                position: Tween<Offset>(
                  begin: offset,
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset.zero,
                      end: offset,
                    ).animate(
                      CurvedAnimation(
                        parent: secondaryAnimation,
                        curve: Curves.easeInOut,
                      ),
                    ),
                    child: child),
              );
            });
}
