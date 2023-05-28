import 'package:flutter/material.dart';
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
  int sectors = 5;
  double screenHeight = 0.0;
  double sectorHeight = 0.0;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenHeight = context.screenHeight - context.percentHeight(s20);
    sectorHeight = screenHeight / sectors;
    _slideController = AnimationController(
      duration: duration3000,
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.symmetricPercentPadding(
        hPercent: s10,
      ),
      child: Column(
        children: [
          ...List.generate(
            sectors,
            (index) => CustomSlider(
              width: context.screenWidth,
              height: sectorHeight,
              animation: _slideController.view,
            ),
          ),
        ],
      ),
    );
  }
}
