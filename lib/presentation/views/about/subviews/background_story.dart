import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class BackgroundStory extends StatefulWidget {
  const BackgroundStory({super.key});

  @override
  State<BackgroundStory> createState() => _BackgroundStoryState();
}

class _BackgroundStoryState extends State<BackgroundStory> {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Align(
        alignment: Alignment.bottomRight,
        child: RotatedBox(
          quarterTurns: 3,
          child: OutlinedText(
            text: "When I was young, I was a kid!",
            fontSize: s40,
            strokeColor: kSecondary,
            textColor: kTransparent,
            fontWeight: FontWeight.w300,
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
            Text('BACKGROUND STORY'),
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
