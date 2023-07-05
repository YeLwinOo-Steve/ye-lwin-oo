import 'package:flutter/material.dart';
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
    return <Widget>[
      <Widget>[
        leftImages(),
        <Widget>[
          <Widget>[
            AnimatedTextSlideBoxTransition(
              controller: _controller,
              coverColor: Theme.of(context).scaffoldBackgroundColor,
              text: ksCraftedWithLove,
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
            AnimatedTextSlideBoxTransition(
              controller: _controller,
              coverColor: Theme.of(context).scaffoldBackgroundColor,
              text: ksRecentProjects,
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ].addColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          ...ksShowcaseProjects
              .sublist(0, 4)
              .map(
                (project) => ProjectDescription(
                  animation: _controller,
                  slideUpTween: _slideUpTween,
                  label: project.title,
                  labelStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                  descriptionStyle: Theme.of(context).textTheme.bodyMedium!,
                  description: project.shortDescription,
                  index: ksShowcaseProjects.indexOf(project),
                  onPressed: () {
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
                  },
                ),
              )
              .toList(),
        ]
            .addNestedListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
            .addContainer(
                height: containerHeight,
                padding: context.symmetricPadding(h: s30, v: s0))
            .addExpanded(),
      ].addRow(),
    ].addColumn().addPadding(
          edgeInsets: context.padding(
            l: s80,
            r: s80,
            t: appBarHeight,
            b: s10,
          ),
        );
  }

  Widget leftImages() {
    return <Widget>[
      RoundedImageContainer(
        width: imageWidth,
        margin: s10,
        beginAlignment: Alignment.topRight,
        endAlignment: Alignment.topLeft,
        animation: _controller.view,
        index: 1,
        imageUrl: ksShowcaseProjects[0].image,
        tag: ksShowcaseProjects[0].heroTag,
      ),
      RoundedImageContainer(
        width: imageWidth,
        margin: s10,
        beginAlignment: Alignment.centerLeft,
        endAlignment: Alignment.centerRight,
        animation: _controller.view,
        index: 2,
        imageUrl: ksShowcaseProjects[1].image,
        tag: ksShowcaseProjects[1].heroTag,
      ),
      RoundedImageContainer(
        width: imageWidth,
        margin: s10,
        beginAlignment: Alignment.bottomRight,
        endAlignment: Alignment.bottomLeft,
        animation: _controller.view,
        index: 3,
        imageUrl: ksShowcaseProjects[2].image,
        tag: ksShowcaseProjects[2].heroTag,
      ),
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
        .addExpanded();
  }
}
