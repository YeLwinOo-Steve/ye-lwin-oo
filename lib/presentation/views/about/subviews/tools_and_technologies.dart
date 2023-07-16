import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/route/route_transitions.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class ToolsAndTechnologies extends StatelessWidget {
  const ToolsAndTechnologies({
    super.key,
    required this.stickController,
    required this.textController,
    required this.techController,
  });
  final AnimationController stickController;
  final AnimationController textController;
  final AnimationController techController;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        AnimatedHorizontalStick(
          controller: stickController,
        ),
        horizontalSpaceMedium,
        AnimatedTextSlideBoxTransition(
          text: ksTools.toUpperCase(),
          controller: textController,
          coverColor: kPrimary,
          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
      ].addRow(),
      verticalSpaceMassive,
      SlideWidget(
        <Widget>[
          Text(
            ksMyTools,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          verticalSpaceSmall,
          <Widget>[
            Text(
              ksWeapon,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
            horizontalSpaceMedium,
            const FlutterLogo(
              size: s24,
            ),
            // Text(
            //   ksFlutter.toUpperCase(),
            //   style: Theme.of(context).textTheme.labelMedium?.copyWith(
            //     fontWeight: FontWeight.w300,
            //   ),
            // ),
          ].addWrap(),
          verticalSpaceMedium,
          <Widget>[
            <Widget>[
              Text(
                ksMobile,
                maxLines: 3,
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              verticalSpaceLarge,
              ...ksMobileTech
                  .map(
                    (tech) => Text(tech),
                  )
                  .toList(),
            ]
                .addColumn(
                  crossAxisAlignment: context.adaptive(
                      CrossAxisAlignment.center, CrossAxisAlignment.start),
                )
                .addExpanded(),
            <Widget>[
              Text(
                ksWebAndOther,
                maxLines: 3,
                softWrap: true,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              verticalSpaceLarge,
              <Widget>[
                ksWebTech
                    .map((tech) => Text(tech))
                    .toList()
                    .addColumn()
                    .addExpanded(),
                ksOtherTech
                    .map((tech) => Text(tech))
                    .toList()
                    .addColumn()
                    .addExpanded(),
              ].addRow(
                crossAxisAlignment: context.adaptive(
                    CrossAxisAlignment.center, CrossAxisAlignment.start),
              ),
            ]
                .addColumn(
                  crossAxisAlignment: context.adaptive(
                      CrossAxisAlignment.center, CrossAxisAlignment.start),
                )
                .addExpanded(
                  flex: 2,
                ),
          ].addRow(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ]
            .addColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .addPadding(
              edgeInsets: context.symmetricPercentPadding(hPercent: s8),
            ),
        animation: techController,
        slidePosition: SlidePosition.bottom,
      ),
    ].addColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
