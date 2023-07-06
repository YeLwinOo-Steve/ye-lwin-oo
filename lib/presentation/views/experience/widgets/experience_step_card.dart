import 'package:flutter/material.dart';
import 'package:yelwinoo/data/model/experience.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../../../configs/configs.dart';
import 'three_d_flip.dart';

class ExperienceStepCard extends StatelessWidget {
  const ExperienceStepCard({
    super.key,
    required this.experience,
    required this.index,
    required this.animation,
    required this.start,
    required this.end,
  });
  final Experience experience;
  final Animation<double> animation;
  final double start;
  final double end;
  final int index;

  Animation<double> get curvedAnimation => CurvedAnimation(
        parent: animation,
        curve: Interval(
          start,
          end,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = context.percentPadding(
      t: s2,
      r: s3,
      b: s5,
    );
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: noSpace,
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topLeft,
              child: ThreeDFlip(
                animation: curvedAnimation,
                start: start,
                end: end,
                child: <Widget>[
                  Text(
                    "/ ${"$index".prefixZero()}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w200,
                        ),
                  ),
                  horizontalSpaceMassive,
                  Text(
                    "${experience.startDate.toMonthAndYear()} - ${experience.endDate.toMonthAndYear()}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w200,
                        ),
                  ),
                ]
                    .addRow(
                      mainAxisSize: MainAxisSize.min,
                    )
                    .addPadding(
                      edgeInsets: padding,
                    ),
              ),
            ),
          ),
          ThreeDFlip(
            animation: curvedAnimation,
            start: start,
            end: end,
            child: Container(
              width: s2,
              margin: context.percentPadding(
                r: s5,
              ),
              decoration: const BoxDecoration(
                color: kBlack,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: ThreeDFlip(
              animation: curvedAnimation,
              start: start,
              end: end,
              child: <Widget>[
                Text(
                  experience.company,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                verticalSpaceMedium,
                Text(experience.position),
                if (experience.type == JobType.remote) const Text("(remote)"),
                verticalSpaceMassive,
                ...experience.responsibilities
                    .map(
                      (responsibility) => Text(
                        responsibility.prefixDash(),
                      ),
                    )
                    .toList(),
              ]
                  .addColumn(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  )
                  .addPadding(
                    edgeInsets: padding,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
