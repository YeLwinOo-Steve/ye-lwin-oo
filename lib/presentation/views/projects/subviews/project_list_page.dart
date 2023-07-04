import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../../../configs/configs.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _projectSlideController;
  late AnimationController _projectRotateController;
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration1000);
    _controller.addListener(controllerListener);
    _projectSlideController =
        AnimationController(vsync: this, duration: duration3000);
    _projectRotateController = AnimationController(
      vsync: this,
      duration: duration2000,
    )..forward();
    _projectRotateController.addStatusListener(projectRotateListener);
  }

  void controllerListener() {
    if (_controller.value > 0.6) {
      _projectSlideController.forward();
    }
  }

  void projectRotateListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _projectRotateController.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _projectSlideController.dispose();
    _projectRotateController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Animation<Offset> get projectSlideAnimation =>
      Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
          .animate(CurvedAnimation(
        parent: _projectSlideController,
        curve: Curves.easeInOut,
      ));

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const ValueKey("project_list"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _controller.forward();
        }
      },
      child: SizedBox(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: AnimatedBackgroundCircle(
                animation: _controller,
                targetWidth: context.screenWidth,
                targetHeight: context.screenHeight,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: context.percentHeight(s60),
                width: double.maxFinite,
                child: SlideTransition(
                  position: projectSlideAnimation,
                  child: HorizontalProjectList(
                    controller: _projectRotateController,
                    scrollController: _scrollController,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimatedBackgroundCircle extends AnimatedWidget {
  const AnimatedBackgroundCircle({
    super.key,
    required this.animation,
    required this.targetWidth,
    required this.targetHeight,
  }) : super(
          listenable: animation,
        );
  final double targetWidth;
  final double targetHeight;
  final Animation<double> animation;

  Animation<double> get widthAnimation =>
      Tween<double>(begin: s150, end: targetWidth).animate(curvedAnimation);
  Animation<double> get heightAnimation =>
      Tween<double>(begin: s150, end: targetWidth).animate(curvedAnimation);
  Animation<double> get radiusAnimation =>
      Tween<double>(begin: s150, end: 0).animate(curvedAnimation);

  Animation<double> get delayedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn);
  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAnimation.value,
      height: heightAnimation.value,
      decoration: BoxDecoration(
        color: kSecondary,
        borderRadius: BorderRadius.circular(radiusAnimation.value),
      ),
    );
  }
}

class AnimatedCard extends AnimatedWidget {
  const AnimatedCard({
    super.key,
    required this.animation,
    this.startAngle = 10,
    this.endAngle = -10,
    required this.bgColor,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final double startAngle;
  final double endAngle;
  final Color bgColor;

  Animation<double> get rotateAnimation =>
      Tween<double>(begin: startAngle, end: endAngle).animate(curvedAnimation);

  Animation<double> get curvedAnimation => CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );
  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: AlwaysStoppedAnimation(rotateAnimation.value / 360),
      child: Container(
        width: context.percentWidth(s20),
        height: context.percentHeight(s50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(s20),
          color: bgColor,
        ),
      ),
    ).addPadding(
      edgeInsets: context.symmetricPercentPadding(
        hPercent: s4,
        vPercent: s8,
      ),
    );
  }
}

class HorizontalProjectList extends StatelessWidget {
  const HorizontalProjectList({
    super.key,
    required this.controller,
    required this.scrollController,
  });
  final AnimationController controller;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        ...List.generate(kMenuColors.length, (index) {
          double startAngle = s10;
          double endAngle = -s10;
          if (index % 2 == 0) {
            double tempAngle = startAngle;
            startAngle = endAngle;
            endAngle = tempAngle;
          }
          return AnimatedCard(
            bgColor: kMenuColors[index],
            animation: controller,
            startAngle: startAngle,
            endAngle: endAngle,
          );
        }),
      ],
    );
  }
}
