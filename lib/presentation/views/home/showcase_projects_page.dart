import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yelwinoo/data/model/showcase_project.dart';
import 'package:yelwinoo/presentation/route/route_transitions.dart';
import 'package:yelwinoo/presentation/route/routes.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/home/widgets/project_description.dart';
import 'package:yelwinoo/presentation/views/project_details/project_details_view.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';

class ShowcaseProjectsPage extends StatefulWidget {
  const ShowcaseProjectsPage({Key? key}) : super(key: key);

  @override
  State<ShowcaseProjectsPage> createState() => _ShowcaseProjectsPageState();
}

class _ShowcaseProjectsPageState extends State<ShowcaseProjectsPage>
    with TickerProviderStateMixin {
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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToProjectDetailsPage({required ShowcaseProject project}) {
    Navigator.of(context).push(
      SlideRouteTransition(
        position: SlidePosition.right,
        enterWidget: ProjectDetailsView(
          project: project,
        ),
        settings: RouteSettings(
          name: '${Routes.projectDetails}/${project.title}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    appBarHeight = Theme.of(context).appBarTheme.toolbarHeight!;
    containerHeight = context.screenHeight - (appBarHeight + s10);
    imageWidth =
        context.adaptive(context.screenWidth, context.percentWidth(s50) * 0.8);
    return VisibilityDetector(
      key: const ValueKey("showcase_projects"),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.2) {
          _controller.forward();
        }
      },
      child: <Widget>[
        context.adaptive<Widget>(mobileVersion(), desktopVersion()),
      ].addColumn().addPadding(
            edgeInsets: context.padding(
                l: context.adaptive(s20, s80),
                r: context.adaptive(s20, s80),
                t: appBarHeight,
                b: s10),
          ),
    );
  }

  Widget mobileVersion() {
    return <Widget>[
      craftedWithText(),
      recentProjectsText(),
      verticalSpaceMedium,
      ...ksShowcaseProjects
          .sublist(0, 3)
          .map(
            (project) => <Widget>[
              projectImage(project),
              verticalSpaceMedium,
              projectDescriptionText(project),
              verticalSpaceLarge,
            ].addColumn(mainAxisSize: MainAxisSize.min),
          )
          .toList(),
    ].addColumn(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget desktopVersion() {
    return <Widget>[
      <Widget>[
        ...ksShowcaseProjects
            .sublist(0, 3)
            .map(
              (project) => projectImage(project),
            )
            .toList(),
      ]
          .addColumn(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          )
          .addContainer(
            width: double.maxFinite,
            height: containerHeight,
            padding: context.symmetricPadding(
              v: s20,
            ),
          )
          .addExpanded(),
      <Widget>[
        <Widget>[
          craftedWithText(),
          recentProjectsText(),
        ].addColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        ...ksShowcaseProjects
            .sublist(0, 3)
            .map(
              (project) => projectDescriptionText(project),
            )
            .toList(),
      ]
          .addColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          )
          .addContainer(
              // height: containerHeight,
              padding: context.symmetricPadding(h: s30, v: s0))
          .addExpanded(),
    ].addRow();
  }

  Widget craftedWithText() {
    return AnimatedTextSlideBoxTransition(
      controller: _controller,
      coverColor: Theme.of(context).scaffoldBackgroundColor,
      text: ksCraftedWithLove,
      textStyle: context.adaptive(Theme.of(context).textTheme.bodyLarge,
          Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget recentProjectsText() {
    return AnimatedTextSlideBoxTransition(
      controller: _controller,
      coverColor: Theme.of(context).scaffoldBackgroundColor,
      text: ksRecentProjects,
      textStyle: context
          .adaptive(Theme.of(context).textTheme.bodySmall,
              Theme.of(context).textTheme.bodyLarge)
          ?.copyWith(
            fontWeight: FontWeight.w300,
          ),
    );
  }

  Widget projectDescriptionText(ShowcaseProject project) {
    return ProjectDescription(
      animation: _controller,
      slideUpTween: _slideUpTween,
      label: project.title,
      labelStyle: context
          .adaptive(Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.labelLarge)!
          .copyWith(
            fontWeight: FontWeight.w500,
          ),
      descriptionStyle: context.adaptive(Theme.of(context).textTheme.bodySmall,
          Theme.of(context).textTheme.bodyMedium)!,
      description: project.shortDescription,
      index: ksShowcaseProjects.indexOf(project),
      onPressed: () => navigateToProjectDetailsPage(project: project),
    );
  }

  Widget projectImage(ShowcaseProject project) {
    int index = ksShowcaseProjects.indexOf(project);
    return RoundedImageContainer(
      width: imageWidth,
      margin: s10,
      beginAlignment: index % 2 == 0 ? Alignment.topRight : Alignment.topLeft,
      endAlignment: index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
      animation: _controller.view,
      index: index + 1,
      imageUrl: project.image,
      tag: project.heroTag,
    );
  }
}
