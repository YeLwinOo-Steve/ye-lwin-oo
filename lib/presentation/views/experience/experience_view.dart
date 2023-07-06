import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';

import '../../configs/configs.dart';
import 'subviews/experience_title_page.dart';
import 'subviews/jobs_list_page.dart';

class ExperienceView extends StatefulWidget {
  ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  // this is like a lock that prevent update the PageView multiple times while is
  bool pageIsScrolling = false;

  final _pageController = PageController();

  void _onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        _pageController
            .nextPage(
              duration: duration300,
              curve: Curves.easeInOut,
            )
            .then((value) => pageIsScrolling = false);
      } else {
        _pageController
            .previousPage(
              duration: duration300,
              curve: Curves.easeInOut,
            )
            .then((value) => pageIsScrolling = false);
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: const [
              ExperienceTitlePage(),
              JobsListPage(),
            ],
          ),
        ),
      ),
    );
  }
}
