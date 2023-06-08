import 'package:flutter/material.dart';

import '../configs/configs.dart';

class AnimatedAppBar extends PreferredSize {
  AnimatedAppBar({
    super.key,
    required this.appBar,
    required this.animation,
  }) : super(
          child: appBar,
          preferredSize:
              Size.fromHeight(appBar.toolbarHeight ?? s100),
        );

  final AppBar appBar;

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
