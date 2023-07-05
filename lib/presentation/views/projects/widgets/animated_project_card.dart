import 'package:flutter/material.dart';
import 'package:yelwinoo/data/model/showcase_project.dart';
import 'package:yelwinoo/presentation/route/route_transitions.dart';
import 'package:yelwinoo/presentation/route/routes.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/project_details/project_details_view.dart';

import '../../../configs/configs.dart';


class AnimatedProjectCard extends AnimatedWidget {
  const AnimatedProjectCard({
    super.key,
    required this.animation,
    this.startAngle = 10,
    this.endAngle = -10,
    required this.bgColor,
    required this.project,
    this.index = 0,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final double startAngle;
  final double endAngle;
  final Color bgColor;
  final int index;
  final ShowcaseProject project;

  Animation<double> get rotateAnimation =>
      Tween<double>(begin: startAngle, end: endAngle).animate(curvedAnimation);

  Animation<double> get curvedAnimation => CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(rotateAnimation.value / 360),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            SlideRouteTransition(
              position: SlidePosition.right,
              enterWidget: ProjectDetailsView(
                project: project,
              ),
              settings: RouteSettings(
                name: '${Routes.projectDetails}/${project.title}',
              ),
            ),
          );
        },
        child: Container(
          width: context.percentWidth(s20),
          height: context.percentHeight(s50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(s20),
            color: bgColor,
          ),
          padding: context.allPadding(
            p: s20,
          ),
          child: Opacity(
            opacity: 1 - curvedAnimation.value,
            child: <Widget>[
              Text(
                index > 9 ? "/ $index" : "/ ${"$index".prefixZero()}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: kWhite,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                project.title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: kWhite),
              ),
              verticalSpaceMedium,
              Text(
                project.shortDescription,
                style: const TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  project.image,
                ),
              ),
            ].addColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ),
      ),
    ).addPadding(
      edgeInsets: context.symmetricPercentPadding(
        hPercent: s4,
        vPercent: s8,
      ),
    );
  }
}
