import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/home/widgets/project_description.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with TickerProviderStateMixin {
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
              textStyle: Theme.of(context).textTheme.headlineSmall,
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
          verticalSpaceMedium,
          ...ksShowcaseProjects
              .map(
                (project) => ProjectDescription(
                  animation: _controller,
                  slideUpTween: _slideUpTween,
                  label: project.title,
                  labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  descriptionStyle: Theme.of(context).textTheme.bodyMedium!,
                  description: project.description,
                  index: ksShowcaseProjects.indexOf(project),
                ),
              )
              .toList(),
        ]
            .addColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            )
            .addContainer(
                height: containerHeight, padding: context.allPadding(p: s30))
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
    return [
      RoundedImageContainer(
        width: imageWidth,
        margin: s10,
        beginAlignment: Alignment.topRight,
        endAlignment: Alignment.topLeft,
        animation: _controller.view,
        index: 1,
        imageUrl: ksShowcaseProjects[0].image,
      ),
      RoundedImageContainer(
        width: imageWidth,
        margin: s10,
        beginAlignment: Alignment.centerLeft,
        endAlignment: Alignment.centerRight,
        animation: _controller.view,
        index: 2,
        imageUrl: ksShowcaseProjects[1].image,
      ),
      RoundedImageContainer(
        width: imageWidth,
        margin: s10,
        beginAlignment: Alignment.bottomRight,
        endAlignment: Alignment.bottomLeft,
        animation: _controller.view,
        index: 3,
        imageUrl: ksShowcaseProjects[2].image,
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
