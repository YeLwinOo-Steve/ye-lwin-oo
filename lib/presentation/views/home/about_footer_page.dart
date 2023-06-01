import 'dart:math';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yelwinoo/data/model/quote.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../widgets/animated_path.dart';

class AboutAndFooterPage extends StatefulWidget {
  const AboutAndFooterPage({Key? key}) : super(key: key);

  @override
  State<AboutAndFooterPage> createState() => _AboutAndFooterPageState();
}

class _AboutAndFooterPageState extends State<AboutAndFooterPage>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _labelController;
  final List<Interval> _itemSlideIntervals = [];
  int sectors = 5;
  double screenHeight = 0.0;
  double sectorHeight = 0.0;
  double quoteHeight = 0.0;
  double footerHeight = 0.0;
  double quoteWidth = 0.0;
  Duration get staggeredDuration => duration100;
  Duration get itemSlideDuration => duration1000;
  Duration get labelDuration => duration1000;
  Duration get slideDuration =>
      staggeredDuration + (staggeredDuration * sectors) + itemSlideDuration;
  List<Color> get sectorColors => [
        kBlue100,
        kBlue100,
        kBlue100,
        kBlack,
        kBlack,
      ];
  Quote randomQuote = ksQuotes[Random().nextInt(ksQuotes.length)];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createStaggeredIntervals();
    screenHeight = context.screenHeight - context.percentHeight(s20);
    sectorHeight = screenHeight / sectors;
    quoteHeight = (context.screenHeight / sectors) * 3;
    quoteWidth = context.screenWidth * 0.06;
    footerHeight = (context.screenHeight / sectors) * 2;
    _slideController = AnimationController(
      duration: slideDuration,
      vsync: this,
    )..forward();
    _labelController = AnimationController(
      duration: labelDuration,
      vsync: this,
    );
    _slideController.addListener(_slideControllerListener);
  }

  void _slideControllerListener() {
    if (_slideController.isCompleted) {
      _labelController.forward();
    } else if (_slideController.isDismissed) {
      _labelController.reset();
    }
  }

  void createStaggeredIntervals() {
    for (int i = 0; i < sectors; i++) {
      final Duration start = staggeredDuration + (staggeredDuration * i);
      final Duration end = start + itemSlideDuration;
      _itemSlideIntervals.add(
        Interval(
          start.inMilliseconds / slideDuration.inMilliseconds,
          end.inMilliseconds / slideDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        ...List.generate(
          sectors,
          (index) => CustomSlider(
            width: context.screenWidth,
            height: sectorHeight,
            color: sectorColors[index],
            animation: _slideController.view,
            interval: _itemSlideIntervals[index],
          ).addExpanded(),
        ),
      ].addColumn(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      <Widget>[
        Container(
          height: quoteHeight,
          width: context.screenWidth,
          margin: context.symmetricPadding(h: quoteWidth / 2),
          child: <Widget>[
            AnimatedTextSlideBoxTransition(
              controller: _labelController,
              coverColor: kBlue100,
              text: randomQuote.name.addDoubleQuote(),
              width: context.screenWidth - quoteWidth,
              maxLines: 5,
              textAlign: TextAlign.center,
              textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                AnimatedTextSlideBoxTransition(
                  controller: _labelController,
                  coverColor: kBlue100,
                  width: context.screenWidth - quoteWidth,
                  text: "— ${randomQuote.author}",
                  textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
                horizontalSpaceEnormous,
              ],
            ),
          ].addColumn(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Container(
          height: footerHeight,
          width: context.screenWidth,
          padding: context.symmetricPadding(h: s80),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Let's work together!",
                          style: context.titleLarge.copyWith(
                            color: kWhite,
                          ),
                        ),
                        verticalSpaceMassive,
                        Text(
                          "I'm available for Freelancing",
                          style: context.titleSmall.copyWith(
                            color: kWhite,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: context.symmetricPadding(
                          h: s20,
                        ),
                        child: SizedBox(
                          height: footerHeight,
                          child: const AnimatedPathDemo(
                            color: kWhite,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          "- Contact Info",
                          style: context.bodyLarge.copyWith(
                            color: kWhite,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Atlas.mailbox,
                              color: kWhite,
                              size: s18,
                            ),
                            horizontalSpaceMedium,
                            Text(
                              "yelwinoo.work@gmail.com",
                              style: context.bodyMedium.copyWith(
                                color: kWhite,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Atlas.office_phone,
                              color: kWhite,
                              size: s18,
                            ),
                            horizontalSpaceMedium,
                            Text(
                              "+959 976294818",
                              style: context.bodyMedium.copyWith(
                                color: kWhite,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Icon(
                              Atlas.linkedin,
                              color: kWhite,
                            ), // github
                            Icon(
                              Atlas.linkedin,
                              color: kWhite,
                            ), // linkedin
                            Icon(
                              Atlas.linkedin,
                              color: kWhite,
                            ), // facebook,color: kWhite,
                            Icon(
                              Atlas.linkedin,
                              color: kWhite,
                            ), // medium
                            Icon(
                              Atlas.linkedin,
                              color: kWhite,
                            ), // stackoverflow
                          ],
                        ),
                        const Spacer(),
                        Text(
                          "- Heavily credit to",
                          style: context.bodyMedium.copyWith(
                            color: kWhite,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                horizontalSpaceMassive,
                                const Icon(
                                  Atlas.star_trophy_achievement,
                                  color: kWhite,
                                  size: s14,
                                ),
                                horizontalSpaceMedium,
                                Text(
                                  "David Cobbina",
                                  style: context.bodyMedium.copyWith(
                                    color: kWhite,
                                    decorationStyle: TextDecorationStyle.dotted,
                                    decoration: TextDecoration.underline,
                                    decorationColor: kWhite,
                                    decorationThickness: s4,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                horizontalSpaceMassive,
                                const Icon(
                                  Atlas.star_trophy_achievement,
                                  color: kWhite,
                                  size: s14,
                                ),
                                horizontalSpaceMedium,
                                Text(
                                  "Design by Julius G",
                                  style: context.bodyMedium.copyWith(
                                    color: kWhite,
                                    decorationStyle: TextDecorationStyle.dotted,
                                    decoration: TextDecoration.underline,
                                    decorationColor: kWhite,
                                    decorationThickness: s4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Build using ",
                    style: context.bodyMedium.copyWith(
                      color: kWhite,
                    ),
                  ),
                  const FlutterLogo(size: 14),
                  Text(
                    " with much ",
                    style: context.bodyMedium.copyWith(
                      color: kWhite,
                    ),
                  ),
                  const Icon(
                    Atlas.heart_arrow_bold,
                    color: kRed,
                  ),
                ],
              ),
              verticalSpaceMedium,
              Text(
                "©️ 2023 Ye Lwin Oo",
                style: context.bodyMedium.copyWith(
                  color: kWhite,
                ),
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ].addColumn(),
    ].addStack();
  }
}

// <Widget>[
// [
// AnimatedTextSlideBoxTransition(
// text:
// "A quick brown fox jumps over the lazy dog and the lazy dog got up and barked at the quick brown fox.",
// controller: _labelController,
// textStyle: context.titleSmall,
// maxLines: 5,
// coverColor: kBlue100,
// ),
// ]
//     .addColumn()
//     .addContainer(
// width: context.screenWidth * 0.5,
// height: sectorHeight,
// color: Colors.teal.shade300,
// )
//     .addExpanded(),
// // AnimatedTextSlideBoxTransition(
// //   text: randomQuote.author,
// //   controller: _labelController,
// //   textStyle: context.titleSmall.copyWith(
// //     fontWeight: FontWeight.w500,
// //   ),
// //   coverColor: kBlue100,
// // ),
//
// SizedBox(
// height: contentHeight,
// width: context.screenWidth,
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// "Let's work together",
// style: context.headlineMedium.copyWith(
// color: kWhite,
// ),
// ),
// Expanded(
// child: SizedBox(
// height: contentHeight,
// // child: const AnimatedPathDemo(
// //   color: kWhite,
// // ),
// ),
// ),
// Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text(
// "I'm available for Freelancing",
// style: context.bodyLarge.copyWith(
// color: kWhite,
// ),
// ),
// Text(
// "You can contact me via",
// style: context.bodySmall.copyWith(
// color: kWhite,
// ),
// ),
// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Icon(
// Atlas.linkedin,
// color: kWhite,
// ),
// Icon(
// Atlas.facebook,
// color: kWhite,
// ),
// Icon(
// Atlas.instagram,
// color: kWhite,
// ),
// ],
// )
// ],
// )
// ],
// ),
// ),
// ].addColumn(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.start,
// ),
