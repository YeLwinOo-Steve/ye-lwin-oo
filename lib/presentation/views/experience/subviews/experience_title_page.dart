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
    final svgSize = context.adaptive<double>(
        context.percentHeight(s20), context.percentHeight(s30));
    return <Widget>[
      SvgPicture.asset(
        kaWorkStump,
        semanticsLabel: 'Work Stump SVG',
        width: svgSize,
        height: svgSize,
      )
          .addPadding(
            edgeInsets: context.percentPadding(r: s5, t: s5),
          )
          .addAlign(alignment: Alignment.topRight),
      AnimatedTextSlideBoxTransition(
        controller: _titleController,
        text: ksExperience,
        coverColor: kPrimary,
        maxLines: 2,
        textAlign: TextAlign.center,
        textStyle: context.adaptive(
          Theme.of(context).textTheme.titleSmall,
          Theme.of(context).textTheme.headlineMedium,
        ),
      ).addAlign(alignment: Alignment.center),
      AnimatedSlideBox(
        controller: _stickController,
        height: context.percentHeight(s30),
        isVertical: true,
        coverColor: kPrimary,
        visibleBoxCurve: Curves.fastLinearToSlowEaseIn,
        width: s6,
      ).addAlign(alignment: Alignment.bottomCenter),
    ].addStack().addSizedBox(
          width: context.screenWidth,
          height: context.screenHeight - context.appBarTheme().toolbarHeight!,
        );
  }
}
