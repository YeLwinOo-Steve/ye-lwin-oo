import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yelwinoo/data/model/showcase_project.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';
import 'info_section.dart';

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
        textStyle: context.adaptive(
          Theme.of(context).textTheme.bodyLarge,
          Theme.of(context).textTheme.titleMedium,
        ),
      ),
      verticalSpaceMassive,
      AnimatedTextSlideBoxTransition(
        controller: _contentController,
        text: widget.project.description,
        coverColor: kPrimary,
        textStyle: context.adaptive(
          Theme.of(context).textTheme.bodyMedium,
          Theme.of(context).textTheme.bodyLarge,
        ),
        maxLines: 15,
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
        .addContainer(
          padding: context.symmetricPercentPadding(
            hPercent: context.adaptive(s4, s10),
            vPercent: s0,
          ),
        )
        .addVisibilityDetector(onDetectVisibility: detectVisibility);
  }
}
