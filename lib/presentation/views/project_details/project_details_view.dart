import 'package:flutter/material.dart';
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
  late Animation<Offset> _appBarAnimation;
  @override
  void initState() {
    super.initState();
    _appBarController = AnimationController(vsync: this, duration: duration500);
    _appBarAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(_appBarController);
    Future.delayed(duration2000, () {
      _appBarController.forward();
    });
  }

  @override
  void dispose() {
    _appBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ShowcaseProject project = widget.project;
    return Scaffold(
      body: <Widget>[
        Image.asset(
          project.image,
          fit: BoxFit.cover,
          width: context.screenWidth,
          height: context.screenHeight,
          alignment: Alignment.center,
        ).addHero(tag: project.heroTag),
        Column(
          children: [
            SlideTransition(
              position: _appBarAnimation,
              child: Container(
                height: s100,
                width: context.screenWidth,
                color: kTransparent,
                padding: context.symmetricPadding(
                  h: s50,
                ),
                child: Text(
                  project.title,
                  style: context.titleSmall,
                ),
              ),
            ),
          ],
        )
      ].addStack(),
    );
  }
}

// verticalSpaceMassive,
// Text(
// project.title,
// style: Theme.of(context).textTheme.headlineMedium,
// ),
// verticalSpaceMedium,
// Text(
// project.description,
// style: Theme.of(context).textTheme.bodyLarge,
// ),
