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
  late AnimationController _text2Controller;
  late AnimationController _stickController;
  late AnimationController _stick2Controller;
  late AnimationController _infoController;
  late AnimationController _techController;
  @override
  void initState() {
    super.initState();
    _textController = AnimationController(vsync: this, duration: duration2000);
    _text2Controller = AnimationController(vsync: this, duration: duration2000);
    _infoController = AnimationController(vsync: this, duration: duration500);
    _techController = AnimationController(vsync: this, duration: duration500);
    _infoController.addStatusListener(infoControllerListener);
    _stickController = AnimationController(vsync: this, duration: duration1000)
      ..forward();
    _stickController.addStatusListener(stickControllerListener);
    _stick2Controller =
        AnimationController(vsync: this, duration: duration1000);
    _stick2Controller.addStatusListener(stick2ControllerListener);
  }

  void infoControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _stick2Controller.forward();
    }
  }

  void stickControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _textController.forward();
      _infoController.forward();
    }
  }

  void stick2ControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _text2Controller.forward();
      _techController.forward();
    }
  }

  @override
  void dispose() {
    _stickController.dispose();
    _stick2Controller.dispose();
    _text2Controller.dispose();
    _techController.dispose();
    _textController.dispose();
    _infoController.dispose();
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
          infoController: _infoController,
        ),
        context.percentSizedBox(
          pHeight: s5,
        ),
        ToolsAndTechnologies(
          stickController: _stick2Controller,
          textController: _text2Controller,
          techController: _techController,
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
