import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.label,
    this.isHovered = false,
    required this.index,
    required this.height,
  }) : super(key: key);
  final String label;
  final bool isHovered;
  final int index;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: duration100,
              curve: Curves.easeInOut,
              width: isHovered ? s100 : s0,
              height: s3,
              decoration: BoxDecoration(
                color: kBlack,
                borderRadius: BorderRadius.circular(s5),
              ),
            ),
            horizontalSpaceMedium,
            AnimatedDefaultTextStyle(
              style: isHovered
                  ? context.bodyLarge.copyWith(
                      fontWeight: FontWeight.bold,
                    )
                  : context.bodySmall,
              duration: duration100,
              child: Opacity(
                  opacity: isHovered ? s1 : s05,
                  child: Text('${index+1}'.prefixZero())),
            ),
            horizontalSpaceMedium,
            AnimatedDefaultTextStyle(
              style: isHovered ? context.headlineSmall : context.titleMedium,
              duration: duration100,
              child: Opacity(
                opacity: isHovered ? s1 : s05,
                child: Text(label),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
