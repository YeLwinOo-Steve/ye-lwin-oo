import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class AnimatedTextField extends StatelessWidget {
  const AnimatedTextField({
    super.key,
    required this.onTap,
    this.textController,
    required this.hintText,
    this.width = s100,
    this.isMultiline = false,
  });
  final double width;
  final TextEditingController? textController;
  final VoidCallback onTap;
  final String hintText;
  final bool? isMultiline;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onTap: onTap,
            keyboardType: isMultiline == true ? TextInputType.multiline : TextInputType.text,
            controller: textController,
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
            width: width,
          ),
          Container(
            height: s2,
            color: kBlack26,
          ),
        ],
      ),
    );
  }
}
