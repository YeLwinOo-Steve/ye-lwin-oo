import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';

import '../../configs/configs.dart';
import 'subviews/experience_title_page.dart';
import 'subviews/jobs_list_page.dart';

class ExperienceView extends StatefulWidget {
  ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: const <Widget>[
        ExperienceTitlePage(),
        JobsListPage(),
      ].addListView(
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
