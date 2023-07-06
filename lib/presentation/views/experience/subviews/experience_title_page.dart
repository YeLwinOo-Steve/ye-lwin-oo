import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class ExperienceTitlePage extends StatefulWidget {
  const ExperienceTitlePage({super.key});

  @override
  State<ExperienceTitlePage> createState() => _ExperienceTitlePageState();
}

class _ExperienceTitlePageState extends State<ExperienceTitlePage>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _stickController;

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(vsync: this, duration: duration2000)
      ..forward();
    _stickController = AnimationController(vsync: this, duration: duration2000)
      ..repeat();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _stickController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: SvgPicture.asset(
            kaWorkStump,
            semanticsLabel: 'Work Stump SVG',
            width: context.percentHeight(s30),
            height: context.percentHeight(s30),
          ).addPadding(
            edgeInsets: context.percentPadding(
              l: s30,
              b: s10,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: AnimatedTextSlideBoxTransition(
            controller: _titleController,
            text: ksExperience,
            coverColor: kPrimary,
            textStyle: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedSlideBox(
            controller: _stickController,
            height: context.percentHeight(s40),
            isVertical: true,
            coverColor: kPrimary,
            visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
            width: s6,
          ),
        ),
      ],
    );
  }
}
