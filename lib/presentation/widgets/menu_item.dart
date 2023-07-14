import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/utils/extensions/layout_adapter_ex.dart';

import '../configs/configs.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key? key,
    required this.label,
    this.isHovered = false,
    required this.index,
    required this.height,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final bool isHovered;
  final int index;
  final double height;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    TextStyle? menuLabelStyle = context.adaptive<TextStyle?>(
        Theme.of(context).textTheme.bodyLarge,
        Theme.of(context).textTheme.titleMedium,
        md: Theme.of(context).textTheme.titleSmall,
    );
    TextStyle? hoverMenuLabelStyle = context.adaptive<TextStyle?>(
      Theme.of(context).textTheme.titleSmall,
      Theme.of(context).textTheme.headlineSmall,
      md: Theme.of(context).textTheme.titleMedium,
    );
    double stickWidth = context.adaptive<double>(
      s50,
      s100,
      md: s70,
    );
    return <Widget>[
      AnimatedContainer(
        duration: duration100,
        curve: Curves.easeInOut,
        width: isHovered ? stickWidth : s0,
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
        style: isHovered ? hoverMenuLabelStyle! : menuLabelStyle!,
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
        .addInkWell(onTap: onTap);
  }
}
