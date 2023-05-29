import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class VanGoghImage extends StatelessWidget {
  VanGoghImage({
    Key? key,
    required this.hoveredIndex,
    required this.animation,
    required this.images,
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
  final Animation<Offset> _slideLeftAnimation;
  final List<Image> images;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideTransition(
          position: _slideLeftAnimation,
          child: SizedBox(
            width: context.percentWidth(s50),
            height: context.percentHeight(s50),
            child: Stack(
              children: [
                Positioned(
                  left: s0,
                  bottom: s0,
                  child: hoveredIndex < 0
                      ? noSpace
                      : Container(
                    width: context.percentWidth(s30),
                    height: context.percentHeight(s30),
                    color: kMenuColors[hoveredIndex],
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
                            width: context.percentWidth(s30),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: images[hoveredIndex].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
