import 'dart:async';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yelwinoo/data/model/project_info.dart';
import 'package:yelwinoo/data/model/showcase_project.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';

class ProjectDetailsView extends StatefulWidget {
  const ProjectDetailsView({
    super.key,
    required this.project,
  });
  final ShowcaseProject project;
  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView>
    with TickerProviderStateMixin {
  late AnimationController _appBarController;
  late AnimationController _mouseIconController;
  late AnimationController _stickController;
  late AnimationController _titleController;
  late Animation<Offset> _appBarAnimation;
  late Animation<double> _mouseOpacityAnimation;
  final GlobalKey _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    _appBarController = AnimationController(vsync: this, duration: duration500);
    _stickController = AnimationController(vsync: this, duration: duration2000);
    _titleController = AnimationController(vsync: this, duration: duration1000);
    _mouseIconController =
        AnimationController(vsync: this, duration: duration500);

    _appBarAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_appBarController);
    _mouseOpacityAnimation =
        Tween<double>(begin: s0, end: s1).animate(_mouseIconController);
    Future.delayed(duration2000, () {
      _appBarController.forward();
      _appBarController.addStatusListener(_appBarListener);
      _mouseIconController.forward();
      _stickController.repeat(
        reverse: true,
      );
    });
  }

  void _appBarListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _titleController.forward();
    }
  }

  @override
  void dispose() {
    _appBarController.dispose();
    _stickController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ShowcaseProject project = widget.project;
    return Scaffold(
      key: _key,
      body: <Widget>[
        <Widget>[
          Image.asset(
            project.image,
            fit: BoxFit.cover,
            width: context.screenWidth,
            height: context.screenHeight,
            alignment: Alignment.center,
          ).addHero(tag: project.heroTag),
          <Widget>[
            SlideTransition(
              position: _appBarAnimation,
              child: <Widget>[
                AnimatedTextSlideBoxTransition(
                  controller: _titleController,
                  text: project.title,
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  coverColor: kSecondary,
                ),
                MenuButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  hasMenuTapped: true,
                ),
              ]
                  .addRow(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  )
                  .addContainer(
                    height: s100,
                    width: context.screenWidth,
                    color: kTransparent,
                    padding: context.symmetricPadding(
                      h: s50,
                    ),
                  ),
            ),
            <Widget>[
              FadeTransition(
                opacity: _mouseOpacityAnimation,
                child: const Icon(
                  kiMouseScroll,
                  size: s38,
                ).addPadding(
                    edgeInsets: context.symmetricPadding(
                  v: s20,
                )),
              ),
              AnimatedVerticalStick(
                controller: _stickController,
              ),
            ]
                .addColumn(
                  mainAxisSize: MainAxisSize.min,
                )
                .addAlign(
                  alignment: Alignment.bottomRight,
                )
                .addPadding(
                  edgeInsets: context.symmetricPadding(
                    h: s40,
                  ),
                ),
          ]
              .addColumn(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )
              .addSizedBox(
                width: context.screenWidth,
                height: context.screenHeight,
              ),
        ].addStack(),
        ProjectOverview(
          project: project,
        ),
      ].addNestedListView(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}

class ProjectOverview extends StatefulWidget {
  const ProjectOverview({super.key, required this.project});
  final ShowcaseProject project;

  @override
  State<ProjectOverview> createState() => _ProjectOverviewState();
}

class _ProjectOverviewState extends State<ProjectOverview>
    with TickerProviderStateMixin {
  late AnimationController _titleController;
  late AnimationController _contentController;
  void detectVisibility(VisibilityInfo info) {
    if (info.visibleFraction > 0.45) {
      _titleController.forward();
      _titleController.addStatusListener(_titleControllerListener);
    } else {
      if (_titleController.isCompleted) {
        _titleController.reset();
      }
      if (_contentController.isCompleted) {
        _contentController.reset();
      }
    }
  }

  void _titleControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _contentController.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    _titleController = AnimationController(vsync: this, duration: duration1000);
    _contentController =
        AnimationController(vsync: this, duration: duration1000);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      AnimatedTextSlideBoxTransition(
        controller: _titleController,
        text: 'Project Overview',
        coverColor: kPrimary,
        textStyle: Theme.of(context).textTheme.titleMedium,
      ),
      verticalSpaceMassive,
      AnimatedTextSlideBoxTransition(
        controller: _contentController,
        text: widget.project.description,
        coverColor: kPrimary,
        textStyle: Theme.of(context).textTheme.bodyLarge,
        maxLines: 10,
      ),
      context.percentSizedBox(
        pHeight: s3,
      ),
      <Widget>[
        InfoSection(
          controller: _contentController,
          info: widget.project.tech,
        ),
        InfoSection(
          controller: _contentController,
          info: widget.project.platform,
        ),
        InfoSection(
          controller: _contentController,
          info: widget.project.tags,
        ),
        InfoSection(
          controller: _contentController,
          info: widget.project.link,
        ),
        InfoSection(
          controller: _contentController,
          info: widget.project.author,
        ),
      ].addWrap(),
    ]
        .addColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .addVisibilityDetector(onDetectVisibility: detectVisibility)
        .addContainer(
          padding: context.symmetricPercentPadding(
            hPercent: s10,
            vPercent: s4,
          ),
        );
  }
}

class InfoSection extends StatelessWidget {
  InfoSection({
    super.key,
    required this.controller,
    required this.info,
  })  : _slideUpAnimation =
            Tween<Offset>(begin: const Offset(s0, s1), end: Offset.zero)
                .animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        ),
        _fadeAnimation = Tween<double>(begin: s0, end: s1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        );
  final AnimationController controller;
  final Animation<Offset> _slideUpAnimation;
  final Animation<double> _fadeAnimation;
  final ProjectInfo info;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconLabel(
          icon: info.icon,
          controller: controller,
          label: info.label,
          coverColor: kPrimary,
          textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        verticalSpaceLarge,
        ...info.contents.map((content) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideUpAnimation,
              child: GestureDetector(
                onTap: () => content.launchWebsite(),
                child: Text(
                  info.isTag == true
                      ? content.prefixHash()
                      : info.isLink == true
                          ? content.prefixLink()
                          : content.prefixDash(),
                )
                    .addContainer(
                      decoration: BoxDecoration(
                        border: info.isLink == true
                            ? const Border(
                                bottom: BorderSide(color: Colors.black26),
                              )
                            : const Border(),
                      ),
                    )
                    .addPadding(
                      edgeInsets: context.padding(
                        l: 2 * horizontalSpaceMassive.width!,
                      ),
                    ),
              ),
            ),
          );
        }),
      ],
    ).addPadding(
      edgeInsets: context.padding(
        r: s100,
        b: s50,
      ),
    );
  }
}
