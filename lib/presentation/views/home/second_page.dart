import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yelwinoo/presentation/utils/extensions/context_ex.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late double appBarHeight;
  late double containerHeight;
  late double imageWidth;
  late Animation<Offset> _slideUpTween;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      vsync: this,
      duration: duration2000,
    );
    _slideUpTween = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appBarHeight = Theme.of(context).appBarTheme.toolbarHeight!;
    containerHeight = context.screenHeight - (appBarHeight + s10);
    imageWidth = context.percentWidth(s50) * 0.8;
    return Padding(
      padding: context.padding(
        l: s80,
        r: s80,
        t: appBarHeight,
        b: s10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              leftImages(),
              Expanded(
                child: Container(
                  height: containerHeight,
                  padding: const EdgeInsets.all(s30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextSlideBoxTransition(
                        controller: _controller,
                        coverColor: Theme.of(context).scaffoldBackgroundColor,
                        text: "Crafted with Love",
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                      AnimatedTextSlideBoxTransition(
                        controller: _controller,
                        coverColor: Theme.of(context).scaffoldBackgroundColor,
                        text: "Here are a selection of my recent projects",
                        textStyle: Theme.of(context).textTheme.titleSmall,
                      ),
                      verticalSpaceMedium,
                      FadeTransition(
                        opacity: _controller,
                        child: SlideTransition(
                          position: _slideUpTween,
                          child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget lorem ullamcorper ex blandit vestibulum. Donec a consequat turpis. Etiam vitae eleifend enim. Aliquam molestie diam erat, in tempus enim blandit sit amet. Curabitur semper vulputate sem, ac laoreet metus. Maecenas porttitor fermentum metus et faucibus. Maecenas eget diam fermentum, bibendum leo a, lobortis nunc. Nunc eleifend venenatis libero, vel vehicula ligula convallis vel. Etiam sollicitudin, eros ut convallis elementum, magna ante dapibus risus, et pellentesque lacus nisl vel lorem. Sed ornare neque massa, quis cursus justo mattis sed. Pellentesque non nisl in massa vestibulum vulputate et ut diam. Vivamus vitae metus ac augue condimentum lacinia id nec elit. In hac habitasse platea dictumst. In ut massa quis arcu tempus finibus vel id nulla. Nullam id vehicula elit.",
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      FadeTransition(
                        opacity: _controller,
                        child: SlideTransition(
                          position: _slideUpTween,
                          child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget lorem ullamcorper ex blandit vestibulum. Donec a consequat turpis. Etiam vitae eleifend enim. Aliquam molestie diam erat, in tempus enim blandit sit amet. Curabitur semper vulputate sem, ac laoreet metus. Maecenas porttitor fermentum metus et faucibus. Maecenas eget diam fermentum, bibendum leo a, lobortis nunc. Nunc eleifend venenatis libero, vel vehicula ligula convallis vel. Etiam sollicitudin, eros ut convallis elementum, magna ante dapibus risus, et pellentesque lacus nisl vel lorem. Sed ornare neque massa, quis cursus justo mattis sed. Pellentesque non nisl in massa vestibulum vulputate et ut diam. Vivamus vitae metus ac augue condimentum lacinia id nec elit. In hac habitasse platea dictumst. In ut massa quis arcu tempus finibus vel id nulla. Nullam id vehicula elit.",
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      FadeTransition(
                        opacity: _controller,
                        child: SlideTransition(
                          position: _slideUpTween,
                          child: const Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas eget lorem ullamcorper ex blandit vestibulum. Donec a consequat turpis. Etiam vitae eleifend enim. Aliquam molestie diam erat, in tempus enim blandit sit amet. Curabitur semper vulputate sem, ac laoreet metus. Maecenas porttitor fermentum metus et faucibus. Maecenas eget diam fermentum, bibendum leo a, lobortis nunc. Nunc eleifend venenatis libero, vel vehicula ligula convallis vel. Etiam sollicitudin, eros ut convallis elementum, magna ante dapibus risus, et pellentesque lacus nisl vel lorem. Sed ornare neque massa, quis cursus justo mattis sed. Pellentesque non nisl in massa vestibulum vulputate et ut diam. Vivamus vitae metus ac augue condimentum lacinia id nec elit. In hac habitasse platea dictumst. In ut massa quis arcu tempus finibus vel id nulla. Nullam id vehicula elit.",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget leftImages() {
    return Expanded(
      child: Container(
        width: double.maxFinite,
        height: containerHeight,
        padding: const EdgeInsets.symmetric(
          vertical: s20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedImageContainer(
              width: imageWidth,
              margin: s10,
              beginAlignment: Alignment.topRight,
              endAlignment: Alignment.topLeft,
              animation: _controller.view,
              index: 1,
            ),
            RoundedImageContainer(
              width: imageWidth,
              margin: s10,
              beginAlignment: Alignment.centerLeft,
              endAlignment: Alignment.centerRight,
              animation: _controller.view,
              index: 2,
            ),
            RoundedImageContainer(
              width: imageWidth,
              margin: s10,
              beginAlignment: Alignment.bottomRight,
              endAlignment: Alignment.bottomLeft,
              animation: _controller.view,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}
