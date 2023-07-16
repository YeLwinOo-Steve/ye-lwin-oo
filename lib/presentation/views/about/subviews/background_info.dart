import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/route/route_transitions.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class BackgroundInfo extends StatelessWidget {
  const BackgroundInfo({
    super.key,
    required this.stickController,
    required this.textController,
    required this.infoController,
  });
  final AnimationController stickController;
  final AnimationController textController;
  final AnimationController infoController;

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
      SlideWidget(
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
          Text(
            ksWhatILove.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          verticalSpaceLarge,
          <Widget>[
            HobbyItem(
                icon: kiCoding,
                label: context.adaptive<String>(ksCodingMobile, ksCoding)),
            const HobbyItem(icon: kiCoffee, label: ksCoffee),
            const HobbyItem(icon: kiReading, label: ksReading),
            HobbyItem(
                icon: kiMusic,
                label: context.adaptive<String>(ksMusicMobile, ksMusic)),
            const HobbyItem(icon: kiMovie, label: ksMovie),
            HobbyItem(
                icon: kiExplore,
                label: context.adaptive<String>(ksExploreMobile, ksExplore)),
          ].addWrap(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: s10,
            vSpacing: s10,
          ),
        ]
            .addColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .addPadding(
              edgeInsets: context.symmetricPercentPadding(hPercent: s8),
            ),
        animation: infoController,
        slidePosition: SlidePosition.bottom,
      ),
    ].addColumn(
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
