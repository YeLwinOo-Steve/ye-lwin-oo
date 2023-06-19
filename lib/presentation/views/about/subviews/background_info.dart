
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class BackgroundInfo extends StatelessWidget {
  const BackgroundInfo({
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
          text: ksBgStory.toUpperCase(),
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
          ksBriefAboutMe,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        verticalSpaceMedium,
        Text(
          ksMyLife,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        verticalSpaceSmall,
        Text(
          ksProfession,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        verticalSpaceMedium,
        AnimatedTextSlideBoxTransition(
          text: ksWhatILove.toUpperCase(),
          controller: textController,
          coverColor: kPrimary,
          textStyle: Theme.of(context).textTheme.labelLarge,
        ),
        verticalSpaceLarge,
        const <Widget>[
          HobbyItem(icon: kiCoding, label: ksCoding),
          HobbyItem(icon: kiCoffee, label: ksCoffee),
          HobbyItem(icon: kiReading, label: ksReading),
          HobbyItem(icon: kiMusic, label: ksMusic),
          HobbyItem(icon: kiMovie, label: ksMovie),
          HobbyItem(icon: kiExplore, label: ksExplore),
        ].addRow(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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