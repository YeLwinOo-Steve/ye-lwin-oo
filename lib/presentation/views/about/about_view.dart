import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yelwinoo/presentation/utils/extensions/context_ex.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';

import '../../configs/configs.dart';
import 'subviews/background_story.dart';
import 'subviews/overall.dart';
import 'subviews/who_am_i.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final _key = GlobalKey();
  final PageController pageController = PageController();
  List<Widget> aboutPages = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    aboutPages = const [
      WhoAmI(),
      BackgroundStory(),
      Overall(),
    ];
  }
  // this is like locking a critical state in concurrency deadlock problem
  bool pageIsScrolling = false;
  void _onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        pageController
            .nextPage(
              duration: duration300,
              curve: Curves.easeInOut,
            )
            .then((value) => pageIsScrolling = false);
      } else {
        pageController
            .previousPage(
              duration: duration300,
              curve: Curves.easeInOut,
            )
            .then((value) => pageIsScrolling = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: GestureDetector(
        onPanUpdate: (details) {
          _onScroll(details.delta.dy * -1);
        },
        child: Listener(
          onPointerSignal: (pointerSignal) {
            if (pointerSignal is PointerScrollEvent) {
              _onScroll(pointerSignal.scrollDelta.dy);
            }
          },
          child: PageView(
            key: _key,
            scrollDirection: Axis.vertical,
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: aboutPages,
          ),
        ),
      ),
    );
  }
}
