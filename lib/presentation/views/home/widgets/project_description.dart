import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

class ProjectDescription extends StatelessWidget {
  const ProjectDescription({
    super.key,
    required this.animation,
    required this.slideUpTween,
    required this.label,
    required this.labelStyle,
    this.index = 0,
    required this.description,
    required this.descriptionStyle,
    required this.onPressed,
  });
  final Animation<double> animation;
  final Animation<Offset> slideUpTween;
  final String label;
  final String description;
  final TextStyle labelStyle;
  final TextStyle descriptionStyle;
  final VoidCallback onPressed;
  final int index;
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: slideUpTween,
        child: <Widget>[
          Text(
            '${index + 1}'.prefixZero(),
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  color: kSecondary,
                ),
          ).addOpacity(
            opacity: s05,
          ),
          <Widget>[
            Text(
              label,
              style: labelStyle,
            ),
            verticalSpaceMedium,
            Text(
              description,
              style: descriptionStyle,
            ),
            verticalSpaceSmall,
            <Widget>[
              CustomButton(
                label: ksViewProject,
                onPressed: onPressed,
                icon: kiArrowForward,
              ),
            ].addRow(
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ].addColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ].addStack(),
      ),
    );
  }
}
