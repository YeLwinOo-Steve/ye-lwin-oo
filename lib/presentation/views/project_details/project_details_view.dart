import 'package:flutter/material.dart';
import 'package:yelwinoo/data/model/showcase_project.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

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

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  @override
  Widget build(BuildContext context) {
    ShowcaseProject project = widget.project;
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title).addHero(
          tag: project.heroTag,
        ),
      ),
      body: <Widget>[
        SizedBox(
          height: context.screenHeight * 0.2,
          child: Image.asset(
            project.image,
            fit: BoxFit.cover,
          ),
        ),
        verticalSpaceMassive,
        Text(
          project.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ).addHero(
          tag: project.title,
        ),
        verticalSpaceMedium,
        Text(
          project.description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ]
          .addColumn(
            mainAxisAlignment: MainAxisAlignment.center,
          )
          .addPadding(
              edgeInsets: context.allPadding(
            p: s30,
          )),
    );
  }
}
