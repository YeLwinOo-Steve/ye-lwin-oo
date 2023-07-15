import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/animated_text_slide_box_transition.dart';

import '../../../configs/configs.dart';
import '../widgets/animated_background_circle.dart';
import '../widgets/animated_project_card.dart';
import '../widgets/project_scroll_icons.dart';
import '../widgets/tool_card.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _labelController;
  late AnimationController _projectSlideController;
  late AnimationController _projectRotateController;
  late AnimationController _slideOpacityController;
  late AnimationController _toolOpacityController;
  final List<AnimationController> _toolAnimations = [];
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration1000)
      ..addListener(controllerListener);
    _projectSlideController =
        AnimationController(vsync: this, duration: duration3000)
          ..addStatusListener(projectSlideListener);
    _slideOpacityController =
        AnimationController(vsync: this, duration: duration500);
    _toolOpacityController =
        AnimationController(vsync: this, duration: duration500)
          ..addStatusListener(toolOpacityListener);
    _labelController = AnimationController(vsync: this, duration: duration2000);
    for (var _ in kaTools) {
      _toolAnimations.add(
        AnimationController(
          vsync: this,
          duration: duration500,
        ),
      );
    }
    _projectRotateController = AnimationController(
      vsync: this,
      duration: duration2000,
    )
      ..forward()
      ..addStatusListener(projectRotateListener);
  }

  void controllerListener() {
    if (_controller.value > 0.95) {
      _labelController.forward();
      _toolOpacityController.forward();
    }
    if (_controller.value > 0.6) {
      _projectSlideController.forward();
    }
  }

  void toolOpacityListener(AnimationStatus status) {
    for (int i = 0; i < _toolAnimations.length; i++) {
      Future.delayed(Duration(milliseconds: d50 * i), () {
        _toolAnimations[i].forward();
      });
    }
  }

  void projectRotateListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _projectRotateController.reverse();
    }
  }

  void projectSlideListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _slideOpacityController.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _labelController.dispose();
    _projectSlideController.dispose();
    _slideOpacityController.dispose();
    _toolOpacityController.dispose();
    _projectRotateController.dispose();
    for (var toolAnimation in _toolAnimations) {
      toolAnimation.dispose();
    }
    super.dispose();
  }

  Animation<Offset> get projectSlideAnimation => Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _projectSlideController,
          curve: Curves.easeInOut,
        ),
      );

  @override
  Widget build(BuildContext context) {
    double cardWidth = context.percentWidth(context.adaptive(s70, s20));
    return VisibilityDetector(
      key: const ValueKey("project_list"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.5) {
          _controller.forward();
        }
      },
      child: <Widget>[
        AnimatedBackgroundCircle(
          animation: _controller,
          targetWidth: context.screenWidth,
          targetHeight: context.screenHeight,
        ).addAlign(
          alignment: Alignment.center,
        ),
        <Widget>[
          <Widget>[
            ...kaTools.map((tool) {
              double cardSize = context.adaptive(s30, s50);
              int index = kaTools.indexOf(tool);
              return ToolCard(
                animation: _toolAnimations[index],
                bgAnimation: _toolOpacityController,
                size: cardSize,
                index: index,
                tool: tool,
              );
            }).toList(),
          ].addStack(),
          horizontalSpaceMassive,
          AnimatedTextSlideBoxTransition(
            controller: _labelController,
            text: ksCraftedProjects,
            coverColor: kSecondary,
            textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w200,
                ),
          ),
        ]
            .addDesktopRowMobileColumn(
              context,
              mSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .addAlign(
              alignment: Alignment.topLeft,
            )
            .addPadding(
              edgeInsets: context.symmetricPercentPadding(
                hPercent: s5,
                vPercent: context.adaptive(s14, s10),
              ),
            ),
        <Widget>[
          const Expanded(child: noSpace,),
          SlideTransition(
            position: projectSlideAnimation,
            child: HorizontalProjectList(
              controller: _projectRotateController,
              scrollController: _scrollController,
            ),
          ).addSizedBox(
            // height: context.percentHeight(context.adaptive(s50, s60)),
            width: double.maxFinite,
          ).addExpanded(flex: 2),
          FadeTransition(
            opacity: _slideOpacityController,
            child: ProjectScrollIcons(
              scrollController: _scrollController,
              cardWidth: cardWidth,
            ),
          ).addAlign(alignment: Alignment.centerRight),
        ]
            .addColumn(
              mainAxisSize: MainAxisSize.min,
            ),
      ].addStack().addSizedBox(
            width: context.screenWidth,
            height: context.screenHeight,
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
    return <Widget>[
      ...List.generate(
        ksShowcaseProjects.length,
        (index) {
          double startAngle = s10;
          double endAngle = -s10;
          if (index % 2 == 0) {
            double tempAngle = startAngle;
            startAngle = endAngle;
            endAngle = tempAngle;
          }
          return AnimatedProjectCard(
            bgColor: kDeepBlack,
            animation: controller,
            startAngle: startAngle,
            endAngle: endAngle,
            index: index + 1,
            project: ksShowcaseProjects[index],
          );
        },
      ),
    ].addListView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
    );
  }
}
