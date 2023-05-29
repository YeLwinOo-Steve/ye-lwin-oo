import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import 'custom_slider.dart';

class CustomPageSlider extends StatefulWidget {
  const CustomPageSlider({Key? key}) : super(key: key);

  @override
  State<CustomPageSlider> createState() => _CustomPageSliderState();
}

class _CustomPageSliderState extends State<CustomPageSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  final List<Interval> _itemSlideIntervals = [];
  int sectors = 5;
  double screenHeight = 0.0;
  double sectorHeight = 0.0;
  Duration get staggeredDuration => const Duration(
        milliseconds: d300,
      );
  Duration get itemSlideDuration => const Duration(
        milliseconds: d2000,
      );
  Duration get slideDuration =>
      staggeredDuration + (staggeredDuration * sectors) + itemSlideDuration;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createStaggeredIntervals();
    screenHeight = context.screenHeight - context.percentHeight(s20);
    sectorHeight = screenHeight / sectors;
    _slideController = AnimationController(
      duration: slideDuration,
      vsync: this,
    )..forward();
  }

  void createStaggeredIntervals() {
    for (int i = 0; i < sectors; i++) {
      final Duration start = staggeredDuration + (staggeredDuration * i);
      final Duration end = start + itemSlideDuration;
      _itemSlideIntervals.add(Interval(
        start.inMilliseconds / slideDuration.inMilliseconds,
        end.inMilliseconds / slideDuration.inMilliseconds,
      ));
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.symmetricPercentPadding(
        hPercent: s0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            sectors,
            (index) => Expanded(
              child: CustomSlider(
                width: context.screenWidth,
                height: sectorHeight,
                color: kBlue100,
                animation: _slideController.view,
                interval: _itemSlideIntervals[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
