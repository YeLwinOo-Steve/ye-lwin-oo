import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';
import 'background_info.dart';
import 'tools_and_technologies.dart';

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
        BackgroundInfo(
          stickController: _stickController,
          textController: _textController,
        ),
        context.percentSizedBox(
          pHeight: s5,
        ),
        ToolsAndTechnologies(
          stickController: _stickController,
          textController: _textController,
        ),
      ]
          .addColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .addContainer(
            margin:
                context.symmetricPercentPadding(hPercent: s8, vPercent: s10),
          ),
    ].addStack();
  }
}
