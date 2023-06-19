import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';


class ToolsAndTechnologies extends StatelessWidget {
  const ToolsAndTechnologies({
    super.key,
    required this.stickController,
    required this.textController,
  });
  final AnimationController stickController;
  final AnimationController textController;
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
          Text(
            ksFlutter.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
              decorationThickness: s2,
              decorationColor: kBlack,
            ),
          ),
        ].addRow(),
        verticalSpaceMedium,
        <Widget>[
          <Widget>[
            Text(
              ksMobile,
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
            crossAxisAlignment: CrossAxisAlignment.start,
          )
              .addExpanded(),
          <Widget>[
            Text(
              ksWebAndOther,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            verticalSpaceLarge,
            <Widget>[
              ksWebTech
                  .map((tech) => Text(tech))
                  .toList()
                  .addColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              )
                  .addExpanded(),
              ksOtherTech
                  .map((tech) => Text(tech))
                  .toList()
                  .addColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              )
                  .addExpanded(),
            ].addRow(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ]
              .addColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
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
          edgeInsets: context.symmetricPercentPadding(hPercent: s8)),
    ].addColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}