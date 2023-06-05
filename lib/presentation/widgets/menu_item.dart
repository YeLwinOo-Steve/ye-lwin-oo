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
    return [
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
            ? Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                )
            : Theme.of(context).textTheme.bodySmall!,
        duration: duration100,
        child: Text('${index + 1}'.prefixZero())
            .addOpacity(opacity: isHovered ? s1 : s05),
      ),
      horizontalSpaceMedium,
      AnimatedDefaultTextStyle(
        style: isHovered
            ? Theme.of(context).textTheme.headlineSmall!
            : Theme.of(context).textTheme.titleMedium!,
        duration: duration100,
        child: Text(label).addOpacity(opacity: isHovered ? s1 : s05),
      ),
    ]
        .addRow()
        .addContainer(
          decoration: const BoxDecoration(
            border: Border(),
          ),
        )
        .addExpanded();
  }
}
