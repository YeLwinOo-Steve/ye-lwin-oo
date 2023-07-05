import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';

import 'subviews/project_list_page.dart';
import 'subviews/project_title_page.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({super.key});

  @override
  State<ProjectsView> createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // this is like a lock that prevent update the PageView multiple times while is
  // scrolling
  bool pageIsScrolling = false;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              ProjectTitlePage(),
              ProjectListPage(),
            ],
          ),
        ),
      ),
    );
  }
}
