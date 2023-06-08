import 'package:flutter/material.dart';

import '../configs/configs.dart';

class AnimatedAppBar extends PreferredSize {
  const AnimatedAppBar({
    super.key,
    required this.appBar,
    required this.animation,
  }) : super(
          child: appBar,
          preferredSize:
              const Size.fromHeight(s100),
        );

  final Widget appBar;

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1)).animate(
        CurvedAnimation(parent: animation, curve: Curves.fastOutSlowIn),
      ),
      child: appBar,
    );
  }
}
