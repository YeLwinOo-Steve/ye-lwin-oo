import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/constant_colors.dart';
import 'package:yelwinoo/presentation/configs/constant_strings.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../configs/configs.dart';

class AnimatedHoverLink extends AnimatedWidget {
  AnimatedHoverLink({
    super.key,
    required this.label,
    required this.controller,
  }) : super(listenable: controller);
  final AnimationController controller;
  final String label;

  final ValueNotifier<bool> _isHovered = ValueNotifier(false);
  void _onHover(bool isHovered) {
    _isHovered.value = isHovered;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (_, hover, __) {
        return MouseRegion(
          onEnter: (_) => _onHover(true),
          onHover: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: AnimatedTextSlideBoxTransition(
            controller: controller,
            coverColor: Theme.of(context).scaffoldBackgroundColor,
            text: label,
            textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: hover ? s5 : s3,
                  decorationColor: hover ? kBlack : kBlack26,
                ),
          ),
        );
      },
      valueListenable: _isHovered,
    );
  }
}
