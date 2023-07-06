import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';
import '../widgets/experience_step_card.dart';

class JobsListPage extends StatefulWidget {
  const JobsListPage({super.key});

  @override
  State<JobsListPage> createState() => _JobsListPageState();
}

class _JobsListPageState extends State<JobsListPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _textController;

  final Duration duration = duration1000;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: duration * ksExperiences.length,
    )..forward();
    _textController = AnimationController(vsync: this, duration: duration2000);
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...ksExperiences.map(
          (exp) {
            int index = ksExperiences.indexOf(exp);
            double start = index / ksExperiences.length;
            double end = (index + 1) > ksExperiences.length
                ? s1
                : (index + 1) / ksExperiences.length;
            return ExperienceStepCard(
              experience: exp,
              index: index + 1,
              animation: _controller,
              start: start,
              end: end,
            );
          },
        ).toList(),
        VisibilityDetector(
          key: const ValueKey("freelancing"),
          onVisibilityChanged: (info) {
            if (info.visibleFraction > 0.4) {
              _textController.forward();
            }
          },
          child: AnimatedTextSlideBoxTransition(
            controller: _textController,
            text: ksWhatElse.addDoubleQuote(),
            textStyle: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
            coverColor: kPrimary,
          ).addPadding(
            edgeInsets: context.percentPadding(
              t: s5,
            ),
          ),
        ),
        verticalSpaceMedium,
        AnimatedTextSlideBoxTransition(
          controller: _textController,
          text: ksSayHello.addDoubleQuote(),
          textStyle: Theme.of(context).textTheme.titleSmall,
          textAlign: TextAlign.center,
          coverColor: kPrimary,
        ),
      ],
    )
        .addPadding(
          edgeInsets: context.symmetricPercentPadding(
            vPercent: s18,
            hPercent: s4,
          ),
        )
        .addScrollView(
          physics: const BouncingScrollPhysics(),
        );
  }
}
