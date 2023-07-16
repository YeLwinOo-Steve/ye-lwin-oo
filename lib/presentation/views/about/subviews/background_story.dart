import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';
import 'awards_and_activities.dart';
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
  late AnimationController _text3Controller;
  late AnimationController _stickController;
  late AnimationController _stick2Controller;
  late AnimationController _stick3Controller;
  late AnimationController _infoController;
  late AnimationController _techController;
  late AnimationController _awardController;
  @override
  void initState() {
    super.initState();
    _textController = AnimationController(vsync: this, duration: duration2000);
    _text2Controller = AnimationController(vsync: this, duration: duration2000);
    _text3Controller = AnimationController(vsync: this, duration: duration2000);
    _infoController = AnimationController(vsync: this, duration: duration500)
      ..addStatusListener(infoControllerListener);
    _techController = AnimationController(vsync: this, duration: duration500)
      ..addStatusListener(techControllerListener);
    _awardController = AnimationController(vsync: this, duration: duration500);
    _stickController = AnimationController(vsync: this, duration: duration1000)
      ..addStatusListener(stickControllerListener);
    _stick2Controller = AnimationController(vsync: this, duration: duration1000)
      ..addStatusListener(stick2ControllerListener);
    _stick3Controller = AnimationController(vsync: this, duration: duration1000)
      ..addStatusListener(stick3ControllerListener);
  }

  void infoControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _stick2Controller.forward();
    }
  }

  void techControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _stick3Controller.forward();
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

  void stick3ControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _text3Controller.forward();
      _awardController.forward();
    }
  }

  @override
  void dispose() {
    _stickController.dispose();
    _stick2Controller.dispose();
    _stick3Controller.dispose();
    _text2Controller.dispose();
    _text3Controller.dispose();
    _techController.dispose();
    _awardController.dispose();
    _textController.dispose();
    _infoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("background_story"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) {
          _stickController.forward();
        }
      },
      child: <Widget>[
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
            pHeight: s3,
          ),
          ToolsAndTechnologies(
            stickController: _stick2Controller,
            textController: _text2Controller,
            techController: _techController,
          ),
          context.percentSizedBox(
            pHeight: s3,
          ),
          AwardsAndActivities(
            stickController: _stick3Controller,
            textController: _text3Controller,
            infoController: _awardController,
          ),
        ]
            .addColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .addPadding(
              edgeInsets: context.symmetricPercentPadding(
                hPercent: context.adaptive(s3,s8),
              ),
            ),
      ].addStack().addPadding(
          edgeInsets: context.symmetricPercentPadding(vPercent: s4)),
    );
  }
}
