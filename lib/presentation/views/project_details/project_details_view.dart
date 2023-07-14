import 'dart:async';
import 'package:flutter/material.dart';
import 'package:yelwinoo/data/model/showcase_project.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';
import 'widget/project_overview.dart';

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
    _mouseIconController.dispose();
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
          Align(
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 12 / 9,
              child: Image.asset(
                project.image,
                width: context.percentWidth(30),
              ).addHero(tag: project.heroTag),
            ),
          ),
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
                  ),
                ),
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
      ].addListView(
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}