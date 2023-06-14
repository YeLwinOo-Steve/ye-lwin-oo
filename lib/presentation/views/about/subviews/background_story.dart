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
      Align(
        alignment: Alignment.bottomRight,
        child: RotatedBox(
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
        ).addPadding(
          edgeInsets: context.allPadding(
            p: s40,
          ),
        ),
      ),
      Container(
        margin: context.symmetricPercentPadding(hPercent: s8, vPercent: s20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
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
              ],
            ),
            verticalSpaceMassive,
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            ),
            verticalSpaceMassive,
            Row(
              children: [
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
              ],
            ),
            verticalSpaceMassive,
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            ),
          ],
        ),
      ),
    ].addStack();
  }
}
