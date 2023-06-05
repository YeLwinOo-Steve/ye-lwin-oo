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
  });
  final Animation<double> animation;
  final Animation<Offset> slideUpTween;
  final String label;
  final String description;
  final TextStyle labelStyle;
  final TextStyle descriptionStyle;
  final int index;
  @override
  Widget build(BuildContext context) {
    Size buttonSize = ksViewProject.textSize(
      style: Theme.of(context).textTheme.bodyMedium,
    );
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: slideUpTween,
        child: Stack(
          children: [
            Positioned(
              child: Opacity(
                opacity: s05,
                child: Text(
                  '$index'.prefixZero(),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: kSecondary,
                      ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomButton(
                      label: ksViewProject,
                      onPressed: () {},
                      icon: kiArrowForward,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
