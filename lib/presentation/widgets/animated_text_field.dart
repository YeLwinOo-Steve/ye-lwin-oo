import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/animated_horizontal_stick.dart';
import 'package:yelwinoo/presentation/widgets/animated_slide_box.dart';

import '../configs/configs.dart';

class AnimatedTextField extends StatelessWidget {
  const AnimatedTextField({
    super.key,
    this.textController,
    required this.hintText,
    this.width,
    this.isMultiline = false,
    this.isEmail = false,
    this.hasFocus = false,
    required this.node,
    required this.animation,
  });
  final double? width;
  final TextEditingController? textController;
  final String hintText;
  final bool? isMultiline;
  final bool? isEmail;
  final FocusNode node;
  final bool hasFocus;
  final AnimationController animation;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            focusNode: node,
            keyboardType: isMultiline == true
                ? TextInputType.multiline
                : isEmail == true
                    ? TextInputType.emailAddress
                    : TextInputType.text,
            controller: textController,
            onSubmitted: (String text) {},
            maxLines: isMultiline == true ? null : 1,
            textAlign: TextAlign.center,
            expands: false,
            decoration: InputDecoration(
              hintText: hintText,
              isCollapsed: true,
              contentPadding: context.allPadding(
                p: s12,
              ),
            ),
          ).addSizedBox(
            width: width ?? double.infinity,
          ),
          AnimatedUnderline(
            animation: animation,
            width: width ?? double.infinity,
          ),
        ],
      ),
    );
  }
}

class AnimatedUnderline extends AnimatedWidget {
  const AnimatedUnderline({
    super.key,
    required this.animation,
    required this.width,
  }) : super(
          listenable: animation,
        );
  final double width;
  final Animation<double> animation;

  Animation<double> get widthAnimation =>
      Tween<double>(begin: s0, end: width).animate(curvedAnimation);
  Animation<double> get curvedAnimation => CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutQuad,
      );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: s2,
          width: width,
          color: Colors.black12,
        ),
        Container(
          height: s2,
          width: widthAnimation.value,
          color: kBlack,
        )
      ],
    );
  }
}
