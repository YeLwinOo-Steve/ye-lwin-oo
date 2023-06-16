import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class BackgroundStory extends StatefulWidget {
  const BackgroundStory({super.key});

  @override
  State<BackgroundStory> createState() => _BackgroundStoryState();
}

class _BackgroundStoryState extends State<BackgroundStory>
    with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController _stickController;
  @override
  void initState() {
    super.initState();
    _textController = AnimationController(vsync: this, duration: duration2000);
    _stickController = AnimationController(vsync: this, duration: duration1000)
      ..forward();
    _stickController.addStatusListener(stickControllerListener);
  }

  void stickControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _textController.forward();
    }
  }

  @override
  void dispose() {
    _stickController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      RotatedBox(
        quarterTurns: 3,
        child: OutlinedText(
          text: ksYoung,
          fontSize: s24,
          letterSpacing: 1.5,
          strokeColor: kSecondary,
          textColor: kTransparent,
          strokeWidth: s1,
          fontWeight: FontWeight.w700,
        ),
      )
          .addPadding(
            edgeInsets: context.allPadding(
              p: s40,
            ),
          )
          .addAlign(
            alignment: Alignment.bottomRight,
          ),
      <Widget>[
        <Widget>[
          AnimatedHorizontalStick(
            controller: _stickController,
          ),
          horizontalSpaceMedium,
          AnimatedTextSlideBoxTransition(
            text: ksBgStory.toUpperCase(),
            controller: _textController,
            coverColor: kPrimary,
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ].addRow(),
        verticalSpaceMassive,
        Text(
          ksBriefAboutMe,
          style: Theme.of(context).textTheme.bodyLarge,
        ).addPadding(edgeInsets: context.symmetricPercentPadding(hPercent: s8)),
        verticalSpaceMedium,
        Text(
          ksMyLife,
          style: Theme.of(context).textTheme.bodyLarge,
        ).addPadding(edgeInsets: context.symmetricPercentPadding(hPercent: s8)),
        verticalSpaceSmall,
        Text(
          ksProfession,
          style: Theme.of(context).textTheme.bodyLarge,
        ).addPadding(edgeInsets: context.symmetricPercentPadding(hPercent: s8)),
        verticalSpaceMedium,
        AnimatedTextSlideBoxTransition(
          text: ksWhatILove.toUpperCase(),
          controller: _textController,
          coverColor: kPrimary,
          textStyle: Theme.of(context).textTheme.labelLarge,
        ).addPadding(edgeInsets: context.symmetricPercentPadding(hPercent: s8)),
        verticalSpaceLarge,
        const <Widget>[
          HobbyItem(icon: kiCoding, label: "Software Engineering"),
          HobbyItem(icon: kiCoffee, label: "Coffee"),
          HobbyItem(icon: kiReading, label: "Reading"),
          HobbyItem(icon: kiMusic, label: "80's,90's Music"),
          HobbyItem(icon: kiMovie, label: "Movies"),
          HobbyItem(icon: kiExplore, label: "Exploring more..."),
        ].addRow(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        ),
        context.percentSizedBox(
          pHeight: s5,
        ),
        <Widget>[
          AnimatedHorizontalStick(
            controller: _stickController,
          ),
          horizontalSpaceMedium,
          AnimatedTextSlideBoxTransition(
            text: ksTools.toUpperCase(),
            controller: _textController,
            coverColor: kPrimary,
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ].addRow(),
        verticalSpaceMassive,
        Text(
          ksMyTools,
          style: Theme.of(context).textTheme.bodyLarge,
        ).addPadding(edgeInsets: context.symmetricPercentPadding(hPercent: s8)),
        verticalSpaceSmall,
        <Widget>[
          Text(
            ksWeapon,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          horizontalSpaceMedium,
          Text(ksFlutter.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
              decorationThickness: s5,
              decorationColor: kBlack,
            ),
          ),
        ].addRow().addPadding(
            edgeInsets: context.symmetricPercentPadding(hPercent: s8)),
      ]
          .addColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .addContainer(
            margin:
                context.symmetricPercentPadding(hPercent: s8, vPercent: s20),
          ),
    ].addStack();
  }
}
